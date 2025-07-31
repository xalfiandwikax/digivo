const express = require('express');
const app = express();
app.use(express.json());

// Simpan database sederhana
const webhooksDB = [];

// Endpoint untuk register webhook
app.post('/register', (req, res) => {
  const { url, events } = req.body;
  webhooksDB.push({ url, events });
  console.log('📌 Registered webhook:', { url, events });
  res.json({ status: 'registered' });
});

// Endpoint untuk trigger event
app.post('/trigger-event', async (req, res) => {
  const { event, data } = req.body;
  
  console.log(`🔔 Triggering "${event}" to ${webhooksDB.length} webhooks`);
  
  // Kirim ke semua webhook terdaftar
  for (const webhook of webhooksDB) {
    if (webhook.events.includes(event)) {
      try {
        await fetch(webhook.url, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ event, data })
        });
        console.log(`✓ Sent to ${webhook.url}`);
      } catch (err) {
        console.error(`✕ Failed to send to ${webhook.url}:`, err.message);
      }
    }
  }

  res.json({ success: true, notified: webhooksDB.length });
});

// Jalankan server penerima
app.listen(4001, () => {
  console.log('🛟 Webhook receiver running on http://localhost:4001');
});
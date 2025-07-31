const { encryptData, generateSignature } = require('../services/cryptoService');

exports.processWebhook = async (job) => {
  const { webhook, payload } = job.data;
  let attempt = 1;
  const maxAttempts = 3;
  const retryDelay = 5 * 60 * 1000; // 5 menit

  while (attempt <= maxAttempts) {
    try {
      const encryptedData = encryptData(payload, webhook.secret);
      const signature = generateSignature(encryptedData, webhook.secret);

      const response = await fetch(webhook.url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-Webhook-Signature': signature,
          'X-Webhook-Attempt': `${attempt}/${maxAttempts}`
        },
        body: JSON.stringify({ data: encryptedData, signature }),
        timeout: 10000
      });

      if (!response.ok) throw new Error(`HTTP ${response.status}`);

      return { success: true, status: response.status };
    } catch (error) {
      console.error(`Attempt ${attempt} failed for ${webhook.url}:`, error.message);
      
      if (attempt < maxAttempts) {
        await new Promise(resolve => setTimeout(resolve, retryDelay));
        attempt++;
      } else {
        throw new Error(`Failed after ${maxAttempts} attempts: ${error.message}`);
      }
    }
  }
};
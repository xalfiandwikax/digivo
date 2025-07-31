const crypto = require('crypto');
const Webhook = require('../models/Webhook');

exports.register = async (req, res) => {
  try {
    const { url, events } = req.body;
    
    if (!url) {
      return res.status(400).json({ error: 'Webhook URL is required' });
    }

    const existing = await Webhook.findByUrl(url);
    if (existing) {
      return res.status(400).json({ error: 'Webhook URL already registered' });
    }

    const secret = crypto.randomBytes(32).toString('hex');
    const result = await Webhook.create({
      url,
      secret,
      events: events || ['ticket.paid', 'ticket.cancelled'],
      active: true,
      createdAt: new Date()
    });

    res.status(201).json({
      message: 'Webhook registered successfully',
      id: result.insertedId,
      secret // Hanya dikembalikan saat pendaftaran
    });
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
};
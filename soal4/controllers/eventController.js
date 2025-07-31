const Webhook = require('../models/Webhook');
const { getQueue } = require('../config/queue');
const { encryptData, generateSignature } = require('../services/cryptoService');
const logger = require('../config/logger'); // Tambahkan logger

exports.triggerEvent = async (req, res) => {
  try {
    const { event, data } = req.body;

    // Validasi lebih ketat
    if (!event || typeof event !== 'string') {
      return res.status(400).json({ error: 'Event name must be a string' });
    }

    if (!data?.ticketId || typeof data.ticketId !== 'string') {
      return res.status(400).json({ error: 'Valid ticketId is required' });
    }

    logger.info(`Triggering event: ${event}`, { data });

    const webhooks = await Webhook.findActiveByEvent(event);
    
    if (!webhooks.length) {
      logger.warn(`No active webhooks found for event: ${event}`);
      return res.json({ message: 'No webhooks to notify', event });
    }

    const queue = getQueue();
    const timestamp = new Date().toISOString();

    const jobs = webhooks.map((webhook) => {
      const payload = {
        event,
        data,
        timestamp,
        signature: generateSignature(webhook.secret, data) 
      };

      return {
        name: 'webhook',
        data: {
          webhook: {
            url: webhook.url,
            secret: webhook.secret,
          },
          payload: encryptData(payload) 
        },
        opts: {
          attempts: 3,
          backoff: {
            type: 'fixed',
            delay: 5 * 60 * 1000,
          },
        }
      };
    });

    await queue.addBulk(jobs);
    
    logger.info(`Scheduled ${jobs.length} webhook jobs for event: ${event}`);

    res.json({
      success: true,
      message: 'Event processed',
      event,
      webhooksCount: webhooks.length,
      firstWebhook: webhooks[0].url // Untuk debugging
    });

  } catch (error) {
    logger.error('Event processing failed', { 
      error: error.message,
      stack: error.stack,
      body: req.body
    });
    
    res.status(500).json({ 
      error: 'Internal server error',
      details: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};
const express = require('express');
const router = express.Router();
const webhookController = require('../controllers/webhookController');
const eventController = require('../controllers/eventController');

// Test endpoint
router.get('/test', (req, res) => {
  res.json({ message: "Endpoint test berhasil!" });
});

// Webhook endpoint
router.post('/webhook', webhookController.register);

// Event endpoint
router.post('/events', eventController.triggerEvent);

module.exports = router;
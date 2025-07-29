const crypto = require('crypto');

const authMiddleware = (req, res, next) => {
  const secret = 'your-secret-key'; // Harus disimpan di environment variable di production
  const receivedHmac = req.headers['x-auth-hmac'];
  
  if (!receivedHmac) {
    return res.status(401).json({
      status: 'error',
      message: 'HMAC signature diperlukan'
    });
  }

  const hmac = crypto.createHmac('sha512', secret);
  const data = JSON.stringify(req.body);
  hmac.update(data);
  const calculatedHmac = hmac.digest('hex');

  if (receivedHmac !== calculatedHmac) {
    return res.status(401).json({
      status: 'error',
      message: 'HMAC signature tidak valid'
    });
  }

  next();
};

module.exports = authMiddleware;
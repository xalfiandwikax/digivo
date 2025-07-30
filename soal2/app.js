const express = require('express');
const bodyParser = require('body-parser');
const crypto = require('crypto');
const fs = require('fs');
const path = require('path');
console.log('Path imageProcessor.js:', 
  fs.existsSync(path.join(__dirname, 'utils', 'imageProcessor.js')));
const { convertToWebP } = require('./utils/imageProcessor');
const { validateRequest, handleErrors } = require('./utils/errorHandler');
const authMiddleware = require('./utils/authMiddleware');

const app = express();
const PORT = process.env.PORT || 3000;

// Buat folder temp jika belum ada
if (!fs.existsSync('./temp')) {
  fs.mkdirSync('./temp');
}

app.use(bodyParser.json());

// Endpoint untuk konversi gambar
app.post('/convert-to-webp', authMiddleware, async (req, res) => {
  try {
    // Validasi request
    const { isValid, message } = validateRequest(req.body);
    if (!isValid) {
      return res.status(400).json({
        status: 'error',
        message: message
      });
    }

    const { url_gambar, persentase_kompresi } = req.body;
    const compression = persentase_kompresi || 60;

    // Proses konversi gambar
    const result = await convertToWebP(url_gambar, compression);

    res.json({
      status: 'success',
      message: 'Gambar berhasil dikonversi ke WEBP',
      url_webp: result.url_webp,
      ukuran_webp: result.ukuran_webp
    });

  } catch (error) {
    handleErrors(error, res);
  }
});

// Endpoint untuk testing HMAC
app.post('/test-hmac', (req, res) => {
  const secret = 'your-secret-key'; // Harus sama dengan yang digunakan di client
  const hmac = crypto.createHmac('sha512', secret);
  const data = JSON.stringify(req.body);
  hmac.update(data);
  const signature = hmac.digest('hex');

  res.json({
    receivedSignature: req.headers['x-auth-hmac'],
    calculatedSignature: signature,
    isValid: req.headers['x-auth-hmac'] === signature
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
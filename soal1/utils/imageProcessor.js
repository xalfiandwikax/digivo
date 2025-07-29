const axios = require('axios');
const sharp = require('sharp');
const fs = require('fs');
const path = require('path');
const { v4: uuidv4 } = require('uuid');

const convertToWebP = async (imageUrl, compression = 60) => {
  try {
    // Validasi URL
    if (!imageUrl) {
      throw new Error('URL gambar tidak boleh kosong');
    }

    // Download gambar
    const response = await axios.get(imageUrl, {
      responseType: 'arraybuffer',
      timeout: 10000 // timeout 10 detik
    });

    if (!response.data) {
      throw new Error('Gagal mengambil gambar dari URL');
    }

    // Generate nama file unik
    const filename = `${uuidv4()}.webp`;
    const outputPath = path.join(__dirname, '../temp', filename);

    // Proses konversi ke WEBP
    await sharp(response.data)
      .webp({ quality: compression })
      .toFile(outputPath);

    // Dapatkan ukuran file
    const stats = fs.statSync(outputPath);
    const fileSize = `${(stats.size / 1024).toFixed(2)} KB`;

    // Dalam produksi, upload file ke storage cloud dan dapatkan URL publik
    const publicUrl = `/temp/${filename}`; // Contoh sederhana

    return {
      url_webp: publicUrl,
      ukuran_webp: fileSize
    };
  } catch (error) {
    throw error;
  }
};

module.exports = { convertToWebP };
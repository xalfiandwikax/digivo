const validateRequest = (body) => {
  if (!body.url_gambar) {
    return {
      isValid: false,
      message: 'Parameter url_gambar diperlukan'
    };
  }

  if (body.persentase_kompresi && 
      (isNaN(body.persentase_kompresi) || 
       body.persentase_kompresi < 1 || 
       body.persentase_kompresi > 100)) {
    return {
      isValid: false,
      message: 'persentase_kompresi harus antara 1-100'
    };
  }

  return { isValid: true };
};

const handleErrors = (error, res) => {
  console.error(error);

  if (error.message === 'URL gambar tidak boleh kosong') {
    return res.status(400).json({
      status: 'error',
      message: error.message
    });
  }

  if (error.message === 'Gagal mengambil gambar dari URL') {
    return res.status(400).json({
      status: 'error',
      message: 'Gagal mengambil gambar dari URL yang diberikan'
    });
  }

  if (error.code === 'ENOTFOUND' || error.code === 'ECONNREFUSED') {
    return res.status(400).json({
      status: 'error',
      message: 'URL gambar tidak valid atau tidak dapat diakses'
    });
  }

  if (error.message.includes('unsupported image format')) {
    return res.status(400).json({
      status: 'error',
      message: 'Format gambar tidak didukung'
    });
  }

  if (error.message.includes('Request failed with status code')) {
    return res.status(400).json({
      status: 'error',
      message: 'Gambar tidak ditemukan di URL yang diberikan'
    });
  }

  if (error.message.includes('timeout')) {
    return res.status(408).json({
      status: 'error',
      message: 'Timeout saat mencoba mengambil gambar'
    });
  }

  return res.status(500).json({
    status: 'error',
    message: 'Terjadi kesalahan internal server'
  });
};

module.exports = { validateRequest, handleErrors };
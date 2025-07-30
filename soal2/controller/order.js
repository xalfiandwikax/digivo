import { execute } from '../config/database.js';
import { generateUniqueCode } from './codeUnic.js'; // Sesuaikan dengan nama file yang ada

// Fungsi untuk membuat order baru
export const createOrder = async (produk_id, nama_produk) => {
    try {
        const kode_unik = await generateUniqueCode();
        const harga = 299000; // Harga tetap 299 ribu
        const status = 'pending';
        
        const result = await execute(
            'INSERT INTO orders (produk_id, nama_produk, harga, kode_unik, status) VALUES (?, ?, ?, ?, ?)',
            [produk_id, nama_produk, harga, kode_unik, status]
        );
        
        return {
            id: result.insertId,
            produk_id,
            nama_produk,
            harga,
            kode_unik,
            status
        };
    } catch (error) {
        console.error('Error creating order:', error);
        throw error;
    }
};

// Fungsi untuk mendapatkan semua order
export const getAllOrders = async () => {
    const orders = await execute('SELECT * FROM orders ORDER BY tanggal DESC');
    return orders;
};
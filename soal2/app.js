import 'dotenv/config';
import express from 'express';
import { query } from './config/database.js';
import seedOrders from './dummy/orderSeed.js';

// Inisialisasi Express
const app = express();
app.use(express.json());

// Endpoint untuk testing
app.get('/', (req, res) => {
    res.send('Order System API');
});

// Inisialisasi server
async function startServer() {
    try {
        // Buat tabel jika belum ada
        await query(`
            CREATE TABLE IF NOT EXISTS orders (
                id INT AUTO_INCREMENT PRIMARY KEY,
                produk_id INT NOT NULL,
                nama_produk VARCHAR(255) NOT NULL,
                harga DECIMAL(10,2) NOT NULL,
                kode_unik INT NOT NULL,
                status ENUM('pending', 'completed', 'cancelled') DEFAULT 'pending',
                tanggal DATETIME DEFAULT CURRENT_TIMESTAMP,
                INDEX (kode_unik)
            )
        `);
        
        // Jalankan seeder jika diperlukan
        if (process.env.RUN_SEEDER === 'true') {
            console.log('Running seeder...');
            await seedOrders();
        }
        
        const PORT = process.env.PORT || 3000;
        app.listen(PORT, () => {
            console.log(`Server running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Failed to start server:', error);
        process.exit(1);
    }
}

startServer();
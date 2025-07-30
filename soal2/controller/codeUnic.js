import { execute } from '../config/database.js';

async function getUsedCodesInLastBatch() {
    try {
        const result = await execute(
            'SELECT kode_unik FROM orders ORDER BY id DESC LIMIT 10'
        );
        
        // Pastikan result adalah array sebelum memanggil map
        if (Array.isArray(result)) {
            return result.map(row => row.kode_unik);
        }
        return [];
    } catch (error) {
        console.error('Error in getUsedCodesInLastBatch:', error);
        return [];
    }
}

async function getOldestUsedCode() {
    try {
        const [result] = await execute(
            'SELECT kode_unik FROM orders ORDER BY tanggal ASC LIMIT 1'
        );
        return result ? result.kode_unik : 1; // Default ke 1 jika tidak ada data
    } catch (error) {
        console.error('Error in getOldestUsedCode:', error);
        return 1;
    }
}

export const generateUniqueCode = async () => {
    try {
        const usedCodes = await getUsedCodesInLastBatch();
        const availableCodes = [];
        
        // Cari kode antara 1-10 yang belum digunakan
        for (let i = 1; i <= 10; i++) {
            if (!usedCodes.includes(i)) {
                availableCodes.push(i);
            }
        }
        
        // Jika ada kode yang tersedia, pilih secara acak
        if (availableCodes.length > 0) {
            const randomIndex = Math.floor(Math.random() * availableCodes.length);
            return availableCodes[randomIndex];
        }
        
        // Jika semua kode 1-10 sudah digunakan, ambil yang paling lama tidak digunakan
        return await getOldestUsedCode();
    } catch (error) {
        console.error('Error in generateUniqueCode:', error);
        return Math.floor(Math.random() * 10) + 1; // Fallback random 1-10
    }
};
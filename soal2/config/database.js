import mysql from 'mysql2/promise';

const pool = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'digivo_order',
    port: process.env.DB_PORT || 3306,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Ekspor fungsi-fungsi yang dibutuhkan
export const query = async (sql, params) => {
    const [rows] = await pool.query(sql, params);
    return rows;
};

export const execute = async (sql, params) => {
    const [result] = await pool.query(sql, params);
    return result;
};

export const getConnection = async () => {
    return await pool.getConnection();
};

export default {
    query,
    execute,
    getConnection
};
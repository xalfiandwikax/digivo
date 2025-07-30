import { createOrder } from '../controller/order.js';
import { execute } from '../config/database.js';

const products = [
    { id: 1, name: 'Produk Premium A' },
    { id: 2, name: 'Produk Standard B' },
    { id: 3, name: 'Produk Economy C' },
    { id: 4, name: 'Produk Limited D' },
    { id: 5, name: 'Produk Special E' }
];

async function clearOrders() {
    try {
        await execute('TRUNCATE TABLE orders');
    } catch (error) {
        console.error('Error clearing orders:', error);
        throw error;
    }
}

async function seedOrders() {
    try {
        await clearOrders();
        
        const successOrders = [];
        
        for (let i = 0; i < 50; i++) {
            try {
                const product = products[Math.floor(Math.random() * products.length)];
                const order = await createOrder(product.id, product.name);
                successOrders.push(order);
                console.log(`Created order ${i+1} with product ${product.name}`);
                
                // Tambahkan delay kecil antara pembuatan order
                await new Promise(resolve => setTimeout(resolve, 100));
            } catch (error) {
                console.error(`Error creating order ${i+1}:`, error.message);
                // Lanjut ke order berikutnya meskipun ada error
                continue;
            }
        }
        
        console.log(`Seed process completed. Successfully created ${successOrders.length} orders.`);
        return successOrders;
    } catch (error) {
        console.error('Error in seed process:', error);
        throw error;
    }
}

export default seedOrders;
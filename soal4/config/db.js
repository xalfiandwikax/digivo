const { MongoClient } = require('mongodb');

const MONGODB_URI = 'mongodb://admin:jcnruad777@127.0.0.1:27017/flight_webhooks?authSource=admin';

const connectDB = async () => {
  try {
    const client = new MongoClient(MONGODB_URI, {
      serverSelectionTimeoutMS: 5000,
      connectTimeoutMS: 10000
    });
    
    await client.connect();
    console.log('✅ Connected to MongoDB');
    return client.db();
  } catch (err) {
    console.error('❌ Database connection failed:', err);
    throw err;
  }
};

module.exports = connectDB;
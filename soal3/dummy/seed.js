// seed.js
const pool = require('../config/database');
const { faker } = require('@faker-js/faker');

// Fungsi untuk clear existing data
async function clearTables() {
  const tables = ['bookings', 'passengers', 'flights', 'airports', 'users'];
  
  try {
    await pool.query('SET FOREIGN_KEY_CHECKS = 0');
    
    for (const table of tables) {
      await pool.query(`TRUNCATE TABLE ${table}`);
      console.log(`🧹 Table ${table} cleared`);
    }
    
    await pool.query('SET FOREIGN_KEY_CHECKS = 1');
  } catch (error) {
    console.error('Error clearing tables:', error);
    throw error;
  }
}

// Seed data untuk airports
async function seedAirports() {
  const airports = [
    ['CGK', 'Soekarno-Hatta', 'Jakarta', 'Indonesia'],
    ['DPS', 'Ngurah Rai', 'Denpasar', 'Indonesia'],
    ['SUB', 'Juanda', 'Surabaya', 'Indonesia'],
    ['KUL', 'Kuala Lumpur Intl', 'Kuala Lumpur', 'Malaysia'],
    ['SIN', 'Changi Airport', 'Singapore', 'Singapore']
  ];

  await pool.query(
    'INSERT INTO airports (code, nama, kota, negara) VALUES ?',
    [airports]
  );
  console.log(`✈️  ${airports.length} airports seeded`);
}

// Seed data untuk users
async function seedUsers(count = 10) {
  const users = [];
  
  for (let i = 0; i < count; i++) {
    users.push([
      faker.person.fullName(),
      faker.internet.email(),
      faker.phone.number('08########'),
      faker.number.int({ min: 0, max: 500 })
    ]);
  }

  await pool.query(
    'INSERT INTO users (nama, email, telepon, points) VALUES ?',
    [users]
  );
  console.log(`👥 ${count} users seeded`);
}

// Seed data untuk flights
async function seedFlights(count = 15) {
  const [airports] = await pool.query('SELECT code FROM airports');
  const airlines = ['Garuda', 'Lion Air', 'AirAsia', 'Singapore Airlines', 'Citilink'];
  const flights = [];
  
  for (let i = 0; i < count; i++) {
    const [departure, arrival] = faker.helpers.shuffle(airports).slice(0, 2);
    flights.push([
      `${faker.helpers.arrayElement(airlines)}-${faker.string.numeric(3)}`,
      departure.code,
      arrival.code,
      faker.date.soon({ days: 30 })
    ]);
  }

  await pool.query(
    'INSERT INTO flights (flight_no, departure, arrival, waktu) VALUES ?',
    [flights]
  );
  console.log(`🛫 ${count} flights seeded`);
}

// Seed data untuk bookings dan passengers
async function seedBookings(count = 30) {
  const [users] = await pool.query('SELECT user_id FROM users');
  const [flights] = await pool.query('SELECT flight_id FROM flights');
  const statuses = ['pending', 'confirmed', 'cancelled'];
  
  for (let i = 0; i < count; i++) {
    const user = faker.helpers.arrayElement(users);
    const flight = faker.helpers.arrayElement(flights);
    const passengerCount = faker.number.int({ min: 1, max: 4 });
    const totalPrice = faker.number.int({ min: 500000, max: 5000000 });
    const status = faker.helpers.arrayElement(statuses);

    // Insert booking
    const [bookingResult] = await pool.query(
      'INSERT INTO bookings (user_id, flight_id, tanggal, status, harga) VALUES (?, ?, ?, ?, ?)',
      [
        user.user_id,
        flight.flight_id,
        faker.date.recent({ days: 10 }),
        status,
        totalPrice
      ]
    );

    // Insert passengers untuk booking ini
    const passengers = [];
    for (let j = 0; j < passengerCount; j++) {
      passengers.push([
        bookingResult.insertId,
        faker.person.fullName(),
        faker.helpers.arrayElement(['adult', 'child', 'infant']),
        `${faker.number.int({ min: 1, max: 30 })}${faker.string.alpha({ length: 1, casing: 'upper' })}`
      ]);
    }

    await pool.query(
      'INSERT INTO passengers (booking_id, nama, tipe, seat_no) VALUES ?',
      [passengers]
    );
  }
  console.log(`🎫 ${count} bookings with passengers seeded`);
}

// Main function
async function seedAll() {
  try {
    console.log('🌱 Starting seeding process...');
    
    await clearTables();
    await seedAirports();
    await seedUsers();
    await seedFlights();
    await seedBookings();
    
    console.log('✅ All seeding completed successfully!');
  } catch (error) {
    console.error('❌ Seeding failed:', error);
  } finally {
    await pool.end();
    process.exit();
  }
}

seedAll();
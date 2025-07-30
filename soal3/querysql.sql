-- Pastikan database sudah ada
CREATE DATABASE IF NOT EXISTS digivo_order;
USE digivo_order;

-- Tabel airports
CREATE TABLE IF NOT EXISTS airports (
    code VARCHAR(3) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    kota VARCHAR(50) NOT NULL,
    negara VARCHAR(50) NOT NULL
);

-- Tabel users
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telepon VARCHAR(20) NOT NULL,
    points INT DEFAULT 0
);

-- Tabel flights
CREATE TABLE IF NOT EXISTS flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_no VARCHAR(10) NOT NULL,
    departure VARCHAR(3) NOT NULL,
    arrival VARCHAR(3) NOT NULL,
    waktu DATETIME NOT NULL,
    FOREIGN KEY (departure) REFERENCES airports(code),
    FOREIGN KEY (arrival) REFERENCES airports(code)
);

-- Tabel bookings
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    flight_id INT NOT NULL,
    tanggal DATETIME NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
    harga DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

-- Tabel passengers
CREATE TABLE IF NOT EXISTS passengers (
    pass_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    nama VARCHAR(100) NOT NULL,
    tipe ENUM('adult', 'child', 'infant') NOT NULL DEFAULT 'adult',
    seat_no VARCHAR(10),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
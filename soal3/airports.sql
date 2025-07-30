-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2025 pada 21.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digivo_order`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `airports`
--

CREATE TABLE `airports` (
  `code` varchar(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `negara` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `airports`
--

INSERT INTO `airports` (`code`, `nama`, `kota`, `negara`) VALUES
('CGK', 'Soekarno-Hatta', 'Jakarta', 'Indonesia'),
('DPS', 'Ngurah Rai', 'Denpasar', 'Indonesia'),
('KUL', 'Kuala Lumpur Intl', 'Kuala Lumpur', 'Malaysia'),
('SIN', 'Changi Airport', 'Singapore', 'Singapore'),
('SUB', 'Juanda', 'Surabaya', 'Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

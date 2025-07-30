-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2025 pada 21.20
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
-- Struktur dari tabel `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `flight_no` varchar(10) NOT NULL,
  `departure` varchar(3) NOT NULL,
  `arrival` varchar(3) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `flights`
--

INSERT INTO `flights` (`flight_id`, `flight_no`, `departure`, `arrival`, `waktu`) VALUES
(1, 'Citilink-7', 'SUB', 'CGK', '2025-08-08 18:15:30'),
(2, 'Singapore ', 'CGK', 'SIN', '2025-08-10 19:04:26'),
(3, 'Citilink-4', 'CGK', 'KUL', '2025-08-14 22:58:15'),
(4, 'AirAsia-86', 'CGK', 'KUL', '2025-08-06 12:39:51'),
(5, 'Lion Air-6', 'CGK', 'SIN', '2025-08-15 17:16:22'),
(6, 'Citilink-3', 'CGK', 'KUL', '2025-08-01 02:30:23'),
(7, 'Garuda-018', 'SUB', 'KUL', '2025-07-31 08:02:05'),
(8, 'Lion Air-7', 'CGK', 'SUB', '2025-08-05 05:02:15'),
(9, 'Citilink-8', 'CGK', 'SIN', '2025-08-07 02:48:50'),
(10, 'AirAsia-42', 'SIN', 'CGK', '2025-08-16 18:06:41'),
(11, 'Citilink-5', 'DPS', 'CGK', '2025-08-16 18:58:05'),
(12, 'Singapore ', 'CGK', 'KUL', '2025-08-20 22:20:25'),
(13, 'Lion Air-0', 'DPS', 'SIN', '2025-08-01 11:27:54'),
(14, 'Lion Air-8', 'SUB', 'SIN', '2025-08-27 19:03:50'),
(15, 'Singapore ', 'SIN', 'KUL', '2025-07-31 16:10:39');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `departure` (`departure`),
  ADD KEY `arrival` (`arrival`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`departure`) REFERENCES `airports` (`code`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`arrival`) REFERENCES `airports` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

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
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `flight_id`, `tanggal`, `status`, `harga`) VALUES
(1, 6, 2, '2025-07-25 05:51:06', 'confirmed', 2574638.00),
(2, 2, 8, '2025-07-24 03:38:48', 'cancelled', 1873552.00),
(3, 1, 8, '2025-07-26 17:03:03', 'cancelled', 4248153.00),
(4, 7, 14, '2025-07-24 03:57:04', 'cancelled', 4399413.00),
(5, 6, 6, '2025-07-28 12:11:46', 'pending', 695793.00),
(6, 7, 12, '2025-07-23 07:09:25', 'confirmed', 1119374.00),
(7, 6, 13, '2025-07-25 21:54:29', 'confirmed', 951476.00),
(8, 2, 6, '2025-07-29 14:34:50', 'pending', 4657546.00),
(9, 8, 3, '2025-07-25 17:20:43', 'pending', 520984.00),
(10, 6, 4, '2025-07-23 23:16:23', 'cancelled', 4688072.00),
(11, 1, 13, '2025-07-24 10:01:30', 'pending', 2196318.00),
(12, 7, 7, '2025-07-22 04:07:54', 'cancelled', 4506860.00),
(13, 5, 1, '2025-07-26 23:21:03', 'cancelled', 2436521.00),
(14, 7, 5, '2025-07-28 02:20:59', 'confirmed', 2909374.00),
(15, 6, 7, '2025-07-29 03:33:41', 'confirmed', 3256721.00),
(16, 6, 13, '2025-07-23 18:45:24', 'pending', 4525991.00),
(17, 4, 8, '2025-07-21 06:26:28', 'cancelled', 4663259.00),
(18, 5, 13, '2025-07-21 19:42:41', 'cancelled', 2320657.00),
(19, 2, 3, '2025-07-25 21:34:40', 'cancelled', 4676644.00),
(20, 9, 1, '2025-07-26 14:16:24', 'pending', 565498.00),
(21, 5, 3, '2025-07-21 20:21:35', 'confirmed', 2551639.00),
(22, 3, 2, '2025-07-24 08:59:19', 'cancelled', 4312882.00),
(23, 5, 12, '2025-07-21 17:04:49', 'cancelled', 550583.00),
(24, 1, 7, '2025-07-26 09:37:53', 'confirmed', 4304628.00),
(25, 4, 2, '2025-07-29 13:21:09', 'pending', 1345142.00),
(26, 2, 2, '2025-07-28 02:36:01', 'cancelled', 890363.00),
(27, 6, 15, '2025-07-27 16:10:38', 'pending', 1325859.00),
(28, 9, 3, '2025-07-23 02:11:22', 'cancelled', 4455710.00),
(29, 7, 1, '2025-07-25 20:56:49', 'cancelled', 732523.00),
(30, 10, 5, '2025-07-28 00:01:44', 'cancelled', 1301915.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

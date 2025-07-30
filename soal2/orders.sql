-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2025 pada 19.57
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
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `produk_id`, `nama_produk`, `harga`, `kode_unik`, `status`, `tanggal`) VALUES
(1, 1, 'Produk Premium A', 299000.00, 6, 'pending', '2025-07-31 00:53:43'),
(2, 3, 'Produk Economy C', 299000.00, 10, 'pending', '2025-07-31 00:53:43'),
(3, 5, 'Produk Special E', 299000.00, 5, 'pending', '2025-07-31 00:53:43'),
(4, 4, 'Produk Limited D', 299000.00, 7, 'pending', '2025-07-31 00:53:43'),
(5, 2, 'Produk Standard B', 299000.00, 8, 'pending', '2025-07-31 00:53:43'),
(6, 2, 'Produk Standard B', 299000.00, 3, 'pending', '2025-07-31 00:53:43'),
(7, 4, 'Produk Limited D', 299000.00, 2, 'pending', '2025-07-31 00:53:44'),
(8, 3, 'Produk Economy C', 299000.00, 4, 'pending', '2025-07-31 00:53:44'),
(9, 2, 'Produk Standard B', 299000.00, 1, 'pending', '2025-07-31 00:53:44'),
(10, 1, 'Produk Premium A', 299000.00, 9, 'pending', '2025-07-31 00:53:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_unik` (`kode_unik`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

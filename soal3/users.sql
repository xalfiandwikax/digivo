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
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `nama`, `email`, `telepon`, `points`) VALUES
(1, 'Brandon Kohler', 'Rosamond.Predovic@hotmail.com', '0836858300', 394),
(2, 'Sylvester Becker', 'Maurine_Murphy56@gmail.com', '0807617902', 216),
(3, 'Gretchen Ankunding', 'Orland_Stracke@hotmail.com', '0878018397', 460),
(4, 'Aaron Nader-Kihn II', 'Jennie_Heaney@hotmail.com', '0813256461', 282),
(5, 'Grant Rippin', 'Sean.McClure@yahoo.com', '0865308227', 309),
(6, 'Mrs. Yolanda Rippin', 'Issac_Abbott@gmail.com', '0861382862', 67),
(7, 'Leland Carter-Heller', 'Zola86@yahoo.com', '0899369953', 478),
(8, 'Bessie Turner', 'Katrine.Wisozk@hotmail.com', '0828485127', 303),
(9, 'Kyle Upton', 'Reuben10@gmail.com', '0893012761', 408),
(10, 'Sam Smitham', 'Keon14@yahoo.com', '0853193997', 79);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

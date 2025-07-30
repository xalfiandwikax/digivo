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
-- Struktur dari tabel `passengers`
--

CREATE TABLE `passengers` (
  `pass_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tipe` enum('adult','child','infant') NOT NULL DEFAULT 'adult',
  `seat_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `passengers`
--

INSERT INTO `passengers` (`pass_id`, `booking_id`, `nama`, `tipe`, `seat_no`) VALUES
(1, 1, 'Leon Hermiston', 'child', '11L'),
(2, 2, 'Bernadette Dare', 'infant', '22R'),
(3, 2, 'Willie Jenkins', 'child', '18O'),
(4, 2, 'Rene Reichel', 'adult', '9H'),
(5, 3, 'Tracy Jacobs Jr.', 'adult', '18Q'),
(6, 4, 'Lynn Deckow DVM', 'infant', '11G'),
(7, 4, 'Tasha Hammes', 'child', '5C'),
(8, 4, 'Emilio Haley', 'adult', '17B'),
(9, 4, 'Roberto Blick', 'adult', '13C'),
(10, 5, 'April Schaefer', 'infant', '3X'),
(11, 5, 'Beulah Hane', 'infant', '3C'),
(12, 5, 'Winston Cruickshank', 'infant', '5Y'),
(13, 6, 'Enrique Reinger PhD', 'adult', '30H'),
(14, 6, 'Johnny Abbott', 'infant', '23C'),
(15, 7, 'Eric Swaniawski-Morissette MD', 'infant', '21Z'),
(16, 7, 'Sarah Koch', 'child', '9N'),
(17, 7, 'Sara Barton', 'adult', '9H'),
(18, 8, 'Judy Moen', 'adult', '29U'),
(19, 8, 'Otis Brakus', 'infant', '19P'),
(20, 8, 'Nicole Rodriguez', 'child', '18B'),
(21, 9, 'Charlie Labadie', 'adult', '27H'),
(22, 9, 'Antonia Schulist', 'infant', '15B'),
(23, 10, 'Ruben Johnson IV', 'infant', '3L'),
(24, 10, 'Ricardo Mraz', 'infant', '1Y'),
(25, 11, 'Angie Feeney', 'infant', '23R'),
(26, 12, 'Dr. Terry Conroy', 'infant', '27P'),
(27, 12, 'Lynn Green', 'adult', '29A'),
(28, 12, 'Geneva Jakubowski', 'child', '11X'),
(29, 13, 'Esther Hodkiewicz', 'adult', '19K'),
(30, 13, 'Seth Corkery', 'infant', '20Y'),
(31, 13, 'Alice Johns IV', 'adult', '24U'),
(32, 14, 'Kevin Hammes', 'child', '24L'),
(33, 14, 'Hugh Harber Sr.', 'infant', '28U'),
(34, 14, 'Brent Adams', 'child', '23V'),
(35, 15, 'Cathy Osinski', 'adult', '5U'),
(36, 15, 'Velma Bode', 'infant', '23G'),
(37, 15, 'Anne Pouros', 'adult', '9B'),
(38, 15, 'Shannon Anderson', 'child', '15E'),
(39, 16, 'Rodolfo Upton', 'adult', '18B'),
(40, 16, 'Whitney Stanton MD', 'adult', '25W'),
(41, 17, 'Byron Erdman-Abshire', 'infant', '10L'),
(42, 17, 'Ms. Lauren Auer', 'child', '7I'),
(43, 17, 'Winston Dibbert', 'infant', '17W'),
(44, 17, 'Dr. Josh Osinski-Bradtke', 'adult', '19I'),
(45, 18, 'Erick Bosco', 'infant', '26O'),
(46, 18, 'Dr. Andres Kohler', 'child', '2V'),
(47, 18, 'Rita Murazik', 'adult', '11P'),
(48, 19, 'Jody Schneider', 'infant', '11C'),
(49, 19, 'Leslie Murphy', 'child', '6L'),
(50, 20, 'Nichole Blanda', 'infant', '6B'),
(51, 20, 'Yolanda Bednar', 'adult', '29V'),
(52, 20, 'Hugo Oberbrunner', 'infant', '7X'),
(53, 21, 'Joanne Lueilwitz', 'adult', '18S'),
(54, 22, 'Deanna Hammes', 'adult', '1G'),
(55, 22, 'Miss Patti Luettgen-Rau', 'child', '19E'),
(56, 22, 'Mable Gutmann', 'infant', '11B'),
(57, 23, 'Gordon Bednar', 'child', '23Z'),
(58, 23, 'Ms. Charlotte Quigley', 'adult', '10P'),
(59, 23, 'Cory Nicolas MD', 'infant', '22L'),
(60, 23, 'Rochelle Aufderhar-Morar', 'infant', '29E'),
(61, 24, 'Jana Marvin', 'adult', '29B'),
(62, 24, 'Rose Greenfelder', 'infant', '15H'),
(63, 24, 'Levi Carter', 'infant', '16C'),
(64, 24, 'Tim Bergstrom', 'adult', '16X'),
(65, 25, 'Levi Hintz', 'child', '14Z'),
(66, 25, 'Francis Witting', 'child', '23W'),
(67, 25, 'Leona Beer', 'child', '24A'),
(68, 26, 'Rita Spinka I', 'child', '27B'),
(69, 27, 'Jasmine Hoppe-Balistreri', 'child', '25M'),
(70, 27, 'Neil Dicki', 'infant', '27C'),
(71, 27, 'Ismael Emmerich-Stiedemann', 'adult', '6O'),
(72, 27, 'Max Stoltenberg', 'adult', '14H'),
(73, 28, 'Lorena Feest', 'infant', '13Y'),
(74, 28, 'Douglas Klein', 'adult', '25C'),
(75, 28, 'Johanna Grant', 'child', '4Y'),
(76, 28, 'Sidney Goldner', 'adult', '27X'),
(77, 29, 'Stacy Kuhn-Senger', 'infant', '8D'),
(78, 30, 'Erika Pollich', 'adult', '24R'),
(79, 30, 'Orlando Ortiz', 'adult', '5H');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`pass_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `passengers`
--
ALTER TABLE `passengers`
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

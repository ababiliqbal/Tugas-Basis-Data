-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2023 at 03:44 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sembako`
--

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `telp_pembeli` varchar(13) NOT NULL,
  `alamat_pembeli` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_pembeli`, `telp_pembeli`, `alamat_pembeli`) VALUES
(1, 'Muhammad Iqbal Ababil', '081914332341', 'JL. Blambangan Timur RT 05 RW 06'),
(2, 'Muhammad Malik Ibrahim', '081229083831', 'JL. Blambangan Timur RT 05 RW 06'),
(3, 'Muhammad Ali Imrun', '081156778902', 'JL. Ahmad Yani No 57 B'),
(4, 'Naruto Uzumaki', '081945778411', 'JL. Konohagakure No 99'),
(5, 'Uchiha Sasuke', '089953441234', 'JL. Konohagakure No 199'),
(6, 'Pak Wawan', '081228173752', 'JL. Terang Benerang No 99'),
(7, 'Mutiara Oktavia Putri', '08884107921', 'JL. Rahmat Tuhan No 99'),
(8, 'Neyrisa Arviana Jaya', '0895605814284', 'JL. Pejuang Cinta No 123'),
(9, 'Oryza Sekar Rismadhani', '082232035606', 'JL. Antah Brantah NO 45'),
(10, 'Muhammad Afif', '081129872345', 'JL. Barudak No 45');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `deskripsi`) VALUES
(1, 'Minyak Goreng', 20000, 'Produk ini dijual per liter'),
(2, 'Telur', 17000, 'Produk ini dijual per kilo'),
(3, 'Beras', 15000, 'Produk ini dijual per kilo'),
(4, 'Daging Ayam', 25000, 'Produk ini dijual per kilo'),
(5, 'Gula Pasir', 15000, 'Produk ini dijual per kilo'),
(6, 'Susu Bubuk', 12000, 'Produk ini dijual per 100g'),
(7, 'Daging sapi', 70000, 'Produk ini dijual per kilo'),
(8, 'Garam', 15000, 'Produk ini dijual per kilo'),
(9, 'Ikan lele', 21000, 'Produk ini dijual per kilo'),
(10, 'Ikan Mujair', 30000, 'Produk ini dijual per kilo');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `pembeli_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `pembeli_id`, `produk_id`, `jumlah`) VALUES
(1, 1, 1, 2),
(2, 2, 2, 3),
(3, 1, 2, 5),
(4, 4, 4, 3),
(5, 4, 3, 5),
(6, 3, 1, 5),
(7, 1, 5, 10),
(8, 3, 1, 3),
(9, 2, 4, 1),
(10, 4, 5, 1),
(11, 2, 3, 5),
(12, 5, 5, 4),
(13, 5, 4, 3),
(14, 4, 2, 2),
(15, 1, 6, 2),
(16, 6, 4, 3),
(17, 7, 3, 7),
(18, 8, 6, 5),
(19, 9, 5, 2),
(20, 6, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `pembeli_id` (`pembeli_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`pembeli_id`) REFERENCES `pembeli` (`id_pembeli`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

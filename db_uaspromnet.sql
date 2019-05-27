-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2019 at 09:31 PM
-- Server version: 10.3.14-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uaspromnet`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_data_cicilan`
--

CREATE TABLE `tb_data_cicilan` (
  `id` int(11) NOT NULL,
  `lama_cicilan` int(11) NOT NULL,
  `bunga_cicilan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_data_cicilan`
--

INSERT INTO `tb_data_cicilan` (`id`, `lama_cicilan`, `bunga_cicilan`) VALUES
(1, 12, 4),
(2, 24, 2.5),
(3, 36, 1.5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_data_dp`
--

CREATE TABLE `tb_data_dp` (
  `id` int(11) NOT NULL,
  `uang_muka` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_data_dp`
--

INSERT INTO `tb_data_dp` (`id`, `uang_muka`) VALUES
(1, 1000000),
(2, 2000000),
(3, 4000000),
(4, 6000000),
(5, 8000000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_data_motor`
--

CREATE TABLE `tb_data_motor` (
  `id` int(11) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `harga` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_data_motor`
--

INSERT INTO `tb_data_motor` (`id`, `tipe`, `harga`) VALUES
(1, 'Supra X 125 Spoke FI', 17468000),
(2, 'Revo X', 15968000),
(3, 'Supra GTR 150 Exclusive', 22300000),
(4, 'Supra Cub C125', 57000000),
(5, 'BeAT Pop CW', 15532000),
(6, 'Scoopy Sporty', 18943000),
(7, 'Vario 150', 23421000),
(8, 'PCX 150 ABS', 31684000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(7) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`id`, `nim`, `nama`) VALUES
(1, '1600000', 'LUQMAN'),
(2, '1600001', 'AKHMAD'),
(3, '1600002', 'IRFAN'),
(4, '1600003', 'RIVALDO');

-- --------------------------------------------------------

--
-- Table structure for table `tb_perhitungan`
--

CREATE TABLE `tb_perhitungan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_motor` int(11) NOT NULL,
  `id_cicilan` int(11) NOT NULL,
  `id_dp` int(11) NOT NULL,
  `pokok` bigint(20) NOT NULL,
  `bunga` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_data_cicilan`
--
ALTER TABLE `tb_data_cicilan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_data_dp`
--
ALTER TABLE `tb_data_dp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_data_motor`
--
ALTER TABLE `tb_data_motor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indexes for table `tb_perhitungan`
--
ALTER TABLE `tb_perhitungan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_motor` (`id_motor`),
  ADD KEY `id_cicilan` (`id_cicilan`),
  ADD KEY `id_dp` (`id_dp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_data_cicilan`
--
ALTER TABLE `tb_data_cicilan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_data_dp`
--
ALTER TABLE `tb_data_dp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_data_motor`
--
ALTER TABLE `tb_data_motor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tb_perhitungan`
--
ALTER TABLE `tb_perhitungan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_perhitungan`
--
ALTER TABLE `tb_perhitungan`
  ADD CONSTRAINT `tb_perhitungan_ibfk_1` FOREIGN KEY (`id_cicilan`) REFERENCES `tb_data_cicilan` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_perhitungan_ibfk_2` FOREIGN KEY (`id_dp`) REFERENCES `tb_data_dp` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_perhitungan_ibfk_3` FOREIGN KEY (`id_motor`) REFERENCES `tb_data_motor` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_perhitungan_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `tb_mahasiswa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

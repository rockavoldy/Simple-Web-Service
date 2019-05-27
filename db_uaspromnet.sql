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
(1, '1601657', 'LUQMAN N.'),
(2, '1700424', 'RIVIAWATI PUTRI GIOVANI'),
(3, '1700502', 'ADE PRIANTO'),
(4, '1700635', 'ALDIAN FALLAHAKBAR NURIZA'),
(5, '1700642', 'AGITSA NUR FIKRI'),
(6, '1700654', 'MUHAMMAD LUTHFI NAUFAL'),
(7, '1700704', 'REZA PAHLEVI'),
(8, '1700964', 'HASYA GHITHA PUTRI'),
(9, '1701266', 'RANTTY GANTINI'),
(10, '1701325', 'FAJAR TRI UTOMO'),
(11, '1701476', 'AULIA DEVINA ANNISAFITRI'),
(12, '1701501', 'TANTI AMELIA SOPYA'),
(13, '1701539', 'MUHAMMAD RIZAL PURNOMO PUTRA P'),
(14, '1701988', 'YULIANSYAH IBRAHIM'),
(15, '1702019', 'MUHAMMAD NUR AULIADY PAMUNGKAS'),
(16, '1702033', 'ROBI NAUFAL KAOSAR'),
(17, '1702153', 'NURFARHAN ABDILLAH'),
(18, '1702490', 'ACHMAD PRIYADI'),
(19, '1702537', 'SYAHRUL KHOLID GUNAWAN'),
(20, '1702715', 'AHMAD FAUZAN'),
(21, '1702752', 'AQHBAR HABIB'),
(22, '1703015', 'FENNY FERONIKA MAHARANI'),
(23, '1703027', 'REGY SAPUTRA'),
(24, '1703054', 'BIAS FAJAR ANUGRAH'),
(25, '1703130', 'IRFAN ADI PRATAMA'),
(26, '1703204', 'WIBI PUTRA PERDANA SUHENDRA'),
(27, '1703621', 'MOCH. DANDI JUHANA'),
(28, '1703924', 'FERDIANSYAH'),
(29, '1704287', 'MUHAMMAD FAUZAN'),
(30, '1704814', 'GHIFARI RAMADHIKA PERMANA'),
(31, '1704834', 'MUHAMMAD IKHSAN NURULFALAAH'),
(32, '1704990', 'GUFRANAKA SULISTIYO PUTRA'),
(33, '1705112', 'EKA BUDI HARYANTI'),
(34, '1705169', 'SALSABILA FEBRIANA HERDIANSAH'),
(35, '1705277', 'LUQMAN ARIF'),
(36, '1705509', 'NUR \'AISYAH NADIYAH'),
(37, '1705653', 'ACHMAD FIRDITAMA'),
(38, '1705694', 'DICKY KURNIAWAN'),
(39, '1707885', 'FAKHRI AZIS BASIRI'),
(40, '1600691', 'TIO'),
(41, '1603525', 'FAIRUZZABADI FARHAN MUHAMMAD'),
(42, '1607488', 'AKHMAD MAULANA AKBAR');

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

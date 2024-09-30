-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 16, 2024 at 12:51 PM
-- Server version: 5.7.44-cll-lve
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `majhesta_sampahku`
--

-- --------------------------------------------------------

--
-- Table structure for table `harga_sampah`
--

CREATE TABLE `harga_sampah` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `handphone` int(11) DEFAULT NULL,
  `monitor` int(11) DEFAULT NULL,
  `kulkas` int(11) DEFAULT NULL,
  `televisi` int(11) DEFAULT NULL,
  `baterai_aki` int(11) DEFAULT NULL,
  `botol_mineral` int(11) DEFAULT NULL,
  `jerigen` int(11) DEFAULT NULL,
  `plastik_campur` int(11) DEFAULT NULL,
  `kardus` int(11) DEFAULT NULL,
  `kertas_arsip` int(11) DEFAULT NULL,
  `duplex` int(11) DEFAULT NULL,
  `kertas_buram` int(11) DEFAULT NULL,
  `sak_semen` int(11) DEFAULT NULL,
  `kaleng_alumunium` int(11) DEFAULT NULL,
  `besi` int(11) DEFAULT NULL,
  `baja` int(11) DEFAULT NULL,
  `tembaga` int(11) DEFAULT NULL,
  `alumunium` int(11) DEFAULT NULL,
  `botol_sirup` int(11) DEFAULT NULL,
  `botol_campur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `harga_sampah`
--

INSERT INTO `harga_sampah` (`id`, `tanggal`, `handphone`, `monitor`, `kulkas`, `televisi`, `baterai_aki`, `botol_mineral`, `jerigen`, `plastik_campur`, `kardus`, `kertas_arsip`, `duplex`, `kertas_buram`, `sak_semen`, `kaleng_alumunium`, `besi`, `baja`, `tembaga`, `alumunium`, `botol_sirup`, `botol_campur`) VALUES
(2, '2023-11-04', 200000, 50000, 300000, 50000, 25000, 1500, 5000, 500, 1600, 1300, 3000, 1500, 1500, 8500, 6000, 15000, 50000, 13000, 3200, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `history_all`
--

CREATE TABLE `history_all` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `flow` int(10) DEFAULT NULL,
  `id_jemput` int(11) DEFAULT NULL,
  `id_jual` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_all`
--

INSERT INTO `history_all` (`id`, `id_user`, `status`, `date`, `flow`, `id_jemput`, `id_jual`, `address`) VALUES
(127, 62, 'Jual Sampah', '2023-11-15', 250000, NULL, 91, 'Mboh'),
(128, 62, 'Jual Sampah', '2023-11-15', 250000, NULL, 91, 'Mboh'),
(129, 62, 'Jemput Sampah', '2023-11-15', 125000, 84, NULL, 'jakyal'),
(130, 63, 'Jual Sampah', '2023-11-15', 120200, NULL, 92, 'kegelapan'),
(131, 63, 'Jemput Sampah', '2023-11-15', 50000, 85, NULL, 'Jl.Test'),
(132, 64, 'Jual Sampah', '2023-11-15', 19825000, NULL, 93, 'gg'),
(133, 63, 'Jual Sampah', '2023-11-15', 688600, NULL, 94, 'JAKAL'),
(134, 65, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 95, 'gbdgfbd'),
(135, 65, 'Jemput Sampah', '2023-11-15', 495000, 86, NULL, 'hbnkjubkjn'),
(136, 64, 'Jual Sampah', '2023-11-15', 50125000, NULL, 96, 'gg'),
(137, 64, 'Jual Sampah', '2023-11-15', 91825000, NULL, 97, 'gg'),
(138, 64, 'Jual Sampah', '2023-11-15', 93625000, NULL, 98, 'gg'),
(139, 64, 'Jual Sampah', '2023-11-15', 536025000, NULL, 99, 'gg'),
(140, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 100, 'gg'),
(141, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 101, 'gg'),
(142, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 102, 'gg'),
(143, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 103, 'gg'),
(144, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 104, 'gg'),
(145, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 105, 'gg'),
(146, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 106, 'gg'),
(147, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 107, 'gg'),
(148, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 108, 'gg'),
(149, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 109, 'gg'),
(150, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 110, 'gg'),
(151, NULL, 'Jual Sampah', '2023-11-15', 2147483647, NULL, 111, 'gg'),
(152, NULL, 'Jual Sampah', '2023-11-15', 800000, NULL, 112, 'gg'),
(153, 64, 'Jual Sampah', '2023-11-15', 740400000, NULL, 113, 'gg'),
(154, 64, 'Jual Sampah', '2023-11-15', 1072800000, NULL, 114, 'gg'),
(155, 66, 'Jual Sampah', '2023-11-15', 32000, NULL, 115, 'Haidek'),
(156, 66, 'Jemput Sampah', '2023-11-15', 30000, 87, NULL, 'Hai'),
(157, 67, 'Jual Sampah', '2023-11-15', 21800, NULL, 116, 'Prujakan'),
(158, 68, 'Jual Sampah', '2023-11-15', 446800, NULL, 117, 'Cybertron bantul'),
(159, 68, 'Jemput Sampah', '2023-11-15', 50000, 88, NULL, 'Bantul ngulon sitik'),
(160, 69, 'Jual Sampah', '2023-11-16', 51500, NULL, 118, '<script>alert(\"Hackkk\")</script>'),
(161, 69, 'Jemput Sampah', '2023-11-16', 5000, 89, NULL, '<script>alert(\"Hackkk\")</script>'),
(162, 64, 'Jual Sampah', '2023-11-16', 91500000, NULL, 119, 'gg'),
(163, 64, 'Jemput Sampah', '2023-11-16', 495000, 90, NULL, 'Shin-Okubo'),
(164, 71, 'Jual Sampah', '2023-11-22', 2760700, NULL, 120, 'jl.apel'),
(165, 73, 'Jual Sampah', '2023-12-15', 50000, NULL, 121, 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `history_jemput`
--

CREATE TABLE `history_jemput` (
  `id_jemput` int(11) NOT NULL,
  `sampah_organik` tinyint(1) DEFAULT NULL,
  `sampah_anorganik` tinyint(1) DEFAULT NULL,
  `sampah_b3` tinyint(1) DEFAULT NULL,
  `berat_sampah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_jemput`
--

INSERT INTO `history_jemput` (`id_jemput`, `sampah_organik`, `sampah_anorganik`, `sampah_b3`, `berat_sampah`) VALUES
(84, 0, 1, 0, 25),
(85, 0, 1, 1, 10),
(86, 1, 0, 0, 99),
(87, 1, 1, 1, 6),
(88, 1, 0, 0, 10),
(89, 1, 0, 0, 1),
(90, 1, 1, 1, 99);

-- --------------------------------------------------------

--
-- Table structure for table `history_jual`
--

CREATE TABLE `history_jual` (
  `id_jual` int(11) NOT NULL,
  `handphone` int(11) DEFAULT NULL,
  `monitor` int(11) DEFAULT NULL,
  `kulkas` int(11) DEFAULT NULL,
  `televisi` int(11) DEFAULT NULL,
  `baterai_aki` int(11) DEFAULT NULL,
  `botol_mineral` int(11) DEFAULT NULL,
  `jerigen` int(11) DEFAULT NULL,
  `plastik_campur` int(11) DEFAULT NULL,
  `kardus` int(11) DEFAULT NULL,
  `kertas_arsip` int(11) DEFAULT NULL,
  `duplex` int(11) DEFAULT NULL,
  `kertas_buram` int(11) DEFAULT NULL,
  `sak_semen` int(11) DEFAULT NULL,
  `kaleng_alumunium` int(11) DEFAULT NULL,
  `besi` int(11) DEFAULT NULL,
  `baja` int(11) DEFAULT NULL,
  `tembaga` int(11) DEFAULT NULL,
  `alumunium` int(11) DEFAULT NULL,
  `botol_sirup` int(11) DEFAULT NULL,
  `botol_campur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_jual`
--

INSERT INTO `history_jual` (`id_jual`, `handphone`, `monitor`, `kulkas`, `televisi`, `baterai_aki`, `botol_mineral`, `jerigen`, `plastik_campur`, `kardus`, `kertas_arsip`, `duplex`, `kertas_buram`, `sak_semen`, `kaleng_alumunium`, `besi`, `baja`, `tembaga`, `alumunium`, `botol_sirup`, `botol_campur`) VALUES
(90, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(93, 1, 1, 65, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(95, 0, 211111111, 0, 0, 0, 2111111, 0, 0, 0, 2111111111, 0, 0, 0, 21111, 0, 0, 0, 0, 21, 0),
(96, 1, 1, 166, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97, 1, 1, 305, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98, 1, 1, 311, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, 851, 1, 1219, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(101, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(102, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(103, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(104, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(105, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(106, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(107, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(108, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(109, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(110, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(111, 1117, 0, 15085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(112, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(113, 0, 0, 2468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(114, 0, 0, 3576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(115, 0, 0, 0, 0, 0, 5, 0, 5, 5, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(116, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(117, 0, 0, 1, 1, 1, 4, 1, 0, 1, 10, 0, 8, 1, 1, 1, 1, 0, 0, 1, 0),
(118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0),
(119, 0, 0, 305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(120, 0, 0, 9, 0, 0, 5, 0, 0, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0, 4, 0),
(121, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tarif_sampah`
--

CREATE TABLE `tarif_sampah` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `tarif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarif_sampah`
--

INSERT INTO `tarif_sampah` (`id`, `tanggal`, `tarif`) VALUES
(1, '2023-11-05', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `id` int(10) NOT NULL,
  `saldo` int(11) DEFAULT '0',
  `username` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`id`, `saldo`, `username`, `password`, `email`, `address`) VALUES
(62, 375000, 'Dilla', '123', 'Dilla@gmail.com', 'Mboh'),
(63, 758800, 'ahmad', 'ahmad', 'ahmad@gmail.com', 'SAMAS'),
(64, 2146988647, 'nanda gay', 'kk', 'kk@kk.com', 'Seyegan'),
(65, 2146988647, 'irul mambu', 'botol', 'kaka@gmail.com', 'SANDEN'),
(66, 2000, 'te', 'te', 'te@gmail.com', 'Te'),
(67, 21800, 'Giacinta', '123', 'Blgg@gmail.com', 'Prujakan'),
(68, 396800, 'Rukiruki', 'ocaocaoca', 'awokawok@gmail.cok', 'Bulan ke7 dari bumi'),
(69, 46500, 'test', '123', 'test@gmail.com', 'DIY'),
(70, 0, 'sampahku', 'samahku', 'sampahku@gmail.com', 'jl.mangga'),
(71, 2760700, 'sampah', '12345678', 'sampah@gmail.com', 'jl.apel'),
(72, 0, 'bebas123', '12345678', 'bebas123@gmail.com', 'bebas'),
(73, 50000, 'p', 'p', 'p@gmail.com', 'p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `harga_sampah`
--
ALTER TABLE `harga_sampah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_all`
--
ALTER TABLE `history_all`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_penjemputan` (`id_jemput`),
  ADD KEY `history_all_ibfk_3` (`id_jual`);

--
-- Indexes for table `history_jemput`
--
ALTER TABLE `history_jemput`
  ADD PRIMARY KEY (`id_jemput`);

--
-- Indexes for table `history_jual`
--
ALTER TABLE `history_jual`
  ADD PRIMARY KEY (`id_jual`);

--
-- Indexes for table `tarif_sampah`
--
ALTER TABLE `tarif_sampah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `harga_sampah`
--
ALTER TABLE `harga_sampah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `history_all`
--
ALTER TABLE `history_all`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `history_jemput`
--
ALTER TABLE `history_jemput`
  MODIFY `id_jemput` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `history_jual`
--
ALTER TABLE `history_jual`
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `tarif_sampah`
--
ALTER TABLE `tarif_sampah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history_all`
--
ALTER TABLE `history_all`
  ADD CONSTRAINT `history_all_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_data` (`id`),
  ADD CONSTRAINT `history_all_ibfk_2` FOREIGN KEY (`id_jemput`) REFERENCES `history_jemput` (`id_jemput`),
  ADD CONSTRAINT `history_all_ibfk_3` FOREIGN KEY (`id_jual`) REFERENCES `history_jual` (`id_jual`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

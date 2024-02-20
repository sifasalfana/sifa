-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2023 at 06:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iuran_sampah_warga`
--

-- --------------------------------------------------------

--
-- Table structure for table `iuran`
--

CREATE TABLE `iuran` (
  `ID` int(100) NOT NULL,
  `NO_KK` int(100) NOT NULL,
  `TANGGAL` date NOT NULL,
  `BULAN` varchar(100) NOT NULL,
  `NOMINAL` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `iuran`
--

INSERT INTO `iuran` (`ID`, `NO_KK`, `TANGGAL`, `BULAN`, `NOMINAL`) VALUES
(984, 12344, '2023-08-01', 'agustus', 30000),
(985, 12345, '2023-08-01', 'agustus', 30000),
(986, 12346, '2023-08-01', 'agustus', 30000),
(987, 12342, '2023-09-06', 'september', 30000),
(988, 12343, '2023-09-17', 'september', 30000),
(992, 12341, '2023-07-12', 'juli', 30000),
(997, 12347, '2023-12-07', 'desember', 30000),
(998, 25436, '2023-09-02', 'september', 30000),
(1001, 12348, '2023-10-11', 'oktober', 30000),
(1003, 123410, '2023-11-08', 'november', 30000),
(1004, 121431, '2023-10-11', 'oktober', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `pengurus`
--

CREATE TABLE `pengurus` (
  `ID` int(100) NOT NULL,
  `NAMA` varchar(100) NOT NULL,
  `JABATAN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengurus`
--

INSERT INTO `pengurus` (`ID`, `NAMA`, `JABATAN`) VALUES
(23451, 'cuargi', 'ketua rt '),
(23452, 'sandri ismail putra', 'ketua karangtaruna'),
(23453, 'muhammad irgi', 'bendahara 1'),
(23454, 'reina zihar', 'bendahara 2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'warga', 'warga', 'user');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vpem`
-- (See below for the actual view)
--
CREATE TABLE `vpem` (
`BULAN` varchar(100)
,`pemasukan` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `NO_KK` int(100) NOT NULL,
  `NAMA_KEPALA_KELUARGA` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`NO_KK`, `NAMA_KEPALA_KELUARGA`) VALUES
(12341, 'elis'),
(12342, 'demian ardito'),
(12343, 'marzuki cahya'),
(12344, 'nizar alkaisar'),
(12345, 'marka atmaja'),
(12346, 'jergas aditama'),
(12347, 'reval hadian'),
(12348, 'haritanu'),
(12349, 'ovy nadiman'),
(12350, 'gangga ilman'),
(12351, 'hardi'),
(12352, 'rai'),
(12353, 'ivana'),
(12355, 'riyad'),
(12356, 'dio');

-- --------------------------------------------------------

--
-- Structure for view `vpem`
--
DROP TABLE IF EXISTS `vpem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpem`  AS SELECT `iuran`.`BULAN` AS `BULAN`, sum(`iuran`.`NOMINAL`) AS `pemasukan` FROM `iuran` GROUP BY `iuran`.`BULAN`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `iuran`
--
ALTER TABLE `iuran`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NO_KK` (`NO_KK`);

--
-- Indexes for table `pengurus`
--
ALTER TABLE `pengurus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`NO_KK`),
  ADD UNIQUE KEY `NO_KK` (`NO_KK`),
  ADD UNIQUE KEY `NO_KK_2` (`NO_KK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iuran`
--
ALTER TABLE `iuran`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `warga`
--
ALTER TABLE `warga`
  MODIFY `NO_KK` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12357;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

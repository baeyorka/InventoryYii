-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2017 at 09:22 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rop_siak`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` varchar(25) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `satuan` int(1) NOT NULL,
  `stok_akhir` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `penggunaan_tahun` int(11) NOT NULL,
  `safety_stok` int(11) NOT NULL,
  `rop` int(11) NOT NULL,
  `eoq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `satuan`, `stok_akhir`, `harga`, `penggunaan_tahun`, `safety_stok`, `rop`, `eoq`) VALUES
('AT0002', 'Kain Karembong', 1, 211, 3000, 30000, 20, 349, 155),
('AT0003', 'Surpet', 2, 100, 100000, 4000, 300, 344, 57),
('AT0004', 'Kain Wol', 1, 324, 4500, 5000, 100, 155, 63);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE IF NOT EXISTS `barang_keluar` (
`id` int(11) NOT NULL,
  `kode_barang` varchar(25) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `kode_barang`, `jumlah`, `tanggal`, `user_id`) VALUES
(1, 'AT0001', 10, '1990-09-11', 1),
(2, 'AT0001', 1, '2017-09-11', 1),
(3, 'AT0001', 3, '2017-09-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE IF NOT EXISTS `barang_masuk` (
`id` int(11) NOT NULL,
  `kode_barang` varchar(25) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `kode_barang`, `jumlah`, `tanggal`, `user_id`) VALUES
(1, 'AT0001', 9, '2017-09-11', 1),
(2, 'AT0001', 15, '2017-09-11', 1),
(3, 'AT0004', 2000, '2017-09-11', 1),
(4, 'AT0004', 30000, '2017-09-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE IF NOT EXISTS `rules` (
`id` int(11) NOT NULL,
  `biaya_pemesanan` int(11) NOT NULL,
  `biaya_penyimpanan` int(11) NOT NULL,
  `lead_time` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `biaya_pemesanan`, `biaya_penyimpanan`, `lead_time`) VALUES
(1, 10, 25, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`USER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `USER_NAME` varchar(10) NOT NULL,
  `USER_PASSWORD` varchar(30) NOT NULL,
  `USER_FULLNAME` varchar(50) NOT NULL,
  `USER_IS_ACTIVE` tinyint(4) NOT NULL,
  `USER_IMAGE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `GROUP_ID`, `USER_NAME`, `USER_PASSWORD`, `USER_FULLNAME`, `USER_IS_ACTIVE`, `USER_IMAGE`) VALUES
(1, 1, 'admin', 'admin', 'Iwan Kurniawan', 1, 'admin.jpg'),
(44, 2, 'sigit', 'sigit', 'sigit', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
`GROUP_ID` int(11) NOT NULL,
  `GROUP_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`GROUP_ID`, `GROUP_NAME`) VALUES
(1, 'Admin'),
(2, 'Pegawai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
 ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`USER_ID`), ADD KEY `FK_RELATIONSHIP_2` (`GROUP_ID`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
 ADD PRIMARY KEY (`GROUP_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
MODIFY `GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `user_group` (`GROUP_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

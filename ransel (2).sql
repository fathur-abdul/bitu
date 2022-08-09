-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2022 at 05:34 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ransel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bayar`
--

CREATE TABLE `bayar` (
  `kode_bayar` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `status` enum('pending','verified') NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bayar`
--

INSERT INTO `bayar` (`kode_bayar`, `id_pesanan`, `id_user`, `tanggal_bayar`, `keterangan`, `status`, `total`) VALUES
(1244, 3112, 898, '2022-08-06 13:41:54', '1232', 'pending', 799999),
(12987, 1234, 0, '0000-00-00 00:00:00', '', '', 0),
(123467, 1234, 1221, '2022-08-06 10:44:00', 'sudah melakukan pembayaran dengan menggunakan grat', 'verified', 550000);

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(25) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `tanggal_pengiriman` datetime NOT NULL,
  `kode_pembayaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`id`, `id_produk`, `nama_produk`, `id_pesanan`, `tanggal_bayar`, `tanggal_pengiriman`, `kode_pembayaran`) VALUES
(1, 12341, 'Bloods', 1234, '2022-08-06 10:44:00', '2022-08-08 10:44:18', 123467),
(2, 28098, 'Eiger', 1222, '2022-08-06 11:00:00', '2022-08-08 10:59:54', 12987);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(25) NOT NULL,
  `dekripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `id_produk`, `nama_produk`, `dekripsi`) VALUES
(1, 'Tas Punggung', 12341, 'Bloods', 'Tas Punggung'),
(2, 'Tas Slendang', 28098, 'Eiger', 'tas slendang eiger'),
(3, 'Tas Punggung', 1277231, 'Screamous', 'Tas Punggung'),
(5, 'Tas Samping', 0, 'Screamous', 'Tas Samping lokal');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'mine', 1, 0, 0, NULL, 1),
(2, 2, 'fathur', 1, 0, 0, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `kode_bayar` int(11) DEFAULT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `tanggal_pengeluaran` datetime NOT NULL,
  `harga` int(15) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `kode_bayar`, `nama_barang`, `tanggal_pengeluaran`, `harga`, `jumlah`, `total`) VALUES
(1, 123467, '', '2022-08-06 10:52:35', 550000, 550000, 550000),
(2, 12987, '', '2022-08-06 11:04:56', 350000, 350000, 350000);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:mahasiswa/mhs:get', 15, 1655520652, 'mine'),
(2, 'uri:mahasiswa/mhs:post', 1, 1655521509, 'mine'),
(3, 'uri:mahasiswa/mhs:get', 1, 1655521838, 'fathur'),
(4, 'uri:API/pesanan/pesanan:get', 3, 1659780222, 'mine'),
(5, 'uri:API/produk/produk:get', 3, 1659778612, 'mine'),
(6, 'uri:API/kategori/kategori:get', 3, 1659779416, 'mine'),
(7, 'uri:API/pembayaran/pembayaran:get', 2, 1659088569, 'mine'),
(8, 'uri:API/laporan/laporan:get', 3, 1659785495, 'mine'),
(9, 'uri:API/produk/produk:post', 3, 1659779026, 'mine'),
(10, 'uri:API/bayar/bayar:get', 3, 1659781891, 'mine'),
(11, 'uri:API/kategori/kategori:post', 3, 1659779653, 'mine'),
(12, 'uri:API/pesanan/pesanan:post', 16, 1659780562, 'mine'),
(13, 'uri:API/bayar/bayar:post', 5, 1659782405, 'mine'),
(14, 'uri:API/laporan/laporan:post', 19, 1659785787, 'mine');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_pesanan` datetime NOT NULL,
  `tanggal_pengiriman` datetime NOT NULL,
  `status` enum('lunas','belum lunas') NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `user_id`, `nama`, `alamat`, `tanggal_pesanan`, `tanggal_pengiriman`, `status`, `telephone`, `ongkir`) VALUES
(1222, 2808, 'Bimo Arga ', 'Cimahi', '2022-08-06 10:59:54', '2022-08-08 10:59:54', 'lunas', '08582184712', 14000),
(1234, 1221, 'Fathur Abdul', 'Bandung', '2022-08-06 10:44:18', '2022-08-08 10:44:18', 'lunas', '085846167488', 12000),
(3112, 890, 'Famo', 'Bandung', '2022-08-07 17:37:17', '2022-08-10 17:37:17', 'belum lunas', '085846167488', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(25) NOT NULL,
  `dekripsi` text NOT NULL,
  `bahan` varchar(25) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `dekripsi`, `bahan`, `id_kategori`, `harga`) VALUES
(122, 'screamous', 'Tas lokal Bandung', 'kanvas', NULL, 550000),
(12341, 'Bloods', 'Tas punggung lokal dari brands bloods', 'kanvas', 1, 550000),
(28098, 'Eiger', 'Tas slendang yang cocok untuk kegiatan olahraga, mendaki gunung untuk menyimpan barang barang berharga', 'kanvas', 2, 350000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `npm` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`npm`, `nama`, `alamat`, `email`) VALUES
(1204075, 'fathur', 'babakan garut', 'foong@poltekpos.aca.id'),
(12040001, 'Cinta', 'Sarijadi', 'cinta@poltekpos.ac.id'),
(12040002, 'Rangga', 'Cibogo', 'rangga@poltekpos.ac.id');

-- --------------------------------------------------------

--
-- Table structure for table `t_mahasiswa`
--

CREATE TABLE `t_mahasiswa` (
  `npm` int(11) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `agama` varchar(30) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `t_mahasiswa`
--

INSERT INTO `t_mahasiswa` (`npm`, `nama`, `jenis_kelamin`, `alamat`, `agama`, `no_hp`, `email`) VALUES
(1204001, 'Jadon', 'Laki-laki', 'Jakarta', 'Islam', '0833333333333', 'jadon@ulbi.ac.id'),
(1204002, 'Hiya', 'Perempuan', 'Huya', 'Khonghucu', '0822222222222', 'hihu@ulbi.ac.id'),
(1204004, 'Zigaz', 'Laki-laki', 'Zaga', 'Islam', '123131232', 'zigzag@ulbi.ac.id'),
(1204005, 'Joni', 'Laki-laki', 'Bandung', 'Budha', '08123123213232', 'joni11@ulbi.ac.id'),
(1204006, 'Abi', 'Laki-laki', 'Abu', 'Hindu', '08123123122', 'abi99@ulbi.ac.id'),
(1204007, 'Kiki', 'Perempuan', 'Cimahi', 'Protestan', '1111111111', 'kiki@ulbi.ac.id'),
(1204008, 'Jadon', 'laki - laki', 'Bandung', 'islam', '0833333333333', 'jadon@ulbi.ac.id'),
(1204075, 'Fathur Abdul Halim', 'laki-laki', 'Jl. Babakan Garut', 'Islam', '081231231123123', 'fathur@poltekpos.ac.id');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(15) NOT NULL,
  `status` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `nama`, `email`, `telephone`, `alamat`, `password`, `status`) VALUES
(898, 'Famo', 'fathurbimo@gmail.com', '081231238123', 'Bandung Cimahi', '1221', 'user'),
(1221, 'fathur', 'fathurabdul@gmail.co', '085846167488', 'Bandung', '1221', 'admin'),
(2808, 'bimo ', 'bimoarga@gmail.com', '08582184712', 'Cimahi', '2211', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`kode_bayar`),
  ADD UNIQUE KEY `id_pesanan` (`id_pesanan`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_produk` (`id_produk`),
  ADD UNIQUE KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD UNIQUE KEY `kode_bayar` (`kode_bayar`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `t_mahasiswa`
--
ALTER TABLE `t_mahasiswa`
  ADD PRIMARY KEY (`npm`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bayar`
--
ALTER TABLE `bayar`
  ADD CONSTRAINT `bayar_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`);

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`);

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`kode_bayar`) REFERENCES `bayar` (`kode_bayar`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

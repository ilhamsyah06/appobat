-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2020 at 06:47 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sendang`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_transaksi` int(11) DEFAULT NULL,
  `id_obat` varchar(11) DEFAULT NULL,
  `id_stok` int(11) DEFAULT NULL,
  `harga` int(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `total` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_transaksi`, `id_obat`, `id_stok`, `harga`, `qty`, `total`) VALUES
(1, 'snxd89328', 7, 21000, 1, 21000),
(1, 'bjwue7863', 4, 4000, 1, 4000),
(1, '28AJSHD2', 1, 5000, 1, 5000),
(2, '28AJSHD2', 1, 5000, 1, 5000),
(3, '28AJSHD2', 1, 5000, 1, 5000),
(4, 'bjwue7863', 4, 4000, 1, 4000),
(4, '28AJSHD2', 8, 90000, 1, 90000);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Obat bebas'),
(2, 'Obat Bebas Terbatas'),
(3, 'Obat Keras (dengan resep dokter)'),
(4, 'Jamu (Empirical based herbal medicine)'),
(5, 'Obat Herbal Terstandar (Scientific based herbal medicine)');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` varchar(11) NOT NULL,
  `nama_obat` varchar(100) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `id_kategori`, `keterangan`) VALUES
('28AJSHD2', 'Livron B Plex', 1, 'vitamin tubuh'),
('732jhdd89', 'Antimo Dimenhydrinate', 2, 'obat anti mabuk'),
('bjwue7863', 'Pilkita Pegal Linu Cair', 4, 'Menghilangkan rasa linu'),
('nxid68ded', 'Stimuno Forte Imunomodulator', 6, 'Obat untuk daya tahan tubuh'),
('nxsdwk6732', 'Tolak Angin Sidomuncul', 5, 'Mencegah masuk angin'),
('snxd89328', 'Penisilin', 3, 'obat diabetes');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id_stok` int(11) NOT NULL,
  `stok_masuk` int(11) DEFAULT NULL,
  `stok_sekarang` int(11) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `harga_beli` int(100) DEFAULT NULL,
  `harga_jual` int(100) DEFAULT NULL,
  `profit` int(100) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_kadaluarsa` date DEFAULT NULL,
  `id_obat` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id_stok`, `stok_masuk`, `stok_sekarang`, `satuan`, `harga_beli`, `harga_jual`, `profit`, `tgl_masuk`, `tgl_kadaluarsa`, `id_obat`) VALUES
(1, 30, 21, 'strip', 4500, 5000, 500, '2020-03-12', '2024-03-20', '28AJSHD2'),
(2, 35, 24, 'strip', 4500, 5000, 500, '2020-03-13', '2024-03-21', '732jhdd89'),
(3, 40, 23, 'strip', 19000, 20000, 1000, '2020-03-14', '2024-03-22', 'snxd89328'),
(4, 45, 30, 'strip', 3500, 4000, 500, '2020-03-15', '2024-03-23', 'bjwue7863'),
(5, 50, 25, 'strip', 2500, 3000, 500, '2020-03-16', '2024-03-24', 'nxsdwk6732'),
(6, 55, 40, 'strip', 22000, 23000, 1000, '2020-03-17', '2024-03-25', 'nxid68ded'),
(7, 40, 40, 'strip', 20000, 21000, 1000, '2020-03-18', '2025-03-27', 'snxd89328'),
(8, 11, 14, 'Botol', 80000, 90000, 10000, '2020-04-01', '2020-04-30', '28AJSHD2');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `no_invoice` varchar(50) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `total_bayar` int(100) DEFAULT NULL,
  `jumlah_bayar` int(100) DEFAULT NULL,
  `kembalian` int(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `no_invoice`, `tgl_transaksi`, `total_bayar`, `jumlah_bayar`, `kembalian`, `user_id`) VALUES
(1, 'SDG00120200402', '2020-04-02', 30000, 50000, 20000, 1),
(2, 'SDG00220200402', '2020-04-02', 5000, 7000, 2000, 1),
(3, 'SDG00320200402', '2020-04-02', 5000, 7000, 2000, 1),
(4, 'SDG00420200402', '2020-04-02', 94000, 100000, 6000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `nohp`, `alamat`, `level`) VALUES
(1, 'hildha', 'hildha', 'Hildha Wahidah', '909809', 'Kediri', 'Pegawai'),
(2, 'rizia', 'riza', 'rizia', '089786453245', 'Ngajuk', 'Owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

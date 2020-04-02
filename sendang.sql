/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - sendang
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sendang` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sendang`;

/*Table structure for table `detail_transaksi` */

DROP TABLE IF EXISTS `detail_transaksi`;

CREATE TABLE `detail_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `id_stok` int(11) NOT NULL,
  `harga` int(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `total` int(50) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`,`id_obat`,`id_stok`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_transaksi` */

insert  into `detail_transaksi`(`id_transaksi`,`id_obat`,`id_stok`,`harga`,`qty`,`total`) values 
(1,1,0,5000,2,50000),
(2,2,0,5000,7,35000),
(3,3,0,20000,1,20000),
(4,4,0,4000,10,40000),
(5,5,0,23000,1,23000);

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nama_kategori`) values 
(1,'Obat bebas'),
(2,'Obat Bebas Terbatas'),
(3,'Obat Keras (dengan resep dokter)'),
(4,'Jamu (Empirical based herbal medicine)'),
(5,'Obat Herbal Terstandar (Scientific based herbal medicine)');

/*Table structure for table `obat` */

DROP TABLE IF EXISTS `obat`;

CREATE TABLE `obat` (
  `id_obat` varchar(11) NOT NULL,
  `nama_obat` varchar(100) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `obat` */

insert  into `obat`(`id_obat`,`nama_obat`,`id_kategori`,`keterangan`) values 
('28AJSHD2','Livron B Plex',1,'vitamin tubuh'),
('732jhdd89','Antimo Dimenhydrinate',2,'obat anti mabuk'),
('bjwue7863','Pilkita Pegal Linu Cair',4,'Menghilangkan rasa linu'),
('nxid68ded','Stimuno Forte Imunomodulator',6,'Obat untuk daya tahan tubuh'),
('nxsdwk6732','Tolak Angin Sidomuncul',5,'Mencegah masuk angin'),
('snxd89328','Penisilin',3,'obat diabetes');

/*Table structure for table `stok` */

DROP TABLE IF EXISTS `stok`;

CREATE TABLE `stok` (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `stok_masuk` int(11) DEFAULT NULL,
  `stok_sekarang` int(11) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `harga_beli` int(100) DEFAULT NULL,
  `harga_jual` int(100) DEFAULT NULL,
  `profit` int(100) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_kadaluarsa` date DEFAULT NULL,
  `id_obat` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_stok`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `stok` */

insert  into `stok`(`id_stok`,`stok_masuk`,`stok_sekarang`,`satuan`,`harga_beli`,`harga_jual`,`profit`,`tgl_masuk`,`tgl_kadaluarsa`,`id_obat`) values 
(1,30,21,'strip',4500,5000,500,'2020-03-12','2024-03-20','28AJSHD2'),
(2,35,24,'strip',4500,5000,500,'2020-03-13','2024-03-21','732jhdd89'),
(3,40,23,'strip',19000,20000,1000,'2020-03-14','2024-03-22','snxd89328'),
(4,45,30,'strip',3500,4000,500,'2020-03-15','2024-03-23','bjwue7863'),
(5,50,25,'strip',2500,3000,500,'2020-03-16','2024-03-24','nxsdwk6732'),
(6,55,40,'strip',22000,23000,1000,'2020-03-17','2024-03-25','nxid68ded'),
(7,40,40,'strip',20000,21000,1000,'2020-03-18','2025-03-27','snxd89328');

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(50) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `total_bayar` int(100) DEFAULT NULL,
  `jumlah_bayar` int(100) DEFAULT NULL,
  `kembalian` int(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`id_transaksi`,`no_invoice`,`tgl_transaksi`,`total_bayar`,`jumlah_bayar`,`kembalian`,`user_id`) values 
(1,'inv-1','0000-00-00',50000,50000,0,1),
(2,'inv-2','0000-00-00',35000,35000,0,2),
(3,'inv-3','0000-00-00',20000,20000,0,1),
(4,'inv-4','0000-00-00',45000,50000,5000,2),
(5,'inv-5','0000-00-00',17000,20000,3000,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `alamat` text,
  `level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id_user`,`username`,`password`,`nama`,`nohp`,`alamat`,`level`) values 
(1,'hildha','hildha','Hildha Wahidah','909809','Kediri','Pegawai'),
(2,'rizia','riza','rizia','089786453245','Ngajuk','Owner');

/* Trigger structure for table `detail_transaksi` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `stokObat` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `stokObat` AFTER INSERT ON `detail_transaksi` FOR EACH ROW UPDATE obat
set stok = stok - new.qty
where
id_obat=new.id_obat */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

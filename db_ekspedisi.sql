/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.26-MariaDB : Database - db_ekspedisi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ekspedisi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_ekspedisi`;

/*Table structure for table `tabel_ongkir` */

DROP TABLE IF EXISTS `tabel_ongkir`;

CREATE TABLE `tabel_ongkir` (
  `id_ongkir` int(11) NOT NULL AUTO_INCREMENT,
  `asal` varchar(100) DEFAULT NULL,
  `tujuan` varchar(100) DEFAULT NULL,
  `harga` int(100) DEFAULT NULL,
  PRIMARY KEY (`id_ongkir`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tabel_ongkir` */

insert  into `tabel_ongkir`(`id_ongkir`,`asal`,`tujuan`,`harga`) values 
(1,'Bandung','Cianjur',10000),
(2,'Bandung','Cirebon',10000),
(3,'Bandung','Garut',10000),
(4,'Bandng','Tasikmalaya',10000),
(5,'Jakarta','Bandung',10000),
(6,'Jakarta','Bekasi',10000),
(7,'Jakarta','Depok',10000);

/*Table structure for table `tabel_order` */

DROP TABLE IF EXISTS `tabel_order`;

CREATE TABLE `tabel_order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `id_ongkir` int(11) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `total_harga` int(100) DEFAULT NULL,
  `status` enum('pengiriman','menuju lokasi','diterima') DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_user` (`id_user`),
  KEY `admin_id` (`admin_id`),
  KEY `id_ongkir` (`id_ongkir`),
  CONSTRAINT `tabel_order_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tabel_user` (`id_user`),
  CONSTRAINT `tabel_order_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `table_admin` (`admin_id`),
  CONSTRAINT `tabel_order_ibfk_3` FOREIGN KEY (`id_ongkir`) REFERENCES `tabel_ongkir` (`id_ongkir`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `tabel_order` */

insert  into `tabel_order`(`id_order`,`id_user`,`admin_id`,`id_ongkir`,`nama_barang`,`berat`,`total_harga`,`status`) values 
(1,5,3,3,'Sepatu',2,20000,'pengiriman'),
(2,5,3,3,'Baju',4,40000,'pengiriman'),
(12,2,2,2,'Tas',2,20000,'pengiriman'),
(13,3,2,2,'Dompet',2,20000,'diterima'),
(14,6,2,2,'Dompet',5,50000,'pengiriman');

/*Table structure for table `tabel_user` */

DROP TABLE IF EXISTS `tabel_user`;

CREATE TABLE `tabel_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tujuan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tabel_user` */

insert  into `tabel_user`(`id_user`,`nama_user`,`alamat`,`tujuan`) values 
(1,'Andi Nugraha','Jl sukarno','cianjur'),
(2,'Abdul Kodir','jl ahmad yani','bandung'),
(3,'Yusuf','Jl Abdul Karim Bandung','ciamis'),
(4,'Ahmad','Jl Budiman','Bogor'),
(5,'Rahmat','Jl Cibolerang','Bandung'),
(6,'Arif','bandung','jakarta');

/*Table structure for table `table_admin` */

DROP TABLE IF EXISTS `table_admin`;

CREATE TABLE `table_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) DEFAULT NULL,
  `admin_email` varchar(50) DEFAULT NULL,
  `admin_password` text,
  `role` enum('super','cabang') DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `table_admin` */

insert  into `table_admin`(`admin_id`,`admin_name`,`admin_email`,`admin_password`,`role`) values 
(1,'Ammar','ammartaradifa2@gmail.com','fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe','super'),
(2,'Admin Bandung','adminbandung@gmail.com','fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe','cabang'),
(3,'Admin Jakarta','adminjakarta@gmail.com','8e7cf0d94071805a9281c5ed51938ff436604652a940c96841afaeded8973cc75ca6e6fc1c2c5f0c3f96c5a37d78e20f7f0da23a41ad3ff0b492d58018311e31','cabang'),
(4,'Admin Bogor','adminbogor@gmail.com','fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe','cabang');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.19-MariaDB : Database - kemakananku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kemakananku` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kemakananku`;

/*Table structure for table `akses` */

DROP TABLE IF EXISTS `akses`;

CREATE TABLE `akses` (
  `idakses` int(100) NOT NULL AUTO_INCREMENT,
  `hak` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idakses`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `akses` */

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `bank` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

/*Table structure for table `data_admin` */

DROP TABLE IF EXISTS `data_admin`;

CREATE TABLE `data_admin` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `Job` varchar(20) DEFAULT NULL,
  `notelp` varchar(16) DEFAULT NULL,
  `kode_user` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data_admin` */

/*Table structure for table `data_catering` */

DROP TABLE IF EXISTS `data_catering`;

CREATE TABLE `data_catering` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nama_catering` varchar(255) DEFAULT NULL,
  `pemilik` varchar(255) DEFAULT NULL,
  `alamat` text,
  `notelpon` varchar(15) DEFAULT NULL,
  `deskripsi` text,
  `bayar_registrasi` int(1) DEFAULT '0',
  `laporan_keuangan` int(1) DEFAULT '0',
  `first_login` int(1) DEFAULT '0',
  `kode_user` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_user` (`kode_user`),
  CONSTRAINT `data_catering_ibfk_1` FOREIGN KEY (`kode_user`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data_catering` */

/*Table structure for table `data_pembeli` */

DROP TABLE IF EXISTS `data_pembeli`;

CREATE TABLE `data_pembeli` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `Perkerjaan` varchar(255) DEFAULT NULL,
  `alamat` text,
  `notelp` varchar(15) DEFAULT NULL,
  `e-mail` varchar(255) DEFAULT NULL,
  `keterangan` tinytext,
  `first_login` int(1) DEFAULT '0',
  `log` datetime DEFAULT NULL,
  `vip` int(1) DEFAULT '0',
  `utang` int(100) DEFAULT NULL,
  `kode_user` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data_pembeli` */

/*Table structure for table `detail_bank` */

DROP TABLE IF EXISTS `detail_bank`;

CREATE TABLE `detail_bank` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `norek` varchar(100) DEFAULT NULL,
  `atasnama` varchar(100) DEFAULT NULL,
  `kode_bank` int(5) DEFAULT NULL,
  `kode_penjual` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `norek` (`norek`),
  KEY `kode_bank` (`kode_bank`),
  KEY `kode_penjual` (`kode_penjual`),
  CONSTRAINT `detail_bank_ibfk_1` FOREIGN KEY (`kode_bank`) REFERENCES `bank` (`id`),
  CONSTRAINT `detail_bank_ibfk_2` FOREIGN KEY (`kode_penjual`) REFERENCES `data_catering` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_bank` */

/*Table structure for table `jadwal` */

DROP TABLE IF EXISTS `jadwal`;

CREATE TABLE `jadwal` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jadwal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jadwal` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `iduser` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `kode_akses` int(100) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `username` (`username`),
  KEY `user_ibfk_1` (`kode_akses`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`kode_akses`) REFERENCES `akses` (`idakses`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

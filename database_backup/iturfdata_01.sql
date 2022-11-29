/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 5.7.36 : Database - iturf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`iturf` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `iturf`;

/*Table structure for table `auth_tokens` */

DROP TABLE IF EXISTS `auth_tokens`;

CREATE TABLE `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_token` varchar(500) NOT NULL,
  `user_ip` varchar(100) DEFAULT NULL,
  `date_created` int(11) NOT NULL,
  `token_status` char(1) DEFAULT '1' COMMENT '1=active,0=inactive',
  PRIMARY KEY (`id`),
  KEY `fk_auth_token_user` (`user_id`),
  CONSTRAINT `fk_auth_token_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `avatars` */

DROP TABLE IF EXISTS `avatars`;

CREATE TABLE `avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` text,
  `active` int(5) DEFAULT '1',
  `deleted` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `avatars` */

insert  into `avatars`(`id`,`name`,`image`,`active`,`deleted`) values 
(1,'Avatar1','Base64 data',1,0),
(2,'Avatar2','Base64 data',1,0),
(3,'Avatar3','Base64 data',1,0),
(4,'Avatar4','Base64 data',1,0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` char(1) DEFAULT NULL COMMENT '1=vendor,0=user',
  `district` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `pin_code` varchar(100) DEFAULT NULL,
  `avatar` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(11) unsigned DEFAULT NULL,
  `deleted_status` char(1) DEFAULT '0',
  PRIMARY KEY (`id`,`mobile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

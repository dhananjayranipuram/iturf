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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `auth_tokens` */

insert  into `auth_tokens`(`id`,`user_id`,`user_token`,`user_ip`,`date_created`,`token_status`) values 
(1,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMjUyMjksImV4cCI6MTY2OTEyODgyOSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.I1LCUeReWkGxINVkwXR72o4aTzF2fYyu9fZpsjoDTa8',NULL,0,'1'),
(2,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMjU4MzUsImV4cCI6MTY2OTEyOTQzNSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.-YstpAMmKqG0FHY1-fUFcRjaMDMzxs8vAzBgPzjNgBo',NULL,0,'1'),
(3,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMjU4NjUsImV4cCI6MTY2OTEyOTQ2NSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.lgghAcQ6FQjuFye7Q3iQ_42jiSQZNgl_8ohw3qTXMlw',NULL,0,'1'),
(4,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMjU5MjEsImV4cCI6MTY2OTEyOTUyMSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.1ggu2kJ6yJn7bOcX860-BV8YL6hC8sAvTXLBiid8xZI',NULL,0,'1'),
(5,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMjU5NDIsImV4cCI6MTY2OTEyOTU0MiwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.HPxxVqcrPEy3BPRJJJO368eogHCe6na0HjoLoOxNwes',NULL,0,'1'),
(6,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMjU5OTksImV4cCI6MTY2OTEyOTU5OSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.8xxThwL7qAWHkRirOSrEZ-wDCuJVHeXJduQGH7rnBng',NULL,0,'1'),
(7,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMjk0MjAsImV4cCI6MTY2OTEzMzAyMCwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.fGojqo0hnp7YXLK04GkOVtQy6cgrIzWJMjKXWfUYHm8',NULL,0,'1'),
(8,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMzAwOTgsImV4cCI6MTY2OTEzMzY5OCwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.BnJ66q9r1fMULCnQGpH99O8_UdymZhSv9vq-v918D6M',NULL,0,'1'),
(9,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMzg5NzEsImV4cCI6MTY2OTE0MjU3MSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.gev49M8356FI8hlZO-P-WCjIXafCtibnDzn45PDFGu0',NULL,0,'1'),
(10,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkxMzkwMjMsImV4cCI6MTY2OTE0MjYyMywibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.X8-Oc_k9fkV5JnWFkIxm4M8EomKzViix2N1k9SjAcv8',NULL,0,'1'),
(11,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkyOTgzODYsImV4cCI6MTY2OTMwMTk4NiwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.DaXuhaLTZE3siX0BVcBNdLI-utCMJC0XBc4INs14Etw',NULL,0,'1'),
(12,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkyOTg1NjMsImV4cCI6MTY2OTMwMjE2MywibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.828A7B-4cea7nF1FNkNb-p91lzehOFtKBYH85fVQkEc',NULL,0,'1'),
(13,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkyOTg1OTIsImV4cCI6MTY2OTMwMjE5MiwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.7dtLUSk32TRuYl8pCh1rCRDiRHdXaHm-CHLJOIJdTq4',NULL,0,'1'),
(14,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkzOTY4ODIsImV4cCI6MTY2OTQwMDQ4MiwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.6hST46LvSJkLb1a4Ar_nGebhUyRHcdp7vUQB8_qnVnQ',NULL,0,'1'),
(15,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkzOTc3MzUsImV4cCI6MTY2OTQwMTMzNSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.15Y7TSkYIMu7tvIiMQ0QDWr9LVTSeQhWtusUPlaRMvs',NULL,0,'1'),
(16,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2NjkzOTc3NzgsImV4cCI6MTY2OTQwMTM3OCwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.QyU4J4OtjToFayimbxpxgMz4D8eXBdw0bgx-BYxBabA',NULL,0,'1'),
(17,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk2MTI3ODIsImV4cCI6MTY2OTYxNjM4MiwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.kldpWNptLaiftguepke3K2DucDNMZI9BrnbcCMyy8Uc',NULL,0,'1'),
(18,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk2MTQ5MjUsImV4cCI6MTY2OTYxODUyNSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.OIq183KJy3EmiBErZ3Pp6bCEVDSIQJTLvkzDyX1b3g4',NULL,0,'1'),
(19,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk2MjcxNjgsImV4cCI6MTY2OTYzMDc2OCwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.4IRlP2uyb1naXldRCFNzo7maRGL9nCjDXKpFSEAkCqA',NULL,0,'1'),
(20,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk4MjAxMjAsImV4cCI6MTY2OTgyMzcyMCwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.1VTp2KHsTgY-V7KsYF0u0S8T1_EMNZhMZX0cnNfYUKw',NULL,0,'1'),
(21,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk4NzM4NjUsImV4cCI6MTY2OTg3NzQ2NSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.7c3Hxhwu0EgSXEj4_yAlb0hEV3EPGabW-9VEVlLIeTs',NULL,0,'1'),
(22,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk5MTI5NDksImV4cCI6MTY2OTkxNjU0OSwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.0W6HLpZmkrMcfE_iJArUFa8Xb3rpoEKA_Zrr13rINlA',NULL,0,'1'),
(23,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk5MTMzMzQsImV4cCI6MTY2OTkxNjkzNCwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.8tT8oX5TOLWKp6DisDD93XavjfiJIZ1LA_gFt1Tz-tA',NULL,0,'1'),
(24,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk5MTM0MDQsImV4cCI6MTY2OTkxNzAwNCwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.tCHuvE7rqTkpoLMaQ-8Vy-ZUmxbx2XhZErPqfDFUssw',NULL,0,'1'),
(25,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk5MTM0NTIsImV4cCI6MTY2OTkxNzA1MiwibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.KeLOQNPOl3viNomcaE4sQ4ZD6-TWdGj4nXCkobxbO7g',NULL,0,'1'),
(26,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk5NTc5MzcsImV4cCI6MTY2OTk2MTUzNywibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.wUtQUW1JhJFiLUdvDHnOzkvsuBekmE47UXLsk_O7a3I',NULL,0,'1'),
(27,1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEaGFuYW5qYXkiLCJhdWQiOiJSb2JlcnQiLCJzdWIiOiJVc2VyIHNlc3Npb24iLCJpYXQiOjE2Njk5NzQ0NTcsImV4cCI6MTY2OTk3ODA1NywibW9iaWxlIjoiOTQ5NjE4NTE0MyJ9.yAvDClyVy_DMo2ixVq0wUpo_KVFxjPVEY1mYC34kXPU',NULL,0,'1');

/*Table structure for table `avatars` */

DROP TABLE IF EXISTS `avatars`;

CREATE TABLE `avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` text,
  `active` int(5) DEFAULT '1',
  `deleted` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `avatars` */

insert  into `avatars`(`id`,`name`,`image`,`active`,`deleted`) values 
(1,'Avatar1','Base64 data',1,0),
(2,'Avatar2','Base64 data',1,0),
(3,'Avatar3','Base64 data',1,0),
(4,'Avatar4','Base64 data',1,0);

/*Table structure for table `turf_details` */

DROP TABLE IF EXISTS `turf_details`;

CREATE TABLE `turf_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `address` text,
  `rate` double(10,2) DEFAULT NULL,
  `events` varchar(100) DEFAULT NULL,
  `facilities` varchar(100) DEFAULT NULL,
  `available_from_date` date DEFAULT NULL,
  `available_to_date` date DEFAULT NULL,
  `working_hr_from` time DEFAULT NULL,
  `working_hr_to` time DEFAULT NULL,
  `lat` varchar(100) DEFAULT NULL,
  `lon` varchar(100) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `turf_details` */

insert  into `turf_details`(`id`,`user_id`,`name`,`image`,`address`,`rate`,`events`,`facilities`,`available_from_date`,`available_to_date`,`working_hr_from`,`working_hr_to`,`lat`,`lon`,`active`,`created_date`,`updated_date`) values 
(3,2,'ST FransisTurf',NULL,'ABC Building,lorem street',150.00,'E1,E2,E3','F1,F2,F3','2022-12-02','2023-12-31','06:00:00','12:30:00','9.991810','76.313011',1,'2022-12-02 15:35:38',NULL);

/*Table structure for table `turf_events` */

DROP TABLE IF EXISTS `turf_events`;

CREATE TABLE `turf_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `turf_events` */

insert  into `turf_events`(`id`,`name`,`image`,`active`) values 
(1,'Football',NULL,1),
(2,'Cricket',NULL,1),
(3,'Boxing',NULL,1),
(4,'Badminton',NULL,1),
(5,'Basketball',NULL,1);

/*Table structure for table `turf_facilities` */

DROP TABLE IF EXISTS `turf_facilities`;

CREATE TABLE `turf_facilities` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` text,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `turf_facilities` */

insert  into `turf_facilities`(`id`,`name`,`image`,`active`) values 
(1,'Electricity',NULL,1),
(2,'Water',NULL,1),
(3,'Parking',NULL,1),
(4,'EV Charging',NULL,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`mobile_number`,`user_name`,`email`,`password`,`user_type`,`district`,`address`,`pin_code`,`avatar`,`created_at`,`updated_at`,`created_by`,`updated_by`,`status`,`deleted_status`) values 
(1,'Dhananjay','9496185143','','dhananjayranipuram@gmail.com','123','0','kasaragod','kodombelur','671543',NULL,NULL,NULL,NULL,NULL,1,'0'),
(2,'Robert','9496185143','robo@123',NULL,'12345678','0','7','Rob villa,palarivattom','682020','1',NULL,NULL,NULL,NULL,NULL,'0'),
(13,'Robert','9496185148','robo@123',NULL,'12345678','0','7','Rob villa,palarivattom','682020','1',NULL,NULL,NULL,NULL,NULL,'0'),
(14,'Robert','9496185145','robo@123',NULL,'12345678','0','7','Rob villa,palarivattom','682020','1',NULL,NULL,NULL,NULL,NULL,'0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

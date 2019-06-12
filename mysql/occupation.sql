/*
SQLyog Ultimate v9.51 
MySQL - 5.6.36 : Database - rcv
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `occupations` */

DROP TABLE IF EXISTS `occupations`;

CREATE TABLE `occupations` (
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `occupations` */

insert  into `occupations`(`name`,`occupation`) values ('Samantha','Doctor'),('Julia','Actor'),('Maria','Actor'),('Meera','Singer'),('Ashely','Professor'),('Ketty','Professor'),('Christeen','Professor'),('Jane','Actor'),('Jenny','Doctor'),('Priya','Singer');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
/*Table structure for table `BinaryTreeNodes` */

DROP TABLE IF EXISTS `BinaryTreeNodes`;

CREATE TABLE `BinaryTreeNodes` (
  `N` int(11) DEFAULT NULL,
  `P` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `BinaryTreeNodes` */

insert  into `BinaryTreeNodes`(`N`,`P`) values (1,2),(3,2),(6,8),(9,8),(2,5),(8,5),(5,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

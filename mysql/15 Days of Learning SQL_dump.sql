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
/*Table structure for table `hackers` */

DROP TABLE IF EXISTS `hackers`;

CREATE TABLE `hackers` (
  `hacker_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `hackers` */

insert  into `hackers`(`hacker_id`,`name`) values (15758,'Rose'),(20703,'Angela'),(36396,'Frank'),(38289,'Patrick'),(44065,'Lisa'),(53473,'Kimberly'),(62529,'Bonnie'),(79722,'Michael');

/*Table structure for table `submissions` */

DROP TABLE IF EXISTS `submissions`;

CREATE TABLE `submissions` (
  `submission_date` date NOT NULL,
  `submission_id` int(11) NOT NULL,
  `hacker_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`submission_date`,`submission_id`,`hacker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `submissions` */

insert  into `submissions`(`submission_date`,`submission_id`,`hacker_id`,`score`) values ('2016-03-01',8494,20703,0),('2016-03-01',22403,53473,15),('2016-03-01',23965,79722,60),('2016-03-01',30173,36396,70),('2016-03-02',34928,20703,0),('2016-03-02',38740,15758,60),('2016-03-02',42769,79722,25),('2016-03-02',44364,79722,60),('2016-03-03',45440,20703,0),('2016-03-03',49050,36396,70),('2016-03-03',50273,79722,5),('2016-03-04',50344,20703,0),('2016-03-04',51360,44065,90),('2016-03-04',54404,53473,65),('2016-03-04',61533,79722,45),('2016-03-05',72852,20703,0),('2016-03-05',74546,38289,0),('2016-03-05',76487,62529,0),('2016-03-05',82439,36396,10),('2016-03-05',90006,36396,40),('2016-03-06',90404,20703,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

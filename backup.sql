/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.1.8-MariaDB : Database - careerguidance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`careerguidance` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `careerguidance`;

/*Table structure for table `applications` */

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `applications` */

/*Table structure for table `collg_details` */

DROP TABLE IF EXISTS `collg_details`;

CREATE TABLE `collg_details` (
  `collg_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(500) DEFAULT NULL,
  `collg_name` varchar(20) DEFAULT NULL,
  `collg_contact` varchar(20) DEFAULT NULL,
  `pincode` decimal(6,0) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`collg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `collg_details` */

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`company_id`,`login_id`,`logo`,`company_name`,`description`,`pincode`,`city`,`state`,`phone`,`email`) values 
(1,10,'static/company/497f6ac5-dc60-48d8-b9e4-643d64a7ecdbWhatsApp Image 2024-02-12 at 23.20.16_76505dbe.jpg','gyg','j','111111','jj','jjk','1233333322','v@gmail.com'),
(2,12,'static/company/471dfd4b-d3a0-4aa5-811d-fb84d19e37d5sign.jpg','gyg','lorem','111111','pala','kerala','1233333322','t@s.v');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_title` int(11) DEFAULT NULL,
  `course_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `course` */

/*Table structure for table `enquiry` */

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `enquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `enquiry` varchar(500) DEFAULT NULL,
  `reply` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`enquiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enquiry` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `feedback` varchar(500) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `date` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

/*Table structure for table `job_details` */

DROP TABLE IF EXISTS `job_details`;

CREATE TABLE `job_details` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmp_id` int(11) NOT NULL,
  `job_description` varchar(500) DEFAULT NULL,
  `job_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `job_details` */

/*Table structure for table `job_vacany` */

DROP TABLE IF EXISTS `job_vacany`;

CREATE TABLE `job_vacany` (
  `vac_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `vacancies` int(11) DEFAULT NULL,
  PRIMARY KEY (`vac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `job_vacany` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','1','admin'),
(2,'ggg','g','student'),
(3,'vin','123','student'),
(5,'kn','kn','student'),
(6,'gtm666','1','student'),
(10,'c','1','company'),
(12,'ggg','1','company');

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `notif_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` varchar(500) DEFAULT NULL,
  `date_from` varchar(500) DEFAULT NULL,
  `date_till` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`notif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `pincode` varchar(48) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`user_id`,`login_id`,`first_name`,`last_name`,`phone`,`pincode`,`email`,`city`,`state`) values 
(1,2,'vinayak','santhosh','9999999999','656768','vinayak123@gmail.com','ernakulam','kerala'),
(2,3,'vinayak','santhosh','8888888888','686632','vinayak1234@gmail.co','ernakulam','kerala'),
(4,5,'kn','kn','7777777777','123456','knkn@gmail.com','kn','kn'),
(5,6,'gautham','krishna','6666666666','666666','gtm@666.com','ettumanoor','kerala');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `login_id` int(11) DEFAULT NULL,
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(20) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` int(6) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

# Host: localhost  (Version: 5.1.44-community-log)
# Date: 2018-05-02 16:33:25
# Generator: MySQL-Front 5.3  (Build 4.186)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES ('admin','admin');

#
# Structure for table "course"
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "course"
#

INSERT INTO `course` VALUES (1,'Basic Science'),(2,'CSE'),(3,'Civil'),(4,'ECE'),(5,'EEE'),(6,'ME'),(7,'MBA'),(8,'M.Tech DC'),(9,'M.Tech SE');

#
# Structure for table "marks"
#

DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sem` varchar(45) NOT NULL,
  `course` varchar(45) DEFAULT NULL,
  `std_usn` varchar(45) NOT NULL,
  `sub01` varchar(45) DEFAULT NULL,
  `sub02` varchar(45) DEFAULT NULL,
  `sub03` varchar(45) DEFAULT NULL,
  `sub04` varchar(45) DEFAULT NULL,
  `sub05` varchar(45) DEFAULT NULL,
  `sub06` varchar(45) DEFAULT NULL,
  `Max_obt` varchar(45) DEFAULT NULL,
  `Max_marks` varchar(45) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `std_usn_UNIQUE` (`std_usn`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "marks"
#

INSERT INTO `marks` VALUES (1,'1st sem','CSE','CS101','44','55','66','77','44','66','385','600','64.16',NULL),(2,'1st sem','CSE','CS102','43','67','67','76','56','88','417','600','69.0',NULL),(3,'2nd sem','CSE','CS201','55','56','85','54','86','84','388','600','64.0','Pass');

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `std_usn` varchar(45) NOT NULL,
  `std_name` varchar(45) DEFAULT NULL,
  `std_age` varchar(45) DEFAULT NULL,
  `std_dob` varchar(45) DEFAULT NULL,
  `std_password` varchar(45) DEFAULT NULL,
  `std_mobile` varchar(45) DEFAULT NULL,
  `std_email` varchar(45) DEFAULT NULL,
  `sem` varchar(45) NOT NULL,
  `dept` varchar(45) DEFAULT NULL,
  `course` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "student"
#

INSERT INTO `student` VALUES (1,'CS101','sham','23','10-02-2000','1234','9852874587','cs101@gmail.com','1st sem','UG','CSE'),(2,'CS102','basu','22','22-02-2000','1234','987878787','basu@gmail.com','1st sem','UG','CSE'),(3,'CS201','ssss','22','22-02-2000','1234','9874587457','ssss@gmail.com','2nd sem','UG','CSE');

#
# Structure for table "attendance"
#

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `studentRollno` varchar(45) NOT NULL,
 
   `attend` varchar(45) NOT NULL,
   `date` varchar(45) DEFAULT NULL,
  
  PRIMARY KEY (`studentRollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "attendance"
#

INSERT INTO `attendance` VALUES ('CS101','YES','24OCT2018'),('CS102','YES','24OCT2018'),('CS103','YES','24OCT2018');





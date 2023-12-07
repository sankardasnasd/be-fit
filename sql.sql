/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.28-MariaDB : Database - befit
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`befit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `befit`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add calender',7,'add_calender'),
(26,'Can change calender',7,'change_calender'),
(27,'Can delete calender',7,'delete_calender'),
(28,'Can view calender',7,'view_calender'),
(29,'Can add instructor',8,'add_instructor'),
(30,'Can change instructor',8,'change_instructor'),
(31,'Can delete instructor',8,'delete_instructor'),
(32,'Can view instructor',8,'view_instructor'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add notification',10,'add_notification'),
(38,'Can change notification',10,'change_notification'),
(39,'Can delete notification',10,'delete_notification'),
(40,'Can view notification',10,'view_notification'),
(41,'Can add product',11,'add_product'),
(42,'Can change product',11,'change_product'),
(43,'Can delete product',11,'delete_product'),
(44,'Can view product',11,'view_product'),
(45,'Can add vendor',12,'add_vendor'),
(46,'Can change vendor',12,'change_vendor'),
(47,'Can delete vendor',12,'delete_vendor'),
(48,'Can view vendor',12,'view_vendor'),
(49,'Can add user',13,'add_user'),
(50,'Can change user',13,'change_user'),
(51,'Can delete user',13,'delete_user'),
(52,'Can view user',13,'view_user'),
(53,'Can add product_request',14,'add_product_request'),
(54,'Can change product_request',14,'change_product_request'),
(55,'Can delete product_request',14,'delete_product_request'),
(56,'Can view product_request',14,'view_product_request'),
(57,'Can add feedback',15,'add_feedback'),
(58,'Can change feedback',15,'change_feedback'),
(59,'Can delete feedback',15,'delete_feedback'),
(60,'Can view feedback',15,'view_feedback'),
(61,'Can add exercise_plans',16,'add_exercise_plans'),
(62,'Can change exercise_plans',16,'change_exercise_plans'),
(63,'Can delete exercise_plans',16,'delete_exercise_plans'),
(64,'Can view exercise_plans',16,'view_exercise_plans'),
(65,'Can add event',17,'add_event'),
(66,'Can change event',17,'change_event'),
(67,'Can delete event',17,'delete_event'),
(68,'Can view event',17,'view_event'),
(69,'Can add addinstruction',18,'add_addinstruction'),
(70,'Can change addinstruction',18,'change_addinstruction'),
(71,'Can delete addinstruction',18,'delete_addinstruction'),
(72,'Can view addinstruction',18,'view_addinstruction'),
(73,'Can add event',19,'add_event'),
(74,'Can change event',19,'change_event'),
(75,'Can delete event',19,'delete_event'),
(76,'Can view event',19,'view_event');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `cal_event` */

DROP TABLE IF EXISTS `cal_event`;

CREATE TABLE `cal_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `user` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cal_event` */

insert  into `cal_event`(`id`,`title`,`description`,`start_time`,`end_time`,`user`,`status`) values 
(1,'bs','mcnm','2023-11-18 17:16:00.000000','2023-11-19 17:16:00.000000',1,'Pending'),
(2,'sedfhfj','gijhiu','2023-11-19 07:20:00.000000','2023-11-19 20:23:00.000000',1,'Done'),
(3,'abcx','asdgrafiosdjaoij','2023-11-26 16:39:00.000000','2023-11-26 16:39:00.000000',1,'Done'),
(4,'yegy','ejfhej','2023-11-26 16:58:00.000000','2023-11-26 16:58:00.000000',1,'done'),
(5,'chest','asdjflasjdkljasd','2023-11-29 14:58:00.000000','2023-11-30 14:58:00.000000',1,'Pending');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(17,'cal','event'),
(5,'contenttypes','contenttype'),
(18,'myapp','addinstruction'),
(7,'myapp','calender'),
(19,'myapp','event'),
(16,'myapp','exercise_plans'),
(15,'myapp','feedback'),
(8,'myapp','instructor'),
(9,'myapp','login'),
(10,'myapp','notification'),
(11,'myapp','product'),
(14,'myapp','product_request'),
(13,'myapp','user'),
(12,'myapp','vendor'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-11-03 05:10:31.880100'),
(2,'auth','0001_initial','2023-11-03 05:10:41.691915'),
(3,'admin','0001_initial','2023-11-03 05:10:44.101167'),
(4,'admin','0002_logentry_remove_auto_add','2023-11-03 05:10:44.169018'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-11-03 05:10:44.243782'),
(6,'contenttypes','0002_remove_content_type_name','2023-11-03 05:10:45.015675'),
(7,'auth','0002_alter_permission_name_max_length','2023-11-03 05:10:45.985730'),
(8,'auth','0003_alter_user_email_max_length','2023-11-03 05:10:46.245829'),
(9,'auth','0004_alter_user_username_opts','2023-11-03 05:10:46.295775'),
(10,'auth','0005_alter_user_last_login_null','2023-11-03 05:10:47.417322'),
(11,'auth','0006_require_contenttypes_0002','2023-11-03 05:10:47.448264'),
(12,'auth','0007_alter_validators_add_error_messages','2023-11-03 05:10:47.500090'),
(13,'auth','0008_alter_user_username_max_length','2023-11-03 05:10:47.627783'),
(14,'auth','0009_alter_user_last_name_max_length','2023-11-03 05:10:47.759562'),
(15,'auth','0010_alter_group_name_max_length','2023-11-03 05:10:47.958161'),
(16,'auth','0011_update_proxy_permissions','2023-11-03 05:10:48.014009'),
(17,'auth','0012_alter_user_first_name_max_length','2023-11-03 05:10:48.192533'),
(18,'myapp','0001_initial','2023-11-03 05:11:00.887407'),
(19,'sessions','0001_initial','2023-11-03 05:11:01.663769'),
(20,'myapp','0002_vendor_status_alter_vendor_district_and_more','2023-11-03 05:29:57.390658'),
(21,'myapp','0003_alter_notification_date_and_time','2023-11-03 07:19:13.031490'),
(22,'myapp','0004_alter_product_request_date_and_time','2023-11-03 09:21:50.762584'),
(23,'myapp','0005_feedback_product_product_vendor','2023-11-14 06:04:07.989045'),
(24,'myapp','0006_alter_product_request_status','2023-11-14 09:03:02.175213'),
(25,'cal','0001_initial','2023-11-18 11:43:54.144375'),
(26,'cal','0002_event_user','2023-11-18 11:43:54.452647'),
(27,'cal','0003_alter_event_id','2023-11-18 11:43:55.320904'),
(28,'myapp','0007_addinstruction','2023-11-25 06:51:14.483777'),
(29,'cal','0004_event_status','2023-11-25 11:18:08.164186'),
(30,'myapp','0008_event_remove_addinstruction_loginid','2023-11-25 11:18:11.787507');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('3db1mvfhr8ahz14agni9la54dkn7c4dw','eyJsaWQiOiIifQ:1r7BSO:SJ3r_FjoYW8DJXwP9wKPhYi0n9nRMzF7fKhzqqs3s4c','2023-12-10 09:29:40.552404'),
('6otdm5zckhw5ghz2yhhmcgk9ltywlnhk','eyJsaWQiOjE0fQ:1r7CpG:J7a52qt3z_OolyXpcuLPzmaM6VOOmk21Wfgb2uHuwHY','2023-12-10 10:57:22.406946'),
('ay9jojh9afi6uefqr2ho5bukgwqhtizj','eyJsYWQiOjEsImxpZCI6MTR9:1r79qO:cyo717HY8cR0uufaz5EEduzj_msdwiRn4HWFdI5SDG4','2023-12-10 07:46:20.879093'),
('c2cliz4w9oqtcv3zkudl25t1oclu34s6','eyJsaWQiOjE0fQ:1r7D15:pK2l7ZmfH0nXWbrymgjGKtudPjYtcZMR7DUl7XGdlLg','2023-12-10 11:09:35.512986'),
('drk90nc3ys4zz2udy2ffn6q3ko9rodvm','eyJsaWQiOjE0fQ:1r7A8m:a90-tc9a8C-b8qrdBngwz66nmhoDaulEpOFzxwmRIUo','2023-12-10 08:05:20.995534'),
('lofpjiazq3ncmrqa6mau6r7gg85rge59','eyJsaWQiOjE0fQ:1r7D1u:I_5FJjPEDDPlz3mqhjXbZ7xAI0Hrto9lbrf-IePA2N8','2023-12-10 11:10:26.572801'),
('oen48zn9thsozfrm2jkdpb55qolddxau','eyJsaWQiOjB9:1r7CTG:N9huz_InvxhoZtBMYNjgOyqy_AegfZQC2Xp04CJI-04','2023-12-10 10:34:38.226831'),
('s8brf6sofnv288byjw66ifb85jqucmjo','eyJsaWQiOjE0fQ:1r7BER:P4dHmb7pcFnJo9gSaRpEUIoKP_OO_WiWWVwMi7hmoYU','2023-12-10 09:15:15.637883'),
('zmel0e7isyd4nwx7gi8y07xatodepsya','eyJsaWQiOjE0fQ:1r7D4j:i1z4u__AKmp7jNSaDdNbUpPA5NXTh-QqxQupoSH9JkQ','2023-12-10 11:13:21.897076');

/*Table structure for table `myapp_addinstruction` */

DROP TABLE IF EXISTS `myapp_addinstruction`;

CREATE TABLE `myapp_addinstruction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inst` varchar(500) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_addinstruction` */

/*Table structure for table `myapp_calender` */

DROP TABLE IF EXISTS `myapp_calender`;

CREATE TABLE `myapp_calender` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` varchar(100) NOT NULL,
  `month` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_calender` */

/*Table structure for table `myapp_event` */

DROP TABLE IF EXISTS `myapp_event`;

CREATE TABLE `myapp_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_event` */

/*Table structure for table `myapp_exercise_plans` */

DROP TABLE IF EXISTS `myapp_exercise_plans`;

CREATE TABLE `myapp_exercise_plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workout_plans` varchar(100) NOT NULL,
  `calender_id` bigint(20) NOT NULL,
  `userid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_exercise_plans_calender_id_8502c4b0_fk_myapp_calender_id` (`calender_id`),
  KEY `myapp_exercise_plans_userid_id_014f33e2_fk_myapp_user_id` (`userid_id`),
  CONSTRAINT `myapp_exercise_plans_calender_id_8502c4b0_fk_myapp_calender_id` FOREIGN KEY (`calender_id`) REFERENCES `myapp_calender` (`id`),
  CONSTRAINT `myapp_exercise_plans_userid_id_014f33e2_fk_myapp_user_id` FOREIGN KEY (`userid_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_exercise_plans` */

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `feedbacks` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `PRODUCT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_user_id_1a72ee6f_fk_myapp_user_id` (`user_id`),
  KEY `myapp_feedback_PRODUCT_id_87175ae5_fk_myapp_product_id` (`PRODUCT_id`),
  CONSTRAINT `myapp_feedback_PRODUCT_id_87175ae5_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_feedback_user_id_1a72ee6f_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`date`,`feedbacks`,`user_id`,`PRODUCT_id`) values 
(5,'2023-11-26','bad',4,4);

/*Table structure for table `myapp_instructor` */

DROP TABLE IF EXISTS `myapp_instructor`;

CREATE TABLE `myapp_instructor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_instructor` */

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`type`) values 
(0,'neerajp280620@gmail.com','8861','admin'),
(2,'robin','123456','vendor'),
(3,'ashitharajnk@gmail.com','1234567','vendor'),
(4,'sneha','7654','vendor'),
(5,'manu','45678','user'),
(6,'achu','6789','user'),
(7,'aparna','1818','user'),
(8,'anjusha','1919','vendor'),
(9,'archith','11111','pending'),
(11,'arch','2222','vendor'),
(12,'arr','11111','rejected'),
(14,'arun@gmail.com','arun12','user'),
(15,'rahul','rahul123','vendor'),
(17,'vishnu','','rejected'),
(18,'vishnu','vishnu1234','vendor'),
(19,'vishnuu@gmail.com','vishnu1234','user'),
(20,'navaneeth@gmail.com','navaneeth123','vendor'),
(21,'aswin@gmail.com','aswin123','vendor'),
(23,'ashitharajnk@gmail.com','abc','rejected'),
(27,'anjusha@gmail.com','anjusha','pending'),
(28,'kais@gmail.com','kais','vendor'),
(29,'nnn@gmail.com','nnn','user'),
(30,'aaa@gmail.com','aaa','vendor');

/*Table structure for table `myapp_notification` */

DROP TABLE IF EXISTS `myapp_notification`;

CREATE TABLE `myapp_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_and_time` date NOT NULL,
  `notification` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_notification` */

insert  into `myapp_notification`(`id`,`date_and_time`,`notification`) values 
(2,'2023-11-18','east or west\r\nyou are the best//hihi');

/*Table structure for table `myapp_product` */

DROP TABLE IF EXISTS `myapp_product`;

CREATE TABLE `myapp_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` varchar(500) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `VENDOR_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_product_VENDOR_id_871656a8_fk_myapp_vendor_id` (`VENDOR_id`),
  CONSTRAINT `myapp_product_VENDOR_id_871656a8_fk_myapp_vendor_id` FOREIGN KEY (`VENDOR_id`) REFERENCES `myapp_vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_product` */

insert  into `myapp_product`(`id`,`photo`,`name`,`description`,`price`,`VENDOR_id`) values 
(2,'/media/20231103-160252.jpg','dumbbell','adfasdf','1000',1),
(3,'/media/20231104-134809.jpg','skipping rope','sdsdf','10',1),
(4,'/media/20231114-152935.jpg','dumbbell 10kg','2+2+3+3','1000',19),
(8,'/media/20231118-163024.jpg','bca','bca','100',20);

/*Table structure for table `myapp_product_request` */

DROP TABLE IF EXISTS `myapp_product_request`;

CREATE TABLE `myapp_product_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_and_time` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `userid_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_product_request_product_id_f71a6c18_fk_myapp_product_id` (`product_id`),
  KEY `myapp_product_request_userid_id_a86b36a5_fk_myapp_user_id` (`userid_id`),
  CONSTRAINT `myapp_product_request_product_id_f71a6c18_fk_myapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_product_request_userid_id_a86b36a5_fk_myapp_user_id` FOREIGN KEY (`userid_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_product_request` */

insert  into `myapp_product_request`(`id`,`date_and_time`,`status`,`product_id`,`userid_id`) values 
(8,'2023-11-14','rejected',2,1),
(9,'2023-11-14','pending',3,1),
(13,'2023-11-19','confirmed',8,4),
(15,'2023-11-26','pending',2,4),
(16,'2023-11-26','pending',4,4);

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`name`,`email`,`phone`,`photo`,`gender`,`dob`,`place`,`pin`,`district`,`LOGIN_id`) values 
(1,'manu','manu@gmail.com',25267283839,'','m','2000-06-28','pathanamthitta','691551','pathanamthitta',5),
(2,'achu','achu@gmail.com',4567898789,'','f','2001-05-22','kozhikod','567893','kozhikod',6),
(3,'aparna','aparna@gmail.com',345678765678,'','f','2000-07-14','kannur','789898','kannur',7),
(4,'arun ','arun@gmail.com',9922099221,'/media/user/231114-102654.jpg','Male','2002-03-21','adoor','691551','pathanamthitta',14),
(5,'vishnu vatakara','vishnuu@gmail.com',345678322,'/media/user/231116-112424.jpg','Male','2007-07-04','vatakara','2673862','kozhikode',19),
(7,'nnnn','nnn@gmail.com',9876543210,'/media/user/231126-150901.jpg','Male','2023-11-10','asdfasdf','654321','adfadfa',29);

/*Table structure for table `myapp_vendor` */

DROP TABLE IF EXISTS `myapp_vendor`;

CREATE TABLE `myapp_vendor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_vendor_LOGIN_id_2082ad3f_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_vendor_LOGIN_id_2082ad3f_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_vendor` */

insert  into `myapp_vendor`(`id`,`name`,`email`,`phone`,`photo`,`gender`,`place`,`district`,`pin`,`LOGIN_id`,`status`) values 
(1,'robin','robin@gmail.com',9999999999,'','Female','meenangadi','wayanad','123456',2,'rejected'),
(12,'ashitha','ashitha@gmail.com',1234567890,'','Female','kozhikod','kozhikod','1234567',3,'approved'),
(13,'sneha','sneha@gmail.com',4567890987,'','Female','wayanad','wayanad','876332',4,'approved'),
(14,'archith','archith@gmail.com',4567898,'/media/vendor/231104-132244.jpg','Male','adsfasdfa','asdfadfasdf','67890',11,'approved'),
(15,'arr','arr@gmail.com',45678989,'/media/vendor/231104-132339.jpg','Male','adsfasdfa','asdfadfasdf','67890',12,'rejected'),
(16,'rahul','rahul@gmail.com',12345432345,'/media/vendor/231114-105109.jpg','Male','asdasdddd','dsfasdf','123211',15,'approved'),
(18,'vishnu','vishnu@gmail.com',1111111111111111,'/media/vendor/231114-152123.jpg','Male','thiruvalla','','',17,'rejected'),
(19,'vishnu','vishnu@gmail.com',11111111111111,'/media/vendor/231114-152259.jpg','Male','thiruvalla','pathanamthitta','1111',18,'approved'),
(20,'navaneeth','navaneeth@gmail.com',1728930872,'/media/vendor/231116-114156.jpg','Male','thiruvananthapuram','thiruvananthapuram','98789',20,'approved'),
(21,'aswin','aswin@gmail.com',876768687,'/media/vendor/231116-114702.jpg','Male','adjljasdlf','adfasd','78987',21,'approved'),
(22,'ashitharajnk','ashitharajnk@gmail.com',232323,'/media/vendor/231116-121608.jpg','Male','asdfasd33','asdasd','654567',23,'rejected'),
(25,'anjusha','anjusha@gmail.com',9876567899,'/media/vendor/231118-092147.jpg','Female','kannur','kannur','678987',27,'pending'),
(26,'kais','kais@gmail.com',9876543459,'/media/vendor/231121-144550.jpg','Male','asdfasdasdf','adasdfasdf','654568',28,'approved'),
(27,'aaa','aaa@gmail.com',9876543212,'/media/vendor/231126-151047.jpg','Others','asdfasf','dfdfg','654321',30,'approved');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.22 : Database - mock_interview
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mock_interview` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mock_interview`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25,'Can add company',7,'add_company'),
(26,'Can change company',7,'change_company'),
(27,'Can delete company',7,'delete_company'),
(28,'Can view company',7,'view_company'),
(29,'Can add guidelines',8,'add_guidelines'),
(30,'Can change guidelines',8,'change_guidelines'),
(31,'Can delete guidelines',8,'delete_guidelines'),
(32,'Can view guidelines',8,'view_guidelines'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add reviews',11,'add_reviews'),
(42,'Can change reviews',11,'change_reviews'),
(43,'Can delete reviews',11,'delete_reviews'),
(44,'Can view reviews',11,'view_reviews'),
(45,'Can add guide',12,'add_guide'),
(46,'Can change guide',12,'change_guide'),
(47,'Can delete guide',12,'delete_guide'),
(48,'Can view guide',12,'view_guide'),
(49,'Can add doubts',13,'add_doubts'),
(50,'Can change doubts',13,'change_doubts'),
(51,'Can delete doubts',13,'delete_doubts'),
(52,'Can view doubts',13,'view_doubts'),
(53,'Can add complaint',14,'add_complaint'),
(54,'Can change complaint',14,'change_complaint'),
(55,'Can delete complaint',14,'delete_complaint'),
(56,'Can view complaint',14,'view_complaint'),
(57,'Can add chat',15,'add_chat'),
(58,'Can change chat',15,'change_chat'),
(59,'Can delete chat',15,'delete_chat'),
(60,'Can view chat',15,'view_chat'),
(61,'Can add tips',16,'add_tips'),
(62,'Can change tips',16,'change_tips'),
(63,'Can delete tips',16,'delete_tips'),
(64,'Can view tips',16,'view_tips'),
(65,'Can add test',17,'add_test'),
(66,'Can change test',17,'change_test'),
(67,'Can delete test',17,'delete_test'),
(68,'Can view test',17,'view_test'),
(69,'Can add questions',18,'add_questions'),
(70,'Can change questions',18,'change_questions'),
(71,'Can delete questions',18,'delete_questions'),
(72,'Can view questions',18,'view_questions'),
(73,'Can add vaccancy',19,'add_vaccancy'),
(74,'Can change vaccancy',19,'change_vaccancy'),
(75,'Can delete vaccancy',19,'delete_vaccancy'),
(76,'Can view vaccancy',19,'view_vaccancy'),
(77,'Can add app_req',20,'add_app_req'),
(78,'Can change app_req',20,'change_app_req'),
(79,'Can delete app_req',20,'delete_app_req'),
(80,'Can view app_req',20,'view_app_req'),
(81,'Can add test_res',21,'add_test_res'),
(82,'Can change test_res',21,'change_test_res'),
(83,'Can delete test_res',21,'delete_test_res'),
(84,'Can view test_res',21,'view_test_res'),
(85,'Can add uplds',22,'add_uplds'),
(86,'Can change uplds',22,'change_uplds'),
(87,'Can delete uplds',22,'delete_uplds'),
(88,'Can view uplds',22,'view_uplds'),
(89,'Can add vac_qn',23,'add_vac_qn'),
(90,'Can change vac_qn',23,'change_vac_qn'),
(91,'Can delete vac_qn',23,'delete_vac_qn'),
(92,'Can view vac_qn',23,'view_vac_qn'),
(97,'Can add answer_details',25,'add_answer_details'),
(98,'Can change answer_details',25,'change_answer_details'),
(99,'Can delete answer_details',25,'delete_answer_details'),
(100,'Can view answer_details',25,'view_answer_details');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$GmWQhFUdCsRZXkOl6rqYSU$XRbJZqDLru/bdw3320M+Gln7h4mWGpu+H/fO0J0p5pY=','2023-10-06 00:30:40.540144',1,'admin','','','admin@gmail.com',1,1,'2023-09-21 00:30:53.518749');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(25,'mock','answer_details'),
(20,'mock','app_req'),
(15,'mock','chat'),
(7,'mock','company'),
(14,'mock','complaint'),
(13,'mock','doubts'),
(12,'mock','guide'),
(8,'mock','guidelines'),
(9,'mock','login'),
(18,'mock','questions'),
(11,'mock','reviews'),
(17,'mock','test'),
(21,'mock','test_res'),
(16,'mock','tips'),
(22,'mock','uplds'),
(10,'mock','user'),
(23,'mock','vac_qn'),
(19,'mock','vaccancy'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-09-15 17:06:25.383746'),
(2,'auth','0001_initial','2023-09-15 17:07:06.754501'),
(3,'admin','0001_initial','2023-09-15 17:07:19.978386'),
(4,'admin','0002_logentry_remove_auto_add','2023-09-15 17:07:20.478397'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-09-15 17:07:20.837747'),
(6,'contenttypes','0002_remove_content_type_name','2023-09-15 17:07:26.993593'),
(7,'auth','0002_alter_permission_name_max_length','2023-09-15 17:07:33.307510'),
(8,'auth','0003_alter_user_email_max_length','2023-09-15 17:07:35.291717'),
(9,'auth','0004_alter_user_username_opts','2023-09-15 17:07:35.666666'),
(10,'auth','0005_alter_user_last_login_null','2023-09-15 17:07:37.666519'),
(11,'auth','0006_require_contenttypes_0002','2023-09-15 17:07:37.744643'),
(12,'auth','0007_alter_validators_add_error_messages','2023-09-15 17:07:37.916534'),
(13,'auth','0008_alter_user_username_max_length','2023-09-15 17:07:40.628960'),
(14,'auth','0009_alter_user_last_name_max_length','2023-09-15 17:07:42.769436'),
(15,'auth','0010_alter_group_name_max_length','2023-09-15 17:07:43.581852'),
(16,'auth','0011_update_proxy_permissions','2023-09-15 17:07:43.659967'),
(17,'auth','0012_alter_user_first_name_max_length','2023-09-15 17:07:45.786935'),
(18,'mock','0001_initial','2023-09-15 17:08:44.896606'),
(19,'sessions','0001_initial','2023-09-15 17:08:47.662038'),
(20,'mock','0002_auto_20230916_1221','2023-09-16 19:22:16.215457'),
(21,'mock','0003_test_guide','2023-09-16 20:17:08.218425'),
(22,'mock','0004_alter_doubts_reply','2023-09-19 18:12:23.998761'),
(23,'mock','0005_vaccancy','2023-09-19 19:18:11.906369'),
(24,'mock','0006_app_req','2023-09-19 23:51:10.091296'),
(25,'mock','0007_test_res','2023-09-21 00:26:43.910012'),
(26,'mock','0008_uplds','2023-09-21 18:49:03.098476'),
(27,'mock','0009_vac_qn','2023-09-21 19:19:27.241605'),
(29,'mock','0010_answer_details','2023-09-22 17:19:53.980565');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('9yiv9nlalye27s7jtqc9biia0991zls6','.eJxVjEEOgyAQRe_CuiEIOEiX3XsGM8OM1dZIIrpqeveWxI3b997_H7XMrO5wUwMe-zQcRbahEtWoCyNMb1mr4Beuz6xTXvdtJl0Tfdqi-8yyPM72cjBhmf5rYXINGSYL5ImDAzRtx20A8QYDdI1lb6MfI1uQYEMSSIwuURytpKi-P2GdOn4:1qoYjo:PVbVu-_GVpQVnWKYxaxqjqzRon7UeegalFIgnYBWxQo','2023-10-20 00:30:40.690437'),
('cvrav58csb6r7rbahhtidzihvohi70q4','.eJxVjDsOgzAQRO_iGlnYmDVOmT5nQPsjkCCQMFRR7p5YoqEa6c2b-RiexNxcZeaSUJkej33sj6xbX4hx5sII-a1LKeSFy3O1vC77NpEtij3bbB-r6Hw_3cvBiHn8r1WocVQLeaBAEhvAuu2kjaChxgid8xJ8CkMSDxp9ZAUWbJjS4JWT-f4A2yU8iQ:1qkqLy:7Lyq6G2KRr566B6oa5wjXBKZ_eFSunllIWSTc_URBDY','2023-10-09 18:30:42.264018');

/*Table structure for table `mock_answer_details` */

DROP TABLE IF EXISTS `mock_answer_details`;

CREATE TABLE `mock_answer_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ans` varchar(200) NOT NULL,
  `emot` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `oans` varchar(200) NOT NULL,
  `USER_id` bigint NOT NULL,
  `VAC_QN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_answer_details_USER_id_9964338f_fk_mock_user_id` (`USER_id`),
  KEY `mock_answer_details_VAC_QN_id_22727960_fk_mock_vac_qn_id` (`VAC_QN_id`),
  CONSTRAINT `mock_answer_details_USER_id_9964338f_fk_mock_user_id` FOREIGN KEY (`USER_id`) REFERENCES `mock_user` (`id`),
  CONSTRAINT `mock_answer_details_VAC_QN_id_22727960_fk_mock_vac_qn_id` FOREIGN KEY (`VAC_QN_id`) REFERENCES `mock_vac_qn` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_answer_details` */

insert  into `mock_answer_details`(`id`,`ans`,`emot`,`date`,`oans`,`USER_id`,`VAC_QN_id`) values 
(1,'no answer','neutral','2023-09-22','hypertext markup language',1,1),
(2,'no answer','neutral','2023-09-22','cascading style sheet',1,1),
(3,'no answer','neutral','2023-09-22','javascript language',1,1),
(4,'no answer','neutral','2023-09-22','hypertext markup language',1,1),
(5,'no answer','neutral','2023-09-22','cascading style sheet',1,1),
(6,'no answer','neutral','2023-09-22','javascript language',1,1),
(7,'1','neutral','2023-09-23','hypertext markup language',1,1),
(8,'1','neutral','2023-09-23','cascading style sheet',1,1),
(9,'no answer','neutral','2023-09-23','javascript language',1,3),
(10,'no answer','neutral','2023-09-23','hypertext markup language',1,1),
(11,'no answer','neutral','2023-09-23','hypertext markup language',1,1),
(12,'no answer','neutral','2023-09-23','cascading style sheet',1,1),
(13,'no answer','neutral','2023-09-23','javascript language',1,1);

/*Table structure for table `mock_app_req` */

DROP TABLE IF EXISTS `mock_app_req`;

CREATE TABLE `mock_app_req` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` longtext NOT NULL,
  `USER_id` bigint NOT NULL,
  `VACCANCY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_app_req_USER_id_cd333ad4_fk_mock_user_id` (`USER_id`),
  KEY `mock_app_req_VACCANCY_id_edb1a3d6_fk_mock_vaccancy_id` (`VACCANCY_id`),
  CONSTRAINT `mock_app_req_USER_id_cd333ad4_fk_mock_user_id` FOREIGN KEY (`USER_id`) REFERENCES `mock_user` (`id`),
  CONSTRAINT `mock_app_req_VACCANCY_id_edb1a3d6_fk_mock_vaccancy_id` FOREIGN KEY (`VACCANCY_id`) REFERENCES `mock_vaccancy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_app_req` */

insert  into `mock_app_req`(`id`,`date`,`status`,`USER_id`,`VACCANCY_id`) values 
(1,'2023-09-19','accepted',1,1);

/*Table structure for table `mock_chat` */

DROP TABLE IF EXISTS `mock_chat`;

CREATE TABLE `mock_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `msg` longtext NOT NULL,
  `time` time(6) NOT NULL,
  `fid_id` bigint NOT NULL,
  `tid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_chat_fid_id_5187918b_fk_mock_login_id` (`fid_id`),
  KEY `mock_chat_tid_id_8671a566_fk_mock_login_id` (`tid_id`),
  CONSTRAINT `mock_chat_fid_id_5187918b_fk_mock_login_id` FOREIGN KEY (`fid_id`) REFERENCES `mock_login` (`id`),
  CONSTRAINT `mock_chat_tid_id_8671a566_fk_mock_login_id` FOREIGN KEY (`tid_id`) REFERENCES `mock_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_chat` */

insert  into `mock_chat`(`id`,`date`,`msg`,`time`,`fid_id`,`tid_id`) values 
(1,'2023-09-20','hellooowwwwww','12:55:34.479620',2,6),
(2,'2023-09-20','hellowww','12:55:00.000000',6,2);

/*Table structure for table `mock_company` */

DROP TABLE IF EXISTS `mock_company`;

CREATE TABLE `mock_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(200) NOT NULL,
  `website` longtext NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_company_LOGIN_id_ea77deb6_fk_mock_login_id` (`LOGIN_id`),
  CONSTRAINT `mock_company_LOGIN_id_ea77deb6_fk_mock_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `mock_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_company` */

insert  into `mock_company`(`id`,`name`,`place`,`phone`,`email`,`website`,`LOGIN_id`) values 
(1,'maxlore','calicut',8978900098,'maxlore@gmail.com','www.maxlore.com',6);

/*Table structure for table `mock_complaint` */

DROP TABLE IF EXISTS `mock_complaint`;

CREATE TABLE `mock_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comp` longtext NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(200) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_complaint_USER_id_245e85f6_fk_mock_user_id` (`USER_id`),
  CONSTRAINT `mock_complaint_USER_id_245e85f6_fk_mock_user_id` FOREIGN KEY (`USER_id`) REFERENCES `mock_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_complaint` */

insert  into `mock_complaint`(`id`,`comp`,`date`,`reply`,`USER_id`) values 
(1,'not working properly!!!','2023-09-16','ok. I can manage it..',1),
(2,'please check the interface..','2023-09-16','pending',2),
(3,'check immediately..','2023-09-20','pending',1);

/*Table structure for table `mock_doubts` */

DROP TABLE IF EXISTS `mock_doubts`;

CREATE TABLE `mock_doubts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dbts` longtext NOT NULL,
  `reply` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `GUIDE_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_doubts_GUIDE_id_724a86f4_fk_mock_guide_id` (`GUIDE_id`),
  KEY `mock_doubts_USER_id_c6418ff1_fk_mock_user_id` (`USER_id`),
  CONSTRAINT `mock_doubts_GUIDE_id_724a86f4_fk_mock_guide_id` FOREIGN KEY (`GUIDE_id`) REFERENCES `mock_guide` (`id`),
  CONSTRAINT `mock_doubts_USER_id_c6418ff1_fk_mock_user_id` FOREIGN KEY (`USER_id`) REFERENCES `mock_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_doubts` */

insert  into `mock_doubts`(`id`,`dbts`,`reply`,`date`,`GUIDE_id`,`USER_id`) values 
(1,'please exaplain the rules','sure.........','2023-09-16',1,1),
(2,'Is there any tips for attending the examination','pending','2023-09-20',1,1);

/*Table structure for table `mock_guide` */

DROP TABLE IF EXISTS `mock_guide`;

CREATE TABLE `mock_guide` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(200) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_guide_LOGIN_id_a08232a1_fk_mock_login_id` (`LOGIN_id`),
  CONSTRAINT `mock_guide_LOGIN_id_a08232a1_fk_mock_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `mock_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_guide` */

insert  into `mock_guide`(`id`,`fname`,`lname`,`address`,`phone`,`email`,`LOGIN_id`) values 
(1,'jinu','k','calicut,678890',9909090909,'jinucalicut@gmail.com',4);

/*Table structure for table `mock_guidelines` */

DROP TABLE IF EXISTS `mock_guidelines`;

CREATE TABLE `mock_guidelines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `guidelines` longtext NOT NULL,
  `details` longtext NOT NULL,
  `COMPANY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_guidelines_COMPANY_id_859efd11_fk_mock_company_id` (`COMPANY_id`),
  CONSTRAINT `mock_guidelines_COMPANY_id_859efd11_fk_mock_company_id` FOREIGN KEY (`COMPANY_id`) REFERENCES `mock_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_guidelines` */

insert  into `mock_guidelines`(`id`,`guidelines`,`details`,`COMPANY_id`) values 
(1,'hgfdgjdku','jfgjgfjfjgfkhgk..........',1);

/*Table structure for table `mock_login` */

DROP TABLE IF EXISTS `mock_login`;

CREATE TABLE `mock_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_login` */

insert  into `mock_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'riya','123','user'),
(3,'anu','222','user'),
(4,'jinu','333','guide'),
(6,'max','1234','company'),
(7,'giga','sree','user');

/*Table structure for table `mock_questions` */

DROP TABLE IF EXISTS `mock_questions`;

CREATE TABLE `mock_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `op1` longtext NOT NULL,
  `op2` longtext NOT NULL,
  `op3` longtext NOT NULL,
  `op4` longtext NOT NULL,
  `ans` longtext NOT NULL,
  `TEST_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_questions_TEST_id_bc198445_fk_mock_test_id` (`TEST_id`),
  CONSTRAINT `mock_questions_TEST_id_bc198445_fk_mock_test_id` FOREIGN KEY (`TEST_id`) REFERENCES `mock_test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_questions` */

insert  into `mock_questions`(`id`,`question`,`op1`,`op2`,`op3`,`op4`,`ans`,`TEST_id`) values 
(1,'who is the inventor of python ?','guido van rossum','ruther leo','charles','robert','guido van rossum',1),
(3,'asdasfasdg','aa','bb','cc','dd','bb',1);

/*Table structure for table `mock_reviews` */

DROP TABLE IF EXISTS `mock_reviews`;

CREATE TABLE `mock_reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review` longtext NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_reviews_USER_id_2ca7dcf9_fk_mock_user_id` (`USER_id`),
  KEY `mock_reviews_LOGIN_id_7b97b982_fk_mock_login_id` (`LOGIN_id`),
  CONSTRAINT `mock_reviews_LOGIN_id_7b97b982_fk_mock_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `mock_login` (`id`),
  CONSTRAINT `mock_reviews_USER_id_2ca7dcf9_fk_mock_user_id` FOREIGN KEY (`USER_id`) REFERENCES `mock_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_reviews` */

insert  into `mock_reviews`(`id`,`review`,`date`,`USER_id`,`LOGIN_id`) values 
(1,'good one','2023-09-16',1,4);

/*Table structure for table `mock_test` */

DROP TABLE IF EXISTS `mock_test`;

CREATE TABLE `mock_test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exam` longtext NOT NULL,
  `date` date NOT NULL,
  `vaccancy` longtext NOT NULL,
  `GUIDE_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_test_GUIDE_id_f3f9e589_fk_mock_guide_id` (`GUIDE_id`),
  CONSTRAINT `mock_test_GUIDE_id_f3f9e589_fk_mock_guide_id` FOREIGN KEY (`GUIDE_id`) REFERENCES `mock_guide` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_test` */

insert  into `mock_test`(`id`,`exam`,`date`,`vaccancy`,`GUIDE_id`) values 
(1,'python','2023-09-30','12',1),
(3,'PHP','2023-10-20','10',1);

/*Table structure for table `mock_test_res` */

DROP TABLE IF EXISTS `mock_test_res`;

CREATE TABLE `mock_test_res` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `res` varchar(200) NOT NULL,
  `ans` varchar(200) NOT NULL,
  `QUESTIONS_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_test_res_QUESTIONS_id_86851020_fk_mock_questions_id` (`QUESTIONS_id`),
  KEY `mock_test_res_USER_id_6913382c_fk_mock_user_id` (`USER_id`),
  CONSTRAINT `mock_test_res_QUESTIONS_id_86851020_fk_mock_questions_id` FOREIGN KEY (`QUESTIONS_id`) REFERENCES `mock_questions` (`id`),
  CONSTRAINT `mock_test_res_USER_id_6913382c_fk_mock_user_id` FOREIGN KEY (`USER_id`) REFERENCES `mock_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_test_res` */

insert  into `mock_test_res`(`id`,`date`,`res`,`ans`,`QUESTIONS_id`,`USER_id`) values 
(1,'2023-09-20','1','guido van rossum',1,1),
(2,'2023-09-20','0','aa',3,1);

/*Table structure for table `mock_tips` */

DROP TABLE IF EXISTS `mock_tips`;

CREATE TABLE `mock_tips` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tip` longtext NOT NULL,
  `details` longtext NOT NULL,
  `GUIDE_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_tips_GUIDE_id_432abfdc_fk_mock_guide_id` (`GUIDE_id`),
  CONSTRAINT `mock_tips_GUIDE_id_432abfdc_fk_mock_guide_id` FOREIGN KEY (`GUIDE_id`) REFERENCES `mock_guide` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_tips` */

insert  into `mock_tips`(`id`,`tip`,`details`,`GUIDE_id`) values 
(1,'asfasf','asdfasfa',1);

/*Table structure for table `mock_uplds` */

DROP TABLE IF EXISTS `mock_uplds`;

CREATE TABLE `mock_uplds` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cv` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_uplds_USER_id_00a44328_fk_mock_user_id` (`USER_id`),
  CONSTRAINT `mock_uplds_USER_id_00a44328_fk_mock_user_id` FOREIGN KEY (`USER_id`) REFERENCES `mock_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_uplds` */

insert  into `mock_uplds`(`id`,`cv`,`date`,`USER_id`) values 
(1,'cv.pdf','2023-09-21',1);

/*Table structure for table `mock_user` */

DROP TABLE IF EXISTS `mock_user`;

CREATE TABLE `mock_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `post` varchar(200) NOT NULL,
  `pin` int NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(200) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_user_LOGIN_id_2906c85d_fk_mock_login_id` (`LOGIN_id`),
  CONSTRAINT `mock_user_LOGIN_id_2906c85d_fk_mock_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `mock_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_user` */

insert  into `mock_user`(`id`,`fname`,`lname`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`LOGIN_id`) values 
(1,'riya','k','female','calicut','kozhikode',675554,9800999000,'riyak@gmail.com',2),
(2,'anusree','p','female','calicut','kozhikode',678888,98888888,'anu@gmail.com',3),
(3,'giga','sree','Female','calicut','calicut',899090,9638527418,'gigasree@gmail.com',7);

/*Table structure for table `mock_vac_qn` */

DROP TABLE IF EXISTS `mock_vac_qn`;

CREATE TABLE `mock_vac_qn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `ans` longtext NOT NULL,
  `VACCANCY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_vac_qn_VACCANCY_id_4281fbd2_fk_mock_vaccancy_id` (`VACCANCY_id`),
  CONSTRAINT `mock_vac_qn_VACCANCY_id_4281fbd2_fk_mock_vaccancy_id` FOREIGN KEY (`VACCANCY_id`) REFERENCES `mock_vaccancy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_vac_qn` */

insert  into `mock_vac_qn`(`id`,`question`,`ans`,`VACCANCY_id`) values 
(1,'what is accountancy ?',' Accountancy is the practice of recording, classifying, and reporting on business transactions for a business.',3),
(2,'What is your understanding of the role of a human resources department',' I know that the HR departments are responsible for many things, including employee selection, recruiting and training processes, workplace communication, payroll and benefits administration, disciplinary actions, termination processes, and much more. ',3),
(3,'what is html','hypertext markup language',1),
(4,'what is css','cascading style sheet',1),
(5,'expansion of JS','javascript language',1);

/*Table structure for table `mock_vaccancy` */

DROP TABLE IF EXISTS `mock_vaccancy`;

CREATE TABLE `mock_vaccancy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job` varchar(200) NOT NULL,
  `vacncy` varchar(200) NOT NULL,
  `qualif` varchar(200) NOT NULL,
  `exp` varchar(200) NOT NULL,
  `salary` varchar(200) NOT NULL,
  `det` longtext NOT NULL,
  `COMPANY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mock_vaccancy_COMPANY_id_be67e199_fk_mock_company_id` (`COMPANY_id`),
  CONSTRAINT `mock_vaccancy_COMPANY_id_be67e199_fk_mock_company_id` FOREIGN KEY (`COMPANY_id`) REFERENCES `mock_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mock_vaccancy` */

insert  into `mock_vaccancy`(`id`,`job`,`vacncy`,`qualif`,`exp`,`salary`,`det`,`COMPANY_id`) values 
(1,'software developer','12','MCA,MSc.CS','3','15000','by profession',1),
(3,'HR','6','MCOM','2','30000','for calicut branch',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

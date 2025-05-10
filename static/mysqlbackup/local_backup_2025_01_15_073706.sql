/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.1-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: truepathlegal
-- ------------------------------------------------------
-- Server version	11.5.1-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
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
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add diagnostic centre registration',6,'add_diagnosticcentreregistration'),
(22,'Can change diagnostic centre registration',6,'change_diagnosticcentreregistration'),
(23,'Can delete diagnostic centre registration',6,'delete_diagnosticcentreregistration'),
(24,'Can view diagnostic centre registration',6,'view_diagnosticcentreregistration'),
(25,'Can add doctor registration',7,'add_doctorregistration'),
(26,'Can change doctor registration',7,'change_doctorregistration'),
(27,'Can delete doctor registration',7,'delete_doctorregistration'),
(28,'Can view doctor registration',7,'view_doctorregistration'),
(29,'Can add hospital and nursing home registration',8,'add_hospitalandnursinghomeregistration'),
(30,'Can change hospital and nursing home registration',8,'change_hospitalandnursinghomeregistration'),
(31,'Can delete hospital and nursing home registration',8,'delete_hospitalandnursinghomeregistration'),
(32,'Can view hospital and nursing home registration',8,'view_hospitalandnursinghomeregistration'),
(33,'Can add payment forms dtails model',9,'add_paymentformsdtailsmodel'),
(34,'Can change payment forms dtails model',9,'change_paymentformsdtailsmodel'),
(35,'Can delete payment forms dtails model',9,'delete_paymentformsdtailsmodel'),
(36,'Can view payment forms dtails model',9,'view_paymentformsdtailsmodel'),
(37,'Can add custom user',10,'add_customuser'),
(38,'Can change custom user',10,'change_customuser'),
(39,'Can delete custom user',10,'delete_customuser'),
(40,'Can view custom user',10,'view_customuser'),
(41,'Can add payment table multi row model',11,'add_paymenttablemultirowmodel'),
(42,'Can change payment table multi row model',11,'change_paymenttablemultirowmodel'),
(43,'Can delete payment table multi row model',11,'delete_paymenttablemultirowmodel'),
(44,'Can view payment table multi row model',11,'view_paymenttablemultirowmodel'),
(45,'Can add lead model',12,'add_leadmodel'),
(46,'Can change lead model',12,'change_leadmodel'),
(47,'Can delete lead model',12,'delete_leadmodel'),
(48,'Can view lead model',12,'view_leadmodel'),
(49,'Can add appointment model',13,'add_appointmentmodel'),
(50,'Can change appointment model',13,'change_appointmentmodel'),
(51,'Can delete appointment model',13,'delete_appointmentmodel'),
(52,'Can view appointment model',13,'view_appointmentmodel'),
(53,'Can add Policy',14,'add_policydetailsmodel'),
(54,'Can change Policy',14,'change_policydetailsmodel'),
(55,'Can delete Policy',14,'delete_policydetailsmodel'),
(56,'Can view Policy',14,'view_policydetailsmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_tbl_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_tbl_users_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'contenttypes','contenttype'),
(5,'sessions','session'),
(13,'tplcapp','appointmentmodel'),
(10,'tplcapp','customuser'),
(6,'tplcapp','diagnosticcentreregistration'),
(7,'tplcapp','doctorregistration'),
(8,'tplcapp','hospitalandnursinghomeregistration'),
(12,'tplcapp','leadmodel'),
(9,'tplcapp','paymentformsdtailsmodel'),
(11,'tplcapp','paymenttablemultirowmodel'),
(14,'tplcapp','policydetailsmodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-01-14 10:04:04.143242'),
(2,'contenttypes','0002_remove_content_type_name','2025-01-14 10:04:04.193184'),
(3,'auth','0001_initial','2025-01-14 10:04:04.347238'),
(4,'auth','0002_alter_permission_name_max_length','2025-01-14 10:04:04.368143'),
(5,'auth','0003_alter_user_email_max_length','2025-01-14 10:04:04.373308'),
(6,'auth','0004_alter_user_username_opts','2025-01-14 10:04:04.380373'),
(7,'auth','0005_alter_user_last_login_null','2025-01-14 10:04:04.385460'),
(8,'auth','0006_require_contenttypes_0002','2025-01-14 10:04:04.388308'),
(9,'auth','0007_alter_validators_add_error_messages','2025-01-14 10:04:04.395309'),
(10,'auth','0008_alter_user_username_max_length','2025-01-14 10:04:04.399668'),
(11,'auth','0009_alter_user_last_name_max_length','2025-01-14 10:04:04.405229'),
(12,'auth','0010_alter_group_name_max_length','2025-01-14 10:04:04.427993'),
(13,'auth','0011_update_proxy_permissions','2025-01-14 10:04:04.434137'),
(14,'auth','0012_alter_user_first_name_max_length','2025-01-14 10:04:04.439037'),
(15,'tplcapp','0001_initial','2025-01-14 10:04:04.706428'),
(16,'admin','0001_initial','2025-01-14 10:04:04.778410'),
(17,'admin','0002_logentry_remove_auto_add','2025-01-14 10:04:04.784447'),
(18,'admin','0003_logentry_add_action_flag_choices','2025-01-14 10:04:04.794363'),
(19,'sessions','0001_initial','2025-01-14 10:04:04.825562'),
(20,'tplcapp','0002_leadmodel_alter_customuser_table','2025-01-14 13:43:07.109983'),
(21,'tplcapp','0003_appointmentmodel_policydetailsmodel_customuser_area','2025-01-15 01:55:33.140408');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('c4p67i2p4u49pwc4m5z97g5dmgj7m7iq','.eJxVjDsOwjAQRO_iGlnrv0NJnzNY67WDA8iW4qRC3J1ESgFTznszbxZwW0vYel7CnNiVCXb57SLSM9cDpAfWe-PU6rrMkR8KP2nnY0v5dTvdv4OCvexrlSJ4RzAIB8JnMWBW3pBOVpo9MGlIIBU6iUCQkSanrbGKpAYJ0bDPF70DNr8:1tXeSO:-JT485OmDhpNvJMeRxLiwWUgkmNkYd6XFbHiJbwOLSk','2025-01-28 10:47:36.723461'),
('fcn4rnnkz3jzcflk4j5ugmjs24t55d4w','.eJxVjEEOgjAQRe_StWloGZipS_eegbQzg0VNSSisjHdXEha6_e-9_zJD3NY8bFWXYRJzNq05_W4p8kPLDuQey222PJd1mZLdFXvQaq-z6PNyuH8HOdb8rZF9GhONDTpSQUBlh67tOhyhV99LjxCAPEGQTpkCeyAOEQKTg8aZ9wfXajcP:1tXshy:8OfQmsyEfdRD6uLOvN28z00hV5nIMlI4Vk9ZR06mM5I','2025-01-29 02:00:38.069213'),
('g41kznr1631xswn9ofc2bd76u1ksqr2t','.eJxVjDsOwjAQRO_iGlnrv0NJnzNY67WDA8iW4qRC3J1ESgFTznszbxZwW0vYel7CnNiVCXb57SLSM9cDpAfWe-PU6rrMkR8KP2nnY0v5dTvdv4OCvexrlSJ4RzAIB8JnMWBW3pBOVpo9MGlIIBU6iUCQkSanrbGKpAYJ0bDPF70DNr8:1tXeTZ:pOc2QOYWXvwar8CMEeyG8SVw8Eqz2tSCywTs4kWE_po','2025-01-28 10:48:49.486747');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnostic_center_reg`
--

DROP TABLE IF EXISTS `tbl_diagnostic_center_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_diagnostic_center_reg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) NOT NULL,
  `proprietor_name` varchar(255) NOT NULL,
  `house_no` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `hospital_address` varchar(255) NOT NULL,
  `hospital_house_no` varchar(255) NOT NULL,
  `hospital_street` varchar(255) NOT NULL,
  `hospital_district` varchar(255) NOT NULL,
  `hospital_state` varchar(255) NOT NULL,
  `hospital_pin_code` int(11) DEFAULT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `alternate_mobile_number` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `dob` date NOT NULL,
  `wedding_date` date DEFAULT NULL,
  `id_proof` varchar(50) NOT NULL,
  `id_number` varchar(255) NOT NULL,
  `registration_number_hospital` varchar(255) NOT NULL,
  `registration_year` int(11) NOT NULL,
  `annual_opd` int(11) NOT NULL,
  `facilities_available` varchar(255) NOT NULL,
  `total_doctors` int(11) NOT NULL,
  `insurance_cover` varchar(50) NOT NULL,
  `coverage_amount` varchar(100) NOT NULL,
  `tenure_of_membership` varchar(255) NOT NULL,
  `tenure_of_indemnity` varchar(255) NOT NULL,
  `tplc_rep_name` varchar(255) NOT NULL,
  `tplc_rep_email` varchar(254) NOT NULL,
  `total_amount_paid` int(11) DEFAULT NULL,
  `payment_details` varchar(255) NOT NULL,
  `registration_certificate` varchar(100) NOT NULL,
  `selfie` varchar(100) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `submission_date_time` datetime(6) DEFAULT NULL,
  `place_of_submission` varchar(100) NOT NULL,
  `app_registraction_no` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnostic_center_reg`
--

LOCK TABLES `tbl_diagnostic_center_reg` WRITE;
/*!40000 ALTER TABLE `tbl_diagnostic_center_reg` DISABLE KEYS */;
INSERT INTO `tbl_diagnostic_center_reg` VALUES
(1,'Dahlia Hines','Plato Mccullough','Doloribus dolor velit iste quasi aperiam dolorem odit sunt libero minim laudantium laborum Rerum consectetur aut omnis hic','Perspiciatis aut incididunt alias molestias','Et necessitatibus sint autem eveniet consequatur','Officia sed ab ut perferendis mollit odio reprehenderit',1,'Labore sed excepteur voluptatem minus ut quis reprehenderit omnis sequi Nam mollitia aut in assumenda aliquid','Ut dolore iusto error quibusdam consequatur enim tempora praesentium ipsum aut quo elit repellendus Cum ipsum et','Id eveniet eos ipsum rerum omnis','Sint tempora in laudantium tenetur officia ad in molestiae ea qui','Maxime obcaecati eiusmod esse et ullam et laborum itaque',45,'862','837','bylid@mailinator.com','2011-05-09','1979-11-04','Aadhar','410','740',2000,52,'Ullam nesciunt qui aute corporis magni dolores possimus exercitationem aut cum rem ut',253,'Yes','50 Lakh','Consequat Consequatur Quia quasi iste ullam ut debitis ex omnis exercitationem facere assumenda quos cumque quis consectetur architecto','Eos aut totam quia maiores quos','Rajah Holman','jepi@mailinator.com',666666666,'175','','','','1988-01-22 02:29:00.000000','Sint qui quia dignissimos dolore quis qui illo nisi','','2025-01-14 11:19:05.461891','2025-01-15 01:36:05.539021',1);
/*!40000 ALTER TABLE `tbl_diagnostic_center_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doctor_registration`
--

DROP TABLE IF EXISTS `tbl_doctor_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_doctor_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(255) NOT NULL,
  `house_no` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `hospital_house_no` varchar(255) DEFAULT NULL,
  `hospital_street` varchar(255) DEFAULT NULL,
  `hospital_district` varchar(255) DEFAULT NULL,
  `hospital_state` varchar(255) DEFAULT NULL,
  `hospital_pin_code` int(11) DEFAULT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `alternate_mobile_number` varchar(10) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `dob` date NOT NULL,
  `wedding_date` date DEFAULT NULL,
  `id_proof` varchar(50) NOT NULL,
  `id_number` varchar(255) NOT NULL,
  `speciality` varchar(50) NOT NULL,
  `other_speciality` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) NOT NULL,
  `registration_number` varchar(255) NOT NULL,
  `registration_year` int(11) NOT NULL,
  `medical_council` varchar(255) NOT NULL,
  `visiting_physician` varchar(3) NOT NULL,
  `associated_hospitals` longtext NOT NULL,
  `legal_claims` varchar(3) NOT NULL,
  `practice_duration` int(11) NOT NULL,
  `avg_patients_per_day` int(11) NOT NULL,
  `unqualified_staff_extension` varchar(3) NOT NULL,
  `annual_income` int(11) DEFAULT NULL,
  `insurance_cover` varchar(10) NOT NULL,
  `coverage_amount` varchar(100) NOT NULL,
  `tenure_of_membership` varchar(255) NOT NULL,
  `tenure_of_indemnity` varchar(255) NOT NULL,
  `tplc_rep_name` varchar(255) NOT NULL,
  `tplc_rep_email` varchar(254) NOT NULL,
  `total_amount_paid` int(11) DEFAULT NULL,
  `payment_details` varchar(255) DEFAULT NULL,
  `registration_certificate` varchar(100) DEFAULT NULL,
  `selfie` varchar(100) DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `submission_date_time` datetime(6) DEFAULT NULL,
  `place_of_submission` varchar(100) NOT NULL,
  `app_registraction_no` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor_registration`
--

LOCK TABLES `tbl_doctor_registration` WRITE;
/*!40000 ALTER TABLE `tbl_doctor_registration` DISABLE KEYS */;
INSERT INTO `tbl_doctor_registration` VALUES
(1,'Keelng','250','Buti','Rabchi','Jharkhand',545664,'675656','ziu','tret','Jharkhand',865,'7654994344','user.is_au','rupesh.kumar805@gmail.com','2025-01-14','2025-01-23','PAN','3208766','CARDIO-VASCULAR SURGEON','Tesr','MCA','4566643',2024,'Test council','Yes','Dylan Larsen Hospital','yes',3,5,'Yes',5498,'Yes','10 Lakh','4','6','Rupes','pudac@mailinator.com',4557,'65477888','','','','2025-01-08 16:22:00.000000','Ranchi','TPD001000','2025-01-14 12:37:58.607885','2025-01-15 01:30:15.655805',1),
(2,'Rttttt','Possimus lorem tempora sit quis laborum Soluta eveniet necessitatibus ea quia harum autem quaerat','Quis sit in animi magnam asperiores et laborum Doloremque quia tempora','Ullamco Nam labore eius culpa sint vel nulla esse modi','Qui iste perferendis nostrud error ullamco proident fuga Est at',38,'Fugiat rerum cillum esse aut et sed corporis reprehenderit occaecat delectus nulla ipsum','Voluptas adipisicing dolorem doloribus sit consequuntur neque ullam voluptatem Pariatur Blanditiis illum reiciendis modi quidem autem culpa et reprehenderit nihil','Porro rerum maiores nobis dolore impedit voluptas proident est pariatur Dolor illo sunt eum id','Reiciendis dolore ducimus sed aliquam fugit consequat Sunt voluptas',36,'63','233','pipykeh@mailinator.com','1975-10-18','2014-01-27','PAN','834','NEPHROLOGIST','Voluptatem a et fugiat perspiciatis nisi beatae ex','Saepe suscipit ut consectetur blanditiis labore qui ea occaecat cupiditate qui illum','847',2005,'Quidem in et sit hic ea pariatur','No','Chava Mcintosh','Qui',74,14,'No',767,'Yes','20 Lakh','Excepturi quia eveniet reprehenderit magnam aliqua','Rerum asperiores nulla rem velit vel hic odio incidunt','Travis Wade','geximah@mailinator.com',93,'Ea nostrum harum rem autem odio quisquam','','','','1971-10-14 23:31:00.000000','Ranchi','TPD001001','2025-01-14 12:35:53.334712','2025-01-14 12:35:53.336718',1),
(3,'Rylee Hurley','Possimus lorem tempora sit quis laborum Soluta eveniet necessitatibus ea quia harum autem quaerat','Quis sit in animi magnam asperiores et laborum Doloremque quia tempora','Ullamco Nam labore eius culpa sint vel nulla esse modi','Qui iste perferendis nostrud error ullamco proident fuga Est at',38,'Fugiat rerum cillum esse aut et sed corporis reprehenderit occaecat delectus nulla ipsum','Voluptas adipisicing dolorem doloribus sit consequuntur neque ullam voluptatem Pariatur Blanditiis illum reiciendis modi quidem autem culpa et reprehenderit nihil','Porro rerum maiores nobis dolore impedit voluptas proident est pariatur Dolor illo sunt eum id','Reiciendis dolore ducimus sed aliquam fugit consequat Sunt voluptas',36,'63','233','pipykeh@mailinator.com','1975-10-18','2014-01-27','PAN','834','NEPHROLOGIST','Voluptatem a et fugiat perspiciatis nisi beatae ex','Saepe suscipit ut consectetur blanditiis labore qui ea occaecat cupiditate qui illum','847',2005,'Quidem in et sit hic ea pariatur','No','Chava Mcintosh','Qui',74,14,'No',767,'No','','Excepturi quia eveniet reprehenderit magnam aliqua','Rerum asperiores nulla rem velit vel hic odio incidunt','Travis Wade','geximah@mailinator.com',93,'Ea nostrum harum rem autem odio quisquam','','','','1971-10-14 23:31:00.000000','Ranchi','TPD001001','2025-01-14 12:20:35.906998','2025-01-14 12:20:35.922848',1),
(4,'Rylee Hurley','Possimus lorem tempora sit quis laborum Soluta eveniet necessitatibus ea quia harum autem quaerat','Quis sit in animi magnam asperiores et laborum Doloremque quia tempora','Ullamco Nam labore eius culpa sint vel nulla esse modi','Qui iste perferendis nostrud error ullamco proident fuga Est at',38,'Fugiat rerum cillum esse aut et sed corporis reprehenderit occaecat delectus nulla ipsum','Voluptas adipisicing dolorem doloribus sit consequuntur neque ullam voluptatem Pariatur Blanditiis illum reiciendis modi quidem autem culpa et reprehenderit nihil','Porro rerum maiores nobis dolore impedit voluptas proident est pariatur Dolor illo sunt eum id','Reiciendis dolore ducimus sed aliquam fugit consequat Sunt voluptas',36,'63','233','pipykeh@mailinator.com','1975-10-18','2014-01-27','PAN','834','NEPHROLOGIST','Voluptatem a et fugiat perspiciatis nisi beatae ex','Saepe suscipit ut consectetur blanditiis labore qui ea occaecat cupiditate qui illum','847',2005,'Quidem in et sit hic ea pariatur','No','Chava Mcintosh','Qui',74,14,'No',767,'No','','Excepturi quia eveniet reprehenderit magnam aliqua','Rerum asperiores nulla rem velit vel hic odio incidunt','Travis Wade','geximah@mailinator.com',93,'Ea nostrum harum rem autem odio quisquam','','','','1971-10-14 23:31:00.000000','Ranchi','TPD001001','2025-01-14 12:23:38.367066','2025-01-14 12:23:38.372201',1),
(5,'Rylee Hurley','Possimus lorem tempora sit quis laborum Soluta eveniet necessitatibus ea quia harum autem quaerat','Quis sit in animi magnam asperiores et laborum Doloremque quia tempora','Ullamco Nam labore eius culpa sint vel nulla esse modi','Qui iste perferendis nostrud error ullamco proident fuga Est at',38,'Fugiat rerum cillum esse aut et sed corporis reprehenderit occaecat delectus nulla ipsum','Voluptas adipisicing dolorem doloribus sit consequuntur neque ullam voluptatem Pariatur Blanditiis illum reiciendis modi quidem autem culpa et reprehenderit nihil','Porro rerum maiores nobis dolore impedit voluptas proident est pariatur Dolor illo sunt eum id','Reiciendis dolore ducimus sed aliquam fugit consequat Sunt voluptas',36,'63','233','pipykeh@mailinator.com','1975-10-18','2014-01-27','PAN','834','NEPHROLOGIST','Voluptatem a et fugiat perspiciatis nisi beatae ex','Saepe suscipit ut consectetur blanditiis labore qui ea occaecat cupiditate qui illum','847',2005,'Quidem in et sit hic ea pariatur','No','Chava Mcintosh','Qui',74,14,'No',767,'No','','Excepturi quia eveniet reprehenderit magnam aliqua','Rerum asperiores nulla rem velit vel hic odio incidunt','Travis Wade','geximah@mailinator.com',93,'Ea nostrum harum rem autem odio quisquam','','','','1971-10-14 23:31:00.000000','Ranchi','TPD001001','2025-01-14 12:26:03.487508','2025-01-14 12:26:03.496351',1),
(6,'Rylee Hurley','Possimus lorem tempora sit quis laborum Soluta eveniet necessitatibus ea quia harum autem quaerat','Quis sit in animi magnam asperiores et laborum Doloremque quia tempora','Ullamco Nam labore eius culpa sint vel nulla esse modi','Qui iste perferendis nostrud error ullamco proident fuga Est at',38,'Fugiat rerum cillum esse aut et sed corporis reprehenderit occaecat delectus nulla ipsum','Voluptas adipisicing dolorem doloribus sit consequuntur neque ullam voluptatem Pariatur Blanditiis illum reiciendis modi quidem autem culpa et reprehenderit nihil','Porro rerum maiores nobis dolore impedit voluptas proident est pariatur Dolor illo sunt eum id','Reiciendis dolore ducimus sed aliquam fugit consequat Sunt voluptas',36,'63','233','pipykeh@mailinator.com','1975-10-18','2014-01-27','PAN','834','NEPHROLOGIST','Voluptatem a et fugiat perspiciatis nisi beatae ex','Saepe suscipit ut consectetur blanditiis labore qui ea occaecat cupiditate qui illum','847',2005,'Quidem in et sit hic ea pariatur','No','Chava Mcintosh','Qui',74,14,'No',767,'Yes','1 Crore','Excepturi quia eveniet reprehenderit magnam aliqua','Rerum asperiores nulla rem velit vel hic odio incidunt','Travis Wade','geximah@mailinator.com',93,'Ea nostrum harum rem autem odio quisquam','','','','1971-10-14 23:31:00.000000','Ranchi','TPD001001','2025-01-14 12:35:15.755466','2025-01-14 12:35:15.762576',1);
/*!40000 ALTER TABLE `tbl_doctor_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hospital_registration`
--

DROP TABLE IF EXISTS `tbl_hospital_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_hospital_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) NOT NULL,
  `proprietor_name` varchar(255) NOT NULL,
  `house_no` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `hospital_address` varchar(255) NOT NULL,
  `hospital_house_no` varchar(255) NOT NULL,
  `hospital_street` varchar(255) NOT NULL,
  `hospital_district` varchar(255) NOT NULL,
  `hospital_state` varchar(255) NOT NULL,
  `hospital_pin_code` int(11) DEFAULT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `alternate_mobile_number` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `dob` date NOT NULL,
  `wedding_date` date DEFAULT NULL,
  `id_proof` varchar(255) NOT NULL,
  `id_number` varchar(255) NOT NULL,
  `registration_number_hospital` varchar(255) NOT NULL,
  `registration_year` int(11) NOT NULL,
  `no_of_beds` int(11) NOT NULL,
  `annual_opd` int(11) NOT NULL,
  `annual_ipd` int(11) NOT NULL,
  `facilities_available` varchar(255) NOT NULL,
  `total_doctors` int(11) NOT NULL,
  `insurance_cover` varchar(255) NOT NULL,
  `coverage_amount` varchar(255) NOT NULL,
  `tenure_of_membership` varchar(255) NOT NULL,
  `tenure_of_indemnity` varchar(255) NOT NULL,
  `tplc_rep_name` varchar(255) NOT NULL,
  `tplc_rep_email` varchar(254) NOT NULL,
  `total_amount_paid` int(11) DEFAULT NULL,
  `payment_details` varchar(255) NOT NULL,
  `registration_certificate` varchar(100) DEFAULT NULL,
  `selfie` varchar(100) DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `submission_date_time` datetime(6) DEFAULT NULL,
  `place_of_submission` varchar(100) NOT NULL,
  `app_registraction_no` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hospital_registration`
--

LOCK TABLES `tbl_hospital_registration` WRITE;
/*!40000 ALTER TABLE `tbl_hospital_registration` DISABLE KEYS */;
INSERT INTO `tbl_hospital_registration` VALUES
(1,'Graham Mcknight','Naomi Greene','Doloribus consectetur et tempore irure voluptates obcaecati ut exercitation voluptate eum animi est consectetur sunt dignissimos quo ut','Do eius aut excepturi quis veritatis ad ratione proident facere facilis','Aliquip dolores exercitation quis magna Nam ullamco officia aut dolorem sed voluptatem Ipsum doloremque aspernatur nesciunt voluptas earum','Saepe facere enim dignissimos deleniti molestias aliquam',96,'Saepe alias non reiciendis ab consequatur Quod aut est quidem sed hic ullamco similique id aut laudantium','Totam vitae quis fugiat magnam adipisicing dolore fuga Sed proident dolore suscipit sunt reiciendis','Architecto nostrum qui id ipsa voluptates quasi est asperiores labore do quis','Vel et omnis animi consequuntur ut id commodo odit enim pariatur Nemo voluptatem do illum eum pariatur Qui libero natus','Quia eum corrupti duis dolor est ea et',29,'583','902','bisenaru@mailinator.com','1990-01-27','2005-07-20','PAN','232','604',1983,313,50,59,'Voluptas sint recusandae Consequatur suscipit dolore ut explicabo Eiusmod corporis dolorem illo do ducimus non qui quis',480,'Yes','30 Lakh','Accusamus reprehenderit ea autem quos officia porro commodo elit quibusdam voluptate','Ex dolor sit laudantium temporibus ratione eum quisquam maxime rem modi ex alias esse aut','Winter Love','wute@mailinator.com',5,'45','','','','1983-12-06 14:55:00.000000','Molestiae quo error maiores ut porro architecto nisi ex quasi illum velit dolores est et aut','TPH001000','2025-01-14 13:15:45.610976','2025-01-14 13:15:45.611965',1);
/*!40000 ALTER TABLE `tbl_hospital_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_leads`
--

DROP TABLE IF EXISTS `tbl_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_leads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lead_date` date NOT NULL,
  `member_type` varchar(20) NOT NULL,
  `doctor_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `mobile2` varchar(15) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `member_status` varchar(20) NOT NULL,
  `landline` varchar(15) DEFAULT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `employee` varchar(255) DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_leads`
--

LOCK TABLES `tbl_leads` WRITE;
/*!40000 ALTER TABLE `tbl_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment_form_details`
--

DROP TABLE IF EXISTS `tbl_payment_form_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_payment_form_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `paymentID` varchar(20) NOT NULL,
  `member_reg_no` varchar(100) NOT NULL,
  `insured_type` varchar(100) NOT NULL,
  `doctor_nameor_establised` varchar(255) DEFAULT NULL,
  `proprietor_name` varchar(255) DEFAULT NULL,
  `speciality` varchar(100) NOT NULL,
  `house_no` varchar(100) NOT NULL,
  `street` varchar(255) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `mobile1` varchar(15) NOT NULL,
  `mobile2` varchar(15) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `membership_tenure` varchar(100) NOT NULL,
  `indemnity_amount` varchar(100) NOT NULL,
  `indemnity_tenure` varchar(100) NOT NULL,
  `plan` varchar(100) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `customer_id_type` varchar(100) NOT NULL,
  `customer_id_number` varchar(100) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `additional_member_id` varchar(100) NOT NULL,
  `selfie` varchar(100) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `place_of_submission` varchar(255) DEFAULT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_form_details`
--

LOCK TABLES `tbl_payment_form_details` WRITE;
/*!40000 ALTER TABLE `tbl_payment_form_details` DISABLE KEYS */;
INSERT INTO `tbl_payment_form_details` VALUES
(1,'100000','TPH001000','Diagnostic','Winifred Hampton','try','Venerologist','904','Consequatur est et q','Sit corporis velit','Labore quis voluptat','76654446','438','620','rydamiqam@mailinator.com','ytt','6545','hgg','Membership + Indemnity Insurance',25.00,'Aadhar','105','Combined','ghgh','','','Qui voluptatibus ali','Molestiae enim volup','2025-01-15'),
(2,'100001','TPH001000','Diagnostic','Winifred Hampton','try','Venerologist','904','Consequatur est et q','Sit corporis velit','Labore quis voluptat','76654446','438','620','rydamiqam@mailinator.com','ytt','6545','hgg','Membership + Indemnity Insurance',25.00,'Aadhar','105','Combined','ghgh','','','Qui voluptatibus ali','Molestiae enim volup','2025-01-15');
/*!40000 ALTER TABLE `tbl_payment_form_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment_multi_row_details`
--

DROP TABLE IF EXISTS `tbl_payment_multi_row_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_payment_multi_row_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_mode` varchar(100) NOT NULL,
  `additional_member_id` varchar(100) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_ref_no` varchar(100) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `payment_tabl_type` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `payment_forms_dtails_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_payment_multi_ro_payment_forms_dtails_25d6df59_fk_tbl_payme` (`payment_forms_dtails_id`),
  CONSTRAINT `tbl_payment_multi_ro_payment_forms_dtails_25d6df59_fk_tbl_payme` FOREIGN KEY (`payment_forms_dtails_id`) REFERENCES `tbl_payment_form_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_multi_row_details`
--

LOCK TABLES `tbl_payment_multi_row_details` WRITE;
/*!40000 ALTER TABLE `tbl_payment_multi_row_details` DISABLE KEYS */;
INSERT INTO `tbl_payment_multi_row_details` VALUES
(1,'IMPS','','2025-01-08','7676',676.00,'676767','Full','2025-01-15 02:04:21.865447','2025-01-15 02:04:21.866442',1,2);
/*!40000 ALTER TABLE `tbl_payment_multi_row_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `area` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES
(1,'pbkdf2_sha256$720000$eEgj0KJ0nm7M8DRZ81nD3k$mWjdAtN+bRfqgt4Xsdti5xgzY7rcLEgWwZm80lWipvI=',0,'admin@example.com','Admin',1,'2025-01-14 12:19:27.269254','','2025-01-14 10:24:41.466183','er'),
(2,'pbkdf2_sha256$720000$dK4kzHcr16Br3PjUfDSRxc$71FKFQ7aj1bh9a39WaygzYI2QMwfOgNqAXShfn6lofc=',0,'admin1@example.com','Laptop',1,'2025-01-15 01:53:02.509869','delhi','2025-01-15 01:53:02.110188','er'),
(3,'pbkdf2_sha256$720000$vcjVLkGEQxEhuI7yO0mZK2$42EfXmTto3OUivakcfyFX6PtGgogivtkWIHPatMEAZ4=',0,'admin2@example.com','Admin2',1,'2025-01-15 02:00:38.049194','delhi','2025-01-15 02:00:37.063330','Delhi');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_groups`
--

DROP TABLE IF EXISTS `tbl_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_users_groups_customuser_id_group_id_58bcf25c_uniq` (`customuser_id`,`group_id`),
  KEY `tbl_users_groups_group_id_154e93e8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `tbl_users_groups_customuser_id_ffeab281_fk_tbl_users_id` FOREIGN KEY (`customuser_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_users_groups_group_id_154e93e8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_groups`
--

LOCK TABLES `tbl_user_groups` WRITE;
/*!40000 ALTER TABLE `tbl_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_user_permissions`
--

DROP TABLE IF EXISTS `tbl_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_users_user_permissio_customuser_id_permission_6fb72d80_uniq` (`customuser_id`,`permission_id`),
  KEY `tbl_users_user_permi_permission_id_bf58bb35_fk_auth_perm` (`permission_id`),
  CONSTRAINT `tbl_users_user_permi_customuser_id_b83a2669_fk_tbl_users` FOREIGN KEY (`customuser_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_users_user_permi_permission_id_bf58bb35_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_user_permissions`
--

LOCK TABLES `tbl_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `tbl_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplcapp_appointmentmodel`
--

DROP TABLE IF EXISTS `tplcapp_appointmentmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplcapp_appointmentmodel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appointment_date` date NOT NULL,
  `employee_sales` varchar(255) NOT NULL,
  `from_time` time(6) NOT NULL,
  `to_time` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplcapp_appointmentmodel`
--

LOCK TABLES `tplcapp_appointmentmodel` WRITE;
/*!40000 ALTER TABLE `tplcapp_appointmentmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tplcapp_appointmentmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplcapp_policydetailsmodel`
--

DROP TABLE IF EXISTS `tplcapp_policydetailsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplcapp_policydetailsmodel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `policy_type` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `insurer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplcapp_policydetailsmodel`
--

LOCK TABLES `tplcapp_policydetailsmodel` WRITE;
/*!40000 ALTER TABLE `tplcapp_policydetailsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tplcapp_policydetailsmodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-01-15  7:37:08

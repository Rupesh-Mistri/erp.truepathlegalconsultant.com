-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: ecofabri_truepathlegalconsultant
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add diagnostic centre registration',6,'add_diagnosticcentreregistration'),(22,'Can change diagnostic centre registration',6,'change_diagnosticcentreregistration'),(23,'Can delete diagnostic centre registration',6,'delete_diagnosticcentreregistration'),(24,'Can view diagnostic centre registration',6,'view_diagnosticcentreregistration'),(25,'Can add doctor registration',7,'add_doctorregistration'),(26,'Can change doctor registration',7,'change_doctorregistration'),(27,'Can delete doctor registration',7,'delete_doctorregistration'),(28,'Can view doctor registration',7,'view_doctorregistration'),(29,'Can add hospital and nursing home registration',8,'add_hospitalandnursinghomeregistration'),(30,'Can change hospital and nursing home registration',8,'change_hospitalandnursinghomeregistration'),(31,'Can delete hospital and nursing home registration',8,'delete_hospitalandnursinghomeregistration'),(32,'Can view hospital and nursing home registration',8,'view_hospitalandnursinghomeregistration'),(33,'Can add payment forms dtails model',9,'add_paymentformsdtailsmodel'),(34,'Can change payment forms dtails model',9,'change_paymentformsdtailsmodel'),(35,'Can delete payment forms dtails model',9,'delete_paymentformsdtailsmodel'),(36,'Can view payment forms dtails model',9,'view_paymentformsdtailsmodel'),(37,'Can add custom user',10,'add_customuser'),(38,'Can change custom user',10,'change_customuser'),(39,'Can delete custom user',10,'delete_customuser'),(40,'Can view custom user',10,'view_customuser'),(41,'Can add payment table multi row model',11,'add_paymenttablemultirowmodel'),(42,'Can change payment table multi row model',11,'change_paymenttablemultirowmodel'),(43,'Can delete payment table multi row model',11,'delete_paymenttablemultirowmodel'),(44,'Can view payment table multi row model',11,'view_paymenttablemultirowmodel'),(45,'Can add lead model',12,'add_leadmodel'),(46,'Can change lead model',12,'change_leadmodel'),(47,'Can delete lead model',12,'delete_leadmodel'),(48,'Can view lead model',12,'view_leadmodel'),(49,'Can add appointment model',13,'add_appointmentmodel'),(50,'Can change appointment model',13,'change_appointmentmodel'),(51,'Can delete appointment model',13,'delete_appointmentmodel'),(52,'Can view appointment model',13,'view_appointmentmodel'),(53,'Can add policy details model',14,'add_policydetailsmodel'),(54,'Can change policy details model',14,'change_policydetailsmodel'),(55,'Can delete policy details model',14,'delete_policydetailsmodel'),(56,'Can view policy details model',14,'view_policydetailsmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_tbl_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_tbl_users_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(13,'tplcapp','appointmentmodel'),(10,'tplcapp','customuser'),(6,'tplcapp','diagnosticcentreregistration'),(7,'tplcapp','doctorregistration'),(8,'tplcapp','hospitalandnursinghomeregistration'),(12,'tplcapp','leadmodel'),(9,'tplcapp','paymentformsdtailsmodel'),(11,'tplcapp','paymenttablemultirowmodel'),(14,'tplcapp','policydetailsmodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-15 04:44:52.860357'),(2,'contenttypes','0002_remove_content_type_name','2025-01-15 04:44:52.966968'),(3,'auth','0001_initial','2025-01-15 04:44:53.505329'),(4,'auth','0002_alter_permission_name_max_length','2025-01-15 04:44:53.615503'),(5,'auth','0003_alter_user_email_max_length','2025-01-15 04:44:53.623528'),(6,'auth','0004_alter_user_username_opts','2025-01-15 04:44:53.632703'),(7,'auth','0005_alter_user_last_login_null','2025-01-15 04:44:53.641794'),(8,'auth','0006_require_contenttypes_0002','2025-01-15 04:44:53.646791'),(9,'auth','0007_alter_validators_add_error_messages','2025-01-15 04:44:53.655164'),(10,'auth','0008_alter_user_username_max_length','2025-01-15 04:44:53.663923'),(11,'auth','0009_alter_user_last_name_max_length','2025-01-15 04:44:53.671956'),(12,'auth','0010_alter_group_name_max_length','2025-01-15 04:44:53.682794'),(13,'auth','0011_update_proxy_permissions','2025-01-15 04:44:53.693546'),(14,'auth','0012_alter_user_first_name_max_length','2025-01-15 04:44:53.710489'),(15,'tplcapp','0001_initial','2025-01-15 04:44:54.557506'),(16,'admin','0001_initial','2025-01-15 04:44:54.794190'),(17,'admin','0002_logentry_remove_auto_add','2025-01-15 04:44:54.802956'),(18,'admin','0003_logentry_add_action_flag_choices','2025-01-15 04:44:54.812805'),(19,'sessions','0001_initial','2025-01-15 04:44:54.859889'),(20,'tplcapp','0002_leadmodel_alter_customuser_table','2025-01-15 04:44:54.967443'),(21,'tplcapp','0003_appointmentmodel_policydetailsmodel_customuser_area','2025-01-15 04:44:55.044900'),(22,'tplcapp','0004_alter_policydetailsmodel_options_and_more','2025-01-15 04:44:55.085042');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2biin6bwpb36cyg5vfvz8ljdrv0119c6','.eJxVjMsOwiAQRf-FtSHMlPBw6d5vIAwMUjWQlHZl_Hdt0oVu7znnvkSI21rDNngJcxZnAeL0u1FMD247yPfYbl2m3tZlJrkr8qBDXnvm5-Vw_w5qHPVbowE7sSOasESF2SsqQNmRnrTzGC17jYkYjDFsUkGwTIq8Bqs0KCfeH92nN2U:1tYHbt:lA-s_LiQCNUm_WryjDZVOj8rCo7Lr7mv4FFeaH3bJFU','2025-01-30 04:36:01.396681'),('ypjugrddsnmciihnf4fz6cjobrqyf4is','.eJxVjEEOwiAQRe_C2hCYFoa4dO8ZyMCAVA1NSrtqvLs06UK37_33d-FpW4vfWlr8xOIqQFx-WaD4SvUQ_KT6mGWc67pMQR4Tedom7zOn9-3c_h0UaqXXQQGD1RAsOuOQwajRBMdmGFPihEGTzVoNGVXsIEZtMHcBPcxIID5f2SE4Uw:1tYIhO:_McF-VF8HD8e-H3o1YDJ1pQI52su3luM5ugffq0YO7Y','2025-01-30 05:45:46.051438');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_appointment`
--

DROP TABLE IF EXISTS `tbl_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_appointment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appointment_date` date NOT NULL,
  `employee_sales` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `from_time` time(6) NOT NULL,
  `to_time` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_appointment`
--

LOCK TABLES `tbl_appointment` WRITE;
/*!40000 ALTER TABLE `tbl_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnostic_center_reg`
--

DROP TABLE IF EXISTS `tbl_diagnostic_center_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnostic_center_reg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `proprietor_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `house_no` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pin_code` int DEFAULT NULL,
  `hospital_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_house_no` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_street` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_district` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_state` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_pin_code` int DEFAULT NULL,
  `mobile_number` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `alternate_mobile_number` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date NOT NULL,
  `wedding_date` date DEFAULT NULL,
  `id_proof` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `registration_number_hospital` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `registration_year` int NOT NULL,
  `annual_opd` int NOT NULL,
  `facilities_available` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `total_doctors` int NOT NULL,
  `insurance_cover` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `coverage_amount` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tenure_of_membership` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tenure_of_indemnity` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tplc_rep_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tplc_rep_email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `total_amount_paid` int DEFAULT NULL,
  `payment_details` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `registration_certificate` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `selfie` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `signature` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `submission_date_time` datetime(6) DEFAULT NULL,
  `place_of_submission` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `app_registraction_no` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnostic_center_reg`
--

LOCK TABLES `tbl_diagnostic_center_reg` WRITE;
/*!40000 ALTER TABLE `tbl_diagnostic_center_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_diagnostic_center_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doctor_registration`
--

DROP TABLE IF EXISTS `tbl_doctor_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doctor_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `house_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pin_code` int DEFAULT NULL,
  `hospital_house_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hospital_street` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hospital_district` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hospital_state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hospital_pin_code` int DEFAULT NULL,
  `mobile_number` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `alternate_mobile_number` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date NOT NULL,
  `wedding_date` date DEFAULT NULL,
  `id_proof` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `speciality` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `other_speciality` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `registration_year` int NOT NULL,
  `medical_council` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `visiting_physician` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `associated_hospitals` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `legal_claims` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `practice_duration` int NOT NULL,
  `avg_patients_per_day` int NOT NULL,
  `unqualified_staff_extension` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `annual_income` int DEFAULT NULL,
  `insurance_cover` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `coverage_amount` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tenure_of_membership` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tenure_of_indemnity` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tplc_rep_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tplc_rep_email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `total_amount_paid` int DEFAULT NULL,
  `payment_details` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registration_certificate` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `selfie` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `submission_date_time` datetime(6) DEFAULT NULL,
  `place_of_submission` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `app_registraction_no` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor_registration`
--

LOCK TABLES `tbl_doctor_registration` WRITE;
/*!40000 ALTER TABLE `tbl_doctor_registration` DISABLE KEYS */;
INSERT INTO `tbl_doctor_registration` VALUES (1,'Amos Nguyen','Modi sit quia sed et dicta dolor dolorem iure','Qui totam in cupidatat eveniet sint impedit ad consequatur expedita ullam sint minima ut beatae totam','Ducimus deleniti labore earum nihil provident','Magna nostrud qui fuga Porro blanditiis dolor cupidatat sit consequat Similique',59,'Sequi occaecat irure quia sed dolore fugiat magna non unde eum sequi ea id ut','Et consequatur quia est facere quo ratione suscipit','Ea reprehenderit quia sunt amet alias corporis non quis ullam ipsam','Qui placeat sit eaque commodo tempora fuga Perferendis non iste qui qui nobis',25,'627','771','budaz@mailinator.com','1982-05-15','2023-12-28','PAN','35','CHEST & TURBERCULOSIS SPECIALIST','Est non quo incididunt sed ea id tempora quos ut irure','Incidunt aliquip sed quidem cupiditate sunt tempor voluptas accusamus quod ducimus molestias nostrud inventore saepe soluta culpa qui voluptas ut','668',2012,'Est ullam in adipisci et','Yes','Desiree Irwin','Vel',28,10,'Yes',490,'Yes','40 Lakh','Velit dolores occaecat sapiente fugit dolore in cillum omnis et illum temporibus','Autem est eius laboriosam beatae officia sapiente repellendus Voluptatem explicabo Proident facilis nulla inventore ut consectetur','Yuli Yang','koboxys@mailinator.com',46,'Eu ea est asperiores maxime placeat sit eius voluptate voluptatum nihil laudantium iusto quas cillum occaecat earum asperiores','documents/popular_image56.jpg','images/popular_image11.jpg','signatures/popular_image102.jpg','2020-05-26 04:40:00.000000','Commodo vitae ut libero asperiores voluptatem rem voluptatem et est optio dolore velit voluptatem','TPD001000','2025-01-16 04:48:32.782664','2025-01-16 04:48:32.905724',1),(2,'SUNIL KUMAR','S/O BALIRAM SINGH GIRIJA NIWAS','99 BESIDE MISSION HOSPITAL PREM NAGAR LATMA ROAD HATIA RANCHI','RANCHI','Jharkhand',834003,'NA','NA','NA','NA',834003,'7541803300','9431166294','drsunil54848@gmail.com','1970-09-05',NULL,'Aadhar','883243176438','GENERAL SURGEON','GENERAL SURGERY','MBBS MS','4748',2015,'JMC','Yes','ALL OVER INDIA','NA',12,200,'No',0,'Yes','50 Lakh','03 YEAR','03 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',23994,'CQ NO 307608 DATE 16.01.2025 state bankof india','documents/WhatsApp_Image_2025-01-15_at_19.09.04.jpeg','','','2025-01-16 10:55:00.000000','RANCHI','TPD001001','2025-01-16 05:26:37.947133','2025-01-16 05:26:37.961787',1);
/*!40000 ALTER TABLE `tbl_doctor_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hospital_registration`
--

DROP TABLE IF EXISTS `tbl_hospital_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hospital_registration` (
  `id` bigint NOT NULL,
  `hospital_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `proprietor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `house_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pin_code` int DEFAULT NULL,
  `hospital_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_house_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_pin_code` int DEFAULT NULL,
  `mobile_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alternate_mobile_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dob` date NOT NULL,
  `wedding_date` date DEFAULT NULL,
  `id_proof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registration_number_hospital` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registration_year` int NOT NULL,
  `no_of_beds` int NOT NULL,
  `annual_opd` int NOT NULL,
  `annual_ipd` int NOT NULL,
  `facilities_available` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_doctors` int NOT NULL,
  `insurance_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coverage_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_doctor_1_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_doctor_1_contact` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_doctor_1_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_doctor_2_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_doctor_2_contact` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_doctor_2_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tplc_rep_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tplc_rep_email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_amount_paid` int DEFAULT NULL,
  `payment_details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registration_certificate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `selfie` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `submission_date_time` datetime DEFAULT NULL,
  `place_of_submission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_registraction_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `tenure_of_membership` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenure_of_indemnity` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hospital_registration`
--

LOCK TABLES `tbl_hospital_registration` WRITE;
/*!40000 ALTER TABLE `tbl_hospital_registration` DISABLE KEYS */;
INSERT INTO `tbl_hospital_registration` VALUES (1,'Vincent Macias','Damon Whitehead','656565634','RYE43','Ranchi','Jharkhand',534543,'TEST HOSPITAL','758483','YTR543','67383','RANCHI',764384,'5444444444','4555555555','admin@example.com','2025-01-11','2025-01-11','PAN','FDFD5433F','640',2024,5,5,4,'TESTING, SERVING',43,'No','','5443','45','54','34','34','32','Kylynn Rich','tyrupy@mailinator.com',5433,'43456FG','registration_certificates/popular_image35.jpg','selfies/popular_image25.jpg','signatures/populkar_image73.jpg','2025-01-11 00:00:00','Ranchi','TPH001000','2025-01-11 10:07:04.009370','2025-01-11 10:07:04.158447',1,NULL,NULL),(2,'JANTA HOSPITAL','SHASHI BHUSHAN SINGH','Ram Dular Singh , Near Durga Mandir Ukrid Ramgarh','Ramgarh , Jharkhand ,','RAMGARH','JHARKHAND',825101,'Collage Road Opp Panchwati Apartment , Near Ramgarh college','Near Ramgarh college Ramgarh , Jharkhand , 829122','RAMGARH','RAMGARH','JHARKHAND',829122,'8409092636','8409092636','Bhushansingh9835@gmail.Com','1989-01-01',NULL,'Aadhar','946507146150','2036100521',2024,20,500,200,'ALL FACILITIES',35,'Yes','1.5 Crore','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',35000,'CQ BANK OF INDIA','','','','2025-01-20 00:00:00','RANCHI','TPH001001','2025-01-11 15:42:37.589335','2025-01-11 15:42:37.589978',1,NULL,NULL);
/*!40000 ALTER TABLE `tbl_hospital_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_leads`
--

DROP TABLE IF EXISTS `tbl_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leads` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lead_date` date NOT NULL,
  `member_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `doctor_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile2` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `member_status` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `landline` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `employee` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_general_ci,
  `hospital_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `diagnostic_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment_form_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `paymentID` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `member_reg_no` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `insured_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `doctor_nameor_establised` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `proprietor_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `speciality` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `house_no` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pincode` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile1` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile2` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `membership_tenure` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `indemnity_amount` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `indemnity_tenure` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `plan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `customer_id_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id_number` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `additional_member_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `selfie` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_general_ci,
  `place_of_submission` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_form_details`
--

LOCK TABLES `tbl_payment_form_details` WRITE;
/*!40000 ALTER TABLE `tbl_payment_form_details` DISABLE KEYS */;
INSERT INTO `tbl_payment_form_details` VALUES (1,'100000','TPD001001','Doctor','sunil kumar',NULL,'General & Laparoscopic Surgeon','S/O BALIRAM SINGH GIRIJA NIWAS','99 BESIDE MISSION HOSPITAL PREM NAGAR LATMA ROAD HATIA RANCHI','JHARKHAND','RANCHI','834003','9234610994','9431166294','drsunil54848@gmail.com','3 year','50','03 year','Membership + Indemnity Insurance',23994.00,'Aadhar','883243176438','Single','','','','THREE YEAR LEGAL SERVICES WITH 50 LAH INSURANCE COVER','RANCHI','2025-01-16'),(2,'100001','TPD001001','Doctor','sunil kumar',NULL,'General & Laparoscopic Surgeon','S/O BALIRAM SINGH GIRIJA NIWAS','99 BESIDE MISSION HOSPITAL PREM NAGAR LATMA ROAD HATIA RANCHI','Jharkhand','RANCHI','834003','7541803300','9431166294','drsunil54848@gmail.com','3 year','9731','3 year','Membership + Indemnity Insurance',23994.00,'Aadhar','883243176438','Single','','','','','RANCHI','2025-01-16'),(3,'100002','TPD001001','Doctor','sunil kumar',NULL,'General & Laparoscopic Surgeon','S/O BALIRAM SINGH GIRIJA NIWAS','99 BESIDE MISSION HOSPITAL PREM NAGAR LATMA ROAD HATIA RANCHI','Jharkhand','RANCHI','834003','7541803300','9431166294','drsunil54848@gmail.com','3 year','9731','3 year','Membership + Indemnity Insurance',23994.00,'Aadhar','883243176438','Single','','','','','RANCHI','2025-01-16');
/*!40000 ALTER TABLE `tbl_payment_form_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment_multi_row_details`
--

DROP TABLE IF EXISTS `tbl_payment_multi_row_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment_multi_row_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_mode` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `additional_member_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_ref_no` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_tabl_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `payment_forms_dtails_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_payment_multi_ro_payment_forms_dtails_25d6df59_fk_tbl_payme` (`payment_forms_dtails_id`),
  CONSTRAINT `tbl_payment_multi_ro_payment_forms_dtails_25d6df59_fk_tbl_payme` FOREIGN KEY (`payment_forms_dtails_id`) REFERENCES `tbl_payment_form_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_multi_row_details`
--

LOCK TABLES `tbl_payment_multi_row_details` WRITE;
/*!40000 ALTER TABLE `tbl_payment_multi_row_details` DISABLE KEYS */;
INSERT INTO `tbl_payment_multi_row_details` VALUES (1,'Cheque','','2025-01-16','307608',23994.00,'sbi','Full','2025-01-16 04:33:30.244614','2025-01-16 04:33:30.246604',1,1);
/*!40000 ALTER TABLE `tbl_payment_multi_row_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_policy_details`
--

DROP TABLE IF EXISTS `tbl_policy_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_policy_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `policy_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `insurer_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_policy_details`
--

LOCK TABLES `tbl_policy_details` WRITE;
/*!40000 ALTER TABLE `tbl_policy_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_policy_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `area` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'pbkdf2_sha256$720000$anHqsvkHCdJiIuUnDyNvKy$Iv0OZrvszTpxN6TZSrL/40e32DU5vO61Ek/yrMcMb1M=',1,'admin@example.com','Admin',1,'2025-01-16 04:36:01.393790','Ranchi','2025-01-15 10:28:59.000000','Ranchi'),(2,'pbkdf2_sha256$720000$5InBsubXe0N6M8Xpek4IcT$jTVSFO6OKIp6Yd5+sxyNrn18nPRHddznSUoTth01CDo=',1,'ashokmishra@truepathlegalconsultant.com','Ashok Kumar Mishra',1,'2025-01-16 05:45:46.049031','Ranchi','2025-01-15 05:07:48.654445','Ranchi');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_groups`
--

DROP TABLE IF EXISTS `tbl_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_users_groups_customuser_id_group_id_58bcf25c_uniq` (`customuser_id`,`group_id`),
  KEY `tbl_users_groups_group_id_154e93e8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `tbl_users_groups_customuser_id_ffeab281_fk_tbl_users_id` FOREIGN KEY (`customuser_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_users_groups_group_id_154e93e8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_users_user_permissio_customuser_id_permission_6fb72d80_uniq` (`customuser_id`,`permission_id`),
  KEY `tbl_users_user_permi_permission_id_bf58bb35_fk_auth_perm` (`permission_id`),
  CONSTRAINT `tbl_users_user_permi_customuser_id_b83a2669_fk_tbl_users` FOREIGN KEY (`customuser_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `tbl_users_user_permi_permission_id_bf58bb35_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_user_permissions`
--

LOCK TABLES `tbl_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `tbl_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-16  6:03:41

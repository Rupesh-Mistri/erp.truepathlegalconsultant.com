-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: ecofabri_truepathlegalconsultant
-- ------------------------------------------------------
-- Server version	8.0.41

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
INSERT INTO `django_session` VALUES ('1my7t88zy4j43r3x1fc52yzftvmwzg5v','.eJydk01zmzAQhv-KhrPtGOzx182NDznYHTfXTkazQguoBYlKoq0nk_9eCRNjWrA7OcI---7uu6vXgEJlM1oZ1FTwYBOEwej6H4P4O0of4N9ApmoSK2m1YBOPTJqomRwUx_xTw3YEMjCZy44W4XKGK8ZmUQLTiK-nLAkZX7H5bL5aR7DE9TyKGYaLxQIXcRKFS2RTtp6Hy-k8nK6caIGy4iK2lJ1q6WDz9TWwwubo9PcI3DhIuP7cZwIkgXFNjYJK58FGVnk-CkzFvEwndVuWSkjr_tuLwJmuE4MHaAGaC-Opi44H30at2DOWSlvTL5T7JqmukVsiR61KZSDvVymbaH8vL9dCBywYavKMqUM1WOHEPuTRTsVW6f5-eB1zY7VF7tr0pEwpLORkKzn5XGkjZEqeVIH9JbIGpyA5lWecZg6_W2gnIJXKWBGTR7c_PVCAXzAa15gf5z8MPsLJnwXZn8lBZ93WzuTdhh_BIDmAhBQ7F9mI5kLiOM6gPqB7h81_qhjswMjQRm83s0MLYuAW30UeYkdS_k7ecOxLhfrUZ9W44PdH6mZ3WvnRhG7UPr8D1Lc3pVtq0Ji9SlX1z3JK9cvNoZKEWPxtxxp5q5q_ZwxqbnkhJDn42IfeqM8kR9SFMOb6oXdc8lm0vIb-9uvl7Q9gmxQ3:1tkl3b:coPiL0c2S7ZHI_wbR1oBJNYAM8W-wHM2SwVRV9xRVLA','2025-03-05 14:28:11.391758'),('2sve48xalr06d3d1zrqvlpd23mwf35w5','.eJxVjEEOwiAQRe_C2hCYFoa4dO8ZyMCAVA1NSrtqvLs06UK37_33d-FpW4vfWlr8xOIqQFx-WaD4SvUQ_KT6mGWc67pMQR4Tedom7zOn9-3c_h0UaqXXQQGD1RAsOuOQwajRBMdmGFPihEGTzVoNGVXsIEZtMHcBPcxIID5f2SE4Uw:1tdOw9:3bRCokfaNzLMhOudKPGcdA6ISPsOqgI-ieoASEMqxXU','2025-02-13 07:26:05.522431'),('3qnif4if2za32s3tew14rdck7wudqp9l','.eJydVV1v2jAU_StRnoECLR_ijcGmPsDE2kl9mKroxr5JPBI7s51tqOp_n52khUA-WB_JPefcr8P1i-tBpiMvUyg9Rt2FO3Z7p998IHvkNkB_Ag_FgAiuJfMHFjIoo2qwFRTjTyW2IhCBigzbH47peDoa-9PZfDKf0fFkeDfx53Rye4dIceaPYBqMhrfBbEjMB0JGk1lgAmNDDGZgq0qQZ5QR7fmHXNpd_HhxNdMxGv0NAlUGxEx95mcATgD9HNVzMxm7C57Fcc9VmW9lWqgFLqe4N7ENeTFT2j3hWshr7yiwTFPBuDZBXS8DR0Cn2AOmQurWemQOaRPZSZEKBXG9SlpG62t5PhXaYuKjdB4wNFAJmhmxDw15LYgWsr4emsdMW8cknWO6FyplGmJnyanzNZOK8dC5FwnWp4hKuAeceryAe5GBdyZaMwi5UJoRZ2X2JxsS0HeYR3KYbeeKAe_gYG3hbApk42TN1gpkZ8ErUOhsgUOIFUeWojHj2CcR5AbqWNqS_hYEdEPLcIy2F7NGDazBi8QAPPoGaBnUtwzloW5C_YR2d1JlVyr4VYZachf2R9m-IHlENc_DXE8gOrfSpR4RiV2ZcjT-1X2JVzT2FIFW5r40TLdI11bR4_axjnuW8Zz1OWnYaAdvBbF5IUDefAe1rz1yXQLvHf03U6Ixq2P-oXusv68dAl_Mu2QfvGupFQttRCiyiz9jKv4YA4sguNi4ufVvjOZ3hyaMO1sb-9BNtkxnhzJhSp0e9oqFLMtLT0HnXT6__gP9JdS9:1tphIj:XkW_k01MhaDS6OJN9CAXiSHp_xLRJPpihdOe-5Mtnhw','2025-03-19 05:28:13.300811'),('53b9uqtl8azwsx5hyvu5bwpvfmmpmnr0','e30:1tfHIo:5VTqfKq96NPpB0iBg6JiuHzJH8Bal0j_v1o3uQgFsDY','2025-02-18 11:41:14.131050'),('5iiijpi2ouci2k93asrd78nc7z2bb37g','.eJxVjEEOwiAQRe_C2hCYFoa4dO8ZyMCAVA1NSrtqvLs06UK37_33d-FpW4vfWlr8xOIqQFx-WaD4SvUQ_KT6mGWc67pMQR4Tedom7zOn9-3c_h0UaqXXQQGD1RAsOuOQwajRBMdmGFPihEGTzVoNGVXsIEZtMHcBPcxIID5f2SE4Uw:1tZNHD:PkTROS7CWw9ltph466201KkEASNgE0WPx326wfHBXkA','2025-02-02 04:51:11.386332'),('6akzcfinv8vv2zgr94p6oyxvfbtt5884','e30:1tfHKv:9PbjX4C0I9ctJkxuJLwAsx_hScn2Gm5A-a0KYSfT5wE','2025-02-18 11:43:25.900134'),('7k76a5zjr5f7f22zgi9s59202dtecgfu','.eJydVV1v2jAU_StRnoESQHy9MdjUB5hYO6kPUxVd2zeJR2JntrMNVf3vcwItBPLB-gj3nHO_Tq5fXB8yE_mZRuVz5s5dz-2c_0eA7lDkAfYTRCh7VAqjOOnlkN4xqnsbyTD-dMSWBCLQkWUPxt5kiFNChoMA-gM265PAI2xKRsPRdDaACc5GA0rQG4_HOKbBwJsg6ZPZyJv0R15_akUTFBnj1PhkX0i78x8vruEmRqu_RmDagritz_4MwAmgW6A6bqZidy6yOO64OiO5TAP1gCso7l2ch_yYa-OecXPIa-cksEhTyYWxQVMtAydAq9gDplKZxnpUAWkS2SqZSg1xtUp6jFbX8nwutMGEoHIeMLRQBYZbsQ8NeSWpkaq6HlbEbFunJK1jupc65QZiZyGY8zVTmovQuZcJVqeIjnAfBPPFAe5HFt6aaMUhFFIbTp2l3Z-qScDeYT4tYHk7Nwx4C_vcFs76gKydrN3aAdla8BI0OhsQEGLJkUfRmAvs0ggKA7UsbcF-SwqmpmU4RZuLWaEBXuNFagE-ewM0DOpbhmpfNaFuwto7KbNLFfw6hhpyH-yPqnlB6oSqn4e9nkBNYaVrPSqTfGXaMfjXdBXe0NhTBEbb-1Iz3UO6pooeN49V3IuMl6zPSc1GW3hLiO0LAeruO-hd5ZFrE3jv6L-ZCq1ZHfuF7rD6vrYIfEFk-YN3K7VkobUMZXb1MabyjzWwDIKrjdtb_8aof3dYwoWzyWMfusk509miSrjW54e9ZKGc5afnoMsun1__Ae8o088:1tz99e:qVhkOY8q76zsH3QssP2ldpCn7LVoc5T3VydDAPJAgmE','2025-04-14 07:01:54.679794'),('aecydax2fpvdmmx6czet3ikcpszdbqi7','e30:1tfGOP:k_FdIB8o5FHoPdilzxwI8FiLMjv9A-Wo-ApumNn25uM','2025-02-18 10:42:57.564431'),('b4gznwf9a0u8cd0onr2s8prc8bssdfk5','e30:1tfH8x:yJbO0kCaLVC8zNlx_p1ycGB-06CkhSEE5tBUYrYkWjE','2025-02-18 11:31:03.984670'),('eelp17g1ylywy7zvtyy98px5wccdjzzh','e30:1tfHHH:f_P6F7kQNKLuXkzLpsAvlnPa9TFoNshFZAF58nxfxlg','2025-02-18 11:39:39.053377'),('g52j7ny0gmtccl04aa3734g27w79vj07','.eJydVV1v2jAU_StRnoECLR_ijcGmPsDE2kl9mKroxr5JPBI7s51tqOp_n52khUA-WB_JPefcr8P1i-tBpiMvUyg9Rt2FO3Z7p998IHvkNkB_Ag_FgAiuJfMHFjIoo2qwFRTjTyW2IhCBigzbH47peDoa-9PZfDKf0fFkeDfx53Rye4dIceaPYBqMhrfBbEjMB0JGk1lgAmNDDGZgq0qQZ5QR7fmHXNpd_HhxNdMxGv0NAlUGxEx95mcATgD9HNVzMxm7C57Fcc9VmW9lWqgFLqe4N7ENeTFT2j3hWshr7yiwTFPBuDZBXS8DR0Cn2AOmQurWemQOaRPZSZEKBXG9SlpG62t5PhXaYuKjdB4wNFAJmhmxDw15LYgWsr4emsdMW8cknWO6FyplGmJnyanzNZOK8dC5FwnWp4hKuAeceryAe5GBdyZaMwi5UJoRZ2X2JxsS0HeYR3KYbeeKAe_gYG3hbApk42TN1gpkZ8ErUOhsgUOIFUeWojHj2CcR5AbqWNqS_hYEdEPLcIy2F7NGDazBi8QAPPoGaBnUtwzloW5C_YR2d1JlVyr4VYZachf2R9m-IHlENc_DXE8gOrfSpR4RiV2ZcjT-1X2JVzT2FIFW5r40TLdI11bR4_axjnuW8Zz1OWnYaAdvBbF5IUDefAe1rz1yXQLvHf03U6Ixq2P-oXusv68dAl_Mu2QfvGupFQttRCiyiz9jKv4YA4sguNi4ufVvjOZ3hyaMO1sb-9BNtkxnhzJhSp0e9oqFLMtLT0HnXT6__gP9JdS9:1tuSAz:ntMWA1M7skazOOG6xioA691uWxJLiKpd5oi5Bh03uss','2025-04-01 08:19:53.279829'),('gm0zfhv9knmnf9zckpp9rcbnre09iev2','e30:1tfH70:uISrjdu0BHaWju0jy_Uw87XDSz1NC-9NV5Cs67COKus','2025-02-18 11:29:02.185246'),('gvmldf2a0sjmxpzkcn805mkxy8bw2b61','.eJydlE1v2zAMhv-K4HOSxk6Qr1vWHHpIhqzXoTAoiba12ZInyduCov99suPUzuaPoceYD1-SL6m8eiEUNgkLgzoU3Nt5vjdpf6PAvqMsA_wbyFjNmJJWCzorkVkdNbOT4ph-qtk7gQRM4rKDlb9e4IbSRRDBPODbOY18yjd0uVhutgGscbsMGEV_tVrhikWBv0Y6p9ulv54v_fnGiWYoCy6YDemlkvZ2X189K2yKTv-IwI2DhOvP_YyARDCtqIlX6NTbySJNJ54paCkzkHrlqhTvIS1DYSqM9Vq5JfI2aQT2ea6EtC5ou2WgAUbFnjFX2g72oytkSOSsVa4MpN0qeR3t7uWlLXTCjKImzxg7VIMVTuxDJh8Us0p398OrmBurKTJq05MyubCQkr3k5HOhjZAxeVIZdpdIajwEyUN5xcPE4aOFDgJiqYwVjDy6_emeAvwdC1mFleP8h8FnuJRnQY5XstdZt7UrOdrwIxgkJ5AQ491F1qKpkDhlCVQHNLK0Pf-pGNiekaGJDjdzQAui5xZvIg_MkSG_kQOOfSlQX7qsmmZ8fKT77LtWftShgdrXd4B6eFO6oXqNOapYFf8sJ1e_3BwqiojF33aqkTeq6S2j_3-IZ0KSUxn70BstM8kZdSaMaT_0O5fKrDBvQ3_79fL2BxdaKi4:1tfHfP:HHAOf-VybWjWEJwqsuuuhyeTMGWX6iLRcULRBRaVNx4','2025-02-18 12:04:35.133334'),('m2aitckfyqvm0yyoiiitq42gxm6b3imb','e30:1tfGw4:4gNgXq8G3bkJBppT15d-q7DEirnUuDNusHruJdRb1dY','2025-02-18 11:17:44.224877'),('nd7ydbkwol7wy9fg06crlw530twgatde','e30:1tfHJF:v6c5lLxpQ4-uGknwbA2EF14K6bRN9NSMd0FeN9f0n3g','2025-02-18 11:41:41.519303'),('o30ljj61oakoo4z8t7obf0o0zyyhlmv5','e30:1tfGK2:lLNPMJVTugi9JfpaGY7FJZ0fTVu0lQNeussSeRQvUjk','2025-02-18 10:38:26.200698'),('o7ycoizmht6oj8ejvv6hki4ba23p20uj','e30:1tfGTi:Rnn0gC8eLu8yQ8gH3JCmMOv8PGdMByUP7nOzosyTa-M','2025-02-18 10:48:26.746887'),('rvp9o9emlw7gl35wo04bh003t1iurbry','.eJydVclu2zAQ_RVBZ9uxldgOfHPtFjnYRZoU6KEohBE5klhLpEpSbY2g_97RknjT4vYozntv3iwiX1wfchv7uUHtC-4uXM8dHJ8FwHYoiwD_DjJSI6ak1SIYFZBRHTWjreKYvKuxJwIxmJjYwdjj3mziBbP5_fR-zr3p-G4a3PPp7R0ix3kwgVk4Gd-G8zGjA8Ym03lIAY-I4RwKVynKnAtm_WBfSruLry-uFTZB0t8gcEMgQf7oMwQnhGGJGri5TtyFzJNk4Jo8KGQ6qBWupLg3SRHyE2Gse8QtIH8GB4FllikhLQVtswwcAL1iT5gpbTv96BLSJfKoVaYMJM0qWR1t9vLtWGiLaYDaecKIoBqsILH_avJaMat0sx9exqisQ5LeNj0okwkLibOU3PmYayNk5DyoFJtTxDXcB8l9WcH9mOC9idYCIqmMFcxZ0fx0SwL-BvNZCSvKuaLBj7Av1sLZVMjWztLUKmSv4RUYdLYgIcKTjaxFEyFxyGIoF6hnaEv-UzGwLSXDIdptZo0WRMsuMgL4_BXQ0ahPOep9U4eGKe-v5JR94uBHHerIXa0_6u4B6QOqvR90ewKz5Spd6jGVFiMzjsXfdqjxisK-xGAN3S8t3a3SdTl63j43cc8ynrPepy0T7eGtIKEXAvTNZzC7xkuuT-Cton9maqRldegP3WHz_doj8IHepeLBu5Z6skIbFan84mfM1C9aYBWGFxOnu_6Vca76F1hxotQ:1tyMVs:VmJWcU_n_AJGgnL9QW5sc_fB6kR3Eo_1mP2mFjKh2z8','2025-04-12 03:05:36.461440'),('tg5vzm38lykazzy93ayzu2rtkg8uiyze','.eJydk01zmzAQhv-KhrPtGOzx182NDznYHTfXTkazQguoBYlKoq0nk_9eCRNjWrA7OcI---7uu6vXgEJlM1oZ1FTwYBOEwej6H4P4O0of4N9ApmoSK2m1YBOPTJqomRwUx_xTw3YEMjCZy44W4XKGK8ZmUQLTiK-nLAkZX7H5bL5aR7DE9TyKGYaLxQIXcRKFS2RTtp6Hy-k8nK6caIGy4iK2lJ1q6WDz9TWwwubo9PcI3DhIuP7cZwIkgXFNjYJK58FGVnk-CkzFvEwndVuWSkjr_tuLwJmuE4MHaAGaC-Opi44H30at2DOWSlvTL5T7JqmukVsiR61KZSDvVymbaH8vL9dCBywYavKMqUM1WOHEPuTRTsVW6f5-eB1zY7VF7tr0pEwpLORkKzn5XGkjZEqeVIH9JbIGpyA5lWecZg6_W2gnIJXKWBGTR7c_PVCAXzAa15gf5z8MPsLJnwXZn8lBZ93WzuTdhh_BIDmAhBQ7F9mI5kLiOM6gPqB7h81_qhjswMjQRm83s0MLYuAW30UeYkdS_k7ecOxLhfrUZ9W44PdH6mZ3WvnRhG7UPr8D1Lc3pVtq0Ji9SlX1z3JK9cvNoZKEWPxtxxp5q5q_ZwxqbnkhJDn42IfeqM8kR9SFMOb6oXdc8lm0vIb-9uvl7Q9gmxQ3:1tjCtQ:5pDS_NJULI2PPqi-7MT3lhwXxWcs1JsNR1STUCBz_LM','2025-03-01 07:47:16.049820'),('urphrqgex42t6bfncvs0n8ru054uyef2','e30:1tfGVy:Q9Hnqro9gTxah6qyDKxPcfcNSU3VqGEBIqVQdqZNTzs','2025-02-18 10:50:46.406766'),('w6ucagvaaz1xa5pz3vc0o5ftmrzpqf65','e30:1tfHEd:MADCJMZZxRAb5dir7RuGOlPQoEjLDPNyDLnp93TF5fA','2025-02-18 11:36:55.148443'),('wo1wpj052l64ksl0mzyq5rzw5k95u73x','.eJxVjMsOwiAQRf-FtSHMlPBw6d5vIAwMUjWQlHZl_Hdt0oVu7znnvkSI21rDNngJcxZnAeL0u1FMD247yPfYbl2m3tZlJrkr8qBDXnvm5-Vw_w5qHPVbowE7sSOasESF2SsqQNmRnrTzGC17jYkYjDFsUkGwTIq8Bqs0KCfeH92nN2U:1tZjiS:9PH7WhaFTmhTa3yr7vYWa3bFaYV79cqPM5l5uGHPGCY','2025-02-03 04:48:48.211367'),('x0or2rqs8so6fgfnza45546fi6f4x7uo','e30:1tfGLJ:42uJwbEOdhqVW2g6rSUntPXDYMteEJR-chHky8MwNi8','2025-02-18 10:39:45.189939'),('xfdh7071nnsvje9sn8ctrzs46pocm4a2','e30:1tfGSl:uyDCO-LDDCe6SbnRbLCrJVB4pjaqy0V4WB6xOh1qTH0','2025-02-18 10:47:27.988621'),('xyn37fjo54s0j00aeymi7jjwrbu1iur2','.eJydVV1v2jAU_StRnoESQHy9MdjUB5hYO6kPUxVd2zeJR2JntrMNVf3vcwItBPLB-gj3nHO_Tq5fXB8yE_mZRuVz5s5dz-2c_0eA7lDkAfYTRCh7VAqjOOnlkN4xqnsbyTD-dMSWBCLQkWUPxt5kiFNChoMA-gM265PAI2xKRsPRdDaACc5GA0rQG4_HOKbBwJsg6ZPZyJv0R15_akUTFBnj1PhkX0i78x8vruEmRqu_RmDagritz_4MwAmgW6A6bqZidy6yOO64OiO5TAP1gCso7l2ch_yYa-OecXPIa-cksEhTyYWxQVMtAydAq9gDplKZxnpUAWkS2SqZSg1xtUp6jFbX8nwutMGEoHIeMLRQBYZbsQ8NeSWpkaq6HlbEbFunJK1jupc65QZiZyGY8zVTmovQuZcJVqeIjnAfBPPFAe5HFt6aaMUhFFIbTp2l3Z-qScDeYT4tYHk7Nwx4C_vcFs76gKydrN3aAdla8BI0OhsQEGLJkUfRmAvs0ggKA7UsbcF-SwqmpmU4RZuLWaEBXuNFagE-ewM0DOpbhmpfNaFuwto7KbNLFfw6hhpyH-yPqnlB6oSqn4e9nkBNYaVrPSqTfGXaMfjXdBXe0NhTBEbb-1Iz3UO6pooeN49V3IuMl6zPSc1GW3hLiO0LAeruO-hd5ZFrE3jv6L-ZCq1ZHfuF7rD6vrYIfEFk-YN3K7VkobUMZXb1MabyjzWwDIKrjdtb_8aof3dYwoWzyWMfusk509miSrjW54e9ZKGc5afnoMsun1__Ae8o088:1tuVaA:WxKBPeVn-Ux1ZjWJdZNm5bUtZSLyoeoxZu1rleSbY3o','2025-04-01 11:58:06.232845');
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
  `alternate_mobile_number` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `registration_certificate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `selfie` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `submission_date_time` datetime(6) DEFAULT NULL,
  `place_of_submission` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `app_registraction_no` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
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
  `legal_claims` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `practice_duration` int DEFAULT NULL,
  `avg_patients_per_day` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `registration_certificate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `selfie` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `submission_date_time` datetime(6) DEFAULT NULL,
  `place_of_submission` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `app_registraction_no` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `STATUS` int DEFAULT '1',
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor_registration`
--

LOCK TABLES `tbl_doctor_registration` WRITE;
/*!40000 ALTER TABLE `tbl_doctor_registration` DISABLE KEYS */;
INSERT INTO `tbl_doctor_registration` VALUES (1,'Amos Nguyen','Modi sit quia sed et dicta dolor dolorem iure','Qui totam in cupidatat eveniet sint impedit ad consequatur expedita ullam sint minima ut beatae totam','Ducimus deleniti labore earum nihil provident','Magna nostrud qui fuga Porro blanditiis dolor cupidatat sit consequat Similique',59,'Sequi occaecat irure quia sed dolore fugiat magna non unde eum sequi ea id ut','Et consequatur quia est facere quo ratione suscipit','Ea reprehenderit quia sunt amet alias corporis non quis ullam ipsam','Qui placeat sit eaque commodo tempora fuga Perferendis non iste qui qui nobis',25,'627','771','budaz@mailinator.com','1982-05-15','2023-12-28','PAN','35','CHEST & TURBERCULOSIS SPECIALIST','Est non quo incididunt sed ea id tempora quos ut irure','Incidunt aliquip sed quidem cupiditate sunt tempor voluptas accusamus quod ducimus molestias nostrud inventore saepe soluta culpa qui voluptas ut','668',2012,'Est ullam in adipisci et','Yes','Desiree Irwin','Vel',28,'10','Yes',490,'Yes','40 Lakh','Velit dolores occaecat sapiente fugit dolore in cillum omnis et illum temporibus','Autem est eius laboriosam beatae officia sapiente repellendus Voluptatem explicabo Proident facilis nulla inventore ut consectetur','Yuli Yang','koboxys@mailinator.com',46,'Eu ea est asperiores maxime placeat sit eius voluptate voluptatum nihil laudantium iusto quas cillum occaecat earum asperiores','documents/popular_image56.jpg','images/popular_image11.jpg','signatures/popular_image102.jpg','2020-05-26 04:40:00.000000','Commodo vitae ut libero asperiores voluptatem rem voluptatem et est optio dolore velit voluptatem','TPD001000','2025-01-16 04:48:32.782664','2025-01-16 04:48:32.905724',1,2),(2,'SUNIL KUMAR','S/O BALIRAM SINGH GIRIJA NIWAS','99 BESIDE MISSION HOSPITAL PREM NAGAR LATMA ROAD HATIA RANCHI','RANCHI','Jharkhand',834003,'NA','NA','NA','NA',834003,'7541803300','9431166294','drsunil54848@gmail.com','1970-09-05',NULL,'Aadhar','883243176438','GENERAL SURGEON','GENERAL SURGERY','MBBS MS','4748',2015,'JMC','Yes','ALL OVER INDIA','NA',12,'200','No',0,'Yes','50 Lakh','03 YEAR','03 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',23994,'CQ NO 307608 DATE 16.01.2025 state bankof india','documents/WhatsApp_Image_2025-01-15_at_19.09.04.jpeg','','','2025-01-16 10:55:00.000000','RANCHI','TPD001001','2025-01-16 05:26:37.947133','2025-01-16 05:26:37.961787',1,2),(3,'MD ABID AKHTAR','S/O MD ALI R ALI BUILDING MAIN ROAD RANCHI','ZOHA EYE CARE R ALI BUILDING MULANA AZAD COLONY MAIN ROAD RANCHI','RANCHI','JHARKHAND',834001,'NA','NA','NA','NA',834001,'9204344787',NULL,'abidakhtar3232@yahoo.co.in','1972-07-09','0001-01-01','Aadhar','858636264979','EYE SURGEON','OPHTHALMOLOGY','MBBS MS','30761',1999,'BCMR','Yes','ALL OVER INDIA','NA',24,NULL,'No',NULL,'Yes','50 Lakh','05 YEAR','01 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',20000,'CQ ICICI BANK (000085)','documents/DR_ABID_AKHTAR.jpg','','','2025-01-17 09:05:00.000000','RANCHI','TPD001002','2025-01-17 05:22:37.036814','2025-01-17 05:22:37.051315',1,2),(4,'KUMAR ABHISHEK','121 NEW A G CLONY NEAR DAV KAPILDEV SCHOOL','DORANDA RANCHI','RANCHI','JHARKHAND',834002,'ALL OVER INDIA','NA','RANCHI','JHARKHAND',834002,'9579206584','8340504876','sbchcare@gmail.com','1988-03-14',NULL,'Aadhar','BJIPA5832N','CHILD SPECIALIST','PHYSISICIAN','MBBS DCH','6557',2019,'JMC','Yes','ALL OVER INDIA','NA',6,NULL,'No',0,'Yes','50 Lakh','03 YEAR','03 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',23000,'cash','documents/registration_certf1.pdf','','','2025-01-27 10:05:00.000000','RANCHI','TPD001003','2025-01-27 12:20:31.495641','2025-01-27 12:20:31.500945',1,2),(5,'DR KHALID AHMAD FASIHI','C/O NAQUI AHMAD ROAD NO 6 AMAN GREEN CITY','AMAN GREEN CITY PUNDAG PO- PUNDAG RANCHI','RANCHI','JHARKHAND',834004,'C/O NAQUI AHMAD ROAD NO 6 AMAN GREEN CITY','AMAN GREEN CITY PUNDAG PO- PUNDAG RANCHI','RANCHI','JHARKHAND',834004,'8804634985','8804634985','drkhalidfasihi@gmail.com','1972-09-20',NULL,'Aadhar','326918933586','CHILD SPECIALIST','CHILD SPECIALIST','MBBS DCH','2351',2009,'JMC','Yes','ALL OVER INDIA','NA',24,'MAX','No',NULL,'Yes','50 Lakh','05 YEAR','01 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',20000,'ONLINE 100412808695 PHONE PAY','','','doctor/signature/signatureNone7Y5PmwaH.png','2025-02-22 18:30:00.000000','RANCHI','TPD001004','2025-02-24 02:17:25.682532','2025-02-24 02:17:25.696562',1,2),(6,'DR PALLAVI SINGH','C/O DR L.P SINHA 314 A','PRABHA BHAWAN JORA TALAB BARIYATU RANCHI','RANCHI','JHARKHAND',834009,'C/O DR L P SINHA','H.NO 314 A PRABHA BHAWAN JORA TALAB BARIYATU RANCHI JHARKHAND','RANCHI','JHARKHAND',834009,'8863934320','8340769419','drraviranjan22@gmail.com','1983-01-01',NULL,'Aadhar','926711418448','OBSTETRICS & GYNAECOLOGIST','IVF','MBBS DGO','1603',2008,'JMC','Yes','ALL VER INDIA','NA',15,'MAX','Yes',NULL,'Yes','50 Lakh','05 YEAR','01 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',20000,'cash','','','','2025-03-01 10:10:00.000000','RANCHI','TPD001005','2025-03-03 02:13:36.606575','2025-03-03 02:13:36.607387',1,2),(7,'DR RAVI RANJAN','C/O DR L P SINHA  H.NO  314 A P PRABHA BHAWAN','JORA TALAB BARIYATU RANCHI JHARKHAND','RANCHI','JHARKHAND',834009,'RAGHUNATH BHAWAN NEAR BABA CHOWK','KESHRI NAGAR PHULWARIPATNA','PATNA','BIHAR',800024,'8340625652','8340625652','drraviranjan22@gmail.com','1981-09-02',NULL,'Aadhar','502839185065','ANAESTHETIST','critical care','MBBS MD ANAESTHESIOLOGY','1620',2008,'JCMR','Yes','ALL OVER INDIA','NA',15,'MAX','No',0,'Yes','50 Lakh','05 YEAR','01','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',20000,'CASH','','','','2025-03-03 11:30:00.000000','RANCHI','TPD001006','2025-03-05 06:01:30.517623','2025-03-05 06:01:30.518644',2,2),(9,'DR ROJI KUMARI','W/O ALOK CHANDRA PRAKASH 2049/A 9 INDRAPRASTA COLONY NEAR INDRAPRASTHA PUBLIC SCHOOL JORA TALAB BARIATU','NEAR INDRAPRASTHA SCHOOL JORA TALAB RANCHI','RANCHI','JHARKHAND',834009,'W/O ALOK CHANDRA PRAKASH 2049/A 9 INDRAPRASTA COLONY NEAR INDRAPRASTHA PUBLIC SCHOOL','NEAR INDRAPRASTHA PUBLIC SCHOOL JORA TALAB BARIATU','RANCHI','JHARKHNAD',834009,'9430717609','8986425068','acpranchi@gmail.com','1982-07-27',NULL,'Aadhar','959594797516','OBSTETRICS & GYNAECOLOGIST','YES','MBBS MS','4095',2012,'JCMR','Yes','ALL OVER INDIA','NA',12,'MAX','No',0,'Yes','50 Lakh','3 YEAR','1 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',3245,'CQ HDFC BANK','','','','2025-03-10 11:30:00.000000','RANCHI','TPD001007','2025-03-10 06:56:28.084362','2025-03-10 06:56:28.085416',1,2),(10,'ALOK CHANDRA PRAKASH','S/O RAMRUP PANDIT 2049/A9,INDRAPRASTH COLONY NEAR INDRAPRASTH PUBLIC SCHOOL','NEAR INDRAPRASTH SCHOOL JORA TALAB BARIATU RANCHI','RANCHI','JHARKHAND',834009,'S/O RAMRUP PANDIT 2049/ A9 INDRAPRASTH COLONY','NEAR INDRAPRASTH PUBLIC SCHOOL JORA TALAB BARIATU RANCHI','RANCHI','JHARKHAND',834009,'9430717609','9430717609','acpranchi@gmail.com','1979-02-15',NULL,'Aadhar','396231591517','GENERAL SURGEON','LAPAROSCOPIC SURGEON','MBBS MS','1501',2008,'JCMR','Yes','ALL OVER INDIA','NA',16,'MAX','Yes',0,'Yes','50 Lakh','5 YEAR','1 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',12000,'CQ HDFC BANK','','','','2025-03-10 11:30:00.000000','RANCHI','TPD001008','2025-03-10 07:09:26.218645','2025-03-10 07:09:26.219431',1,2),(11,'BEAUTY BANERJEE','W/O JAYANT KUMAR CHAKRABORTY 6 D SHREE BIMLANAND TOWER','NEAR ST.  XAVIER COLLEGE PURULIYA ROAD RANCHI','RANCHI','JHARKHAND',834001,'W/O JAYANT KUMAR CHAKRABORTY 6 D SHREE BIMLANAND TOWER','NEAR ST.  XAVIER COLLEGE PURULIYA ROAD RANCHI','RANCHI','JHARKHAND',834001,'9431382368','7979748248','drbeautybanerjee1964@gmail.com','1964-01-01',NULL,'Aadhar','935291382917','OBSTETRICS & GYNAECOLOGIST','GENERAL SURGERY','MBBS MS','7370',2021,'JCMR','Yes','ALL OVER INDIA','NA',23,'MAX','Yes',0,'Yes','30 Lakh','05 YEAR','01 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',16255,'CQ NO 080040 PNB RANCHI','','','','2025-03-11 18:30:00.000000','RANCHI','TPD001009','2025-03-11 15:52:41.122372','2025-03-11 15:52:41.122914',2,2),(12,'AMARDEEP KUMAR','S/O SITARAM SINGH','389 HESAG DONBOSCO SCHOOL ROAD OPPOSITE SHIV MANDIR HATIYA RANCHI','RANCHI','JHARKHAND',834003,'389 HESAG DON BOSCO SCHOOL ROAD','OPPOSITE SHIV MANDIR HATIYA RANCHI','RANCHI','JHARKHAND',834003,'9304764180','9304764180','amardeep.doc@gmail.com','1975-12-26',NULL,'Aadhar','845242933055','PAEDIATRICIAN','CHILD SPECIALIST','MBBS MD','1850',2009,'JCMR','Yes','ALL OVER INDIA','YES',22,'MAX','Yes',0,'Yes','50 Lakh','05 YEAR','01 YEAR','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',15500,'CQ NO 300372 SBI','doctor/registration_certificate/registration_certificateNone2uGuMkCh.jpg','','','2025-03-29 08:48:00.000000','RANCHI','TPD001010','2025-03-29 03:18:36.944932','2025-03-29 03:18:36.960612',2,2);
/*!40000 ALTER TABLE `tbl_doctor_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hospital_registration`
--

DROP TABLE IF EXISTS `tbl_hospital_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hospital_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `alternate_mobile_number` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
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
  `registration_certificate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `selfie` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `submission_date_time` datetime DEFAULT NULL,
  `place_of_submission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_registraction_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` int NOT NULL,
  `tenure_of_membership` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tenure_of_indemnity` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hospital_registration`
--

LOCK TABLES `tbl_hospital_registration` WRITE;
/*!40000 ALTER TABLE `tbl_hospital_registration` DISABLE KEYS */;
INSERT INTO `tbl_hospital_registration` VALUES (1,'Vincent Macias','Damon Whitehead','656565634','RYE43','Ranchi','Jharkhand',534543,'TEST HOSPITAL','758483','YTR543','67383','RANCHI',764384,'5444444444','4555555555','admin@example.com','2025-01-11','2025-01-11','PAN','FDFD5433F','640',2024,5,5,4,'TESTING, SERVING',43,'No','','5443','45','54','34','34','32','Kylynn Rich','tyrupy@mailinator.com',5433,'43456FG','registration_certificates/popular_image35.jpg','selfies/popular_image25.jpg','signatures/populkar_image73.jpg','2025-01-11 00:00:00','Ranchi','TPH001000','2025-01-11 10:07:04.009370','2025-01-11 10:07:04.158447',1,NULL,NULL,2),(2,'JANTA HOSPITAL','SHASHI BHUSHAN SINGH','Ram Dular Singh , Near Durga Mandir Ukrid Ramgarh','Ramgarh , Jharkhand ,','RAMGARH','JHARKHAND',825101,'Collage Road Opp Panchwati Apartment , Near Ramgarh college','Near Ramgarh college Ramgarh , Jharkhand , 829122','RAMGARH','RAMGARH','JHARKHAND',829122,'8409092636','8409092636','Bhushansingh9835@gmail.Com','1989-01-01',NULL,'Aadhar','946507146150','2036100521',2024,20,500,200,'ALL FACILITIES',35,'Yes','1.5 Crore','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',35000,'CQ BANK OF INDIA','','','','2025-01-20 00:00:00','RANCHI','TPH001001','2025-01-11 15:42:37.589335','2025-01-11 15:42:37.589978',1,NULL,NULL,2),(3,'SHRI BALRAM CHILDREN HOSPITAL','KUMAR ABHISHEK','121 NEW A G CLONY','NEAR DAV KAPILDEV SCHOOL DORANDA RANCHI','RANCHI','JHARKHAND',834002,'PLOT NO 1123/12 CHAUHAN BHAWAN','KATHAL MORE ARGORA ROAD RANCHI','KATHAL MORE ARGORA ROAD','RANCHI','JHARKHAND',835303,'9579206584','8340504876','sbchcare@gmail.com','1988-03-14',NULL,'PAN','BJIPA5832N','2036403879',2024,25,1000,500,'ALL FACILITIES',25,'Yes','50 Lakh','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',30000,'CASH','','','','2025-01-27 10:30:00','RANCHI','TPH001002','2025-01-27 12:03:09.998714','2025-01-27 12:03:09.999721',1,'03 YEAR','03 YEAR',2),(4,'SHRI GANESH EYE HOSPITAL','AMIT KUMAR JAYSWAL','C/O BIHARI BHAGAT NEW COLONY H B ROAD THARPAKNA LALPUR','THARPAKNA , LALPUR , RANCHI G.P.O RANCHI','RANCHI','JHARKHAND',834001,'Shri Ramji Arcade, Near Jayswal Petrol Pump,','Above IDBI Bank, Ratu Road,','Jayswal Petrol Pump,','RANCHI','Jharkhand',831001,'7024134776','7024134776','dr_jayswal@yahoo.co.in','1983-03-15',NULL,'Aadhar','952353388345','2036403067',2024,20,500,200,'EYE HOSPITAL ALL FACILITIES AVAILABLE',30,'Yes','50 Lakh','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',20000,'CQ AXIS BANK 049636','','','','2025-02-07 18:30:00','RANCHI','TPH001003','2025-02-07 13:42:37.945419','2025-02-07 13:47:29.017269',1,'03 YEAR','ONE YEAR (01 YEAR)',2),(5,'DR N . K MEHTA MEMORIAL HOSPITAL','AJAY KUMAR RAJ','ST J . G PUBLIC SCHOOL PO PS PISKA NAHRI','ST J. G PUBLIC SCHOOL','RANCHI','JHARKHAND',835303,'Kurla Toli Piska, Nagri, Ranchi - 835222','(Near Nagri Block,Opposite Jalchhajan Kendra, Nagri)','Kurla Toli Piska, Nagri, Ranchi - 835222','RANCHI','Jharkhand',835222,'9113403953','9113403953','drajaykr29raj@gmail.com','1987-12-29',NULL,'Aadhar','490261277257','2036403323',2024,30,1000,500,'ALL FACILITIES',30,'Yes','50 Lakh','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',25000,'CQ - 137237 (State Bank of India Ranchi Gumla Road)','','','','2025-02-17 09:05:00','RANCHI','TPH001004','2025-02-17 03:36:34.369362','2025-02-17 03:36:34.370135',1,'03 YEAR','01 YEAR',2),(6,'AMRIT HOSPITAL AND RESEARCH CENTRE','DR AVINASH DR PRADEEP DR AMIT','TILTA CHOWK RANCHI','NEAR RING ROAD TILTA CHOWK KAMRE RANCHI','RANCHI','JHARKHAND',835222,'NEAR RING ROAD','TILTA CHOWK KAMRE RANCHI','TILTA CHOWK','RANCHI','JHARKHAND',835222,'6201192421','6290463093','ahrctiltaranchi@gmail.com','1999-09-24',NULL,'Aadhar','722413640563','2036403962',2024,25,1000,500,'ALL FACILITIES',35,'Yes','50 Lakh','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',25000,'CQ YES BANK RANCHI 540788','','','','2025-02-28 10:30:00','RANCHI','TPH001005','2025-02-28 06:09:09.951190','2025-02-28 06:09:09.951809',1,'03 YEAR','01 YEAR',2),(7,'SINGHPUR NURSING HOME','DR RAMNESH PRASAD','S/O RAJESH PRASAD','SINGHPUR NURSING HOME , SINGHPUR , MURI RANCHI','RANCHI','JHARKHAND',835101,'SINGHPUR , MURI RANCHI','SINGHPUR , MURI RANCHI','SINGHPUR RANCHI','RANCHI','JHARKHAND',835101,'9431277155','9835173678','drramnesh.muri@gmail.com','1976-08-15',NULL,'Aadhar','537868910737','2036404103',2024,100,1000,500,'ALL FACILITIES',100,'Yes','30 Lakh','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',25229,'CQ NO 194991 STATE BANK OF INDIA DATE 27/03/2025','','','','2025-03-01 10:30:00','RANCHI','TPH001006','2025-03-03 01:35:37.847777','2025-03-03 01:35:37.848558',1,'03 YEAR','01 YEAR',2),(8,'SWARNREKHA HOSPITAL','DR ROJI KUMARI','W/O DR ALOK CHANDRA PRAKASH 2049/A9 INDRAPRASTHA COLONY','NEAR INDRAPRASTHA PUBLIC SCHOOL JORA TALAB BARIATU RANCHI','RANCHI','JHARKHAND',834009,'OPP SHIV SHAKTI PETROL PUMP','opp. Petrol Pump, near Cambridge School, Tatisilwai, Jharkhand','opp. Petrol Pump, near Cambridge School, Tatisilwai, Jharkhand','RANCHI','JHARKHAND',835103,'9430717609','8986425068','acpranchi@gmail.com','1982-07-27',NULL,'Aadhar','959594797516','2036404014',2024,50,1000,500,'ALL FACCILITIES',50,'Yes','50 Lakh','','','','','','','ASHOK MISHRA','ashokmishra@truepathlegalconsultant.com',20000,'CQ HDFC BANK','','','','2025-03-10 11:30:00','RANCHI','TPH001007','2025-03-10 07:32:56.015932','2025-03-10 07:32:56.016665',1,'3 YEAR','1 YEAR',2);
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
-- Table structure for table `tbl_menu_item`
--

DROP TABLE IF EXISTS `tbl_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_menu_item` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int DEFAULT '0',
  `STATUS` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu_item`
--

LOCK TABLES `tbl_menu_item` WRITE;
/*!40000 ALTER TABLE `tbl_menu_item` DISABLE KEYS */;
INSERT INTO `tbl_menu_item` VALUES (1,'Leads','fa fa-user',NULL,NULL,1,1),(2,'Leads',NULL,'/leads_list',1,1,1),(3,'Appointment',NULL,'/appointment_list',1,2,1),(4,'Reports',NULL,'/leads_report',1,3,1),(5,'Proposal',NULL,'/proposal_list',1,4,1),(6,'Member Registration','fa fa-user',NULL,NULL,2,1),(7,'Doctor',NULL,'/doctor_registration_list',6,1,1),(8,'Hospital And Nursing Home',NULL,'/hospital_and_nursing_home_list',6,2,1),(9,'Diagnostic Centre',NULL,'/diagnostic_centre_reg_list',6,3,1),(10,'Payment List','fa fa-user','/payment_list',NULL,3,1),(11,'Case Management','fa fa-line-chart',NULL,NULL,4,1),(12,'Advocate',NULL,'/advocate',11,1,1),(13,'Case Detail',NULL,'/case_detail',11,2,1),(14,'Query','fa fa-user-md',NULL,NULL,5,1),(15,'Query',NULL,'/query',14,1,1),(16,'Register','fa fa-user','/register',NULL,6,1),(17,'Contact Center','fa fa-comments text-red',NULL,NULL,7,1),(18,'Whatsapp',NULL,'/contact',17,1,1),(19,'SMS',NULL,'',17,2,1),(20,'Email',NULL,'',17,3,1),(21,'Calendar/Tasks',NULL,'',17,4,1),(22,'Contact',NULL,'',17,5,1),(23,'Create tickets',NULL,'',17,6,1),(24,'Feedback',NULL,'',17,7,1),(25,'Logout','fa fa-power-off text-red','/logout',NULL,8,1),(26,'Admin Menu','fa fa-user',NULL,NULL,9,1),(27,'Menu Permission',NULL,'/menu_permission',26,1,1);
/*!40000 ALTER TABLE `tbl_menu_item` ENABLE KEYS */;
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
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT '1',
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_form_details`
--

LOCK TABLES `tbl_payment_form_details` WRITE;
/*!40000 ALTER TABLE `tbl_payment_form_details` DISABLE KEYS */;
INSERT INTO `tbl_payment_form_details` VALUES (1,'100000','TPD001001','Doctor','sunil kumar',NULL,'General & Laparoscopic Surgeon','S/O BALIRAM SINGH GIRIJA NIWAS','99 BESIDE MISSION HOSPITAL PREM NAGAR LATMA ROAD HATIA RANCHI','JHARKHAND','RANCHI','834003','9234610994','9431166294','drsunil54848@gmail.com','3 year','50','03 year','Membership + Indemnity Insurance',23994.00,'Aadhar','883243176438','Single','','','','THREE YEAR LEGAL SERVICES WITH 50 LAH INSURANCE COVER','RANCHI','2025-01-16','2025-01-29 16:18:45','2025-01-29 16:20:13',1,2),(2,'100001','TPD001001','Doctor','MD ABID AKHTAR','','Eye Surgeon','ZOHA EYE CARE MAHATMA GANDH MAIN ROAD','BEHIND R ALI BUILDING MULANA AZAD COLONY HINDPIRI RANCHI','JHARKHAND','RANCHI','834001','9204344787',NULL,'abidakhtar3232@yahoo.co.in','05  year','3245','01 year','Membership + Indemnity Insurance',20000.00,'Aadhar','858636264979','Single','','','','legal services 05 year \r\ninsurance 50 lakh for one year','RANCHI','2025-01-17','2025-01-29 16:18:45','2025-01-29 16:20:13',1,2),(3,'100002','TPD001002','Doctor','MD ABID AKHTAR','','Eye Surgeon','S/O MD ALI R ALI BUILDING MAIN ROAD RANCHI','ZOHA EYE CARE R ALI BUILDING MULANA AZAD COLONY MAIN ROAD RANCHI','JHARKHAND','RANCHI','834001','9204344787',NULL,'abidakhtar3232@yahoo.co.in','5 year','3245','1 year','Membership + Indemnity Insurance',20000.00,'Aadhar','858636264979','Single','','','','05 year legal service with \r\ninsurance cover 50 lakh for one year','Ranchi','2025-01-18','2025-01-29 16:18:45','2025-01-29 16:20:13',1,2),(4,'100003','TPD001003','Doctor','KUMAR ABHISHEK','','Child Specialist','121 NREW AG CLONY NEAR KAPILDEV SCHOOL','DORANDA RANCHI','JHARKHAND','RANCHI','834002','9579206584','8340504876','sbchcare@gmail.com','3 year','4950','03 year','Membership + Indemnity Insurance',23000.00,'PAN','BJIPA5832N','Single','','','','ALL CASES COVER','RANCHI','2025-01-27','2025-01-29 16:18:45','2025-01-29 16:20:13',1,2),(5,'100004','TPH001002','Hospital','SHRI BALRAM CHILDREN HOSPITAL','KUMAR ABHISHEK','Child Specialist','121 NEW A G CLONY','NEAR DAV KAPILDEV SCHOOL DORANDA RANCHI','Jharkhand','RANCHI','834002','9579206584','8340504876','sbchcare@gmail.com','3 year','4631','03 year','Membership + Indemnity Insurance',30000.00,'PAN','BJIPA5832N','Single','','','','ALL TYPE OF CASE COVER','RANCHI','2025-01-27','2025-01-29 16:18:45','2025-01-29 16:20:13',1,2),(6,'100005','TPH001003','Hospital','SHRI GANESH EYE HOSPITAL','AMIT KUMAR JAYSWAL','Eye Surgeon','C/O BIHARI BHAGAT NEW COLONY H B ROAD THARPAKNA LALPUR','LALPUR , RANCHI G.P.O RANCHI RANCHI JHARKHAND','Jharkhand','RANCHI','834001','7024134776','7024134776','dr_jayswal@yahoo.co.in','03 year','4159','01 year','Membership + Indemnity Insurance',20000.00,'Aadhar','952353388345','Single','','','','ALL CASES ARE COVER','RANCHI','2025-02-07','2025-02-07 13:59:07','2025-02-07 13:59:07',1,2),(7,'100006','TPH001004','Hospital','DR. N . K. MEHTA MEMORIAL HOSPITAL','AJAY KUMAR RAJ','Paediatrician','ST J . G PUBLIC SCHOOL PO PS PISKA NAHRI','ST J. G PUBLIC SCHOOL','JHARKHAND','RANCHI','835303','9113403953',NULL,'drajaykr29raj@gmail.com','3 year','4159','01 YEAR','Membership + Indemnity Insurance',25000.00,'Aadhar','490261277257','Single','','','','ALL CASES ARE COVER MEDICO AND NON MEDICO ALSO','RANCHI','2025-02-17','2025-02-17 03:54:42','2025-02-17 03:54:42',1,2),(8,'100007','TPD001004','Doctor','DR KHALID AHMAD FASIHI','','Child Specialist','C/O NAQUI AHMAD ROAD NO 6 AMAN GREEN CITY','AMAN GREEN CITY PUNDAG PO- PUNDAG RANCHI','JHARKHAND','RANCHI','834004','8804634985','8804634985','drkhalidfasihi@gmail.com','05 YEAR','18350','01 YEAR','Membership + Indemnity Insurance',20000.00,'Aadhar','326918933586','Single','','','','ALL CASES COVER MEDICO AND NON MEDICO OLD AND NEW','RANCHI','2025-02-24','2025-02-24 02:27:46','2025-02-24 02:27:46',1,2),(9,'100008','TPH001005','Hospital','AMRIT HOSPITAL AND RESEARCH CENTRE','DR PRADEEP DR AVINASH DR AMIT','Consultant Physician','TILTA CHOWK RANCHI','NEAR RING ROAD TILTA CHOWK KAMRE RANCHI','JHARKHAND','RANCHI','835222','6201192421','6290463093','ahrctiltaranchi@gmail.com','03 YEAR','5232','01 YEAR','Membership + Indemnity Insurance',25000.00,'Aadhar','722413640563','Single','','','','ALL CASES ARE COVER MEDICO AND NON MEDICO','RANCHI','2025-02-28','2025-02-28 06:22:34','2025-02-28 06:22:34',1,2),(10,'100009','TPH001006','Hospital','SINGHPUR NURSING HOME','DR RAMNESH PRASAD','General Physician','S/O RAJESH PRASAD','SINGHPUR NURSING HOME , SINGHPUR , MURI RANCHI','JHARKHAND','RANCHI','835101','9431277155','9431277155','drramnesh.muri@gmail.com','3 year','2710','01 YEAR','Membership + Indemnity Insurance',22519.00,'Aadhar','537868910737','Single','','','','ALL CASES ARE COVER MEDICO AND NON MEDICO','RANCHI','2025-03-03','2025-03-03 01:52:12','2025-03-03 01:52:12',1,2),(11,'100010','TPD001005','Doctor','DR PALLAVI SINGH','','Obstetrics & Gynaecologist','C/O DR L.P SINHA 314 A','PRABHA BHAWAN JORA TALAB BARIYATU RANCHI','JHARKHAND','RANCHI','834009','8863934320','8863934320','drraviranjan22@gmail.com','05 YEAR','3245','01 year','Membership + Indemnity Insurance',20000.00,'Aadhar','926711418448','Single','','','','ALL CASES ARE COVER OLD AND NEW MEDICO AND NON MEDICO ALSO','RANCHI','2025-03-03','2025-03-03 02:23:34','2025-03-03 02:23:34',1,2),(12,'100011','TPD001006','Doctor','DR RAVI RANJAN','','Anaesthetist','C/O DR L P SINHA  H.NO  314 A P PRABHA BHAWAN','JORA TALAB BARIYATU RANCHI JHARKHAND','JHARKHAND','RANCHI','834009','8340625652','8340625652','drraviranjan22@gmail.com','05 YEAR','5015','01 YEAR','Membership + Indemnity Insurance',20000.00,'Aadhar','502839185065','Single','','','','all cases cover new and old also \r\nmedico and non medico','RANCHI','2025-03-05','2025-03-05 06:14:22','2025-03-05 06:14:22',1,2),(13,'100012','TPD001009','Doctor','BEAUTY BANERJEE','','General Surgeon','W/O JAYANT KUMAR CHAKRABORTY 6 D SHREE BIMLANAND TOWER','NEAR ST. XAVIER COLLAGE PURULLYA ROAD RANCHI','JHARKHAND','RANCHI','834001','9431382368','7979748248','drbeautybanerjee1964@gmail.com','05 YEAR','1947','01 YEAR','Membership + Indemnity Insurance',16255.00,'Aadhar','935291382917','Single','','','','ALL CASE ARE COVER MEDICO AND NON MEDICO ALSO','RANCHI','2025-03-11','2025-03-11 16:02:24','2025-03-11 16:02:24',1,2),(14,'100013','TPD001010','Doctor','AMARDEEP KUAMR','','Paediatrician','S/O SITARAM SINGH 389 HESAG DON BOSCO SCHOOL  ROAD','OPPOSITESHIV MANDIR HATIYA RANCHI','JHARKHAND','RANCHI','834003','9304764180','9304764180','amardeep.doc@gmail.com','05 YEAR','1650','01 year','Membership + Indemnity Insurance',15500.00,'Aadhar','845242933055','Single','','','','ALL CASES ARE COVER MEDICO AND NON MEDICO \r\n50 LAKH INDEMNITY INSURANCE ONE YEAR  AND 5 YEAR LEGAL SERVICES','RANCHI','2025-03-29','2025-03-29 03:28:31','2025-03-29 03:28:31',1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_multi_row_details`
--

LOCK TABLES `tbl_payment_multi_row_details` WRITE;
/*!40000 ALTER TABLE `tbl_payment_multi_row_details` DISABLE KEYS */;
INSERT INTO `tbl_payment_multi_row_details` VALUES (1,'Cheque','','2025-01-16','307608',23994.00,'sbi','Full','2025-01-16 04:33:30.244614','2025-01-16 04:33:30.246604',1,1),(2,'Cheque','','2025-01-16','000085',20000.00,'icici bank','Full','2025-01-17 12:46:18.210886','2025-01-17 12:46:18.212842',1,2),(3,'Cheque','','2025-01-16','000085',20000.00,'ICICI BANK','Full','2025-01-18 07:16:01.291797','2025-01-18 07:16:01.293562',1,3),(4,'Cash','','2025-01-25','307609',23000.00,'IDFC','Full','2025-01-27 12:30:05.588531','2025-01-27 12:30:05.589915',1,4),(5,'Cash','','2025-01-25','307609',30000.00,'IDFC','Full','2025-01-27 12:36:49.764412','2025-01-27 12:36:49.764670',1,5),(6,'Cheque','','2025-02-07','049636',20000.00,'AXIS BANK ','Full','2025-02-07 13:59:06.979090','2025-02-07 13:59:06.979496',1,6),(7,'Cheque','','2025-02-15','137237',15000.00,'SBI','Partial','2025-02-17 03:54:41.902634','2025-02-17 03:54:41.903470',1,7),(8,'Phonepe','','2025-02-22','100412808695',20000.00,'phone pay ','Full','2025-02-24 02:27:46.127104','2025-02-24 02:27:46.128247',1,8),(9,'Cheque','','2025-02-26','540788',25000.00,'YES BANK ','Full','2025-02-28 06:22:33.817358','2025-02-28 06:22:33.818713',1,9),(10,'Cheque','','2025-01-27','194991',25229.00,'SBI','Full','2025-03-03 01:52:12.460345','2025-03-03 01:52:12.461335',1,10),(11,'IMPS','','2025-03-03','100412808695',20000.00,'phone pay ','Full','2025-03-03 02:23:34.204926','2025-03-03 02:23:34.206173',1,11),(12,'Google Pay','','2025-03-03','102025344784',20000.00,'online','Full','2025-03-05 06:14:21.858161','2025-03-05 06:14:21.858493',1,12),(13,'Cheque','','2025-03-11','080040',16255.00,'PNB','Full','2025-03-11 16:02:24.252671','2025-03-11 16:02:24.253662',1,13),(14,'Cheque','','2025-03-19','300372',15500.00,'sbi','Full','2025-03-29 03:28:30.891171','2025-03-29 03:28:30.892138',1,14);
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
-- Table structure for table `tbl_proposal_extra_details`
--

DROP TABLE IF EXISTS `tbl_proposal_extra_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proposal_extra_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospital_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_mentions` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT '1',
  `proposal_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposal_extra_details`
--

LOCK TABLES `tbl_proposal_extra_details` WRITE;
/*!40000 ALTER TABLE `tbl_proposal_extra_details` DISABLE KEYS */;
INSERT INTO `tbl_proposal_extra_details` VALUES (1,'Hospital','Chancellor Grant','Eleanor Wells','Radiologist','70','Pithampur','Qui modi quisquam am','2025-01-20 08:04:21','2025-01-21 17:29:41',1,'PROP001000'),(2,'Doctor','Jharkhand Urology Society','JHARKHAND CHAPTER','Urologist','7631021656','Ranchi','We are Glad to present this Proposal to Jharkhand urology society .\r\nDear sir we are provide all type of medico and non medico legal services in all over India for health care provider .\r\nif Jharkhand Urology Society attach with our company than we are add  two type of services for better connectivity\r\n1. one special no only for Jharkhand Urology Society for all query .\r\n2. if society provide a place we are give a lawyer for two hr. Monday to Friday every week you and your family and other discuss legal issue     \r\n3. special price for you \r\nMembership for 3 year 17500/- cover all type of legal services and first year 50 lakh cover free \r\nnext year premium only 3245/-','2025-02-15 04:01:54','2025-02-15 04:01:54',1,'PROP001001'),(3,'Society/Association','Jharkhand Urology Society','JHARKHAND CHAPTER','Urologist','7631021656','Ranchi','we are glade to present this proposal to Jharkhand urology society .\r\nDear sir  we are providing all type of medico and non medico legal services in all over India for health care provider .\r\nDear sir if Jharkhand urology  society attach with our company than we will add two type of services for better connectivity  .\r\n1. one special calling mobile number for any query will  be given  to Jharkhand urology society .\r\n2. if society provide a space we will give a lawyer for two hr. , Monday to Friday every week for any matter concerning to you , your family and friends. \r\n\r\nspecial discounted membership charges for  society membership .\r\nMembership for 3 year 21500/- with 50 lakh insurance cover .','2025-02-17 05:02:33','2025-03-17 14:19:44',1,'PROP001002'),(4,'Doctor','DR VIKRANT AND DR ANVI','ALL OVER INDIA','Plastic and Cosmetic Surgeon','816057652632','Ranchi','ALL CASES ARE COVER MEDICO AND NON MEDICO ALSO \r\nDR VIKRANT RANJAN 31500 For 5 year legal services with 50 lakh indemnity insurance \r\nDR TULIKA JOSHI 24500 For 5 year legal services with 50 lakh indemnity insurance\r\n\r\nA/C NO 89102053525\r\nAC/ NAME TRUE PATH LEGAL CONSULTANT LLP\r\nBANK IDFC BANK \r\nIFSC CODE IDFB0060344','2025-03-17 09:07:42','2025-03-17 14:43:47',1,'PROP001003');
/*!40000 ALTER TABLE `tbl_proposal_extra_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proposal_multi_record`
--

DROP TABLE IF EXISTS `tbl_proposal_multi_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proposal_multi_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_details_id` int NOT NULL,
  `services_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `premium_amount` decimal(10,2) NOT NULL,
  `membership_amount` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `membership_tenure` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `policy_tenure` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `proposal_details_id` (`proposal_details_id`),
  CONSTRAINT `tbl_proposal_multi_record_ibfk_1` FOREIGN KEY (`proposal_details_id`) REFERENCES `tbl_proposal_extra_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposal_multi_record`
--

LOCK TABLES `tbl_proposal_multi_record` WRITE;
/*!40000 ALTER TABLE `tbl_proposal_multi_record` DISABLE KEYS */;
INSERT INTO `tbl_proposal_multi_record` VALUES (1,1,'Only Indmenity insurance','1',87.00,71.00,6.00,'1','2','2025-01-20 08:04:21','2025-01-20 08:04:21',1),(2,1,'Pre - Membership Fee / Other Charges','2',3.00,25.00,7.00,'1','7','2025-01-20 08:04:21','2025-01-20 08:04:21',1),(3,1,'Pre - Membership Fee / Other Charges','2',75.00,89.00,57.00,'8','3','2025-01-20 08:04:21','2025-01-20 08:04:21',1),(4,2,'Membership + Indemnity Insurance','5 Lakh Yearly',3245.00,14255.00,17500.00,'3','1','2025-02-15 04:01:54','2025-02-15 14:41:23',1),(6,3,'Membership + Indemnity Insurance','50 Lakh Yearly',9735.00,11765.00,21500.00,'3','3','2025-02-26 12:02:03','2025-02-26 12:02:03',1),(8,4,'Membership + Indemnity Insurance','50 Lakh Yearly',33040.00,22960.00,56000.00,'5','5','2025-03-17 09:11:22','2025-03-17 09:11:22',1);
/*!40000 ALTER TABLE `tbl_proposal_multi_record` ENABLE KEYS */;
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
INSERT INTO `tbl_user` VALUES (1,'pbkdf2_sha256$720000$anHqsvkHCdJiIuUnDyNvKy$Iv0OZrvszTpxN6TZSrL/40e32DU5vO61Ek/yrMcMb1M=',1,'admin@example.com','Admin',1,'2025-03-31 07:01:54.671339','Ranchi','2025-01-15 10:28:59.000000','Ranchi'),(2,'pbkdf2_sha256$720000$5InBsubXe0N6M8Xpek4IcT$jTVSFO6OKIp6Yd5+sxyNrn18nPRHddznSUoTth01CDo=',1,'ashokmishra@truepathlegalconsultant.com','Ashok Kumar Mishra',1,'2025-03-31 06:49:32.483427','Ranchi','2025-01-15 05:07:48.654445','Ranchi');
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
-- Table structure for table `tbl_user_menu_mapping`
--

DROP TABLE IF EXISTS `tbl_user_menu_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_menu_mapping` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `status` smallint DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_menu_mapping`
--

LOCK TABLES `tbl_user_menu_mapping` WRITE;
/*!40000 ALTER TABLE `tbl_user_menu_mapping` DISABLE KEYS */;
INSERT INTO `tbl_user_menu_mapping` VALUES (0,1,2,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,27,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,18,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,15,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,12,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,7,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,1,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,8,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,19,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,3,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,13,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,6,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,4,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,10,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,9,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,20,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,5,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,11,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,21,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,14,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,22,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,16,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,23,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,17,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,24,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,25,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,1,26,1,'2025-02-21 07:50:55','2025-02-21 07:50:55'),(0,2,2,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,27,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,18,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,15,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,12,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,7,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,1,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,8,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,19,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,3,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,13,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,6,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,4,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,10,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,9,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,20,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,5,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,11,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,21,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,14,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,22,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,16,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,23,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,17,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,24,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,25,1,'2025-03-31 06:48:48','2025-03-31 06:48:48'),(0,2,26,1,'2025-03-31 06:48:48','2025-03-31 06:48:48');
/*!40000 ALTER TABLE `tbl_user_menu_mapping` ENABLE KEYS */;
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

-- Dump completed on 2025-03-31  7:09:39

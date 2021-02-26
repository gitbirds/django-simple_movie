-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.20

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 电影',7,'add_movie'),(26,'Can change 电影',7,'change_movie'),(27,'Can delete 电影',7,'delete_movie'),(28,'Can view 电影',7,'view_movie'),(29,'Can add comments',8,'add_comments'),(30,'Can change comments',8,'change_comments'),(31,'Can delete comments',8,'delete_comments'),(32,'Can view comments',8,'view_comments'),(33,'Can add user_link',9,'add_user_link'),(34,'Can change user_link',9,'change_user_link'),(35,'Can delete user_link',9,'delete_user_link'),(36,'Can view user_link',9,'view_user_link');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$jqpjyS3fvhMO$kU/qzT1KT+oNLhcdO8iohmq1A3Ugg0LugGMOIpe4vNk=','2021-02-24 02:58:14.741013',1,'admin','','','1946528578@qq.com',1,1,'2021-02-11 07:44:49.000000'),(14,'pbkdf2_sha256$216000$lEOoOoRMQK7w$j0g9psUX7JXFIE1xH9pDBaHX6RKoXtvhCzGQHpxaHrY=','2021-02-20 08:42:08.664717',0,'joker','','','',0,1,'2021-02-20 08:41:58.156244'),(15,'pbkdf2_sha256$216000$NaL5lkyZwlp0$pC2hg+PDQJghJPpaWe3+rVEymHCdqmTr1mzTXTP1ErQ=',NULL,0,'jack','','','',0,1,'2021-02-20 08:52:32.722110'),(16,'pbkdf2_sha256$216000$x1SlVEErI0rb$//nvbxgYvceFaQ6xkRAhseZkeKi0EnOFurKqvoUk5Ms=',NULL,0,'admins','','','',0,1,'2021-02-22 08:39:13.642474');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-11 08:14:17.760502','1','复仇者联盟',1,'[{\"added\": {}}]',7,1),(2,'2021-02-11 08:19:19.807777','2','唐人街探案',1,'[{\"added\": {}}]',7,1),(3,'2021-02-11 08:22:31.773645','3','海贼王剧场版Z',1,'[{\"added\": {}}]',7,1),(4,'2021-02-11 08:23:09.581142','3','海贼王剧场版Z',2,'[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\"]}}]',7,1),(5,'2021-02-11 08:25:19.039754','4','战狼',1,'[{\"added\": {}}]',7,1),(6,'2021-02-11 08:27:44.724885','5','心花路放',1,'[{\"added\": {}}]',7,1),(7,'2021-02-11 11:17:18.253566','2','唐人街探案',2,'[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\"]}}]',7,1),(8,'2021-02-12 03:45:17.130600','6','摩天营救',1,'[{\"added\": {}}]',7,1),(9,'2021-02-12 03:46:35.294153','7','奇门遁甲',1,'[{\"added\": {}}]',7,1),(10,'2021-02-12 03:49:19.463803','8','罗小黑战记',1,'[{\"added\": {}}]',7,1),(11,'2021-02-12 03:51:15.622153','9','西游记之大圣归来',1,'[{\"added\": {}}]',7,1),(12,'2021-02-12 03:53:22.802778','10','大鱼海棠',1,'[{\"added\": {}}]',7,1),(13,'2021-02-12 03:54:55.507975','11','寻梦环游记',1,'[{\"added\": {}}]',7,1),(14,'2021-02-12 03:59:30.081822','9','大圣归来',2,'[{\"changed\": {\"fields\": [\"\\u7535\\u5f71\\u540d\\u5b57\"]}}]',7,1),(15,'2021-02-12 04:00:19.614214','3','海贼王剧场版Z',2,'[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\"]}}]',7,1),(16,'2021-02-12 04:01:10.529655','1','复仇者联盟',2,'[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\"]}}]',7,1),(17,'2021-02-12 04:02:11.734789','2','唐人街探案',2,'[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\"]}}]',7,1),(18,'2021-02-12 04:03:55.099765','4','战狼',2,'[{\"changed\": {\"fields\": [\"\\u5c01\\u9762\"]}}]',7,1),(19,'2021-02-12 04:09:14.803792','12','疯狂原始人2',1,'[{\"added\": {}}]',7,1),(20,'2021-02-12 04:11:06.194990','13','城市猎人剧场版',1,'[{\"added\": {}}]',7,1),(21,'2021-02-12 04:12:49.894103','14','龙珠超：布罗利',1,'[{\"added\": {}}]',7,1),(22,'2021-02-12 04:14:35.510032','15','哪吒之魔童降世',1,'[{\"added\": {}}]',7,1),(23,'2021-02-12 04:16:10.803957','16','史酷比狗',1,'[{\"added\": {}}]',7,1),(24,'2021-02-12 04:19:33.233525','17','绝密档案',1,'[{\"added\": {}}]',7,1),(25,'2021-02-12 04:21:27.323196','18','龙之心',1,'[{\"added\": {}}]',7,1),(26,'2021-02-13 06:40:53.272832','1','admin',2,'[{\"added\": {\"name\": \"user_link\", \"object\": \"user_link object (1)\"}}]',4,1),(27,'2021-02-13 09:00:40.864771','19','西虹市首富',1,'[{\"added\": {}}]',7,1),(28,'2021-02-13 09:03:53.800650','20','疯狂的外星人',1,'[{\"added\": {}}]',7,1),(29,'2021-02-20 08:09:31.813374','5','艾斯',1,'[{\"added\": {}}]',4,1),(30,'2021-02-20 08:15:19.748774','4','admins',3,'',4,1),(31,'2021-02-20 08:15:19.820826','2','jack',3,'',4,1),(32,'2021-02-20 08:15:19.897771','3','joker',3,'',4,1),(33,'2021-02-20 08:15:19.987779','5','艾斯',3,'',4,1),(34,'2021-02-21 06:36:30.471709','21','我和我的家乡',1,'[{\"added\": {}}]',7,1),(35,'2021-02-21 06:38:21.348924','22','我不是药神',1,'[{\"added\": {}}]',7,1),(36,'2021-02-21 06:40:57.839460','23','楚门的世界',1,'[{\"added\": {}}]',7,1),(37,'2021-02-21 06:42:30.109551','24','怦然心动 Flipped (2010)',1,'[{\"added\": {}}]',7,1),(38,'2021-02-21 06:43:39.507380','25','大话西游之大圣娶亲',1,'[{\"added\": {}}]',7,1),(39,'2021-02-21 06:45:25.790492','26','夏洛特烦恼',1,'[{\"added\": {}}]',7,1),(40,'2021-02-21 06:46:41.917882','27','剪刀手爱德华',1,'[{\"added\": {}}]',7,1),(41,'2021-02-21 06:46:57.249119','24','怦然心动 Flipped',2,'[{\"changed\": {\"fields\": [\"\\u7535\\u5f71\\u540d\\u5b57\"]}}]',7,1),(42,'2021-02-21 06:47:03.781332','25','大圣娶亲',2,'[{\"changed\": {\"fields\": [\"\\u7535\\u5f71\\u540d\\u5b57\"]}}]',7,1),(43,'2021-02-21 06:50:27.937829','28','信条',1,'[{\"added\": {}}]',7,1),(44,'2021-02-21 06:51:54.532978','29','功夫',1,'[{\"added\": {}}]',7,1),(45,'2021-02-21 06:53:08.928597','30','湄公河行动',1,'[{\"added\": {}}]',7,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'movies','movie'),(6,'sessions','session'),(8,'users','comments'),(9,'users','user_link');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-11 07:43:27.650821'),(2,'auth','0001_initial','2021-02-11 07:43:31.415802'),(3,'admin','0001_initial','2021-02-11 07:43:44.107934'),(4,'admin','0002_logentry_remove_auto_add','2021-02-11 07:43:47.176927'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-11 07:43:47.292987'),(6,'contenttypes','0002_remove_content_type_name','2021-02-11 07:43:50.863326'),(7,'auth','0002_alter_permission_name_max_length','2021-02-11 07:43:52.902387'),(8,'auth','0003_alter_user_email_max_length','2021-02-11 07:43:53.189327'),(9,'auth','0004_alter_user_username_opts','2021-02-11 07:43:53.320373'),(10,'auth','0005_alter_user_last_login_null','2021-02-11 07:43:54.732324'),(11,'auth','0006_require_contenttypes_0002','2021-02-11 07:43:54.875324'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-11 07:43:55.035327'),(13,'auth','0008_alter_user_username_max_length','2021-02-11 07:43:57.235733'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-11 07:43:59.485669'),(15,'auth','0010_alter_group_name_max_length','2021-02-11 07:44:00.224670'),(16,'auth','0011_update_proxy_permissions','2021-02-11 07:44:00.374688'),(17,'auth','0012_alter_user_first_name_max_length','2021-02-11 07:44:02.405926'),(18,'movies','0001_initial','2021-02-11 07:44:03.293444'),(19,'sessions','0001_initial','2021-02-11 07:44:04.103828'),(20,'movies','0002_auto_20210211_1615','2021-02-11 08:15:11.492187'),(21,'movies','0003_auto_20210211_1616','2021-02-11 08:16:07.123432'),(22,'movies','0004_auto_20210212_1142','2021-02-12 03:42:45.732151'),(23,'users','0001_initial','2021-02-13 03:03:52.940566'),(24,'users','0002_auto_20210213_1440','2021-02-13 06:40:14.498696'),(25,'users','0003_user_link_collections','2021-02-13 07:28:27.502514'),(26,'movies','0005_auto_20210220_1604','2021-02-20 08:04:36.564729'),(27,'users','0004_auto_20210220_1604','2021-02-20 08:04:39.702029');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('uiqizw430qu8i65cr4ctlzwztrclyyl0','.eJzFlLtugzAYRl8FeU4Ac02ytUunjJlKFflGcAt2ZUOHRnn32pBKjRsSElXqBPJ_-PB3uOzBFnVtte00U1tOwQpAMPu5hhF5Y8IO6CsSO-kTKVrFsW8R_zjV_lpSVj8e2ZOACunKXJ1niLAlzAhElMAwiWAShSVdUMxgxLI4jGJKsmVEQkrjFGZZlKOcYJjALMYpZTa0YaLTJut5XwCBGlaAlVeAB3MrJlpOUMul8JCgnl2Sin_2KwWYGYoTe2b5EmmvRHNdcVbTOarbAWhsA22R0_gnJbt3PRJiG-o5kbth3ql6GAeINlwE1kKwswHBACBKN-OMmR45rJjRpLoGn9nRHxQ-zLy7Sh5eLME4tQAMw8gN2lj2d476zrngyY6vaOqR_7N0vZzrJ3YXoJu5lh-cjYUSrkjNLr-fRdHlaZyaQ1rmcEKQK7_pdzAcxv2fUBMfwaRurpCb-lz1fdMLOlF3v6-iW2CS3KG7_5oCIhvzN2v1uHCHm6h8Sr0zxqdXcgUnZx4BOHwBSUYDxg:1lEkOC:AqAOma7_CETJs7CmfImsbfCfZrOmxTtJyWjbKqIYZzs','2021-03-10 02:59:00.535814');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie`
--

DROP TABLE IF EXISTS `movies_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `actors` varchar(100) NOT NULL,
  `show_time` date NOT NULL,
  `director` varchar(20) NOT NULL,
  `type` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `area` int NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie`
--

LOCK TABLES `movies_movie` WRITE;
/*!40000 ALTER TABLE `movies_movie` DISABLE KEYS */;
INSERT INTO `movies_movie` VALUES (1,'复仇者联盟','小罗伯特·唐尼、克里斯·埃文斯、马克·鲁法洛、克里斯·海姆斯沃斯、斯嘉丽·约翰逊、杰瑞米·雷纳、汤姆·希德勒斯顿、塞缪尔·杰克逊、克拉克·格雷格、寇碧·史莫德斯','2021-02-11','乔斯韦登，罗素兄弟','ke','一股突如其来的强大邪恶势力对地球造成致命威胁，没有任何一个超级英雄能够单独抵挡。\r\n长期致力于保护全球安危的神盾局感到措手不及，其指挥官“独眼侠”尼克·弗瑞（塞缪尔·杰克逊 饰）意识到他必须创建一个“地球史上最强”的联盟组织，云集各方超级英雄一起发威，才能拯救世界于水深火热，抵御黑暗势力的侵袭。\r\n于是由六大超级英雄—钢铁侠托尼·斯塔克（小罗伯特·唐尼 饰）、美国队长史蒂夫·罗杰斯（克里斯·埃文斯 饰）、雷神索尔·奥丁森（克里斯·海姆斯沃斯 饰）、绿巨人布鲁斯·班纳（马克·鲁弗洛 饰）、黑寡妇娜塔莎·罗曼诺夫（斯嘉丽·约翰逊 饰）和鹰眼克林特·巴顿（杰瑞米·雷纳 饰）组成的 “复仇者联盟”应运而生。他们各显神通，团结一心，终于战胜了以洛基为首的邪恶势力，保住了地球的安全。',4,'media/9c16fdfaaf51f3de29b86af69aeef01f3a29791e.jpg'),(2,'唐人街探案','陈思诚','2015-12-31','王宝强、刘昊然、佟丽娅、陈赫、小沈阳、肖','xi','天赋异禀的结巴少年“秦风”警校落榜，被姥姥遣送泰国找远房表舅——号称“唐人街第一神探 ”，实则“猥琐”大叔的“唐仁“散心。不想一夜花天酒地后，唐仁沦为离奇凶案嫌疑人，不得不和秦风亡命天涯，穷追不舍的警探——-“疯狗”黄兰登；无敌幸运的警察——“草包”坤泰；穷凶极恶、阴差阳错的“匪帮三人组”；高深莫测的“唐人街教父”；“美艳风骚老板娘”等悉数登场。七天，唐仁、秦风这对“欢喜冤家”、“天作之合”必须取长补短、同仇敌忾，他们要在躲避警察追捕、匪帮追杀、黑帮围剿的同时，在短短“七天”内，完成找到“失落的黄金”、查明“真凶”、为他们“洗清罪名”这些“逆天”的任务。',1,'media/0d338744ebf81a4ca5938b65d12a6059242da6fd.jpg'),(3,'海贼王剧场版Z','田中真弓，中井和哉，铃木真仁，筱原凉子','2012-12-25','长峰达也','h','伟大航路的后半段，\"新世界\"某个小岛上，迎来了令人毛骨悚然且充满不祥气息的访客。其首领是原为海军大将的Z，他的家人当年遭海贼杀害，右臂当初也在海贼的袭击中重伤致残，因此对这群\"祸乱天下\"的不法之徒怀有切齿仇恨。此番他登岛的目的，是为了获得蕴藏着巨大能量足以和古代兵器相媲美的矿物黛娜岩。跟随在他身后的是多年来一直和Z大将出生入死的忠实部下爱和宾斯。黛娜岩一旦到手，Z将率领他的\"NEO海军\"展开天下海贼全盘歼灭的宏大计划。\r\n与此同时，顺利突入\"新世界\"的草帽海贼团遭遇了NEO海军的阻击。在他们面前的，正是右边装配了海楼石制成的机械手臂、全身布满绷带和伤疤的Z大将。路飞等人与之陷入缠斗，可是很快便意识到眼前这名男子，拥有比其外形更为恐怖的实力。在极度憎恶海贼的Z大将狂风暴雨的攻击下，草帽海贼团丢盔弃甲，毫无还手之力，连他们的桑尼号也遭到一定程度的损毁。\r\n三大将之一的青雉也离开海军本部后，也追寻着草帽海贼团的气息来到\"新世界\"，前所未有的劲敌交替登场，路飞和伙伴们面临严峻的挑战。',6,'media/e824b899a9014c0871d2e72a0f7b02087af4f450.jpg'),(4,'战狼','吴京、余男、倪大红、斯科特·阿金斯 、周晓鸥','2015-04-02','吴京','d','痞性十足的冷锋（吴京饰）屡屡惹祸，有人说他是流氓，是痞子， 也有人说他是英雄，是传奇，在一次行动中冷锋违抗军令打死了恐怖分子，要被开除出队，却意外得到了神秘部队战狼的接纳，但本想换个地方继续惹祸的他却跳进了另外一个深渊，冷傲的战狼副队长，擦出暧昧火花的性感女队长（余男饰），心计颇深腹黑的毒枭，枉死的队友，雇佣兵跨过边境线入侵中国，一切都使他陷入了麻烦中。一切都在考验这个团队的毒瘤冷锋，他不知该何去何从。',1,'media/8c1001e93901213f36ed904450e736d12e2e9548.jpg'),(5,'心花路放','黄渤、徐峥','2014-09-30','宁浩','a','电影《心花路放》讲述了耿浩（黄渤饰）在生活中遭遇了情感危机，面对情感的背叛，耿浩陷入难以自拔的痛苦之中。好基友郝义（徐峥饰）为了帮助他摆脱痛苦，于是一对“暴走兄弟”带上一只狗，开始了一段搞笑的疯狂的猎艳之旅',1,'media/08f790529822720e77ff16c578cb0a46f21fabd8.jpg'),(6,'摩天营救','道恩·强森 / 巴勃罗·施瑞博尔 / 内芙·坎贝尔 / 凯文·兰金 / 罗兰·默勒 / 艾德里安·霍姆斯 / 黄经汉 / 文峰','2018-12-05','罗森·马歇尔·瑟伯','d','在香港市中心，世界上最高、结构最复杂的摩天大楼遭到破坏，危机一触即发。威尔·索耶（道恩·强森 饰）的妻子萨拉（内芙·坎贝尔 饰）和孩子们在98层被劫为人质，直接暴露在火线上。威尔，这位战争英雄、前联邦调查局救援队员，作为大楼的安保顾问，却被诬陷纵火和谋杀。他必须奋力营救家人，为自己洗脱罪名，关乎生死存亡的高空任务就此展开。',4,'media/dy_a5d02a5f1c7f7f0db8747fd39441b2fc.jpg'),(7,'奇门遁甲','大鹏 / 倪妮 / 李治廷 / 周冬雨 / 伍佰 / 柳岩 / 许明虎 / 杨一威','2017-06-05','袁和平','ke','在一个妖孽横行，天象大乱的时代，外星妖物侵袭而来。此时江湖上精通“奇门遁甲”之术的神秘组织“雾隐门”挺身而出，其首领老大（伍佰 饰）、弟子诸葛青云（大鹏 饰）、铁蜻蜓（倪妮 饰）和雾隐七子等众人各怀所长。另一方面，诸葛青云途中寻找新一代掌门小圆圈（周冬雨 饰）之时，新晋捕快刀宜长（李治廷 饰）为救铁蜻蜓亦被牵连在内。一时间，风云涌起，“天外来客”与“雾隐门”之间的正邪之战即将引发，一场新的奇幻危机正在来临……',1,'media/t0133c839dfe3c19225.jpg'),(8,'罗小黑战记','山新 / 皇贞季 / 郝祥海 / 刘明月 / 曹云图 / 张圣 / 图特哈蒙 / 杨凝','2019-03-06','木头','h','在熙攘的人类世界里，很多妖精隐匿其中，他们与人类相安无事地生活着。猫妖罗小黑因为家园被破坏，开始了它的流浪之旅。这场旅途中惺惺相惜的妖精同类与和谐包容的人类伙伴相继出现，让小黑陷入了两难抉择，究竟何处才是真正的归属？',1,'media/dy_07d9d6f9f37bf063cc47f6fbdeb98076.jpg'),(9,'大圣归来','张磊 / 林子杰 / 吴文伦 / 童自荣 / 刘九容 / 吴迪 / 刘北辰 / 赵乾景','2015-06-04','田晓鹏','h','大闹天宫后四百年多年，齐天大圣成了一个传说，在山妖横行的长安城，孤儿江流儿（林子杰 配音）与行脚僧法明（吴文伦 配音）相依为命，小小少年常常神往大闹天宫的孙悟空（张磊 配音）。 有一天，山妖（吴迪 配音）来劫掠童男童女，江流儿救了一个小女孩，惹得山妖追杀，他一路逃跑，跑进了五行山，盲打误撞地解除了孙悟空的封印。悟空自由之后只想回花果山，却无奈腕上封印未解，又欠江流儿人情，勉强地护送他回长安城。 一路上八戒（刘九容 配音）和白龙马也因缘际化地现身，但或落魄或魔性大发，英雄不再。妖王（童自荣 配音）为抢女童，布下夜店迷局，却发现悟空法力尽失，轻而易举地抓走了女童。悟空不愿再去救女童，江流儿决定自己去救。 日全食之日，在悬空寺，妖王准备将童男童女投入丹炉中，江流儿却冲进了道场，最后一战开始了……',2,'media/t01dbbbea3094573803.jpg'),(10,'大鱼海棠','季冠霖 / 苏尚卿 / 许魏洲 / 金士杰 / 王德顺 / 姜广涛 / 杨婷 / 潘淑兰','2016-06-02','梁旋  张春','h','所有活着的人类，都是海里一条巨大的鱼；出生的时候他们从海的此岸出发。他们的生命就像横越大海，有时相遇，有时分开……死的时候，他们便到了岸，各去各的世界。 四十五亿年前，这个星球上，只有一片汪洋大海，和一群古老的大鱼。在与人类世界平行的空间里，生活着一个规规矩矩、遵守秩序的族群，他们为神工作，掌管世界万物运行规律，也掌管人类的灵魂。他们的天空与人类世界的大海相连。他们既不是神，也不是人，他们是“其他人”。 十六岁生日那天，居住在“神之围楼”里的一个名叫椿（季冠霖 配音）的女孩变作一条海豚到人间巡礼，被大海中的一张网困住，一个人类男孩因为救她而落入深海死去。为了报恩，为了让人类男孩复活，她需要在自己的世界里，历经种种困难与阻碍，帮助死后男孩的灵魂——一条拇指那么大的小鱼，成长为一条比鲸更巨大的鱼并回归大海。',1,'media/t012ecb235f76dd2b0b.jpg'),(11,'寻梦环游记','爱德华·詹姆斯·奥莫斯 / 阿兰纳·乌巴奇 / 本杰明·布拉特 / 盖尔·加西亚·贝纳尔 / 加布里埃尔·伊格莱西亚斯 / 切奇·马林','2020-06-01','李·昂克里奇  阿德里安·莫利纳','h','热爱音乐的米格尔（安东尼·冈萨雷兹 Anthony Gonzalez 配音）不幸地出生在一个视音乐为洪水猛兽的大家庭之中，一家人只盼着米格尔快快长大，好继承家里传承了数代的制鞋产业。一年一度的亡灵节即将来临，每逢这一天，去世的亲人们的魂魄便可凭借着摆在祭坛上的照片返回现世和生者团圆。 在一场意外中，米格尔竟然穿越到了亡灵国度之中，在太阳升起之前，他必须得到一位亲人的祝福，否则就将会永远地留在这个世界里。米格尔决定去寻找已故的歌神德拉库斯（本杰明·布拉特 Benjamin Bratt 配音），因为他很有可能就是自己的祖父。途中，米格尔邂逅了落魄乐手埃克托（盖尔·加西亚·贝纳尔 Gael García Bernal 配音），也渐渐发现了德拉库斯隐藏已久的秘密。',4,'media/t0107e396d7bd39bade.jpg'),(12,'疯狂原始人2','尼古拉斯·凯奇  艾玛·斯通  瑞恩·雷诺兹  凯瑟琳·基纳  莱斯利·曼恩  彼特·丁拉基  克拉克·杜克  克萝丽丝·利奇曼  乔安娜·林莉  凯莉·玛丽·陈','2020-06-01','乔尔·克劳福德','h','经历了逃离洞穴、挺过末日危机之后的原始人咕噜家族，咕噜一家决定寻找新家园。中途盖（瑞恩·雷诺兹 Ryan Reynolds 配音）已成了咕噜一家中的一员，但让瓜哥（尼古拉斯·凯奇 Nicolas Cage 配音）头疼的是，盖跟女儿小伊（艾玛·斯通 Emma Stone 配音）每天你侬我侬，还妄想组成只属于两人的小家庭。就在咕噜一家人饥肠辘辘之际，他们发现了一片高墙内隐藏着食物丰饶的沃土，原来开辟这片世外桃源的文明人夫妇霍普和菲尔是已经去世的盖的父母的朋友。在最初的热情款待后，一心想要撮合盖和女儿晓晓的霍普和菲尔，发现咕噜一家成了绊脚石，为了把盖抢过来，他们用上了攻心计。两家人闹得不可开交，盖和小伊也产生了裂痕，却浑然不知危险正慢慢靠近……',4,'media/d36d000b7f2ca0d7a7c6b4447959daf7.jpg'),(13,'城市猎人剧场版','神谷明  伊仓一惠  饭丰万理江  山寺宏一  麻上洋子  玄田哲章','2019-05-01','儿玉兼嗣','h','美树与阿香好不轻易有机会参加海滩城市饭店的开幕仪式，没想到海怪和阿獠不但爽约，还意外为一个女孩子引起一场火拼。原来流亡海外的哥斯迪罗共和国的前独裁者基利阿姆将军为报复美国想利用海滩城市饭店的电脑入侵美国的战略防卫系统......',6,'media/f149ea808ae25a6e125fd1c6720b1435.jpg'),(14,'龙珠超：布罗利','野泽雅子  堀川亮  中尾隆圣  岛田敏  古川登志夫','2018-06-08','长峰达也','h','《龙珠超：布罗利》是一个全新的「赛亚人」故事，剧情将会延续即将结束的电视动画《七龙珠》，关于布罗利和悟空之间的故事。「力之大会」之后，悟空了解到宇宙中还存在着自己未曾见过的强者，于是每天都为了变得更强而不断努力修行。某天，现身于悟空和贝吉达面前的是从未见过的赛亚人「布罗利」。本该随着行星的消灭而近乎灭亡的赛亚人，为何会在地球？而从地狱中再度归来的弗利沙军也被卷入其中？三个走上了完全不同道路的赛亚人在相遇后，将引起一场壮烈的战斗……',6,'media/ce5bbccaa32f17c2ec46900eb28d53af.jpg'),(15,'哪吒之魔童降世','吕艳婷  囧森瑟夫  瀚墨  陈浩  绿绮  张珈铭  杨卫','2019-03-09','饺子','h','天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和魔丸竟然被掉包。本应是灵珠英雄的哪吒却成了混世大魔王。调皮捣蛋顽劣不堪的哪吒却徒有一颗做英雄的心。然而面对众人对魔丸的误解和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？',1,'media/507f32fcc02e22e2f4368d5a68ddb1da.jpg'),(16,'史酷比狗','威尔·福特  马克·沃尔伯格  詹森·艾萨克  吉娜·罗德里格兹','2020-06-01','托尼·塞沃恩','h','《史酷比狗》是史酷比狗的第一部大银幕动画冒险长片，讲述了史酷比不为人知的起源故事，以及神秘公司史上最精彩的惊世秘案。\r\n　　《史酷比狗》演绎了史酷比与其一生挚友夏奇的初次相遇，以及他们如何与少年侦探弗雷德、维尔玛和达芙妮一起组建了世界著名的神秘公司。如今，神秘公司已经解决了数百起谜案、进行了无数次冒险，但史酷比和他的同伴们发现，他们正面临有史以来最惊险、最具挑战性的神秘案件：一个将“幽灵狗”塞伯勒斯释放回世上的阴谋。当他们拼命努力想要阻止这一全球性大灾难之时，他们也发现了史酷比的秘密身世，以及他超乎想象的神秘命运。',4,'media/b63d3d02dbadc22b0e936a3c1bb3a946.jpg'),(17,'绝密档案','奥莎娜·阿金什那  费奥多尔·邦达尔丘克  彼得·费奥多罗夫  安东·瓦西利耶夫','2019-06-04','Egor  Abramenko','ke','苏联，1983年。苏联宇航员兼英雄康斯坦丁·维什尼亚科夫（Konstantin Veshnyakov）将一个外星生物带入了自己的身体。在一个封闭的城市神经生理学家塔蒂扬娜·克里莫娃（Tatyana Klimova）的秘密实验室中，她试图从宇航员中解救宇航员时，发现她对患者的感觉远不止是专业兴趣',4,'media/b0f151a37d840775d938bab57fa6b873.jpg'),(18,'龙之心','约瑟夫·米尔森  杰克·凯恩  阿图罗·穆塞利','2020-06-04','Ivan  Silvestrini','ke','Lukas, a young farmer whose family is killed by savage raiders in the countryside, sets out on an epic quest for revenge, forming an unlikely molikan.com trio with a majestic dragon and a swashbuckling, sword-fighting mercenary, Darius.',4,'media/80c0cad76ddc8e1d40b72de6ac28508a.jpg'),(19,'西虹市首富','沈腾 / 宋芸桦 / 张一鸣 / 张晨光 / 常远 / 魏翔 / 赵自强 / 九孔','2018-06-01','闫非  彭大魔','xi','西虹市丙级球队大翔队的守门员王多鱼（沈腾 饰）因比赛失利被教练开除，一筹莫展之际王多鱼突然收到神秘人士金老板（张晨光 饰）的邀请，被告知自己竟然是保险大亨王老太爷（李立群 饰）的唯一继承人，遗产高达百亿！但是王老太爷给出了一个非常奇葩的条件，那就是要求王多鱼在一个月内花光十亿，还不能告诉身边人，否则失去继承权。王多鱼毫不犹豫签下了“军令状”，与好友庄强（张一鸣 饰）以及财务夏竹（宋芸桦 饰）一起开启了“挥金之旅”，即将成为西虹市首富的王多鱼，第一次感受到了做富人的快乐，同时也发现想要挥金如土实在没有那么简单！',1,'media/dy_ec35ab9af96c2d0962ffffb4353a74f5.jpg'),(20,'疯狂的外星人','黄渤/沈腾','2019-02-05','宁浩','xi','耿浩（黄渤 饰）与一心想发大财的好兄弟大飞（沈腾 饰），经营着各自惨淡的“事业”，然而“天外来客”（徐峥 饰）的意外降临，打破了二人平静又拮据的生活。神秘的西方力量也派出“哼哈二将”在全球搜查外星人行踪。啼笑皆非的跨物种对决，别开生面的“星战”，在中国某海边城市激情上演。',1,'media/6a21e35ad7106c60967954b165c09b92915222.jpg'),(21,'我和我的家乡','葛优 / 黄渤 / 范伟 / 邓超 / 沈腾','2020-10-01','宁浩','xi','电影《我和我的家乡》定档2020年国庆，延续《我和我的祖国》集体创作的方式，由张艺谋担当总监制，宁浩担任总导演，张一白担任总策划，宁浩、徐峥、陈思诚、闫非&彭大魔、邓超&俞白眉分别执导五个故事。',1,'media/p2620453443.jpg'),(22,'我不是药神','徐峥 / 王传君 / 周一围 / 谭卓 / 章宇','2018-07-05','韩家女','xi','普通中年男子程勇（徐峥 饰）经营着一家保健品店，失意又失婚。不速之客吕受益（王传君 饰）的到来，让他开辟了一条去印度买药做“代购”的新事业，虽然困难重重，但他在这条“买药之路”上发现了商机，一发不可收拾地做起了治疗慢粒白血病的印度仿制药独家代理商。赚钱的同时，他也认识了几个病患及家属，为救女儿被迫做舞女的思慧（谭卓 饰）、说一口流利“神父腔”英语的刘牧师（杨新鸣 饰），以及脾气暴烈的“黄毛”（章宇 饰），几个人合伙做起了生意，利润倍增的同时也危机四伏。程勇昔日的小舅子曹警官（周一围 饰）奉命调查仿制药的源头，假药贩子张长林（王砚辉 饰）和瑞士正牌医药代表（李乃文 饰）也对其虎视眈眈，生意逐渐变成了一场关于救赎的拉锯战。\r\n　　本片改编自慢粒白血病患者陆勇代购抗癌药的真实事迹。',1,'media/p2561305376.jpg'),(23,'楚门的世界','金·凯瑞 / 劳拉·琳妮 / 艾德·哈里斯 / 诺亚·艾默里奇 / 娜塔莎·麦克艾霍恩','1998-06-05','彼得·威尔','ke','楚门（金•凯瑞 Jim Carrey 饰）是一个平凡得不能再平凡的人，除了一些有些稀奇的经历之外——初恋女友突然失踪、溺水身亡的父亲忽然似乎又出现在眼前，他和绝大多数30多岁的美国男人绝无异样。这令他倍感失落。他也曾试过离开自己生活了多年的地方，但总因种种理由而不能成行。\r\n　　直到有一天，他忽然发觉自己似乎一直在被人跟踪，无论他走到哪里，干什么事情。这种感觉愈来愈强烈。楚门决定不惜一切代价逃离这个他生活了30多年的地方，去寻找他的初恋女友。\r\n　　但他却发现自己怎样也逃不出去。真相其实很残忍。',4,'media/p479682972.jpg'),(24,'怦然心动 Flipped','玛德琳·卡罗尔 / 卡兰·麦克奥利菲 / 瑞贝卡·德·莫妮 / 安东尼·爱德华兹 / 约翰·马奥尼','2010-07-26','罗伯·莱纳','a','布莱斯（卡兰•麦克奥利菲 Callan McAuliffe 饰）全家搬到小镇，邻家女孩朱丽（玛德琳•卡罗尔 Madeline Carroll 饰）前来帮忙。她对他一见钟情，心愿是获得他的吻。两人是同班同学，她一直想方设法接近他，但是他避之不及。她喜欢爬在高高的梧桐树上看风景。但因为施工，树被要被砍掉，她誓死捍卫，希望他并肩作战，但是他退缩了。她的事迹上了报纸，外公对她颇有好感，令他十分困惑。她凭借鸡下蛋的项目获得了科技展第一名，成了全场焦点，令他黯然失色。她把自家鸡蛋送给他，他听家人怀疑她家鸡蛋不卫生，便偷偷把鸡蛋丢掉。她得知真相，很伤心，两人关系跌入冰点。她跟家人诉说，引发争吵。原来父亲一直攒钱照顾傻弟弟，所以生活拮据。她理解了父母，自己动手，还得到了他外公的鼎力相助。他向她道歉，但是并未解决问题。他开始关注她。鸡蛋风波未平，家庭晚宴与午餐男孩评选.',4,'media/p501177648.jpg'),(25,'大圣娶亲','周星驰 / 吴孟达 / 朱茵 / 蔡少芬 / 蓝洁瑛 /','1995-02-04','刘镇伟','a','至尊宝（周星驰 饰）被月光宝盒带回到五百年前，遇见紫霞仙子（朱茵 饰），被对方打上烙印成为对方的人，并发觉自己已变成孙悟空。\r\n　　紫霞与青霞（朱茵 饰）本是如来佛祖座前日月神灯的灯芯（白天是紫霞，晚上是青霞），二人虽然同一肉身却仇恨颇深，因此紫霞立下誓言，谁能拔出她手中的紫青宝剑，谁就是她的意中人。紫青宝剑被至尊宝于不经意间拔出，紫霞决定以身相许，却遭一心记挂白晶晶（莫文蔚 饰）的至尊宝拒绝。后牛魔王救下迷失在沙漠中的紫霞，并逼紫霞与他成婚，关键时刻，至尊宝现身。',2,'media/p2455050536.jpg'),(26,'夏洛特烦恼','沈腾 / 马丽 / 尹正 / 艾伦 / 王智','2015-09-30','闫非 / 彭大魔','a','在学生时代的初恋秋雅（王智 饰）的婚礼上，毕业后吃软饭靠老婆养的夏洛（沈腾 饰）假充大款，出尽其丑，中间还被老婆马冬梅（马丽 饰）戳穿暴捶。混乱之中，夏洛意外穿越时空，回到了1997年的学生时代的课堂里。他懵懵懂懂，以为是场真实感极强的梦，于是痛揍王老师，强吻秋雅，还尝试跳楼让自己醒来。当受伤的他从病床上苏醒时，他意识到自己真的穿越了时空。既然有机会重新来过，那不如好好折腾一回。他勇敢追求秋雅、奚落优等生袁华（尹正 饰）、拒绝马冬梅的死缠烂打。后来夏洛凭借“创作”朴树、窦唯等人的成名曲而进入娱乐圈。\r\n　　他的人生发生翻天覆地的巨变，但是内心某个地方却越来越感到空虚……',1,'media/p2264377763.jpg'),(27,'剪刀手爱德华','约翰尼·德普 / 薇诺娜·瑞德 / 黛安·韦斯特 / 安东尼·迈克尔·豪尔 / 凯西·贝克','1990-12-06','蒂姆·波顿','a','爱德华（约翰尼•戴普 饰）是一个机器人，他拥有人的心智，却有一双剪刀手，孤独地生活在古堡里，闯入古堡的化妆品推销员佩格把他带回家，让他走进了人类的世界。单纯的爱德华爱上了佩格的女儿金（薇诺娜•瑞德 饰），金也慢慢的被爱德华的善良所吸引。\r\n　　但是，一连串的意外事情让周围的人邻居对爱德华的态度从喜欢变成无法接受，爱德华痛苦地发现，他总是好心办坏事，连自己的爱人都不能拥抱，或许，他注定就不属于这个世界。',4,'media/p480956937.jpg'),(28,'信条','约翰·大卫·华盛顿 / 罗伯特·帕丁森 / 伊丽莎白·德比茨基 / 肯尼思·布拉纳 / 亚伦·泰勒-约翰逊','2020-09-04','克里斯托弗·诺兰','d','世界存亡危在旦夕，“信条”一词是唯一的线索与武器。主人公穿梭于全球各地，开展特工活动，力求揭示“信条”之谜，并完成一项超越了真实时间的神秘任务。这项任务并非时间之旅，而是【时空逆转】。',4,'media/p2618403186.jpg'),(29,'功夫','周星驰 / 元秋 / 元华 / 黄圣依 / 梁小龙','2004-12-23','周星驰','d','1940年代的上海，自小受尽欺辱的街头混混阿星（周星驰）为了能出人头地，可谓窥见机会的缝隙就往里钻，今次他盯上行动日益猖獗的黑道势力“斧头帮”，想借之大名成就大业。\r\n　　阿星假冒“斧头帮”成员试图在一个叫“猪笼城寨”的地方对居民敲诈，不想引来真的“斧头帮”与“猪笼城寨”居民的恩怨。“猪笼城寨”原是藏龙卧虎之处，居民中有许多身怀绝技者（元华、梁小龙等），他们隐藏于此本是为远离江湖恩怨，不想麻烦自动上身，躲都躲不及。而在观战正邪两派的斗争中，阿星逐渐领悟功夫的真谛。',2,'media/p2219011938.jpg'),(30,'湄公河行动','张涵予 / 彭于晏 / 孙淳 / 陈宝国 / 冯文娟','2016-09-30','林超贤','d','金三角湄公河上，一处被称为“鬼门关”的河段，两艘来自中国的商船遭到不明身份之人的枪击袭击。未过多久，泰国军方召开新闻发布会，指责中国商船贩卖毒品。虽然发布会宣称船员全部逃亡，但是十三具遭受残忍杀害的中国船员尸体很快被人发现。这起胆大妄为的案件令中国警方大为震惊，云南省缉毒总队队长高刚（张涵予 饰）受命带特别行动小组前往泰国，并与情报员方新武（彭于晏 饰）合作接洽。根据现有资料显示，这件案子由盘踞在金三角的大毒枭糯卡所为。糯卡贪婪残忍，胆大包天，是湄公河流域上一颗惊扰运输安全的毒瘤。为了将这个恶棍绳之于法，中国、老挝、缅甸开展了三国联合巡逻，集中对糯卡的制毒窝点进行扫荡。而高刚等人也深入最危险境地，与丧失人性的贩毒分子进行惨烈对决……',1,'media/p2380677316.jpg');
/*!40000 ALTER TABLE `movies_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_comments`
--

DROP TABLE IF EXISTS `users_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_comments_movie_id_3b663949_fk_movies_movie_id` (`movie_id`),
  KEY `users_comments_user_id_77729380_fk_auth_user_id` (`user_id`),
  CONSTRAINT `users_comments_movie_id_3b663949_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`),
  CONSTRAINT `users_comments_user_id_77729380_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_comments`
--

LOCK TABLES `users_comments` WRITE;
/*!40000 ALTER TABLE `users_comments` DISABLE KEYS */;
INSERT INTO `users_comments` VALUES (1,'2021-02-13 05:45:44.649990','棒棒',3,1),(2,'2021-02-13 07:01:00.632664','大圣归来',9,1),(3,'2021-02-20 02:32:44.159575','我爱海贼王',3,1),(4,'2021-02-20 02:32:55.733619','六六六',3,1),(5,'2021-02-20 02:49:18.408238','虽然我是大年初一一个人去看的唐人街探案3，但是它果然没有让我失望！！！太好看啦！剧情设计的非常巧妙，一环扣一环，环环相扣。探案的过程不仅仅是探索真相的过程，更是各种各样人性显露的过程。世界上没有绝对的善与恶，一切都是善恶缠绕交织在一起的最终结果。一桩桩案件的背后皆有因果。真相揭开以后，只能令人唏嘘感叹。很高兴秦风能够一直坚守本心，这个世界上只有像秦风这样的人坚守下去，做自己认为对的事情，这个世界才会变的越来越好。剧情精彩曲折，出人意料又在情理之中，给人惊喜。全程基本无尿点，有搞笑也有感悟。是一部非常好的电影，没有辜负我等了这么久还大年初一一个人去看！希望还有后续！',3,1),(6,'2021-02-20 08:43:48.222794','哇，真的超好看',3,14),(7,'2021-02-20 08:45:10.974841','的撒旦范德萨',3,14),(8,'2021-02-20 08:45:28.515856','的撒旦范德萨',3,14),(9,'2021-02-23 06:58:58.579666','666666666',9,1);
/*!40000 ALTER TABLE `users_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_link`
--

DROP TABLE IF EXISTS `users_user_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `touxiang` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `collections` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_user_link_user_id_6f372f0b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_link`
--

LOCK TABLES `users_user_link` WRITE;
/*!40000 ALTER TABLE `users_user_link` DISABLE KEYS */;
INSERT INTO `users_user_link` VALUES (1,'touxiang/4c6c4e784052af6fce4ff4.jpg',1,'3,11,23,27,29,2117,8,'),(3,'touxiang/default.jpg',14,NULL),(4,'touxiang/default.jpg',15,NULL),(5,'touxiang/default.jpg',16,NULL);
/*!40000 ALTER TABLE `users_user_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24 11:11:18

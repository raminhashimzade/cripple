CREATE DATABASE  IF NOT EXISTS `asc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `asc`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: asc
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_security`
--

DROP TABLE IF EXISTS `app_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_security` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_psw` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_security`
--

LOCK TABLES `app_security` WRITE;
/*!40000 ALTER TABLE `app_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_files`
--

DROP TABLE IF EXISTS `dev_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dev_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `dev_id` varchar(45) DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `file_type` varchar(45) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_files`
--

LOCK TABLES `dev_files` WRITE;
/*!40000 ALTER TABLE `dev_files` DISABLE KEYS */;
INSERT INTO `dev_files` VALUES (1,'2018-02-04 08:22:14','354623073299332','rec_354623073299332_20180204040016.mp4','record','D:\\MyProjects\\ASC\\Deployment\\App_Data\\rec_354623073299332_20180204040016.mp4'),(2,'2018-02-04 05:27:15','354623073299332','rec_354623073299332_20180204040016.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204040016.mp4'),(3,'2018-02-04 05:27:16','354623073299332','rec_354623073299332_20180204040037.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204040037.mp4'),(4,'2018-02-04 05:27:18','354623073299332','rec_354623073299332_20180204040107.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204040107.mp4'),(5,'2018-02-04 05:27:19','354623073299332','rec_354623073299332_20180204040137.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204040137.mp4'),(6,'2018-02-04 08:34:59','354623073299332','rec_354623073299332_20180204123418.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204123418.mp4'),(7,'2018-02-04 09:16:59','354623073299332','rec_354623073299332_20180204123448.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204123448.mp4'),(8,'2018-02-04 09:17:00','354623073299332','rec_354623073299332_20180204123518.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204123518.mp4'),(9,'2018-02-04 09:19:49','354623073299332','rec_354623073299332_20180204131847.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204131847.mp4'),(10,'2018-02-04 09:20:08','354623073299332','rec_354623073299332_20180204131918.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204131918.mp4'),(11,'2018-02-04 09:21:08','354623073299332','rec_354623073299332_20180204132007.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204132007.mp4'),(12,'2018-02-04 09:22:08','354623073299332','rec_354623073299332_20180204132107.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204132107.mp4'),(13,'2018-02-04 09:22:10','354623073299332','rec_354623073299332_20180204132037.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204132037.mp4'),(14,'2018-02-04 09:23:08','354623073299332','rec_354623073299332_20180204132207.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204132207.mp4'),(15,'2018-02-04 09:23:10','354623073299332','rec_354623073299332_20180204132137.mp4','record','C:\\inetpub\\wwwroot\\test\\App_Data\\rec_354623073299332_20180204132137.mp4');
/*!40000 ALTER TABLE `dev_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_info`
--

DROP TABLE IF EXISTS `dev_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dev_info` (
  `dev_id` int(11) NOT NULL AUTO_INCREMENT,
  `history` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dev_imei` varchar(45) DEFAULT NULL,
  `dev_name` varchar(45) DEFAULT NULL,
  `dev_model` varchar(45) DEFAULT NULL,
  `soft_info` varchar(450) DEFAULT NULL,
  `person_name` varchar(450) DEFAULT NULL,
  `operator` varchar(45) DEFAULT NULL,
  `line_number` varchar(45) DEFAULT NULL,
  `charge_percent` int(11) DEFAULT NULL,
  `desc` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`dev_id`,`history`),
  KEY `ix_dev_info_1` (`dev_imei`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (history)
(PARTITION partHIST VALUES IN (-1) ENGINE = InnoDB,
 PARTITION partLIVE VALUES IN (1) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_info`
--

LOCK TABLES `dev_info` WRITE;
/*!40000 ALTER TABLE `dev_info` DISABLE KEYS */;
INSERT INTO `dev_info` VALUES (8,-1,'2018-02-04 00:12:48','2','3','4','5','6','7','8',9,''),(9,-1,'2018-02-04 00:13:00','2','3','4','5','6','7','8',9,''),(10,-1,'2018-02-04 00:23:27','2','3','4','5','6','7','8',9,''),(12,-1,'2018-02-04 05:27:12','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',35,''),(13,-1,'2018-02-04 06:40:34','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',35,''),(14,-1,'2018-02-04 07:09:43','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',30,''),(15,-1,'2018-02-04 07:14:39','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',37,''),(16,-1,'2018-02-04 07:26:07','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',38,''),(17,-1,'2018-02-04 07:28:02','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',41,''),(18,-1,'2018-02-04 07:30:05','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',42,''),(19,-1,'2018-02-04 07:41:36','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',42,''),(20,-1,'2018-02-04 08:26:17','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',45,''),(21,-1,'2018-02-04 08:31:20','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',58,''),(22,-1,'2018-02-04 08:33:55','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',59,''),(23,-1,'2018-02-04 09:14:14','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',59,''),(11,1,'2018-02-04 00:23:27','2','3','4','5','6','7','8',9,''),(24,1,'2018-02-04 09:14:14','354623073299332','samsung','SM-G928C','7.0',NULL,'BAKCELL','',69,'');
/*!40000 ALTER TABLE `dev_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_location`
--

DROP TABLE IF EXISTS `dev_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dev_location` (
  `loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` varchar(45) DEFAULT NULL,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `loc_type` varchar(45) DEFAULT NULL,
  `loc_x` varchar(45) DEFAULT NULL,
  `loc_y` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_location`
--

LOCK TABLES `dev_location` WRITE;
/*!40000 ALTER TABLE `dev_location` DISABLE KEYS */;
INSERT INTO `dev_location` VALUES (1,'354623073299332','2018-02-04 07:41:39','network','40.4204111','49.8103298'),(2,'354623073299332','2018-02-04 07:41:59','network','40.4200934','49.81015'),(3,'354623073299332','2018-02-04 07:42:20','network','40.4199941','49.8106431'),(4,'354623073299332','2018-02-04 07:43:20','network','40.4205555','49.8104139'),(5,'354623073299332','2018-02-04 09:14:21','network','40.4199584','49.810077'),(6,'354623073299332','2018-02-04 09:15:48','gps','40.41868538398513','49.80973570250654'),(7,'354623073299332','2018-02-04 09:15:49','gps','40.41926026413162','49.809753082650936'),(8,'354623073299332','2018-02-04 09:15:50','gps','40.419775583708415','49.80978393794553'),(9,'354623073299332','2018-02-04 09:15:52','network','40.4202886','49.8102016'),(10,'354623073299332','2018-02-04 09:16:13','network','40.4200157','49.8100792'),(11,'354623073299332','2018-02-04 09:16:21','gps','40.41970460068827','49.8098701336979'),(12,'354623073299332','2018-02-04 09:16:36','gps','40.41970283919148','49.80999441088814'),(13,'354623073299332','2018-02-04 09:16:58','gps','40.41969409298035','49.810059828296694'),(14,'354623073299332','2018-02-04 09:17:15','network','40.4215715','49.8114704'),(15,'354623073299332','2018-02-04 09:17:28','gps','40.41971582419','49.81003387311341'),(16,'354623073299332','2018-02-04 09:17:29','network','40.4215715','49.8114704'),(17,'354623073299332','2018-02-04 09:18:11','gps','40.41970946292922','49.80987950085053'),(18,'354623073299332','2018-02-04 09:18:48','network','40.4200651','49.8101264'),(19,'354623073299332','2018-02-04 09:19:32','gps','40.41980663511683','49.8102644374622'),(20,'354623073299332','2018-02-04 09:20:03','gps','40.41989410677355','49.81023441298216'),(21,'354623073299332','2018-02-04 09:20:04','gps','40.41988984938393','49.81010021214203'),(22,'354623073299332','2018-02-04 09:20:04','network','40.4201133','49.8101349'),(23,'354623073299332','2018-02-04 09:20:05','gps','40.42000245390259','49.810174430882384'),(24,'354623073299332','2018-02-04 09:20:06','network','40.4199305','49.8100991'),(25,'354623073299332','2018-02-04 09:20:07','gps','40.420042251319686','49.81028999799774'),(26,'354623073299332','2018-02-04 09:20:07','network','40.4199333','49.8100972'),(27,'354623073299332','2018-02-04 09:20:08','gps','40.42001966534147','49.81030354752102'),(28,'354623073299332','2018-02-04 09:20:43','gps','40.41970392151345','49.8105444284691'),(29,'354623073299332','2018-02-04 09:20:51','network','40.4215715','49.8114704'),(30,'354623073299332','2018-02-04 09:20:52','gps','40.41981741822599','49.81040249762587'),(31,'354623073299332','2018-02-04 09:21:04','gps','40.41973330314833','49.81035893830078'),(32,'354623073299332','2018-02-04 09:21:08','network','40.4201328','49.8103243'),(33,'354623073299332','2018-02-04 09:21:11','gps','40.41981527041041','49.81027241505753'),(34,'354623073299332','2018-02-04 09:21:30','network','40.4200827','49.8101496'),(35,'354623073299332','2018-02-04 09:21:31','gps','40.419860336391324','49.81037498934894'),(36,'354623073299332','2018-02-04 09:21:50','network','40.4199201','49.8100967'),(37,'354623073299332','2018-02-04 09:22:10','network','40.4215715','49.8114704'),(38,'354623073299332','2018-02-04 09:22:28','gps','40.41989459681348','49.81026424581038'),(39,'354623073299332','2018-02-04 09:22:41','gps','40.419823378762004','49.81018032281658'),(40,'354623073299332','2018-02-04 09:22:53','gps','40.41973826088918','49.81013865524692'),(41,'354623073299332','2018-02-04 09:23:10','network','40.4199356','49.8100952'),(42,'354623073299332','2018-02-04 09:23:31','network','40.4200018','49.8101973'),(43,'354623073299332','2018-02-04 09:23:49','gps','40.419807342338494','49.81024237867852'),(44,'354623073299332','2018-02-04 09:24:28','network','40.4199351','49.8101262'),(45,'354623073299332','2018-02-04 09:24:35','gps','40.41985667961772','49.81020064119813'),(46,'354623073299332','2018-02-04 09:30:14','gps','40.419803199539885','49.81019851694653');
/*!40000 ALTER TABLE `dev_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_tracker`
--

DROP TABLE IF EXISTS `dev_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dev_tracker` (
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` varchar(45) DEFAULT NULL,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `track_type` varchar(45) DEFAULT NULL,
  `track_status` int(11) NOT NULL COMMENT '-1 / 1',
  PRIMARY KEY (`track_id`,`track_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY LIST (track_status)
(PARTITION partHIST VALUES IN (-1) ENGINE = InnoDB,
 PARTITION partLIVE VALUES IN (1) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_tracker`
--

LOCK TABLES `dev_tracker` WRITE;
/*!40000 ALTER TABLE `dev_tracker` DISABLE KEYS */;
INSERT INTO `dev_tracker` VALUES (1,'354623073299332','2018-02-04 05:45:39','track',-1),(2,'354623073299332','2018-02-04 05:45:39','deaf',-1),(3,'354623073299332','2018-02-04 05:47:31','lame',-1);
/*!40000 ALTER TABLE `dev_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'asc'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_dev_files` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `proc_dev_files`(p_dev_id varchar(45),
								  p_file_type varchar(45),
								  p_file_name varchar(45),
								  p_file_path varchar(450),
                                  p_dml		  varchar(45))
BEGIN
	if (p_dml = 'insert') then
		INSERT INTO `asc`.`dev_files`(`dev_id`,`file_name`,`file_type`,`file_path`)
		VALUES(p_dev_id,p_file_name,p_file_type,p_file_path);
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_dev_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `proc_dev_info`(  p_dev_imei varchar(45),
													   p_dev_name varchar(45),
													   p_dev_model varchar(45),					
													   p_soft_info varchar(450),
													   p_operator varchar(45),
													   p_line_number varchar(45),
													   p_charge_percent int,
													   p_desc	varchar(1024),
													   p_dml varchar(45))
BEGIN
		if (p_dml in ('insert','update')) then
					UPDATE `asc`.`dev_info` t
					SET `date_time` = CURRENT_TIMESTAMP,
						 `history` = -1
					WHERE dev_imei = p_dev_imei and `history` = 1;
                    
					INSERT INTO `asc`.`dev_info`
					(`date_time`,
					`history`,
					`dev_imei`,
					`dev_name`,
					`dev_model`,
					`soft_info`,
					`operator`,
					`line_number`,
					`charge_percent`,
                    `desc`)
					VALUES
					(CURRENT_TIMESTAMP,
					1,
					p_dev_imei,
					p_dev_name,
					p_dev_model,
					p_soft_info,
					p_operator,
					p_line_number,
					p_charge_percent,
                    p_desc);          
		elseif (p_dml = 'delete') then
					UPDATE `asc`.`dev_info` t
					SET `date_time` = CURRENT_TIMESTAMP,
						 `history` = -1
					WHERE dev_imei = p_dev_imei and `history` = 1;
		end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_dev_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `proc_dev_location`(p_dev_id varchar(45),
									  p_loc_type varchar(45),
                                      p_loc_x varchar(45),
                                      p_loc_y varchar(45))
BEGIN

	INSERT INTO `asc`.`dev_location` (`dev_id`,	`loc_type`,	`loc_x`, `loc_y`)
	VALUES(p_dev_id, p_loc_type, p_loc_x, p_loc_y);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-04  9:34:50

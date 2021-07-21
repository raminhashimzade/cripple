CREATE DATABASE  IF NOT EXISTS `asc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `asc`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.2.100    Database: asc
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_security`
--

LOCK TABLES `app_security` WRITE;
/*!40000 ALTER TABLE `app_security` DISABLE KEYS */;
INSERT INTO `app_security` VALUES (1,'ramin','1');
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
  `bookmark` int(20) DEFAULT '0',
  `file_desc` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_files`
--

LOCK TABLES `dev_files` WRITE;
/*!40000 ALTER TABLE `dev_files` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `dev_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_person`
--

DROP TABLE IF EXISTS `dev_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dev_person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `history` int(20) NOT NULL DEFAULT '1',
  `dev_id` varchar(45) DEFAULT NULL,
  `person_name` varchar(450) DEFAULT NULL,
  `criminal_n` varchar(450) DEFAULT NULL,
  `person_desc` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_person`
--

LOCK TABLES `dev_person` WRITE;
/*!40000 ALTER TABLE `dev_person` DISABLE KEYS */;
INSERT INTO `dev_person` VALUES (1,'2018-02-04 12:55:03',1,'354623073299332','Ramin','1111',NULL);
/*!40000 ALTER TABLE `dev_person` ENABLE KEYS */;
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_dev_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `proc_dev_person`(
   IN p_dev_id        varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci,
   IN p_person_name   varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci,
   IN p_person_desc   varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci,
   IN p_criminal_n    varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci)
BEGIN
   UPDATE `asc`.dev_person
      SET history = -1
    WHERE dev_id = p_dev_id;

   INSERT INTO `asc`.dev_person(history,
                                dev_id,
                                person_name,
                                criminal_n,
                                person_desc)
        VALUES (1,
                p_dev_id,
                p_person_name,
                p_criminal_n,
                p_person_desc);
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

-- Dump completed on 2018-02-05  2:05:31

CREATE DATABASE  IF NOT EXISTS `rmmsdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rmmsdb`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: rmmsdb
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_type` varchar(50) NOT NULL,
  `r_id` int DEFAULT NULL,
  `u_id` int NOT NULL,
  `p_date` datetime NOT NULL,
  `p_c_date` datetime DEFAULT NULL,
  `p_note` varchar(100) DEFAULT NULL,
  `p_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_user` (`u_id`),
  KEY `plan_ibfk_1` (`r_id`),
  CONSTRAINT `plan_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `road` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plan_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1000011,'勘察',NULL,1,'2020-05-27 11:17:00',NULL,'','未施工');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_progress`
--

DROP TABLE IF EXISTS `plan_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_progress` (
  `pg_id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `p_id` int NOT NULL,
  `pg_note` varchar(100) DEFAULT NULL,
  `pg_rate` float DEFAULT NULL,
  `pg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pg_id`),
  KEY `fk_user` (`u_id`),
  KEY `plan_progress_ibfk_1` (`p_id`),
  CONSTRAINT `plan_progress_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `plan` (`p_id`),
  CONSTRAINT `plan_progress_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_progress`
--

LOCK TABLES `plan_progress` WRITE;
/*!40000 ALTER TABLE `plan_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_user`
--

DROP TABLE IF EXISTS `plan_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_user` (
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `pu_isadmin` tinyint(1) NOT NULL,
  KEY `fk_plan` (`p_id`),
  KEY `fk_user` (`u_id`),
  CONSTRAINT `plan_user_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `plan` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plan_user_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_user`
--

LOCK TABLES `plan_user` WRITE;
/*!40000 ALTER TABLE `plan_user` DISABLE KEYS */;
INSERT INTO `plan_user` VALUES (1000011,10,1);
/*!40000 ALTER TABLE `plan_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `road`
--

DROP TABLE IF EXISTS `road`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `road` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) NOT NULL,
  `r_type` varchar(50) DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  `r_x` double NOT NULL,
  `r_y` double NOT NULL,
  `r_length` double DEFAULT NULL,
  `r_width` double DEFAULT NULL,
  `r_date` datetime NOT NULL,
  `r_state` varchar(50) NOT NULL,
  `r_note` varchar(100) DEFAULT NULL,
  `r_m_type` varchar(50) DEFAULT NULL,
  `r_m_length` double DEFAULT NULL,
  `r_m_width` double DEFAULT NULL,
  `r_m_density` double DEFAULT NULL,
  `r_m_grade` int DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `fk_user` (`u_id`),
  CONSTRAINT `road_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `road`
--

LOCK TABLES `road` WRITE;
/*!40000 ALTER TABLE `road` DISABLE KEYS */;
INSERT INTO `road` VALUES (1000002,'首南街道','沥青',1,29.813794,121.571622,200,15,'2020-02-02 00:00:00','未分配','','裂缝',3,0.1,0.05,10);
/*!40000 ALTER TABLE `road` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(50) NOT NULL,
  `t_type` varchar(50) NOT NULL,
  `t_note` varchar(100) DEFAULT NULL,
  `w_id` int NOT NULL,
  PRIMARY KEY (`t_id`),
  KEY `fk_warehouse` (`w_id`),
  CONSTRAINT `tool_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `warehouse` (`w_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1000003,'水泥','材料',NULL,1000002),(1000004,'水泥车','车辆',NULL,1000003);
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_record`
--

DROP TABLE IF EXISTS `tool_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_record` (
  `tr_id` int NOT NULL AUTO_INCREMENT,
  `t_id` int NOT NULL,
  `w_id` int NOT NULL,
  `p_id` int DEFAULT NULL,
  `u_id` int NOT NULL,
  `tr_date` datetime NOT NULL,
  `tr_type` varchar(50) NOT NULL,
  `tr_num` int NOT NULL,
  `tr_note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tr_id`),
  KEY `fk_tool` (`t_id`),
  KEY `fk_warehouse` (`w_id`),
  KEY `fk_plan` (`p_id`),
  KEY `fk_user` (`u_id`),
  CONSTRAINT `tool_record_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `tool` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tool_record_ibfk_2` FOREIGN KEY (`w_id`) REFERENCES `warehouse` (`w_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tool_record_ibfk_3` FOREIGN KEY (`p_id`) REFERENCES `plan` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tool_record_ibfk_4` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_record`
--

LOCK TABLES `tool_record` WRITE;
/*!40000 ALTER TABLE `tool_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) NOT NULL,
  `u_pwd` varchar(50) NOT NULL DEFAULT '123456',
  `u_phone` varchar(50) DEFAULT NULL,
  `u_type` varchar(50) NOT NULL,
  `u_class` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_phone` (`u_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1000010 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456','123456','管理员','管理员'),(10,'张胜','123456','1112','维护人员','道路工程师'),(22,'李明','123456','15858581212','维护人员','司机'),(1000000,'test','123456','12345676','资料人员','资料人员'),(1000001,'李敏','123456','15358581212','维护人员','项目主管'),(1000003,'吴孟涛','123456','1234564444','管理员','系统维护人员'),(1000004,'徐恺航','123456','1234564445','管理员','系统维护人员'),(1000008,'admin','123456','111222','管理员','管理员'),(1000009,'admin','123456','1112255','请选择','管理员');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `w_id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `w_place` varchar(50) NOT NULL,
  `w_size` double DEFAULT NULL,
  PRIMARY KEY (`w_id`),
  KEY `warehouse_ibfk_1` (`u_id`),
  CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1000002,1,'仓库1',20),(1000003,1,'车库',100);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19 16:23:16

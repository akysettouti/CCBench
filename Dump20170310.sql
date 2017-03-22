CREATE DATABASE  IF NOT EXISTS `cc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cc`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cc
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `experiment`
--

DROP TABLE IF EXISTS `experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moment` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment`
--

LOCK TABLES `experiment` WRITE;
/*!40000 ALTER TABLE `experiment` DISABLE KEYS */;
INSERT INTO `experiment` VALUES (11,'2017-03-09 20:32:05');
/*!40000 ALTER TABLE `experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  `vCPU` int(11) DEFAULT NULL,
  `ECU` decimal(5,2) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `HDD` int(11) DEFAULT NULL,
  `BW` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` VALUES (1,'Small-2',1,2.20,1,50,5120),(2,'Small-3',1,2.20,2,50,5120),(3,'Medium-1',2,4.40,2,50,5120),(4,'Medium-3',4,8.80,8,80,5120),(5,'Large-1',8,17.60,16,160,5120),(6,'Large-2',12,26.40,32,320,5120),(7,'Large-3',16,35.20,48,480,5120),(8,'XLarge',20,44.00,64,640,5120);
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `instance_complete`
--

DROP TABLE IF EXISTS `instance_complete`;
/*!50001 DROP VIEW IF EXISTS `instance_complete`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `instance_complete` AS SELECT 
 1 AS `code`,
 1 AS `provider_id`,
 1 AS `location_id`,
 1 AS `instance_id`,
 1 AS `name`,
 1 AS `Instance`,
 1 AS `vCPU`,
 1 AS `ECU`,
 1 AS `RAM`,
 1 AS `HDD`,
 1 AS `BW`,
 1 AS `hour_price`,
 1 AS `month_price`,
 1 AS `bw_price`,
 1 AS `Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Zurich','Switzerland'),(2,'Washington DC','USA'),(3,'San Jose','USA'),(4,'Miami','USA'),(5,'Honolulu','USA'),(6,'Perth','Australia'),(7,'Manila','Philippines'),(8,'Warsaw','Poland'),(9,'Frankfurt','Germany'),(10,'Tlemcen','Algeria');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_pricing`
--

DROP TABLE IF EXISTS `location_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_pricing` (
  `provider` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `hour_price` decimal(10,5) DEFAULT NULL,
  `month_price` decimal(10,5) DEFAULT NULL,
  `bw_price` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`provider`,`location`,`instance`),
  KEY `fk_bw_location_idx` (`location`),
  KEY `fk_bw_instance_idx` (`instance`),
  CONSTRAINT `fk_bw_instance` FOREIGN KEY (`instance`) REFERENCES `instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bw_location` FOREIGN KEY (`location`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bw_provider` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_pricing`
--

LOCK TABLES `location_pricing` WRITE;
/*!40000 ALTER TABLE `location_pricing` DISABLE KEYS */;
INSERT INTO `location_pricing` VALUES (1,1,1,0.01950,14.00000,0.04430),(1,2,1,0.02900,20.00000,0.04430),(1,3,1,0.04800,34.00000,0.04430),(1,4,1,0.15800,96.00000,0.04430),(1,5,1,0.34200,203.00000,0.04430),(1,6,1,0.63500,361.00000,0.04430),(1,7,1,0.92700,519.00000,0.04430),(1,8,1,1.21900,677.00000,0.04430),(1,1,2,0.01300,14.00000,0.04000),(1,2,2,0.02000,20.00000,0.04000),(1,3,2,0.03200,34.00000,0.04000),(1,4,2,0.10900,96.00000,0.04000),(1,5,2,0.24400,203.00000,0.04000),(1,6,2,0.46100,361.00000,0.04000),(1,7,2,0.67900,519.00000,0.04000),(1,8,2,0.89700,677.00000,0.04000),(1,1,3,0.01300,14.00000,0.04000),(1,2,3,0.02000,20.00000,0.04000),(1,3,3,0.03200,34.00000,0.04000),(1,4,3,0.10900,96.00000,0.04000),(1,5,3,0.24400,203.00000,0.04000),(1,6,3,0.46100,361.00000,0.04000),(1,7,3,0.67900,519.00000,0.04000),(1,8,3,0.89700,677.00000,0.04000),(1,1,4,0.01300,14.00000,0.04000),(1,2,4,0.02000,20.00000,0.04000),(1,3,4,0.03200,34.00000,0.04000),(1,4,4,0.10900,96.00000,0.04000),(1,5,4,0.24400,203.00000,0.04000),(1,6,4,0.46100,361.00000,0.04000),(1,7,4,0.67900,519.00000,0.04000),(1,8,4,0.89700,677.00000,0.04000),(1,1,5,0.05300,14.00000,0.07150),(1,2,5,0.02000,20.00000,0.07150),(1,3,5,0.03200,34.00000,0.07150),(1,4,5,0.10900,96.00000,0.07150),(1,5,5,0.24400,203.00000,0.07150),(1,6,5,0.46100,361.00000,0.07150),(1,7,5,0.67900,519.00000,0.07150),(1,8,5,0.89700,677.00000,0.07150),(1,1,6,0.75100,14.00000,0.01118),(1,2,6,0.76800,20.00000,0.01118),(1,3,6,0.79300,34.00000,0.01118),(1,4,6,0.95600,96.00000,0.01118),(1,5,6,1.22100,203.00000,0.01118),(1,6,6,1.64800,361.00000,0.01118),(1,7,6,2.07500,519.00000,0.01118),(1,8,6,2.50200,677.00000,0.01118),(1,1,7,0.04700,14.00000,0.01708),(1,2,7,0.07200,20.00000,0.01708),(1,3,7,0.09500,34.00000,0.01708),(1,4,7,0.29900,96.00000,0.01708),(1,5,7,0.61900,203.00000,0.01708),(1,6,7,1.16800,361.00000,0.01708),(1,7,7,1.71700,519.00000,0.01708),(1,8,7,2.26600,677.00000,0.01708),(1,1,8,0.02400,14.00000,0.04020),(1,2,8,0.03200,20.00000,0.04020),(1,3,8,0.04800,34.00000,0.04020),(1,4,8,0.13400,96.00000,0.04020),(1,5,8,0.27600,203.00000,0.04020),(1,6,8,0.49800,361.00000,0.04020),(1,7,8,0.72000,519.00000,0.04020),(1,8,8,0.94200,677.00000,0.04020),(1,1,9,0.02000,14.00000,0.04180),(1,2,9,0.02700,20.00000,0.04180),(1,3,9,0.04000,34.00000,0.04180),(1,4,9,0.11400,96.00000,0.04180),(1,5,9,0.23900,203.00000,0.04180),(1,6,9,0.43800,361.00000,0.04180),(1,7,9,0.63600,519.00000,0.04180),(1,8,9,0.83400,677.00000,0.04180);
/*!40000 ALTER TABLE `location_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_performance`
--

DROP TABLE IF EXISTS `network_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_performance` (
  `provider_location` int(11) NOT NULL,
  `client_location` int(11) NOT NULL,
  `network_time_period` int(11) NOT NULL,
  `availability` decimal(6,3) DEFAULT '99.950',
  PRIMARY KEY (`provider_location`,`client_location`),
  KEY `fk_network_time_wsn_idx` (`client_location`),
  CONSTRAINT `fk_network_performance_location` FOREIGN KEY (`client_location`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_network_time_location` FOREIGN KEY (`provider_location`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_performance`
--

LOCK TABLES `network_performance` WRITE;
/*!40000 ALTER TABLE `network_performance` DISABLE KEYS */;
INSERT INTO `network_performance` VALUES (1,10,120,99.950),(2,10,132,99.990),(3,10,100,99.940),(4,10,83,90.000),(5,10,42,89.000),(6,10,56,95.890),(7,10,189,80.000),(8,10,200,99.950),(9,10,23,97.990);
/*!40000 ALTER TABLE `network_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(45) DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `transmitting_period` int(11) DEFAULT NULL,
  `protocole` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_UNIQUE` (`reference`),
  KEY `fk_node_protocole_idx` (`protocole`),
  CONSTRAINT `fk_node_protocole` FOREIGN KEY (`protocole`) REFERENCES `wireless_protocole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'Arago Systems','WisMote',90,1),(2,'Arago Systems','WisMote+WisGate',2000,2),(3,'Arago Systems','WisMote+SHT15',90,1),(4,'Arago Systems','WisMote+SHT21',90,1),(5,'Arago Systems','WisMote+SHT75',90,1),(6,'Arago Systems','WisMote+SHT15+WiseGate',2000,2),(7,'Arago Systems','WisMote+SHT21+WiseGate',2000,2),(8,'Arago Systems','WisMote+SHT75+WiseGate',2000,2);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_sensor`
--

DROP TABLE IF EXISTS `node_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_sensor` (
  `node` int(11) NOT NULL,
  `sensor` varchar(45) NOT NULL,
  PRIMARY KEY (`node`,`sensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_sensor`
--

LOCK TABLES `node_sensor` WRITE;
/*!40000 ALTER TABLE `node_sensor` DISABLE KEYS */;
INSERT INTO `node_sensor` VALUES (1,'4'),(1,'5'),(2,'4'),(2,'5'),(3,'1'),(3,'4'),(3,'5'),(4,'2'),(4,'4'),(4,'5'),(5,'3'),(5,'4'),(5,'5'),(6,'1'),(6,'4'),(6,'5'),(7,'2'),(7,'4'),(7,'5'),(8,'3'),(8,'4'),(8,'5');
/*!40000 ALTER TABLE `node_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `node_sensor_complete`
--

DROP TABLE IF EXISTS `node_sensor_complete`;
/*!50001 DROP VIEW IF EXISTS `node_sensor_complete`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `node_sensor_complete` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `actuation`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'CloudSigma');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_measure`
--

DROP TABLE IF EXISTS `quality_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(10) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_measure`
--

LOCK TABLES `quality_measure` WRITE;
/*!40000 ALTER TABLE `quality_measure` DISABLE KEYS */;
INSERT INTO `quality_measure` VALUES (1,'RT','Cloud Computing Service Response Time'),(2,'Av','Cloud Computing Service Availability'),(3,'SM','Saved Money');
/*!40000 ALTER TABLE `quality_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `experiment` int(11) NOT NULL,
  `approach` varchar(50) NOT NULL,
  `instance` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `provider` int(11) NOT NULL,
  `wsn` int(11) NOT NULL,
  `time` bigint(64) NOT NULL,
  `score` double NOT NULL,
  PRIMARY KEY (`experiment`,`approach`,`instance`,`user`,`location`,`provider`,`wsn`),
  KEY `fk_instance_idx` (`instance`),
  KEY `fk_user_idx` (`user`),
  KEY `fk_user_result_idx` (`user`),
  KEY `fk_location_idx` (`location`),
  KEY `fk_provider_idx` (`provider`),
  KEY `fk_wsn_idx` (`wsn`),
  KEY `fk_wsn_result_idx` (`wsn`),
  CONSTRAINT `fk_experiment` FOREIGN KEY (`experiment`) REFERENCES `experiment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_instance` FOREIGN KEY (`instance`) REFERENCES `instance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_location` FOREIGN KEY (`location`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_provider` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_result` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wsn_result` FOREIGN KEY (`wsn`) REFERENCES `wsn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (11,'OriginalBCloudTree',1,1,1,1,3,0,70.15),(11,'OriginalBCloudTree',1,1,1,1,4,0,70.15),(11,'OriginalBCloudTree',1,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',1,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',1,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',1,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',1,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',1,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',1,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',1,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',1,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',1,2,1,1,3,0,15.7),(11,'OriginalBCloudTree',1,2,1,1,4,0,15.7),(11,'OriginalBCloudTree',1,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',1,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',1,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',1,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',1,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',1,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',1,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',1,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',1,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',1,3,1,1,3,0,15.15),(11,'OriginalBCloudTree',1,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',1,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',1,3,9,1,4,1,15.15),(11,'OriginalBCloudTree',2,1,1,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,1,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',2,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',2,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',2,2,1,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,1,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',2,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',2,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',2,3,1,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',2,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',2,3,9,1,4,1,15.15),(11,'OriginalBCloudTree',3,1,1,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,1,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',3,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',3,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',3,2,1,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,1,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',3,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',3,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',3,3,1,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',3,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',3,3,9,1,4,1,15.15),(11,'OriginalBCloudTree',4,1,1,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,1,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,1,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,2,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,3,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,4,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,5,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,6,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,7,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,8,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',4,1,9,1,2,1,70.15),(11,'OriginalBCloudTree',4,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',4,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',4,2,1,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,1,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,1,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,2,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,3,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,4,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,5,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,6,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,7,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,8,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',4,2,9,1,2,1,15.7),(11,'OriginalBCloudTree',4,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',4,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',4,3,1,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,1,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,2,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,3,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,4,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,5,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,6,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,7,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,8,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',4,3,9,1,2,1,15.15),(11,'OriginalBCloudTree',4,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',4,3,9,1,4,1,15.15),(11,'OriginalBCloudTree',5,1,1,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,1,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,1,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,2,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,3,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,4,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,5,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,6,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,7,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,8,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',5,1,9,1,2,1,70.15),(11,'OriginalBCloudTree',5,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',5,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',5,2,1,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,1,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,1,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,2,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,3,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,4,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,5,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,6,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,7,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,8,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',5,2,9,1,2,1,15.7),(11,'OriginalBCloudTree',5,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',5,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',5,3,1,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,1,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,2,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,3,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,4,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,5,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,6,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,7,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,8,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',5,3,9,1,2,1,15.15),(11,'OriginalBCloudTree',5,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',5,3,9,1,4,1,15.15),(11,'OriginalBCloudTree',6,1,1,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,1,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,1,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,2,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,3,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,4,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,5,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,6,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,7,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,8,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',6,1,9,1,2,1,70.15),(11,'OriginalBCloudTree',6,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',6,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',6,2,1,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,1,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,1,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,2,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,3,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,4,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,5,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,6,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,7,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,8,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',6,2,9,1,2,1,15.7),(11,'OriginalBCloudTree',6,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',6,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',6,3,1,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,1,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,2,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,3,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,4,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,5,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,6,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,7,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,8,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',6,3,9,1,2,1,15.15),(11,'OriginalBCloudTree',6,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',6,3,9,1,4,1,15.15),(11,'OriginalBCloudTree',7,1,1,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,1,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,1,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,2,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,3,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,4,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,5,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,6,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,7,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,8,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',7,1,9,1,2,1,70.15),(11,'OriginalBCloudTree',7,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',7,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',7,2,1,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,1,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,1,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,2,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,3,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,4,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,5,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,6,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,7,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,8,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',7,2,9,1,2,1,15.7),(11,'OriginalBCloudTree',7,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',7,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',7,3,1,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,1,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,2,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,3,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,4,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,5,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,6,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,7,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,8,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',7,3,9,1,2,1,15.15),(11,'OriginalBCloudTree',7,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',7,3,9,1,4,1,15.15),(11,'OriginalBCloudTree',8,1,1,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,1,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,1,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,2,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,2,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,2,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,3,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,3,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,3,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,4,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,4,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,4,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,5,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,5,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,5,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,6,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,6,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,6,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,7,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,7,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,7,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,8,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,8,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,8,1,4,1,70.15),(11,'OriginalBCloudTree',8,1,9,1,2,1,70.15),(11,'OriginalBCloudTree',8,1,9,1,3,1,70.15),(11,'OriginalBCloudTree',8,1,9,1,4,1,70.15),(11,'OriginalBCloudTree',8,2,1,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,1,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,1,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,2,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,2,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,2,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,3,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,3,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,3,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,4,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,4,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,4,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,5,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,5,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,5,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,6,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,6,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,6,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,7,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,7,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,7,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,8,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,8,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,8,1,4,1,15.7),(11,'OriginalBCloudTree',8,2,9,1,2,1,15.7),(11,'OriginalBCloudTree',8,2,9,1,3,1,15.7),(11,'OriginalBCloudTree',8,2,9,1,4,1,15.7),(11,'OriginalBCloudTree',8,3,1,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,1,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,1,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,2,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,2,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,2,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,3,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,3,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,3,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,4,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,4,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,4,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,5,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,5,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,5,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,6,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,6,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,6,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,7,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,7,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,7,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,8,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,8,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,8,1,4,1,15.15),(11,'OriginalBCloudTree',8,3,9,1,2,1,15.15),(11,'OriginalBCloudTree',8,3,9,1,3,1,15.15),(11,'OriginalBCloudTree',8,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',1,1,1,1,3,0,70.15),(11,'ProposedBCloudTree',1,1,1,1,4,0,70.15),(11,'ProposedBCloudTree',1,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',1,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',1,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',1,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',1,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',1,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',1,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',1,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',1,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',1,2,1,1,3,0,15.7),(11,'ProposedBCloudTree',1,2,1,1,4,0,15.7),(11,'ProposedBCloudTree',1,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',1,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',1,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',1,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',1,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',1,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',1,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',1,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',1,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',1,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,1,1,4,0,15.15),(11,'ProposedBCloudTree',1,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',1,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',1,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',1,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',1,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',1,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',1,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',1,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',1,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',2,1,1,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,1,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',2,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',2,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',2,2,1,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,1,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',2,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',2,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',2,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,1,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',2,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',2,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',3,1,1,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,1,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',3,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',3,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',3,2,1,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,1,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',3,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',3,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',3,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,1,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',3,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',3,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',4,1,1,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,1,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,1,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,2,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,3,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,4,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,5,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,6,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,7,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,8,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',4,1,9,1,2,1,70.15),(11,'ProposedBCloudTree',4,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',4,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',4,2,1,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,1,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,1,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,2,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,3,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,4,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,5,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,6,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,7,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,8,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',4,2,9,1,2,1,15.7),(11,'ProposedBCloudTree',4,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',4,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',4,3,1,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,1,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,2,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,3,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,4,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,5,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,6,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,7,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,8,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',4,3,9,1,2,1,15.15),(11,'ProposedBCloudTree',4,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',4,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',5,1,1,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,1,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,1,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,2,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,3,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,4,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,5,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,6,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,7,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,8,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',5,1,9,1,2,1,70.15),(11,'ProposedBCloudTree',5,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',5,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',5,2,1,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,1,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,1,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,2,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,3,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,4,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,5,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,6,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,7,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,8,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',5,2,9,1,2,1,15.7),(11,'ProposedBCloudTree',5,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',5,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',5,3,1,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,1,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,2,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,3,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,4,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,5,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,6,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,7,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,8,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',5,3,9,1,2,1,15.15),(11,'ProposedBCloudTree',5,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',5,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',6,1,1,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,1,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,1,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,2,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,3,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,4,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,5,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,6,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,7,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,8,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',6,1,9,1,2,1,70.15),(11,'ProposedBCloudTree',6,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',6,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',6,2,1,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,1,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,1,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,2,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,3,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,4,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,5,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,6,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,7,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,8,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',6,2,9,1,2,1,15.7),(11,'ProposedBCloudTree',6,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',6,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',6,3,1,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,1,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,2,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,3,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,4,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,5,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,6,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,7,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,8,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',6,3,9,1,2,1,15.15),(11,'ProposedBCloudTree',6,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',6,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',7,1,1,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,1,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,1,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,2,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,3,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,4,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,5,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,6,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,7,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,8,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',7,1,9,1,2,1,70.15),(11,'ProposedBCloudTree',7,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',7,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',7,2,1,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,1,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,1,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,2,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,3,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,4,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,5,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,6,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,7,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,8,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',7,2,9,1,2,1,15.7),(11,'ProposedBCloudTree',7,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',7,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',7,3,1,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,1,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,2,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,3,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,4,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,5,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,6,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,7,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,8,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',7,3,9,1,2,1,15.15),(11,'ProposedBCloudTree',7,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',7,3,9,1,4,1,15.15),(11,'ProposedBCloudTree',8,1,1,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,1,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,1,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,2,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,2,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,2,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,3,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,3,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,3,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,4,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,4,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,4,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,5,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,5,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,5,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,6,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,6,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,6,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,7,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,7,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,7,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,8,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,8,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,8,1,4,1,70.15),(11,'ProposedBCloudTree',8,1,9,1,2,1,70.15),(11,'ProposedBCloudTree',8,1,9,1,3,1,70.15),(11,'ProposedBCloudTree',8,1,9,1,4,1,70.15),(11,'ProposedBCloudTree',8,2,1,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,1,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,1,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,2,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,2,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,2,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,3,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,3,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,3,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,4,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,4,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,4,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,5,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,5,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,5,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,6,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,6,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,6,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,7,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,7,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,7,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,8,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,8,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,8,1,4,1,15.7),(11,'ProposedBCloudTree',8,2,9,1,2,1,15.7),(11,'ProposedBCloudTree',8,2,9,1,3,1,15.7),(11,'ProposedBCloudTree',8,2,9,1,4,1,15.7),(11,'ProposedBCloudTree',8,3,1,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,1,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,1,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,2,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,2,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,2,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,3,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,3,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,3,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,4,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,4,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,4,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,5,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,5,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,5,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,6,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,6,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,6,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,7,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,7,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,7,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,8,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,8,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,8,1,4,1,15.15),(11,'ProposedBCloudTree',8,3,9,1,2,1,15.15),(11,'ProposedBCloudTree',8,3,9,1,3,1,15.15),(11,'ProposedBCloudTree',8,3,9,1,4,1,15.15);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(45) DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `phenomenon` varchar(45) DEFAULT NULL,
  `actuation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'Sensirion','SHT15','Temperature, Humidity','26'),(2,'Sensirion','SHT21','Temperature, Humidity','26'),(3,'Sensirion','SHT75','Temperature, Humidity','26'),(4,'avago','APDS9007','Ambiant Light','10'),(5,'Arduino playground','MMA7455','Accelration','10');
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_function`
--

DROP TABLE IF EXISTS `service_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acronym` varchar(45) NOT NULL,
  `client` enum('Client','Node') DEFAULT 'Node',
  `description` text,
  `ecu` decimal(20,15) DEFAULT NULL,
  `ram` decimal(20,15) DEFAULT NULL,
  `hdd` decimal(20,15) DEFAULT NULL,
  `datarate` decimal(20,15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_function`
--

LOCK TABLES `service_function` WRITE;
/*!40000 ALTER TABLE `service_function` DISABLE KEYS */;
INSERT INTO `service_function` VALUES (1,'User Control','Client','A process insuring users privileges, connections and securities.',0.097656250000000,0.000976562500000,0.000000000000000,0.000244140625000),(2,'Encoding','Node','A process collected data to encoded values (string, double or integer)',0.117187500000000,0.000976562500000,0.000000000000000,0.000000000000000),(3,'Encryption/Decryption','Node','A process to encrypt or decrypt the encoded values form collected sensor data (DES, AES...etc).',0.126953125000000,0.002441406250000,0.000000000000000,0.000000000000000),(4,'Data Analysis','Client','A Graphical analysis tools for Users to ease decision making.',0.292968750000000,0.244140625000000,0.000000000000000,0.014648437500000),(5,'User Alert','Client','A user mail notification in case of out of bound phenomena measures.',0.000488281250000,0.001953125000000,0.000000000000000,0.000000000000001);
/*!40000 ALTER TABLE `service_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ahmed','SETTOUTI'),(2,'Yassine','SETTOUTI'),(3,'Khalid','SETTOUTI');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_complete`
--

DROP TABLE IF EXISTS `user_complete`;
/*!50001 DROP VIEW IF EXISTS `user_complete`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_complete` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `RT`,
 1 AS `Av`,
 1 AS `SM`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_quality_measure`
--

DROP TABLE IF EXISTS `user_quality_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_quality_measure` (
  `user` int(11) NOT NULL,
  `quality_measure` int(11) NOT NULL,
  `score` int(3) DEFAULT NULL,
  PRIMARY KEY (`user`,`quality_measure`),
  KEY `fk_quality_measure_idx` (`quality_measure`),
  CONSTRAINT `fk_quality_measure` FOREIGN KEY (`quality_measure`) REFERENCES `quality_measure` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_quality_measure`
--

LOCK TABLES `user_quality_measure` WRITE;
/*!40000 ALTER TABLE `user_quality_measure` DISABLE KEYS */;
INSERT INTO `user_quality_measure` VALUES (1,1,15),(1,2,15),(1,3,70),(2,1,15),(2,2,70),(2,3,15),(3,1,70),(3,2,15),(3,3,15);
/*!40000 ALTER TABLE `user_quality_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wireless_protocole`
--

DROP TABLE IF EXISTS `wireless_protocole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wireless_protocole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `min_frequency` decimal(10,2) DEFAULT NULL,
  `max_frequency` decimal(10,2) DEFAULT NULL,
  `datarate` int(11) DEFAULT NULL,
  `range` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wireless_protocole`
--

LOCK TABLES `wireless_protocole` WRITE;
/*!40000 ALTER TABLE `wireless_protocole` DISABLE KEYS */;
INSERT INTO `wireless_protocole` VALUES (1,'ZigBee',2400.00,2400.00,250,100),(2,'Wifi',2400.00,2400.00,55296,140);
/*!40000 ALTER TABLE `wireless_protocole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wsn`
--

DROP TABLE IF EXISTS `wsn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wsn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_period` int(11) NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `total_user` int(11) NOT NULL,
  `connected_user` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wsn_location_idx` (`location`),
  CONSTRAINT `fk_wsn_location` FOREIGN KEY (`location`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wsn`
--

LOCK TABLES `wsn` WRITE;
/*!40000 ALTER TABLE `wsn` DISABLE KEYS */;
INSERT INTO `wsn` VALUES (1,8760,1000.00,100,50,10),(2,360,10000.00,50,25,10),(3,360,100000.00,50,25,10),(4,168,1000000.00,50,25,10);
/*!40000 ALTER TABLE `wsn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wsn_complete`
--

DROP TABLE IF EXISTS `wsn_complete`;
/*!50001 DROP VIEW IF EXISTS `wsn_complete`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wsn_complete` AS SELECT 
 1 AS `id`,
 1 AS `budget`,
 1 AS `mission_period`,
 1 AS `ecu`,
 1 AS `ram`,
 1 AS `hdd`,
 1 AS `bw`,
 1 AS `location`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wsn_node`
--

DROP TABLE IF EXISTS `wsn_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wsn_node` (
  `wsn` int(11) NOT NULL,
  `node` int(11) NOT NULL,
  `x` decimal(10,2) NOT NULL,
  `y` decimal(10,2) NOT NULL,
  PRIMARY KEY (`wsn`,`node`,`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wsn_node`
--

LOCK TABLES `wsn_node` WRITE;
/*!40000 ALTER TABLE `wsn_node` DISABLE KEYS */;
INSERT INTO `wsn_node` VALUES (1,1,10.00,10.00),(1,2,90.00,90.00),(1,3,20.00,10.00),(1,4,10.00,20.00),(1,5,30.00,30.00),(1,6,0.00,90.00),(2,3,10.00,10.00),(2,8,30.00,30.00),(3,8,10.00,10.00),(4,1,4.00,4.00);
/*!40000 ALTER TABLE `wsn_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wsn_node_complete`
--

DROP TABLE IF EXISTS `wsn_node_complete`;
/*!50001 DROP VIEW IF EXISTS `wsn_node_complete`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wsn_node_complete` AS SELECT 
 1 AS `wsn_id`,
 1 AS `ecu`,
 1 AS `ram`,
 1 AS `hdd`,
 1 AS `bw`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wsn_service_function`
--

DROP TABLE IF EXISTS `wsn_service_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wsn_service_function` (
  `service_function` int(11) NOT NULL,
  `wsn` int(11) NOT NULL,
  PRIMARY KEY (`service_function`,`wsn`),
  KEY `fk_wsn_idx` (`wsn`),
  CONSTRAINT `fk_service_function` FOREIGN KEY (`service_function`) REFERENCES `service_function` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wsn` FOREIGN KEY (`wsn`) REFERENCES `wsn` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wsn_service_function`
--

LOCK TABLES `wsn_service_function` WRITE;
/*!40000 ALTER TABLE `wsn_service_function` DISABLE KEYS */;
INSERT INTO `wsn_service_function` VALUES (1,1),(2,1),(5,1),(2,2),(5,2),(2,3),(5,3),(2,4),(5,4);
/*!40000 ALTER TABLE `wsn_service_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wsn_service_function_complete`
--

DROP TABLE IF EXISTS `wsn_service_function_complete`;
/*!50001 DROP VIEW IF EXISTS `wsn_service_function_complete`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wsn_service_function_complete` AS SELECT 
 1 AS `id`,
 1 AS `ecu`,
 1 AS `ram`,
 1 AS `hdd`,
 1 AS `datarate`,
 1 AS `type`,
 1 AS `location`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'cc'
--

--
-- Dumping routines for database 'cc'
--

--
-- Final view structure for view `instance_complete`
--

/*!50001 DROP VIEW IF EXISTS `instance_complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`saky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instance_complete` AS select concat(`provider`.`id`,`location`.`id`,`instance`.`id`) AS `code`,`provider`.`id` AS `provider_id`,`location`.`id` AS `location_id`,`instance`.`id` AS `instance_id`,`provider`.`name` AS `name`,`instance`.`label` AS `Instance`,`instance`.`vCPU` AS `vCPU`,`instance`.`ECU` AS `ECU`,`instance`.`RAM` AS `RAM`,`instance`.`HDD` AS `HDD`,`instance`.`BW` AS `BW`,`location_pricing`.`hour_price` AS `hour_price`,`location_pricing`.`month_price` AS `month_price`,`location_pricing`.`bw_price` AS `bw_price`,concat(`location`.`city`,'-',`location`.`country`) AS `Location` from (((`instance` join `provider`) join `location_pricing`) join `location`) where ((`location_pricing`.`location` = `location`.`id`) and (`location_pricing`.`provider` = `provider`.`id`) and (`location_pricing`.`instance` = `instance`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `node_sensor_complete`
--

/*!50001 DROP VIEW IF EXISTS `node_sensor_complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`saky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `node_sensor_complete` AS select `node`.`id` AS `id`,concat(`node`.`provider`,' ',`node`.`reference`) AS `name`,ceiling((sum(`sensor`.`actuation`) / 8)) AS `actuation` from (((`sensor` join `node_sensor`) join `node`) join `wireless_protocole`) where ((`sensor`.`id` = `node_sensor`.`sensor`) and (`node_sensor`.`node` = `node`.`id`) and (`wireless_protocole`.`id` = `node`.`protocole`)) group by `node`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_complete`
--

/*!50001 DROP VIEW IF EXISTS `user_complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`saky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_complete` AS select `user`.`id` AS `id`,`user`.`firstname` AS `firstname`,`user`.`lastname` AS `lastname`,`a1`.`score` AS `RT`,`a2`.`score` AS `Av`,`a3`.`score` AS `SM` from (((`user` join `user_quality_measure` `a1`) join `user_quality_measure` `a2`) join `user_quality_measure` `a3`) where ((`a1`.`quality_measure` = 1) and (`a2`.`quality_measure` = 2) and (`a3`.`quality_measure` = 3) and (`a1`.`user` = `user`.`id`) and (`a2`.`user` = `user`.`id`) and (`a3`.`user` = `user`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wsn_complete`
--

/*!50001 DROP VIEW IF EXISTS `wsn_complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`saky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wsn_complete` AS select `wsn`.`id` AS `id`,`wsn`.`budget` AS `budget`,`wsn`.`mission_period` AS `mission_period`,((sum(`wsn_service_function_complete`.`ecu`) * `wsn`.`connected_user`) + `wsn_node_complete`.`ecu`) AS `ecu`,((sum(`wsn_service_function_complete`.`ram`) * `wsn`.`connected_user`) + `wsn_node_complete`.`ram`) AS `ram`,(sum((`wsn_service_function_complete`.`hdd` * `wsn`.`total_user`)) + `wsn_node_complete`.`hdd`) AS `hdd`,((((sum(`wsn_service_function_complete`.`datarate`) * `wsn`.`mission_period`) * `wsn`.`connected_user`) * 12656.25) + `wsn_node_complete`.`bw`) AS `bw`,`wsn`.`location` AS `location` from ((`wsn` join `wsn_node_complete`) join `wsn_service_function_complete`) where ((`wsn_service_function_complete`.`type` = 'Client') and (`wsn`.`id` = `wsn_node_complete`.`wsn_id`) and (`wsn`.`id` = `wsn_service_function_complete`.`id`)) group by `wsn`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wsn_node_complete`
--

/*!50001 DROP VIEW IF EXISTS `wsn_node_complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`saky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wsn_node_complete` AS select `wsn`.`id` AS `wsn_id`,(sum(`wsn_service_function_complete`.`ecu`) * count(`wsn_node`.`node`)) AS `ecu`,(sum(`wsn_service_function_complete`.`ram`) * count(`wsn_node`.`node`)) AS `ram`,((sum(`wsn_service_function_complete`.`hdd`) * count(`wsn_node`.`node`)) + ((sum(`node_sensor_complete`.`actuation`) * `wsn`.`mission_period`) * 0.0120699405670166)) AS `hdd`,(((sum(`wsn_service_function_complete`.`datarate`) * count(`wsn_node`.`node`)) * 12656.25) + ((sum(`node_sensor_complete`.`actuation`) * 0.0120699405670166) * `wsn`.`mission_period`)) AS `bw` from (((`wsn` join `wsn_node`) join `node_sensor_complete`) join `wsn_service_function_complete`) where ((`wsn_service_function_complete`.`type` = 'Node') and (`wsn`.`id` = `wsn_node`.`wsn`) and (`wsn_node`.`node` = `node_sensor_complete`.`id`) and (`wsn`.`id` = `wsn_service_function_complete`.`id`)) group by `wsn`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wsn_service_function_complete`
--

/*!50001 DROP VIEW IF EXISTS `wsn_service_function_complete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`saky`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wsn_service_function_complete` AS select `wsn`.`id` AS `id`,sum(`service_function`.`ecu`) AS `ecu`,sum(`service_function`.`ram`) AS `ram`,sum(`service_function`.`hdd`) AS `hdd`,sum(`service_function`.`datarate`) AS `datarate`,'Client' AS `type`,`wsn`.`location` AS `location` from ((`wsn` join `wsn_service_function`) join `service_function`) where ((`service_function`.`client` = 'Client') and (`wsn`.`id` = `wsn_service_function`.`wsn`) and (`wsn_service_function`.`service_function` = `service_function`.`id`)) group by `wsn`.`id` union select `wsn`.`id` AS `id`,sum(`service_function`.`ecu`) AS `ecu`,sum(`service_function`.`ram`) AS `ram`,sum(`service_function`.`hdd`) AS `hdd`,sum(`service_function`.`datarate`) AS `datarate`,'Node' AS `type`,`wsn`.`location` AS `location` from ((`wsn` join `wsn_service_function`) join `service_function`) where ((`service_function`.`client` = 'Node') and (`wsn`.`id` = `wsn_service_function`.`wsn`) and (`wsn_service_function`.`service_function` = `service_function`.`id`)) group by `wsn`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-10  9:31:55

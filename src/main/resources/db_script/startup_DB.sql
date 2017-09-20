CREATE DATABASE  IF NOT EXISTS `startups_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `startups_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: startups_db
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `investors`
--

DROP TABLE IF EXISTS `investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `INVESTMENTS` decimal(19,2) DEFAULT NULL,
  `INVESTOR_USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors`
--

LOCK TABLES `investors` WRITE;
/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` VALUES (1,10000.00,1);
/*!40000 ALTER TABLE `investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_TYPE` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t4udapikfkh2xv77a3qe8hdrm` (`ROLE_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startup_details`
--

DROP TABLE IF EXISTS `startup_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startup_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BUSINESS_MODEL` varchar(500) DEFAULT NULL,
  `COMPETITORS` varchar(500) DEFAULT NULL,
  `CURRENT_STATE` varchar(500) DEFAULT NULL,
  `GROSS_PROFIT` varchar(500) DEFAULT NULL,
  `NET_INCOME` varchar(500) DEFAULT NULL,
  `PROBLEM_OR_OPPORTUNITY` varchar(500) DEFAULT NULL,
  `PROPERTY` varchar(500) DEFAULT NULL,
  `TYPE_OF_PROPERTY` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_details`
--

LOCK TABLES `startup_details` WRITE;
/*!40000 ALTER TABLE `startup_details` DISABLE KEYS */;
INSERT INTO `startup_details` VALUES (1,'Sales','Internet sellers','idea for startup','120 000 $','45 000 $','Many competitors on market','office + car','private business');
/*!40000 ALTER TABLE `startup_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startups`
--

DROP TABLE IF EXISTS `startups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY` varchar(30) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `IDEA` varchar(1000) DEFAULT NULL,
  `INDUSTRY` varchar(30) DEFAULT NULL,
  `PROJECT_STAGE` varchar(50) DEFAULT NULL,
  `STARTUP_COST` decimal(19,2) DEFAULT NULL,
  `STARTUP_NAME` varchar(150) DEFAULT NULL,
  `TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ownerUser_id` int(11) DEFAULT NULL,
  `STARTUP_DETAILS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrm3fyaftmf1ca8hexokhm7xtj` (`ownerUser_id`),
  KEY `FKfl96cy1vv6u0diml6ayvno0um` (`STARTUP_DETAILS_ID`),
  CONSTRAINT `FKfl96cy1vv6u0diml6ayvno0um` FOREIGN KEY (`STARTUP_DETAILS_ID`) REFERENCES `startup_details` (`id`),
  CONSTRAINT `FKrm3fyaftmf1ca8hexokhm7xtj` FOREIGN KEY (`ownerUser_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startups`
--

LOCK TABLES `startups` WRITE;
/*!40000 ALTER TABLE `startups` DISABLE KEYS */;
INSERT INTO `startups` VALUES (1,'us','new Startup','todoSomething','IT','Only on paper',100000.00,'Something New',NULL,1,1);
/*!40000 ALTER TABLE `startups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startups_investors`
--

DROP TABLE IF EXISTS `startups_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startups_investors` (
  `STARTUP_ID` int(11) NOT NULL,
  `INVESTOR_ID` int(11) NOT NULL,
  KEY `FKemmpk9hsk0gm8i9f55wyyej4m` (`STARTUP_ID`),
  KEY `FK76ej85r26lsia3qnsuwjmmprr` (`INVESTOR_ID`),
  CONSTRAINT `FK76ej85r26lsia3qnsuwjmmprr` FOREIGN KEY (`INVESTOR_ID`) REFERENCES `investors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKemmpk9hsk0gm8i9f55wyyej4m` FOREIGN KEY (`STARTUP_ID`) REFERENCES `startups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startups_investors`
--

LOCK TABLES `startups_investors` WRITE;
/*!40000 ALTER TABLE `startups_investors` DISABLE KEYS */;
INSERT INTO `startups_investors` VALUES (1,1);
/*!40000 ALTER TABLE `startups_investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(60) NOT NULL,
  `FIRST_NAME` varchar(30) DEFAULT NULL,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `PHONE` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ku29j688xlci1ksopvjfgpswp` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abram@email.com','Roman','Abramovich','0000','+380910000000');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`,`ROLE_ID`),
  KEY `FKhrise9pcg12cgpvq5j7vc6wil` (`ROLE_ID`),
  CONSTRAINT `FKhrise9pcg12cgpvq5j7vc6wil` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKnbxbjebs333gdgocva79x568p` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-16 13:13:11

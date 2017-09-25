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
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `INVESTMENTS` decimal(19,2) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKdyed3bu0juuv1p50u4eebk550` (`USER_ID`),
  CONSTRAINT `FKdyed3bu0juuv1p50u4eebk550` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors`
--

LOCK TABLES `investors` WRITE;
/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` VALUES (1,10000.00,10),(2,10000.00,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (3,'ADMIN'),(2,'OWNER'),(1,'USER');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startup_details`
--

LOCK TABLES `startup_details` WRITE;
/*!40000 ALTER TABLE `startup_details` DISABLE KEYS */;
INSERT INTO `startup_details` VALUES (7,'Sales','Internet sellers','idea for startup','120 000 $','45 000 $','Many competitors on market','office + car','private business'),(8,'Производство и продажа.','Некоторые призводители гаджетов.','Есть наработки и презентационная модель.','120 000 $','45 000 $','Возможность быстрого входа на рынки Азии и восточной Европы.','2 офиса в Киеве и 6 автомобилей.','ЧП'),(9,'Sales','Internet sellers','idea for startup','120 000 $','45 000 $','Many competitors on market','office + car','private business'),(10,'Sales','Internet sellers','idea for startup','120 000 $','45 000 $','Many competitors on market','office + car','private business'),(11,'Sales','Internet sellers','idea for startup','120 000 $','45 000 $','Many competitors on market','office + car','private business'),(12,'Sales','Internet sellers','idea for startup','120 000 $','45 000 $','Many competitors on market','office + car','private business');
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
  `COUNTRY` varchar(200) DEFAULT NULL,
  `STARTUP_NAME` varchar(150) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `IMAGE_LINK` varchar(500) DEFAULT NULL,
  `IDEA` varchar(1000) DEFAULT NULL,
  `INDUSTRY` varchar(500) DEFAULT NULL,
  `PROJECT_STAGE` varchar(50) DEFAULT NULL,
  `STARTUP_COST` decimal(19,2) DEFAULT NULL,
  `TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ownerUser_id` int(11) DEFAULT NULL,
  `STARTUP_DETAILS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfl96cy1vv6u0diml6ayvno0um` (`STARTUP_DETAILS_ID`),
  KEY `FKrm3fyaftmf1ca8hexokhm7xtj` (`ownerUser_id`),
  CONSTRAINT `FKfl96cy1vv6u0diml6ayvno0um` FOREIGN KEY (`STARTUP_DETAILS_ID`) REFERENCES `startup_details` (`id`),
  CONSTRAINT `FKrm3fyaftmf1ca8hexokhm7xtj` FOREIGN KEY (`ownerUser_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startups`
--

LOCK TABLES `startups` WRITE;
/*!40000 ALTER TABLE `startups` DISABLE KEYS */;
INSERT INTO `startups` VALUES (7,'us','Брелок Hideez Key 2','Hideez Key 2 представляет собой оригинальный цифровой гаджет, исполненный в виде ключа. Созданием гаджета занималась молодая украинская команда разработчиков. Им удалось создать по-настоящему универсальное устройство, которое заслуживает внимания любителей утилитарных технических инноваций: брелок Hideez Key 2 имеет множество полезных функций, во многом упрощающие самые простые бытовые процессы, с которыми предстоит сталкиваться владельцу.','https://marketer.ua/wp-content/uploads/2017/03/Hideez-Key-2.jpg','todoSomething','IT','Only on paper',100000.00,'2017-09-21 12:17:23',11,7),(8,'Украина','Беспроводная зарядная станция Technovator','Беспроводная зарядная станция Technovator станет хорошим выбором для почитателей техники Apple: с ее помощью можно одновременно зарядить до четырех смартфонов. Во время подзарядки гаджеты помещаются в специальные чехлы, которые поставляются в комплекте. Интересной особенностью устройства является возможность зарядки смартфонов даже на расстоянии. Достаточно включить Technovator и расположить ее в радиусе пяти метров от своего телефона. Уже были предприняты попытки создать подобную технику, но лишь создателям этого гаджета удалось достичь такой внушительной дальности работы гаджета.','https://marketer.ua/wp-content/uploads/2017/03/Technovator.jpg','Гаджеты для зарядки смартфонов.','Гаджеты,Интернет и ИТ,Автотехобслуживание','Готов прототип или продукт',100000.00,'2017-09-21 16:42:52',11,8),(9,'us','Приспособление для контроля сновидений Luciding','Выставка СES 2017 представила любителям оригинальных девайсов множество остроумных технических новинок, среди которых особенное внимание привлекла новая, усовершенствованная модель устройства Luciding. Этот гаджет выглядит как повязка на голову, которая оснащена множеством датчиков и электродов. Компания, которая занимается разработкой такого устройства позиционируют его как специальный девайс, помогающий контролировать сновидения своего владельца. Этот стартап в Украине уже привлек внимание многих потенциальных покупателей.','https://marketer.ua/wp-content/uploads/2017/03/Luciding.jpg','todoSomething','IT','Only on paper',100000.00,'2017-09-21 16:43:03',11,9),(10,'us','Солнечные жалюзи SolarGaps','Достаточно интересным гаджетом, выпущенным в 2017 году, стали интересные жалюзи, которые способны превратить солнечные лучи в электроэнергию. Это стало возможным благодаря специальным фотоэлектрическим конструкциям, которые являются одними из базовых элементов устройства. Если разместить жалюзи внутри помещения, за один месяц работы они смогут выработать как минимум 100 кВт электроэнергии. При расположении в наружной части дома они смогут произвести примерно в 1,5 раза больше электричества. Оригинальная, полезная и экологичная идея обеспечила SolarGaps несомненное попадание в топ стартапов Украины.','https://marketer.ua/wp-content/uploads/2017/03/SolarGaps.jpg','todoSomething','IT','Only on paper',100000.00,'2017-09-21 16:43:11',10,10),(11,'us','VR-аттракцион от MMOne Project и VR-перчатка Raccoon.world','Вы заинтересованы гаджетами, которые помогают перенестись в виртуальную реальность? Вполне возможно, что скоро вы не ограничитесь VR-очками. Чтобы вы могли в полной мере ощутить себя в ином измерении, компания-разработчик MMOne Project создала специальное движущееся кресло, которое помогает усилить физические ощущения пользователя VR-очками или специальными шлемами. VR-аттракцион способен разворачивать человека под углом до 360 градусов, кресло способно двигаться в абсолютно любом направлении.','https://marketer.ua/wp-content/uploads/2017/03/VR-attraktsion.jpg','todoSomething','IT','Only on paper',100000.00,'2017-09-21 16:43:21',10,11),(12,'us','Мультивизор Wider','Мультимедийный комплекс Wider является многофункциональным устройством, которое успешно совмещает функции персонального компьютера, проектора и панорамного монитора. Этот девайс позволяет перевести на большой экран разнообразные файлы со смартфона или планшета. Для оптимизации пользования этим аппаратом его оснастили мощными динамиками и ИБП. Пользование аппаратом элементарное, в нем сможет разобраться даже неопытный пользователь.','https://marketer.ua/wp-content/uploads/2017/03/Multivisor.jpg','todoSomething','IT','Only on paper',100000.00,'2017-09-21 16:43:30',10,12);
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
  KEY `FK76ej85r26lsia3qnsuwjmmprr` (`INVESTOR_ID`),
  KEY `FKemmpk9hsk0gm8i9f55wyyej4m` (`STARTUP_ID`),
  CONSTRAINT `FK76ej85r26lsia3qnsuwjmmprr` FOREIGN KEY (`INVESTOR_ID`) REFERENCES `investors` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FKemmpk9hsk0gm8i9f55wyyej4m` FOREIGN KEY (`STARTUP_ID`) REFERENCES `startups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startups_investors`
--

LOCK TABLES `startups_investors` WRITE;
/*!40000 ALTER TABLE `startups_investors` DISABLE KEYS */;
INSERT INTO `startups_investors` VALUES (7,1),(8,2);
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
  `PHONE` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ku29j688xlci1ksopvjfgpswp` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'abram@email.com','Roman','Abramovich','0000','+800000000000'),(11,'victor@gmail.com','Фигурский','Виктор','1234','+380250252135');
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
INSERT INTO `users_roles` VALUES (10,1),(11,1);
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

-- Dump completed on 2017-09-24  2:53:32

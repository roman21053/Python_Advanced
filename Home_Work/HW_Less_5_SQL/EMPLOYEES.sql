-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: EMPLOYEES
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.10.2

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
-- Table structure for table `COUNTRIES`
--

DROP TABLE IF EXISTS `COUNTRIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COUNTRIES` (
  `COUNTRY_ID` int NOT NULL AUTO_INCREMENT,
  `COUNTRY_NAME` char(50) NOT NULL,
  `REGION_ID` int NOT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `REGION_ID` (`REGION_ID`),
  CONSTRAINT `COUNTRIES_ibfk_1` FOREIGN KEY (`REGION_ID`) REFERENCES `REGIONS` (`REGION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRIES`
--

LOCK TABLES `COUNTRIES` WRITE;
/*!40000 ALTER TABLE `COUNTRIES` DISABLE KEYS */;
INSERT INTO `COUNTRIES` VALUES (1,'Ukrain',1);
/*!40000 ALTER TABLE `COUNTRIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTMENTS`
--

DROP TABLE IF EXISTS `DEPARTMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPARTMENTS` (
  `DEPARTMENT_ID` int NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_NAME` char(100) NOT NULL,
  `MANAGER_ID` int DEFAULT NULL,
  `LOCATION_ID` int DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  UNIQUE KEY `MANAGER_ID` (`MANAGER_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `DEPARTMENTS_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `LOCATIONS` (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENTS`
--

LOCK TABLES `DEPARTMENTS` WRITE;
/*!40000 ALTER TABLE `DEPARTMENTS` DISABLE KEYS */;
INSERT INTO `DEPARTMENTS` VALUES (10,'IT Support',1,1),(20,'Software Development',2,2),(30,'Database Administration',3,3),(40,'Web Development',4,4),(50,'Network Administration',5,5),(60,'Systems Analysis',6,6),(70,'Application Design',7,7),(80,'Software Testing',8,8),(90,'IT Management',9,9);
/*!40000 ALTER TABLE `DEPARTMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEES` (
  `EMPLOYEE_ID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` char(20) NOT NULL,
  `LAST_NAME` char(30) NOT NULL,
  `EMAIL` char(50) DEFAULT NULL,
  `PHONE_NUMBER` char(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` int DEFAULT NULL,
  `SALARY` double(10,2) NOT NULL,
  `COMMISSION_PCT` int DEFAULT NULL,
  `MANAGER_ID` int NOT NULL,
  `DEPARTMENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`),
  CONSTRAINT `EMPLOYEES_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`JOB_ID`),
  CONSTRAINT `EMPLOYEES_ibfk_2` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `DEPARTMENTS` (`DEPARTMENT_ID`),
  CONSTRAINT `EMPLOYEES_ibfk_3` FOREIGN KEY (`MANAGER_ID`) REFERENCES `DEPARTMENTS` (`MANAGER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1,'Roman','Mereniuk','roman@gmail.com','093488754','2007-08-23',17,5000.00,NULL,6,60),(2,'John','Smith','john@gmail.com','0123456789','2007-10-25',4,6000.00,NULL,9,90),(3,'Adam','Brown','adam@gmail.com','0123456780','2007-02-05',9,7000.00,NULL,6,60),(4,'Joe','Hill','joe@gmail.com','0123456781','2007-04-01',8,8000.00,20,3,30),(5,'David','Green','alex@gmail.com','0123456782','2007-06-25',5,9000.00,NULL,5,50),(6,'Steve','Taylor','steve@gmail.com','0123456783','2007-08-05',3,10000.00,NULL,5,50),(7,'David','James','david@gmail.com','0123456784','2007-10-15',11,11000.00,10,8,80),(8,'Maddie','Miller','maddie@gmail.com','0123456785','2007-12-25',12,12000.00,NULL,8,80),(9,'Jacob','Davis','jacob@gmail.com','0123456786','2008-02-05',16,13000.00,NULL,6,60),(10,'Will','Wilson','will@gmail.com','0123456787','2008-04-15',10,14000.00,5,4,40),(11,'Mark','Moore','mark@gmail.com','0123456788','2008-06-25',11,15000.00,NULL,1,10),(12,'Henry','Watson','henry@gmail.com','0123456789','2008-08-05',12,16000.00,NULL,5,50),(13,'Jack','Taylor','jack@gmail.com','0123456780','2008-10-15',13,17000.00,NULL,8,80),(14,'David','James','jill@gmail.com','0123456781','2008-12-25',14,18000.00,NULL,6,60),(15,'Harry','Miller','harry@gmail.com','0123456782','2008-02-05',15,19000.00,20,7,70),(16,'Luke','Davis','luke@gmail.com','0123456783','2008-04-15',16,20000.00,NULL,6,60),(17,'John','Wilson','john@gmail.com','0123456784','2008-06-01',17,21000.00,20,6,60),(18,'Adam','Moore','adam@gmail.com','0123456785','2008-08-05',18,22000.00,NULL,9,90),(19,'Steve','Watson','steve@gmail.com','0123456786','2008-10-15',13,23000.00,5,4,40),(20,'David','Taylor','david@gmail.com','0123456787','2008-12-01',11,24000.00,3,4,40);
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOBS`
--

DROP TABLE IF EXISTS `JOBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOBS` (
  `JOB_ID` int NOT NULL AUTO_INCREMENT,
  `JOB_TITLE` char(255) NOT NULL,
  `MIN_SALARY` float(10,2) NOT NULL,
  `MAX_SALARY` float(10,2) NOT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBS`
--

LOCK TABLES `JOBS` WRITE;
/*!40000 ALTER TABLE `JOBS` DISABLE KEYS */;
INSERT INTO `JOBS` VALUES (1,'President',100000.00,150000.00),(2,'Ministr',80000.00,100000.00),(3,'Deputat',50000.00,70000.00),(4,'Software Engineer',5000.00,10000.00),(5,'Systems Administrator',4000.00,8000.00),(6,'Network Engineer',3000.00,6000.00),(7,'Software Developer',3000.00,8000.00),(8,'Web Developer',2500.00,6000.00),(9,'Database Administrator',3500.00,7000.00),(10,'Quality Assurance Engineer',3000.00,7000.00),(11,'Project Manager',4000.00,12000.00),(12,'Business Analyst',3000.00,9000.00),(13,'Software Tester',2500.00,7000.00),(14,'UX Designer',3000.00,8000.00),(15,'Technical Writer',2000.00,8000.00),(16,'IT Manager',5000.00,15000.00),(17,'Data Scientist',4000.00,12000.00),(18,'DevOps Engineer',4000.00,11000.00);
/*!40000 ALTER TABLE `JOBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOB_HISTORY`
--

DROP TABLE IF EXISTS `JOB_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOB_HISTORY` (
  `EMPLOYEE_ID` int DEFAULT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date DEFAULT NULL,
  `JOB_ID` int NOT NULL,
  `DEPARTMENT_ID` int DEFAULT NULL,
  KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  CONSTRAINT `JOB_HISTORY_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEES` (`EMPLOYEE_ID`),
  CONSTRAINT `JOB_HISTORY_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`JOB_ID`),
  CONSTRAINT `JOB_HISTORY_ibfk_3` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `DEPARTMENTS` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOB_HISTORY`
--

LOCK TABLES `JOB_HISTORY` WRITE;
/*!40000 ALTER TABLE `JOB_HISTORY` DISABLE KEYS */;
INSERT INTO `JOB_HISTORY` VALUES (1,'2007-08-23',NULL,17,60),(2,'2007-10-25',NULL,4,90),(3,'2007-02-05',NULL,9,60),(4,'2007-04-01',NULL,8,30),(5,'2007-06-25',NULL,5,50),(6,'2007-08-05',NULL,3,50),(7,'2007-10-15',NULL,11,80),(8,'2007-12-25',NULL,12,80),(9,'2008-02-05',NULL,16,60),(10,'2008-04-15',NULL,10,40),(11,'2008-06-25',NULL,11,10),(12,'2008-08-05',NULL,12,50),(13,'2008-10-15',NULL,13,80),(14,'2008-12-25',NULL,14,60),(15,'2008-02-05',NULL,15,70),(16,'2008-04-15',NULL,16,60),(17,'2008-06-01',NULL,17,60),(18,'2008-08-05',NULL,18,90),(19,'2008-10-15',NULL,13,40),(20,'2008-12-01',NULL,11,40);
/*!40000 ALTER TABLE `JOB_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATIONS`
--

DROP TABLE IF EXISTS `LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCATIONS` (
  `LOCATION_ID` int NOT NULL AUTO_INCREMENT,
  `STREET_ADDRESS` char(255) NOT NULL,
  `POSTAL_CODE` char(50) NOT NULL,
  `CITY` char(50) NOT NULL,
  `STATE_PROVINCE` char(50) NOT NULL,
  `COUNTRY_ID` int DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`),
  KEY `COUNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `LOCATIONS_ibfk_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `COUNTRIES` (`COUNTRY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATIONS`
--

LOCK TABLES `LOCATIONS` WRITE;
/*!40000 ALTER TABLE `LOCATIONS` DISABLE KEYS */;
INSERT INTO `LOCATIONS` VALUES (1,'1 Main Street','00001','Kyiv','Kyivska oblast',1),(2,'2 Main Street','00002','Odessa','Odeska oblast',1),(3,'3 Main Street','00003','Lviv','Lvivska oblast',1),(4,'4 Main Street','00004','Kharkiv','Kharkivska oblast',1),(5,'5 Main Street','00005','Dnipro','Dnipropetrovska oblast',1),(6,'6 Main Street','00006','Donetsk','Donetska oblast',1),(7,'7 Main Street','00007','Vinnytsia','Vinnytska oblast',1),(8,'8 Main Street','00008','Zaporizhia','Zaporizka oblast',1),(9,'9 Main Street','00009','Cherkasy','Cherkaska oblast',1);
/*!40000 ALTER TABLE `LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGIONS`
--

DROP TABLE IF EXISTS `REGIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REGIONS` (
  `REGION_ID` int NOT NULL AUTO_INCREMENT,
  `REGION_NAME` char(50) NOT NULL,
  PRIMARY KEY (`REGION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGIONS`
--

LOCK TABLES `REGIONS` WRITE;
/*!40000 ALTER TABLE `REGIONS` DISABLE KEYS */;
INSERT INTO `REGIONS` VALUES (1,'Europe'),(2,'Asia'),(3,'Africa'),(4,'Australia'),(5,'North America'),(6,'South America'),(7,'Oceania'),(8,'Antarctica');
/*!40000 ALTER TABLE `REGIONS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18 16:44:02

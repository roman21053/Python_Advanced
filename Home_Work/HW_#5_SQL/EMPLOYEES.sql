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
  CONSTRAINT `COUNTRIES_ibfk_1` FOREIGN KEY (`REGION_ID`) REFERENCES `REGIONS` (`REGION_ID`),
  CONSTRAINT `COUNTRIES_ibfk_2` FOREIGN KEY (`REGION_ID`) REFERENCES `REGIONS` (`REGION_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRIES`
--

LOCK TABLES `COUNTRIES` WRITE;
/*!40000 ALTER TABLE `COUNTRIES` DISABLE KEYS */;
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
  KEY `LOCATION_ID` (`LOCATION_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`),
  CONSTRAINT `DEPARTMENTS_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `LOCATIONS` (`LOCATION_ID`),
  CONSTRAINT `DEPARTMENTS_ibfk_2` FOREIGN KEY (`MANAGER_ID`) REFERENCES `EMPLOYEES` (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENTS`
--

LOCK TABLES `DEPARTMENTS` WRITE;
/*!40000 ALTER TABLE `DEPARTMENTS` DISABLE KEYS */;
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
  `FIRST_NAME` char(20) DEFAULT NULL,
  `LAST_NAME` char(30) DEFAULT NULL,
  `EMAIL` char(50) DEFAULT NULL,
  `PHONE_NUMBER` char(20) DEFAULT NULL,
  `HIRE_DATE` date DEFAULT NULL,
  `JOB_ID` int DEFAULT NULL,
  `SALARY` double(10,2) NOT NULL,
  `COMMISSION_PCT` int NOT NULL DEFAULT '20',
  `MANAGER_ID` int NOT NULL,
  `DEPARTMENT_ID` int DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  CONSTRAINT `EMPLOYEES_ibfk_1` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `DEPARTMENTS` (`DEPARTMENT_ID`),
  CONSTRAINT `EMPLOYEES_ibfk_2` FOREIGN KEY (`MANAGER_ID`) REFERENCES `EMPLOYEES` (`EMPLOYEE_ID`),
  CONSTRAINT `EMPLOYEES_ibfk_3` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
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
  `JOB_TITLE` char(255) DEFAULT NULL,
  `MIN_SALARY` float DEFAULT NULL,
  `MAX_SALARY` float DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBS`
--

LOCK TABLES `JOBS` WRITE;
/*!40000 ALTER TABLE `JOBS` DISABLE KEYS */;
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
  `START_DATA` date DEFAULT NULL,
  `END_DATA` date DEFAULT NULL,
  `JOB_ID` int DEFAULT NULL,
  `DEPARTMENT_ID` int DEFAULT NULL,
  KEY `JOB_ID` (`JOB_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  CONSTRAINT `JOB_HISTORY_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`JOB_ID`) ON UPDATE CASCADE,
  CONSTRAINT `JOB_HISTORY_ibfk_2` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `DEPARTMENTS` (`DEPARTMENT_ID`) ON UPDATE CASCADE,
  CONSTRAINT `JOB_HISTORY_ibfk_3` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEES` (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOB_HISTORY`
--

LOCK TABLES `JOB_HISTORY` WRITE;
/*!40000 ALTER TABLE `JOB_HISTORY` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATIONS`
--

LOCK TABLES `LOCATIONS` WRITE;
/*!40000 ALTER TABLE `LOCATIONS` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGIONS`
--

LOCK TABLES `REGIONS` WRITE;
/*!40000 ALTER TABLE `REGIONS` DISABLE KEYS */;
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

-- Dump completed on 2023-03-16 12:18:37

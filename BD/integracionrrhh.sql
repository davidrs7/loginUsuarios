CREATE DATABASE  IF NOT EXISTS `integracionrrhh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `integracionrrhh`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: integracionrrhh
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `absence`
--

DROP TABLE IF EXISTS `absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AbsenceTypeId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `EmployeeId` int DEFAULT NULL,
  `Created` datetime(6) DEFAULT NULL,
  `Updated` datetime(6) DEFAULT NULL,
  `Started` date DEFAULT NULL,
  `BusinessDays` int DEFAULT NULL,
  `Finished` date DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Absence__Absence__2DB1C7EE` (`AbsenceTypeId`),
  KEY `FK__Absence__UserId__2EA5EC27` (`UserId`),
  KEY `FK__Absence__Employe__2F9A1060` (`EmployeeId`),
  CONSTRAINT `FK__Absence__Absence__2DB1C7EE` FOREIGN KEY (`AbsenceTypeId`) REFERENCES `absence_type` (`Id`),
  CONSTRAINT `FK__Absence__Employe__2F9A1060` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`),
  CONSTRAINT `FK__Absence__UserId__2EA5EC27` FOREIGN KEY (`UserId`) REFERENCES `user_login` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence`
--

LOCK TABLES `absence` WRITE;
/*!40000 ALTER TABLE `absence` DISABLE KEYS */;
INSERT INTO `absence` VALUES (1,1,6,291,'2024-01-27 12:31:17.697000','2024-01-28 01:51:50.487000','2024-01-08',5,'2024-01-12',1,0,'Vacaciones editadas.'),(2,1,6,292,'2024-01-28 01:30:49.257000','2024-04-03 21:46:15.587000','2024-01-22',7,'2024-01-30',1,1,'Primeras vacaciones registradas para tercero.'),(3,1,13,417,'2024-01-30 22:19:31.893000','2024-04-03 21:30:49.640000','2024-03-04',8,'2024-03-13',1,1,'Vacaciones registradas para un usuario que requiere aprobación de RR.HH.'),(4,2,6,293,'2024-02-07 12:00:37.480000','2024-04-03 21:32:46.887000','2024-02-08',2,'2024-02-09',1,1,'Permiso para realizar trámites de visa.'),(5,3,6,395,'2024-02-11 19:40:11.713000','2024-04-03 21:32:57.063000','2024-02-12',2,'2024-02-13',1,1,'Incapacidad médica por lesión de tobillo.'),(6,2,6,291,'2024-02-18 13:29:40.997000','2024-02-18 13:29:40.997000','2024-03-04',3,'2024-03-06',1,0,'Permiso para atender asuntos personales fuera de la ciudad.'),(7,2,6,291,'2024-03-17 09:56:50.017000','2024-03-17 09:56:50.017000','2024-03-18',1,'2024-03-18',1,0,'Permiso para realizar diligencias personales.'),(8,3,6,291,'2024-03-17 12:18:21.797000','2024-03-17 12:18:21.797000','2024-03-18',2,'2024-03-19',1,0,'Incapacidad por medicina general.'),(9,3,6,291,'2024-04-03 21:25:24.060000','2024-04-03 21:31:19.997000','2024-03-22',3,'2024-03-26',1,0,'se formaliza incapacidad del periodo actual por vasectomia'),(10,1,6,291,'2024-04-03 21:37:41.097000','2024-04-03 21:37:41.097000','2024-04-10',5,'2024-04-16',1,0,'viaje familiar'),(11,1,6,291,'2024-04-03 21:48:42.937000','2024-04-03 21:48:42.937000','2024-05-08',4,'2024-05-13',1,0,'probar usuarios que autorizan');
/*!40000 ALTER TABLE `absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absence_approval`
--

DROP TABLE IF EXISTS `absence_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence_approval` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AbsenceId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `Created` datetime(6) DEFAULT NULL,
  `Updated` datetime(6) DEFAULT NULL,
  `Approval` tinyint(1) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `IsHRApproval` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Absence_A__Absen__32767D0B` (`AbsenceId`),
  KEY `FK__Absence_A__UserI__336AA144` (`UserId`),
  CONSTRAINT `FK__Absence_A__Absen__32767D0B` FOREIGN KEY (`AbsenceId`) REFERENCES `absence` (`Id`),
  CONSTRAINT `FK__Absence_A__UserI__336AA144` FOREIGN KEY (`UserId`) REFERENCES `user_login` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_approval`
--

LOCK TABLES `absence_approval` WRITE;
/*!40000 ALTER TABLE `absence_approval` DISABLE KEYS */;
INSERT INTO `absence_approval` VALUES (1,2,6,'2024-02-06 17:33:09.947000','2024-04-03 21:46:15.567000',1,'Esta es una prueba de aprobación.',0),(2,3,6,'2024-02-06 19:33:54.433000','2024-04-03 21:30:49.620000',1,'Esta es una prueba de cambio de rechazo a aprobación.',1),(4,4,6,'2024-02-07 12:10:03.703000','2024-04-03 21:32:46.863000',1,'No refiere documetos soporte para este permiso por problemas en la plataforma, pero se registran físicamente. Los documentos son verificados.',0),(5,5,6,'2024-02-11 20:10:08.110000','2024-04-03 21:32:57.040000',1,'Revisado y aprobado.',0);
/*!40000 ALTER TABLE `absence_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absence_file_rel`
--

DROP TABLE IF EXISTS `absence_file_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence_file_rel` (
  `AbsenceId` int DEFAULT NULL,
  `EmployeeFileId` int DEFAULT NULL,
  KEY `FK__Absence_F__Absen__3552E9B6` (`AbsenceId`),
  KEY `FK__Absence_F__Emplo__36470DEF` (`EmployeeFileId`),
  CONSTRAINT `FK__Absence_F__Absen__3552E9B6` FOREIGN KEY (`AbsenceId`) REFERENCES `absence` (`Id`),
  CONSTRAINT `FK__Absence_F__Emplo__36470DEF` FOREIGN KEY (`EmployeeFileId`) REFERENCES `employee_file` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_file_rel`
--

LOCK TABLES `absence_file_rel` WRITE;
/*!40000 ALTER TABLE `absence_file_rel` DISABLE KEYS */;
INSERT INTO `absence_file_rel` VALUES (8,3390);
/*!40000 ALTER TABLE `absence_file_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absence_type`
--

DROP TABLE IF EXISTS `absence_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence_type` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_type`
--

LOCK TABLES `absence_type` WRITE;
/*!40000 ALTER TABLE `absence_type` DISABLE KEYS */;
INSERT INTO `absence_type` VALUES (1,0,'Vacaciones'),(2,0,'Permiso'),(3,0,'Incapacidad');
/*!40000 ALTER TABLE `absence_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accionesobjetivos`
--

DROP TABLE IF EXISTS `accionesobjetivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accionesobjetivos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdObjetivo` int DEFAULT NULL,
  `IdUsuario` int DEFAULT NULL,
  `Descripcion` text,
  `Calificacion` int DEFAULT NULL,
  `Evidencia` varchar(255) DEFAULT NULL,
  `IdEstado` int DEFAULT NULL,
  `Comentarios` text,
  `FechaAccion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdObjetivo` (`IdObjetivo`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `IdEstado` (`IdEstado`),
  CONSTRAINT `AccionesObjetivos_ibfk_1` FOREIGN KEY (`IdObjetivo`) REFERENCES `objetivos` (`Id`),
  CONSTRAINT `AccionesObjetivos_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`UsuarioID`),
  CONSTRAINT `AccionesObjetivos_ibfk_3` FOREIGN KEY (`IdEstado`) REFERENCES `estadosacciones` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accionesobjetivos`
--

LOCK TABLES `accionesobjetivos` WRITE;
/*!40000 ALTER TABLE `accionesobjetivos` DISABLE KEYS */;
INSERT INTO `accionesobjetivos` VALUES (19,33,2,'',50,'',3,'gracias por que el objetivo está alineado con la organización','2024-04-09 00:00:00'),(20,34,2,'',0,'',1,'','2024-04-09 00:00:00'),(21,39,1,'',0,'',2,'No cumple con las politicas de la compañía','2024-04-17 00:00:00'),(22,40,1,'',0,'',1,'','2024-04-17 00:00:00');
/*!40000 ALTER TABLE `accionesobjetivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banking_entity`
--

DROP TABLE IF EXISTS `banking_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banking_entity` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banking_entity`
--

LOCK TABLES `banking_entity` WRITE;
/*!40000 ALTER TABLE `banking_entity` DISABLE KEYS */;
INSERT INTO `banking_entity` VALUES (1,0,'BANCAMIA S.A.'),(2,0,'BANCO AGRARIO'),(3,0,'BANCO AV VILLAS'),(4,0,'BANCO BBVA COLOMBIA S.A.'),(5,0,'BANCO CAJA SOCIAL'),(6,0,'BANCO COOPERATIVO COOPCENTRAL'),(7,0,'BANCO CREDIFINANCIERA'),(8,0,'BANCO DAVIVIENDA'),(9,0,'BANCO DE BOGOTA'),(10,0,'BANCO DE OCCIDENTE'),(11,0,'BANCO FALABELLA'),(12,0,'BANCO GNB SUDAMERIS'),(13,0,'BANCO ITAU'),(14,0,'BANCO PICHINCHA S.A.'),(15,0,'BANCO POPULAR'),(16,0,'BANCO SANTANDER COLOMBIA'),(17,0,'BANCO SERFINANZA'),(18,0,'BANCOLOMBIA'),(19,0,'BANCOOMEVA S.A.'),(20,0,'CFA COOPERATIVA FINANCIERA'),(21,0,'CITIBANK'),(22,0,'COLTEFINANCIERA'),(23,0,'CONFIAR COOPERATIVA FINANCIERA'),(24,0,'COOFINEP COOPERATIVA FINANCIERA'),(25,0,'COTRAFA'),(26,0,'DALE'),(27,0,'DAVIPLATA'),(28,0,'GIROS Y FINANZAS COMPAÑIA DE FINANCIAMIENTO S.A.'),(29,0,'IRIS'),(30,0,'MOVII S.A.'),(31,0,'RAPPIPAY DAVIPLATA'),(32,0,'SCOTIABANK COLPATRIA');
/*!40000 ALTER TABLE `banking_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `CargoID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `EmpresaID` int DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CargoID`),
  KEY `EmpresaID` (`EmpresaID`),
  CONSTRAINT `Cargos_ibfk_1` FOREIGN KEY (`EmpresaID`) REFERENCES `empresas` (`EmpresaID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Gerente General','Gerente General de la Empresa A',1,1),(2,'Gerente de Ventas','Gerente de Ventas de la Empresa B',2,1),(3,'Analista de Datos','Analista de Datos de la Empresa C',3,1);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'Bogotá D.C.','Bogotá D.C.'),(2,1,'Medellín','Antioquia'),(3,1,'Anolaima','Cundinamarca'),(4,1,'Anserma','Caldas'),(5,1,'Ansermanuevo','Valle del Cauca'),(6,1,'Aracataca','Magdalena'),(7,1,'Arauca','Arauca'),(8,1,'Arboletes','Antioquia'),(9,1,'Armenia','Quindio'),(10,1,'Armero','Tolima'),(11,1,'Ataco','Tolima'),(12,1,'Barbosa','Antioquia'),(13,1,'Barrancabermeja','Santander'),(14,1,'Barranquilla','Atlantico'),(15,1,'Bello','Antioquia'),(16,1,'Bucaramanga','Santander'),(17,1,'Calarca','Quindio'),(18,1,'Cali','Valle del Cauca'),(19,1,'Cañasgordas','Antioquia'),(20,1,'Candelaria','Valle del Cauca'),(21,1,'Carepa','Antioquia'),(22,1,'Cartagena','Bolivar'),(23,1,'Cartago','Valle del Cauca'),(24,1,'Cerete','Cordoba'),(25,1,'Cerro San Antonio','Magdalena'),(26,1,'Chía','Cundinamarca'),(27,1,'Chiquinquirá','Boyaca'),(28,1,'Cienaga De Oro','Cordoba'),(29,1,'Circasia','Quindio'),(30,1,'Cómbita','Boyaca'),(31,1,'Copacabana','Antioquia'),(32,1,'Córdoba','Quindio'),(33,1,'Cúcuta','Norte de Santander'),(34,1,'Dosquebradas','Risaralda'),(35,1,'Duitama','Boyaca'),(36,1,'Envigado','Antioquia'),(37,1,'Facatativá','Cundinamarca'),(38,1,'Firavitoba','Boyaca'),(39,1,'Florencia','Cauca'),(40,1,'Floridablanca','Santander'),(41,1,'Funza','Cundinamarca'),(42,1,'Fusagasugá','Cundinamarca'),(43,1,'Gama','Cundinamarca'),(44,1,'Gigante','Huila'),(45,1,'Girardot','Cundinamarca'),(46,1,'Girón','Santander'),(47,1,'Guadalajara De Buga','Valle del Cauca'),(48,1,'Guatavita','Cundinamarca'),(49,1,'Hobo','Huila'),(50,1,'Honda','Tolima'),(51,1,'Ibagué','Tolima'),(52,1,'Ipiales','Narino'),(53,1,'Itagüí','Antioquia'),(54,1,'Jamundí','Valle del Cauca'),(55,1,'La Estrella','Antioquia'),(56,1,'Lebrija','Santander'),(57,1,'Líbano','Tolima'),(58,1,'Los Patios','Norte de Santander'),(59,1,'Madrid','Cundinamarca'),(60,1,'Málaga','Santander'),(61,1,'Malambo','Atlantico'),(62,1,'Manizales','Caldas'),(63,1,'Marinilla','Antioquia'),(64,1,'Melgar','Tolima'),(65,1,'Moniquira','Boyaca'),(66,1,'Montería','Cordoba'),(67,1,'Mosquera','Cundinamarca'),(68,1,'Neiva','Huila'),(69,1,'Nobsa','Boyaca'),(70,1,'Ocaña','Norte de Santander'),(71,1,'Palmar De Varela','Atlantico'),(72,1,'Palmira','Valle del Cauca'),(73,1,'Pasto','Narino'),(74,1,'Pelaya','Cesar'),(75,1,'Pereira','Risaralda'),(76,1,'Piedecuesta','Santander'),(77,1,'Pivijay','Magdalena'),(78,1,'Planeta Rica','Cordoba'),(79,1,'Popayán','Cauca'),(80,1,'Puerto Colombia','Atlantico'),(81,1,'Purificación','Tolima'),(82,1,'Quibdó','Choco'),(83,1,'Remedios','Antioquia'),(84,1,'Rionegro','Antioquia'),(85,1,'Risaralda','Caldas'),(86,1,'Sabaneta','Antioquia'),(87,1,'San Cayetano','Norte de Santander'),(88,1,'San Pelayo','Cordoba'),(89,1,'San Rafael','Antioquia'),(90,1,'Santa Marta','Magdalena'),(91,1,'Santo Tomas','Atlantico'),(92,1,'Sincelejo','Sucre'),(93,1,'Soacha','Cundinamarca'),(94,1,'Sogamoso','Boyaca'),(95,1,'Soledad','Atlantico'),(96,1,'Suan','Atlantico'),(97,1,'Tuluá','Valle del Cauca'),(98,1,'Tunja','Boyaca'),(99,1,'Turbaco','Bolivar'),(100,1,'Ubaté','Cundinamarca'),(101,1,'Valledupar','Cesar'),(102,1,'Villa De Leyva','Boyaca'),(103,1,'Villa Del Rosario','Norte de Santander'),(104,1,'Villa María','Caldas'),(105,1,'Villavicencio','Meta'),(106,1,'Villeta','Cundinamarca'),(107,1,'Yumbo','Valle del Cauca'),(108,1,'Buga','Valle del Cauca'),(109,1,'Pedraza','Magdalena'),(110,1,'San Andrés de Sotavento','Córdoba');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Hex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,0,'#31EAA0'),(2,0,'#F41B55'),(3,0,'#9BC9E1'),(4,0,'#658FCD'),(5,0,'#BA738E'),(6,0,'#F58224'),(7,0,'#4E2FE9'),(8,0,'#85D2CD'),(9,0,'#D129BA'),(10,0,'#7BA7DD'),(11,0,'#342F52'),(12,0,'#05A572'),(13,0,'#ACF579'),(14,0,'#936B0F'),(15,0,'#A4CE0F'),(16,0,'#6D7791'),(17,0,'#00ff00'),(18,0,'#654322'),(19,0,'#5F7227'),(20,0,'#54276F'),(21,0,'#36A6A0'),(22,0,'#C8F810'),(23,0,'#D664CA'),(24,0,'#ADE5B0'),(25,0,'#B9FA16'),(26,0,'#517C4C'),(27,0,'#1EF889'),(28,0,'#D797F0'),(29,0,'#AFC2B3'),(30,0,'#8A1683'),(31,0,'#A48F8E'),(32,0,'#152C8E');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `competencia` text,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias`
--

LOCK TABLES `competencias` WRITE;
/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
INSERT INTO `competencias` VALUES (1,'Liderazgo',1),(2,'trabajo en equipo ',1),(5,'Gestion ',1),(8,'Puntualidad',1);
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration` (
  `ConfigKey` varchar(100) NOT NULL,
  `UserId` int DEFAULT NULL,
  `Updated` datetime(6) DEFAULT NULL,
  `Value1` varchar(255) DEFAULT NULL,
  `Value2` varchar(255) DEFAULT NULL,
  `ListType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ConfigKey`),
  KEY `FK__Configura__UserI__0C50D423` (`UserId`),
  CONSTRAINT `FK__Configura__UserI__0C50D423` FOREIGN KEY (`UserId`) REFERENCES `user_login` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES ('absence.file.level',6,'2024-03-14 12:40:16.307000','2,15','2','items'),('absence.types.allowed',1,'2024-06-28 00:42:05.681838','1,2','1,2,3,4,5','none'),('absence.users.allowed',6,'2024-04-03 21:47:39.393000','1,2,3,4,5','6','userIds'),('holidays.2023',1,'2024-01-20 11:15:38.933000','2023','2023','dates'),('holidays.2024',1,'2024-01-20 10:07:18.633000','2024','2024','dates'),('holidays.2025',6,'2024-02-08 12:25:27.073000','2025','2025','dates'),('workdays',1,'2024-01-20 11:41:55.020000','0,1,2,3,4,-1,-1','0-4','none');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_list`
--

DROP TABLE IF EXISTS `configuration_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration_list` (
  `ConfigKey` varchar(100) DEFAULT NULL,
  `Item` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  KEY `FK__Configura__Confi__0E391C95` (`ConfigKey`),
  CONSTRAINT `FK__Configura__Confi__0E391C95` FOREIGN KEY (`ConfigKey`) REFERENCES `configuration` (`ConfigKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_list`
--

LOCK TABLES `configuration_list` WRITE;
/*!40000 ALTER TABLE `configuration_list` DISABLE KEYS */;
INSERT INTO `configuration_list` VALUES ('holidays.2024','1-0-2024','2024-01-01'),('holidays.2024','8-0-2024','2024-01-08'),('holidays.2023','25-11-2023','2023-12-25'),('holidays.2023','7-11-2023','2023-12-07'),('holidays.2024','25-2-2024','2024-03-25'),('holidays.2024','28-2-2024','2024-03-28'),('holidays.2024','29-2-2024','2024-03-29'),('holidays.2024','1-4-2024','2024-05-01'),('holidays.2024','13-4-2024','2024-05-13'),('holidays.2024','3-5-2024','2024-06-03'),('holidays.2024','10-5-2024','2024-06-10'),('holidays.2024','1-6-2024','2024-07-01'),('holidays.2024','20-6-2024','2024-07-20'),('holidays.2024','7-7-2024','2024-08-07'),('holidays.2024','19-7-2024','2024-08-19'),('holidays.2024','14-9-2024','2024-10-14'),('holidays.2024','4-10-2024','2024-11-04'),('holidays.2024','11-10-2024','2024-11-11'),('holidays.2024','8-11-2024','2024-12-08'),('holidays.2024','25-11-2024','2024-12-25'),('holidays.2024','27-0-2024','2024-01-27'),('holidays.2025','1-0-2025','2025-01-01'),('absence.file.level','1','2,12,78'),('holidays.2024','17-1-2024','2024-02-17'),('holidays.2024','9-1-2024','2024-02-09'),('holidays.2024','23-1-2024','2024-02-23'),('absence.users.allowed','6','291'),('absence.users.allowed','11','415'),('absence.file.level','2','2,8,44'),('absence.users.allowed','10','396');
/*!40000 ALTER TABLE `configuration_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_type`
--

DROP TABLE IF EXISTS `contract_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_type` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_type`
--

LOCK TABLES `contract_type` WRITE;
/*!40000 ALTER TABLE `contract_type` DISABLE KEYS */;
INSERT INTO `contract_type` VALUES (1,0,'Prestacion de Servicios'),(2,0,'Indefinido'),(3,0,'Aprendiz');
/*!40000 ALTER TABLE `contract_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ColorId` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Departmen__Color__3A81B327` (`ColorId`),
  CONSTRAINT `FK__Departmen__Color__3A81B327` FOREIGN KEY (`ColorId`) REFERENCES `color` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,7,'Gestión Administrativa'),(2,2,'Gestión Tecnologica'),(3,3,'Gestión Operativa'),(4,4,'Gestión Comercial'),(5,6,'Gestión Gerencial'),(6,9,'prueba nombre dpto');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_type`
--

DROP TABLE IF EXISTS `doc_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doc_type` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_type`
--

LOCK TABLES `doc_type` WRITE;
/*!40000 ALTER TABLE `doc_type` DISABLE KEYS */;
INSERT INTO `doc_type` VALUES (1,0,'CC'),(2,0,'CE'),(3,0,'TI'),(4,0,'P.E.P.');
/*!40000 ALTER TABLE `doc_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educational_level`
--

DROP TABLE IF EXISTS `educational_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educational_level` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational_level`
--

LOCK TABLES `educational_level` WRITE;
/*!40000 ALTER TABLE `educational_level` DISABLE KEYS */;
INSERT INTO `educational_level` VALUES (1,0,'Primaria'),(2,0,'Secundaria'),(3,0,'Bachiller'),(4,0,'Técnico'),(5,0,'Tecnólogo'),(6,0,'Estudiante Universitario'),(7,0,'Profesional Incompleto'),(8,0,'Profesional'),(9,0,'Postgrado'),(10,0,'Maestría');
/*!40000 ALTER TABLE `educational_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `JobId` int DEFAULT NULL,
  `GeneralId` int DEFAULT NULL,
  `AcademicId` int DEFAULT NULL,
  `StatusId` int DEFAULT NULL,
  `MaritalStatusId` int DEFAULT NULL,
  `DocTypeId` int DEFAULT NULL,
  `DocIssueCityId` int DEFAULT NULL,
  `ContractTypeId` int DEFAULT NULL,
  `JobCityId` int DEFAULT NULL,
  `BankingEntityId` int DEFAULT NULL,
  `Doc` varchar(255) DEFAULT NULL,
  `DocIssueDate` date DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Rh` varchar(255) DEFAULT NULL,
  `CorpCellphone` varchar(255) DEFAULT NULL,
  `Cellphone` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `EmploymentDate` date DEFAULT NULL,
  `BankAccount` varchar(255) DEFAULT NULL,
  `BankAccountType` varchar(255) DEFAULT NULL,
  `HasVaccine` tinyint(1) DEFAULT NULL,
  `VaccineMaker` varchar(255) DEFAULT NULL,
  `VaccineDose` int DEFAULT NULL,
  `HasVaccineBooster` tinyint(1) DEFAULT NULL,
  `PhotoUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Employee__JobId__56E8E7AB` (`JobId`),
  KEY `FK__Employee__Genera__57DD0BE4` (`GeneralId`),
  KEY `FK__Employee__Academ__58D1301D` (`AcademicId`),
  KEY `FK__Employee__Status__59C55456` (`StatusId`),
  KEY `FK__Employee__Marita__5AB9788F` (`MaritalStatusId`),
  KEY `FK__Employee__DocTyp__5BAD9CC8` (`DocTypeId`),
  KEY `FK__Employee__DocIss__5CA1C101` (`DocIssueCityId`),
  KEY `FK__Employee__Contra__5D95E53A` (`ContractTypeId`),
  KEY `FK__Employee__JobCit__5E8A0973` (`JobCityId`),
  KEY `FK__Employee__Bankin__5F7E2DAC` (`BankingEntityId`),
  CONSTRAINT `FK__Employee__Academ__58D1301D` FOREIGN KEY (`AcademicId`) REFERENCES `employee_academic` (`Id`),
  CONSTRAINT `FK__Employee__Bankin__5F7E2DAC` FOREIGN KEY (`BankingEntityId`) REFERENCES `banking_entity` (`Id`),
  CONSTRAINT `FK__Employee__Contra__5D95E53A` FOREIGN KEY (`ContractTypeId`) REFERENCES `contract_type` (`Id`),
  CONSTRAINT `FK__Employee__DocIss__5CA1C101` FOREIGN KEY (`DocIssueCityId`) REFERENCES `city` (`Id`),
  CONSTRAINT `FK__Employee__DocTyp__5BAD9CC8` FOREIGN KEY (`DocTypeId`) REFERENCES `doc_type` (`Id`),
  CONSTRAINT `FK__Employee__Genera__57DD0BE4` FOREIGN KEY (`GeneralId`) REFERENCES `employee_general` (`Id`),
  CONSTRAINT `FK__Employee__JobCit__5E8A0973` FOREIGN KEY (`JobCityId`) REFERENCES `city` (`Id`),
  CONSTRAINT `FK__Employee__JobId__56E8E7AB` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`),
  CONSTRAINT `FK__Employee__Marita__5AB9788F` FOREIGN KEY (`MaritalStatusId`) REFERENCES `marital_status` (`Id`),
  CONSTRAINT `FK__Employee__Status__59C55456` FOREIGN KEY (`StatusId`) REFERENCES `employee_status` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'123456','2005-08-01','usuario 1 integrado','Masculino','2005-08-01',NULL,NULL,'3215633252','3215633252','usuario1@sistema.com','2024-07-31',NULL,NULL,0,NULL,0,0,NULL),(2,3,NULL,NULL,1,1,1,1,1,1,18,'1234567','2010-05-02','usuario integrado 2 employee','Masculino',NULL,'A-','3269635698','3269635698','3269635698','usuario2@sistema.com',NULL,'4602026137','Cuenta de ahorros',0,'AstraZeneca',2,1,NULL),(3,2,NULL,NULL,NULL,1,1,1,1,1,NULL,'12345678',NULL,'usuario 2 integrado','Masculino','2000-05-02','A+','3145623658','3145623658','3145623658','usuario2@sistema.com','2018-05-02',NULL,NULL,0,NULL,NULL,0,NULL),(4,1,NULL,NULL,NULL,1,1,1,1,1,NULL,'12345678','2015-05-08','usuario 2 integrado','Masculino','1995-06-05','A+','3216598565','3216598565','3216598565','usuario2@sistema.com','2020-08-05',NULL,NULL,0,NULL,NULL,0,NULL),(5,1,NULL,NULL,NULL,2,1,1,2,11,NULL,'123456789','2010-09-08','usuario 2 integrado','Masculino','1990-09-08','A+','3216598569','3216598569','3216598569','usuario2@sistema.com','2020-09-08',NULL,NULL,0,NULL,NULL,0,NULL),(6,3,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'321654987','1998-08-25','testsinemployee3@sistema.com','Femenino','1998-08-25',NULL,NULL,'3216589656','3216589656','testsinemployee3@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(7,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(8,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(9,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(10,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(11,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(12,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(13,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(14,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(15,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(16,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(17,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(18,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(19,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(20,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(21,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(22,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(23,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(24,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(25,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(26,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(27,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL),(28,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345','1990-01-01','Super Admin usuario','Masculino','1990-01-01',NULL,NULL,'1234567890','1234567890','admin@sistema.com','2024-04-24',NULL,NULL,0,NULL,NULL,0,NULL),(29,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,'12345678965','2024-07-31','testsinemployee2@sistema.com','Masculino','2024-07-31',NULL,NULL,'3215698569','3215698569','testsinemployee2@sistema.com','2024-07-31',NULL,NULL,0,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_academic`
--

DROP TABLE IF EXISTS `employee_academic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_academic` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EducationalLevelId` int DEFAULT NULL,
  `Career` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Employee___Educa__2739D489` (`EducationalLevelId`),
  CONSTRAINT `FK__Employee___Educa__2739D489` FOREIGN KEY (`EducationalLevelId`) REFERENCES `educational_level` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_academic`
--

LOCK TABLES `employee_academic` WRITE;
/*!40000 ALTER TABLE `employee_academic` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_academic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_file`
--

DROP TABLE IF EXISTS `employee_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_file` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EmployeeId` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Level1` varchar(255) DEFAULT NULL,
  `Level2` varchar(255) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `Level3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Employee___Emplo__625A9A57` (`EmployeeId`),
  CONSTRAINT `FK__Employee___Emplo__625A9A57` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_file`
--

LOCK TABLES `employee_file` WRITE;
/*!40000 ALTER TABLE `employee_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_file_type`
--

DROP TABLE IF EXISTS `employee_file_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_file_type` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LevelId` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Employee___Level__6FE99F9F` (`LevelId`),
  CONSTRAINT `FK__Employee___Level__6FE99F9F` FOREIGN KEY (`LevelId`) REFERENCES `employee_file_type` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_file_type`
--

LOCK TABLES `employee_file_type` WRITE;
/*!40000 ALTER TABLE `employee_file_type` DISABLE KEYS */;
INSERT INTO `employee_file_type` VALUES (1,NULL,'Bienestar'),(2,NULL,'Información personal'),(3,NULL,'Contratos y otro si'),(4,NULL,'Perfil de cargos'),(5,1,'Bonificaciones'),(6,1,'Polizas'),(7,1,'Beneficios Laborales'),(8,2,'Hoja de vida'),(9,2,'Procesos disciplinarios'),(10,2,'Certificaciones laborales'),(11,2,'Cesantias'),(12,2,'Vacaciones'),(13,2,'Dotación'),(14,2,'Seguridad social'),(15,2,'Salud'),(16,2,'Incrementos de salarios'),(17,3,'Contratos'),(18,3,'Otros SI'),(19,2,'Promoción y Prevención'),(20,6,'Plan Prevensión Exequial'),(21,1,'Cartas'),(22,6,'Seguro de vida'),(23,8,'Formato - Hoja de vida funcionario y/o contratista '),(24,8,'Hoja de vida'),(25,8,'Formato - Entrevista'),(26,8,'Informe de selección'),(27,8,'Pruebas Psicotécnicas'),(28,8,'Fotocopia de la Cedula'),(29,8,'Consultas antecedentes disciplinarios'),(30,8,'Certificados de estudios'),(31,8,'Formato de verificación de referencias'),(32,8,'Referencias Laborales'),(33,8,'Referencias personales'),(34,8,'Formato de Visita Domiciliaria'),(35,8,'Formato de firma y huellas'),(36,8,'Formato - Carta de Recomendaciones'),(37,8,'RUT'),(38,8,'Copia de Licencia de Conducción'),(39,8,'Copia de Tarjeta de Propiedad'),(40,8,'Copia de SOAT'),(41,8,'Copia Revisión Técnico Mecánica'),(42,8,'Estado en infracciones de Tránsito'),(43,8,'Certificación Bancaria (Colpatria o Bancolombia)'),(44,8,'Otros Documentos'),(45,9,'2014'),(46,9,'2015'),(47,9,'2016'),(48,9,'2017'),(49,9,'2018'),(50,9,'2019'),(51,9,'2020'),(52,9,'2021'),(53,9,'2022'),(54,9,'Comunicados Internos'),(55,9,'Comunicados SG-SST'),(56,9,'2023'),(57,11,'Solicitud Retiro Cesantias - 2015'),(58,11,'Solicitud Retiro Cesantias - 2016'),(59,11,'Solicitud Retiro Cesantias - 2017'),(60,11,'Solicitud Retiro Cesantias - 2018'),(61,11,'Solicitud Retiro Cesantias - 2019'),(62,11,'Solicitud Retiro Cesantias - 2020'),(63,11,'Solicitud Retiro Cesantias - 2021'),(64,11,'Solicitud Retiro Cesantias - 2022'),(65,11,'Solicitud Retiro Cesantias - 2023'),(66,12,'2010 - 2011'),(67,12,'2011 - 2012'),(68,12,'2012 - 2013'),(69,12,'2013 - 2014'),(70,12,'2014 - 2015'),(71,12,'2015 - 2016'),(72,12,'2016 - 2017'),(73,12,'2017 - 2018'),(74,12,'2018 - 2019'),(75,12,'2019 - 2020'),(76,12,'2020 - 2021'),(77,12,'2021 - 2022'),(78,12,'2022 - 2023'),(79,13,'2016'),(80,13,'2017'),(81,13,'2018'),(82,13,'2019'),(83,13,'2020'),(84,13,'2021'),(85,13,'2022'),(86,13,'2023'),(87,13,'2024'),(88,14,'EPS'),(89,14,'AFP'),(90,14,'CCF'),(91,14,'ARL'),(92,19,'Carnet Vacuna Covid'),(93,19,'Examenes Ocupacionales Ingreso'),(94,19,'Examenes Ocupacionales Formato Reporte condiciones de Salud '),(95,19,'Examenes Ocupacionales Profesiograma'),(96,19,'Examenes Ocupacionales Examenes Medicos'),(97,19,'Pruebas Covid-19'),(98,16,'2014'),(99,16,'2015'),(100,16,'2016'),(101,16,'2017'),(102,16,'2018'),(103,16,'2019'),(104,16,'2020'),(105,16,'2021'),(106,16,'2022'),(107,16,'2023'),(108,16,'2024'),(109,17,'Fijos'),(110,17,'Termino indefinido'),(111,17,'Prestación de servicios'),(112,18,'Anteriores'),(113,18,'2019'),(114,18,'2020'),(115,18,'2021'),(116,18,'2022'),(117,18,'2023');
/*!40000 ALTER TABLE `employee_file_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_general`
--

DROP TABLE IF EXISTS `employee_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_general` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CityId` int DEFAULT NULL,
  `HousingTypeId` int DEFAULT NULL,
  `TransportationId` int DEFAULT NULL,
  `EmergencyContactName` varchar(255) DEFAULT NULL,
  `EmergencyContactPhone` varchar(255) DEFAULT NULL,
  `EmergencyContactRelationship` varchar(255) DEFAULT NULL,
  `Dependents` int DEFAULT NULL,
  `DependentsUnder9` int DEFAULT NULL,
  `DependentBirthDate` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Neighborhood` varchar(255) DEFAULT NULL,
  `HousingTime` int DEFAULT NULL,
  `SocioeconomicStatus` int DEFAULT NULL,
  `LicensePlate` varchar(255) DEFAULT NULL,
  `VehicleMark` varchar(255) DEFAULT NULL,
  `VehicleModel` varchar(255) DEFAULT NULL,
  `LicenseNumber` varchar(255) DEFAULT NULL,
  `LicenseCategory` varchar(255) DEFAULT NULL,
  `LicenseValidity` date DEFAULT NULL,
  `SOATExpirationDate` date DEFAULT NULL,
  `RTMExpirationDate` date DEFAULT NULL,
  `VehicleOwnerName` varchar(255) DEFAULT NULL,
  `ContributorType` varchar(255) DEFAULT NULL,
  `Eps` varchar(255) DEFAULT NULL,
  `Arl` varchar(255) DEFAULT NULL,
  `Afp` varchar(255) DEFAULT NULL,
  `RecommendedBy` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Employee___CityI__5224328E` (`CityId`),
  KEY `FK__Employee___Housi__531856C7` (`HousingTypeId`),
  KEY `FK__Employee___Trans__540C7B00` (`TransportationId`),
  CONSTRAINT `FK__Employee___CityI__5224328E` FOREIGN KEY (`CityId`) REFERENCES `city` (`Id`),
  CONSTRAINT `FK__Employee___Housi__531856C7` FOREIGN KEY (`HousingTypeId`) REFERENCES `housing_type` (`Id`),
  CONSTRAINT `FK__Employee___Trans__540C7B00` FOREIGN KEY (`TransportationId`) REFERENCES `transportation` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_general`
--

LOCK TABLES `employee_general` WRITE;
/*!40000 ALTER TABLE `employee_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_knowledges`
--

DROP TABLE IF EXISTS `employee_knowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_knowledges` (
  `EmployeeId` int DEFAULT NULL,
  `KnowledgeId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  KEY `FK__Employee___Emplo__6442E2C9` (`EmployeeId`),
  KEY `FK__Employee___Knowl__65370702` (`KnowledgeId`),
  CONSTRAINT `FK__Employee___Emplo__6442E2C9` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`),
  CONSTRAINT `FK__Employee___Knowl__65370702` FOREIGN KEY (`KnowledgeId`) REFERENCES `knowledge` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_knowledges`
--

LOCK TABLES `employee_knowledges` WRITE;
/*!40000 ALTER TABLE `employee_knowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_knowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_skills`
--

DROP TABLE IF EXISTS `employee_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_skills` (
  `EmployeeId` int DEFAULT NULL,
  `SkillId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  KEY `FK__Employee___Emplo__671F4F74` (`EmployeeId`),
  KEY `FK__Employee___Skill__681373AD` (`SkillId`),
  CONSTRAINT `FK__Employee___Emplo__671F4F74` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`),
  CONSTRAINT `FK__Employee___Skill__681373AD` FOREIGN KEY (`SkillId`) REFERENCES `skill` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_skills`
--

LOCK TABLES `employee_skills` WRITE;
/*!40000 ALTER TABLE `employee_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_sons`
--

DROP TABLE IF EXISTS `employee_sons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_sons` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EmployeeGeneralId` int NOT NULL,
  `SonBornDate` date NOT NULL,
  `SonName` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_employee_general_id` (`EmployeeGeneralId`),
  CONSTRAINT `fk_employees_general_id_employees_sons_id` FOREIGN KEY (`EmployeeGeneralId`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_sons`
--

LOCK TABLES `employee_sons` WRITE;
/*!40000 ALTER TABLE `employee_sons` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_sons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_status`
--

DROP TABLE IF EXISTS `employee_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_status` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_status`
--

LOCK TABLES `employee_status` WRITE;
/*!40000 ALTER TABLE `employee_status` DISABLE KEYS */;
INSERT INTO `employee_status` VALUES (1,0,'Activo'),(2,0,'Inactivo');
/*!40000 ALTER TABLE `employee_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `EmpresaID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`EmpresaID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Empresa A',1),(2,'Empresa B',1),(3,'Empresa C',1);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosacciones`
--

DROP TABLE IF EXISTS `estadosacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosacciones` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosacciones`
--

LOCK TABLES `estadosacciones` WRITE;
/*!40000 ALTER TABLE `estadosacciones` DISABLE KEYS */;
INSERT INTO `estadosacciones` VALUES (1,'aprobado'),(2,'rechazado'),(3,'calificado'),(4,'Registrado');
/*!40000 ALTER TABLE `estadosacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_type`
--

DROP TABLE IF EXISTS `housing_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_type` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_type`
--

LOCK TABLES `housing_type` WRITE;
/*!40000 ALTER TABLE `housing_type` DISABLE KEYS */;
INSERT INTO `housing_type` VALUES (1,0,'Arriendo'),(2,0,'Familiar'),(3,0,'Propia');
/*!40000 ALTER TABLE `housing_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jerarquias`
--

DROP TABLE IF EXISTS `jerarquias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jerarquias` (
  `JerarquiaID` int NOT NULL AUTO_INCREMENT,
  `JefeID` int DEFAULT NULL,
  `SubordinadoID` int DEFAULT NULL,
  PRIMARY KEY (`JerarquiaID`),
  KEY `JefeID` (`JefeID`),
  KEY `SubordinadoID` (`SubordinadoID`),
  CONSTRAINT `Jerarquias_ibfk_1` FOREIGN KEY (`JefeID`) REFERENCES `usuarios` (`UsuarioID`),
  CONSTRAINT `Jerarquias_ibfk_2` FOREIGN KEY (`SubordinadoID`) REFERENCES `usuarios` (`UsuarioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jerarquias`
--

LOCK TABLES `jerarquias` WRITE;
/*!40000 ALTER TABLE `jerarquias` DISABLE KEYS */;
/*!40000 ALTER TABLE `jerarquias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DepartmentId` int DEFAULT NULL,
  `ApproveId` int DEFAULT NULL,
  `ReportId` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Profile` varchar(255) DEFAULT NULL,
  `Functions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Job__DepartmentI__3D5E1FD2` (`DepartmentId`),
  KEY `FK__Job__ApproveId__3E52440B` (`ApproveId`),
  KEY `FK__Job__ReportId__3F466844` (`ReportId`),
  CONSTRAINT `FK__Job__ApproveId__3E52440B` FOREIGN KEY (`ApproveId`) REFERENCES `job` (`Id`),
  CONSTRAINT `FK__Job__DepartmentI__3D5E1FD2` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`Id`),
  CONSTRAINT `FK__Job__ReportId__3F466844` FOREIGN KEY (`ReportId`) REFERENCES `job` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,1,NULL,NULL,'Auxiliar Recursos Humanos','El Asistente de Recursos Humanos, trabaja bajo la dirección del Director de Recursos Humanos y asegura no solo la gestión del personal, sino también de todo el proceso que se aplica a la contratación o la motivación de los equipos.','Lorem ipsum dolor sit amet consectetur adipiscing elit turpis pretium, eleifend non faucibus consequat vel dui lobortis risus habitasse in, maecenas ultrices senectus sapien pellentesque ad accumsan pharetra.'),(2,2,NULL,NULL,'Desarrollador Senior',NULL,NULL),(3,2,NULL,NULL,'Director de Tecnologia ',NULL,NULL),(4,4,NULL,NULL,'Analista de Control de Calidad Call',NULL,NULL),(5,1,NULL,NULL,'Analista de Mercados',NULL,NULL),(6,3,NULL,NULL,'Analista de Soluciones Integrales',NULL,NULL),(7,1,NULL,NULL,'Analista de Gestión Humana ',NULL,NULL),(8,3,NULL,NULL,'Asesor',NULL,NULL),(9,4,NULL,NULL,'Asesor Call Center',NULL,NULL),(10,2,NULL,NULL,'Auxiliar de Tecnologia',NULL,NULL),(11,3,NULL,NULL,'Auxiliar Operativo',NULL,NULL),(12,1,NULL,NULL,'Auxiliar de Servicio al Cliente',NULL,NULL),(13,1,NULL,NULL,'Coordinador Agencia',NULL,NULL),(14,3,NULL,NULL,'Coordinador Operativo y Base de Datos',NULL,NULL),(15,3,NULL,NULL,'Coordinador Profesional de Formación',NULL,NULL),(16,1,NULL,NULL,'Director Comercial y Cumplimiento ',NULL,NULL),(17,1,NULL,NULL,'Gerencia Administrativa',NULL,NULL),(18,4,NULL,NULL,'Gerencia Comercial y Operaciones Call',NULL,NULL),(19,2,NULL,NULL,'Gerencia de Diseño y Desarrollo',NULL,NULL),(20,1,NULL,NULL,'Recepcionista',NULL,NULL),(21,1,NULL,NULL,'Servicios Generales',NULL,NULL),(22,4,NULL,NULL,'Supervisor Call Center',NULL,NULL),(23,3,NULL,NULL,'Supervisor Operativo ',NULL,NULL),(24,1,NULL,NULL,'Tesoreria',NULL,NULL),(25,1,17,2,'Desarrollador Junior','Perfil','Funiones'),(26,3,NULL,NULL,'Asesor Comercial Externo',NULL,NULL),(27,4,NULL,NULL,'Asesor Externo',NULL,NULL),(28,3,NULL,NULL,'Comunicaciones',NULL,NULL),(29,3,NULL,NULL,'Directora SIG',NULL,NULL),(30,3,NULL,NULL,'Prestación de Servicios',NULL,NULL),(31,1,NULL,NULL,'Psicólogo',NULL,NULL),(32,4,NULL,NULL,'Coordinador Call Center',NULL,NULL),(33,1,1,2,'test','test','test'),(34,1,1,1,' test',' test test test test',' test test test test');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_skills`
--

DROP TABLE IF EXISTS `job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_skills` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_skills`
--

LOCK TABLES `job_skills` WRITE;
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge`
--

DROP TABLE IF EXISTS `knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge`
--

LOCK TABLES `knowledge` WRITE;
/*!40000 ALTER TABLE `knowledge` DISABLE KEYS */;
INSERT INTO `knowledge` VALUES (1,0,'Neuromarketing'),(2,0,'Servicios'),(3,0,'Consumidor'),(4,0,'Medios'),(5,0,'Programación'),(6,0,'Bases de Datos'),(7,0,'Ciencias de datos');
/*!40000 ALTER TABLE `knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marital_status`
--

DROP TABLE IF EXISTS `marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marital_status` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marital_status`
--

LOCK TABLES `marital_status` WRITE;
/*!40000 ALTER TABLE `marital_status` DISABLE KEYS */;
INSERT INTO `marital_status` VALUES (1,0,'Soltero'),(2,0,'Casado'),(3,0,'Unión Libre'),(4,0,'Separado'),(5,0,'Divorciado'),(6,0,'Viudo');
/*!40000 ALTER TABLE `marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivos`
--

DROP TABLE IF EXISTS `objetivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetivos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int DEFAULT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Descripcion` text,
  `Peso` double DEFAULT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivos`
--

LOCK TABLES `objetivos` WRITE;
/*!40000 ALTER TABLE `objetivos` DISABLE KEYS */;
INSERT INTO `objetivos` VALUES (33,2,'objetivo 1 user 1 ','objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 objetivo 1 user 1 ',20,'2024-04-08 00:00:00','2024-06-22 00:00:00',1),(34,2,'objetivo 2 user 2','objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2objetivo 2 user 2',60,'2024-04-02 00:00:00','2024-06-07 00:00:00',1),(35,2,'objetivo 3 user 3','objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3objetivo 3 user 3',20,'2024-04-08 00:00:00','2024-06-14 00:00:00',1),(36,3,'Objetivo No 1 ','Descripción y resultado esperado para mi objetivo No 1',30,'2024-04-17 00:00:00','2024-10-31 00:00:00',1),(37,3,'Objetivo No 2','Descripción - resultado esperado Objetivo No 2',50,'2024-04-17 00:00:00','2024-09-07 00:00:00',1),(38,3,'Objetivo No 3','Descripción - Resultado esperado No 3',20,'2024-04-17 00:00:00','2024-11-09 00:00:00',1),(39,1,'Mi objetivo 1','Mi objetivo 1 Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1Mi objetivo 1',40,'2024-04-17 00:00:00','2024-10-25 00:00:00',1),(40,1,'Mi objetivo 2','Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2Mi objetivo 2',50,'2024-04-17 00:00:00','2024-08-31 00:00:00',1),(41,1,'Mi objetivo 3','Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3Mi objetivo 3',9,'2024-04-17 00:00:00','2024-09-07 00:00:00',1),(42,1,'Mi objetivo 4','Mi objetivo 4Mi objetivo 4Mi objetivo 4Mi objetivo 4Mi objetivo 4',1,'2024-07-01 00:00:00','2024-10-26 00:00:00',1);
/*!40000 ALTER TABLE `objetivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones_respuesta`
--

DROP TABLE IF EXISTS `opciones_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones_respuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pregunta` int DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(1) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones_respuesta`
--

LOCK TABLES `opciones_respuesta` WRITE;
/*!40000 ALTER TABLE `opciones_respuesta` DISABLE KEYS */;
INSERT INTO `opciones_respuesta` VALUES (1,0,'supera expectativas',1,5),(2,0,'cumple con su labor',1,4),(3,0,'se limita a cumplir ',1,3),(4,0,'No cumple con las expectativas',1,2),(5,0,'No cumple',1,1);
/*!40000 ALTER TABLE `opciones_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `PermisoID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `RutaAngular` varchar(255) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PermisoID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Estructura Organizacional','Acceso a estructura organizacional','employees/employee/list',0),(2,'Selección de personal','seleccion de personal RRHH','recruiter/vacancy/list',1),(3,'Encuestas','modulo encuestas','survey/pending/list',1),(4,'Roles','Roles de los Usuarios','pages/roles',1),(5,'encuestas','Acceso a encuestas','/encuestas',1),(6,'Cargos','Cargos de los Usuarios del sistema','pages/cargos',1),(7,'Usuarios','Accesos a modificacion de rutas para Permisos','pages/usuarios',1),(8,'Empresas','Empresas para superadmin','pages/empresas',1),(9,'Accesos','Accesos a la plataforma','pages/rutaspermisos',1),(10,'Permisos','Concede los Permisos entre Roles y accesos','pages/permisos',1),(11,'Admin Objetivos','Administración de los Objetivos para desempeño de la empresa','pages/adminobjetivos',1),(12,'Objetivos Usuarios','Modulo para registrar el desempeño por medio de los Objetivos de los Usuarios','pages/performance/objetiveuser',1),(13,'Admin Preguntas Competencias','Administración de las Preguntas presentadas en el modulo desempeño-Competencias','pages/adminPreguntas',1),(14,'respuestas','Administración de respuestas para el modulo desempeño-Competencias','pages/adminRespuestas',1),(15,'Admin Competencias','Administración de las Competencias asociadas a las Preguntas y respuestas de cada uno de los Usuarios.','pages/adminCompetencias',1),(16,'reportes usuario ','reportes de los Usuarios desempeño','pages/reportes-usuarios',0),(17,'Admin de personal','Admin de personal','absence/request/list',0);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulate`
--

DROP TABLE IF EXISTS `postulate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulate` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RecruiterUserId` int DEFAULT NULL,
  `FindOutId` int DEFAULT NULL,
  `DocTypeId` int DEFAULT NULL,
  `EducationalLevelId` int DEFAULT NULL,
  `EmployeeId` int DEFAULT NULL,
  `OfferedSalary` decimal(19,4) DEFAULT NULL,
  `ExpectedSalary` decimal(19,4) DEFAULT NULL,
  `Doc` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Rh` varchar(255) DEFAULT NULL,
  `Cellphone` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Career` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `PhotoUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Postulate__Recru__7073AF84` (`RecruiterUserId`),
  KEY `FK__Postulate__FindO__7167D3BD` (`FindOutId`),
  KEY `FK__Postulate__DocTy__725BF7F6` (`DocTypeId`),
  KEY `FK__Postulate__Educa__73501C2F` (`EducationalLevelId`),
  KEY `FK__Postulate__Emplo__74444068` (`EmployeeId`),
  CONSTRAINT `FK__Postulate__DocTy__725BF7F6` FOREIGN KEY (`DocTypeId`) REFERENCES `doc_type` (`Id`),
  CONSTRAINT `FK__Postulate__Educa__73501C2F` FOREIGN KEY (`EducationalLevelId`) REFERENCES `educational_level` (`Id`),
  CONSTRAINT `FK__Postulate__Emplo__74444068` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`),
  CONSTRAINT `FK__Postulate__FindO__7167D3BD` FOREIGN KEY (`FindOutId`) REFERENCES `postulate_findout` (`Id`),
  CONSTRAINT `FK__Postulate__Recru__7073AF84` FOREIGN KEY (`RecruiterUserId`) REFERENCES `user_login` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulate`
--

LOCK TABLES `postulate` WRITE;
/*!40000 ALTER TABLE `postulate` DISABLE KEYS */;
INSERT INTO `postulate` VALUES (1,1,4,1,5,488,1600000.0000,1500900.0000,'170170','Elsy Edit','de Prueba','Femenino','1967-06-07','O+','3112677878','9542329','elmar.elsy9@gmail.com','Regente de farmacia','Esta es una prueba de flujo de datos en edición de postulado sin foto (en segunda instancia).',NULL),(2,1,1,1,8,487,NULL,2100000.0000,'171171','Xiomara','de Prueba',NULL,NULL,NULL,NULL,NULL,'almego08@yahoo.es',NULL,NULL,NULL),(3,1,4,1,9,486,NULL,3800000.0000,'172172','Alvaro','de Prueba','Masculino',NULL,NULL,NULL,NULL,'DanaDWindsor@superrito.com',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(4,1,4,1,10,NULL,7.0000,10000000.0000,'4567890','Diego','Delgado','Masculino','2003-03-10','B+','2345678900','34567890','prueba@tiindux.com','Licenciado','registro prueba',NULL),(8,1,2,1,7,NULL,0.0000,0.0000,'31256456456','Jon','Doe',NULL,'1956-08-12',NULL,NULL,'23156456456','dasda@mail.com',NULL,NULL,NULL),(9,1,2,1,2,NULL,0.0000,0.0000,'564564564','Joao','Souza Silva',NULL,'1995-05-12',NULL,NULL,'3121286800','joai@gmail.com',NULL,NULL,NULL),(10,1,2,1,5,NULL,0.0000,0.0000,'12654','Juan Francisco','García Flores',NULL,'1996-06-12',NULL,NULL,'5553428400','juan@gmail.com',NULL,NULL,NULL),(11,1,2,1,7,NULL,0.0000,0.0000,'5465456','Gottfried','Leibniz',NULL,'1998-05-12',NULL,NULL,'030303986300','gottfierd@mail.com',NULL,NULL,NULL);
/*!40000 ALTER TABLE `postulate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulate_findout`
--

DROP TABLE IF EXISTS `postulate_findout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulate_findout` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulate_findout`
--

LOCK TABLES `postulate_findout` WRITE;
/*!40000 ALTER TABLE `postulate_findout` DISABLE KEYS */;
INSERT INTO `postulate_findout` VALUES (1,0,'Redes Sociales'),(2,0,'Páginas de ofertas laborales'),(3,0,'Recomendación'),(4,0,'Fue contactado por RRHH'),(5,0,'Otro');
/*!40000 ALTER TABLE `postulate_findout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulate_vacant_rel`
--

DROP TABLE IF EXISTS `postulate_vacant_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulate_vacant_rel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VacantId` int DEFAULT NULL,
  `PostulateId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `IsEmployee` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Postulate__Vacan__7720AD13` (`VacantId`),
  KEY `FK__Postulate__Postu__7814D14C` (`PostulateId`),
  CONSTRAINT `FK__Postulate__Postu__7814D14C` FOREIGN KEY (`PostulateId`) REFERENCES `postulate` (`Id`),
  CONSTRAINT `FK__Postulate__Vacan__7720AD13` FOREIGN KEY (`VacantId`) REFERENCES `vacant` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulate_vacant_rel`
--

LOCK TABLES `postulate_vacant_rel` WRITE;
/*!40000 ALTER TABLE `postulate_vacant_rel` DISABLE KEYS */;
INSERT INTO `postulate_vacant_rel` VALUES (1,1,3,1,0),(2,1,1,1,0),(3,8,2,1,0),(4,9,4,1,0),(5,8,4,1,0),(6,10,4,1,0),(7,6,4,1,0),(8,2,4,1,0),(9,1,4,1,0),(10,2,9,1,0),(11,1,10,1,0),(12,2,11,1,0);
/*!40000 ALTER TABLE `postulate_vacant_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulate_vacant_step_field_rel`
--

DROP TABLE IF EXISTS `postulate_vacant_step_field_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulate_vacant_step_field_rel` (
  `PostulateVacantRelId` int DEFAULT NULL,
  `StepFieldRelId` int DEFAULT NULL,
  `FieldValue` varchar(512) DEFAULT NULL,
  KEY `FK__Postulate__Postu__7CD98669` (`PostulateVacantRelId`),
  KEY `FK__Postulate__StepF__7DCDAAA2` (`StepFieldRelId`),
  CONSTRAINT `FK__Postulate__Postu__7CD98669` FOREIGN KEY (`PostulateVacantRelId`) REFERENCES `postulate_vacant_rel` (`Id`),
  CONSTRAINT `FK__Postulate__StepF__7DCDAAA2` FOREIGN KEY (`StepFieldRelId`) REFERENCES `step_field_rel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulate_vacant_step_field_rel`
--

LOCK TABLES `postulate_vacant_step_field_rel` WRITE;
/*!40000 ALTER TABLE `postulate_vacant_step_field_rel` DISABLE KEYS */;
INSERT INTO `postulate_vacant_step_field_rel` VALUES (1,15,'4'),(3,9,'Ok revisión'),(2,15,'5'),(3,17,'5'),(4,21,'2023-10-13'),(4,23,'ok'),(5,9,'ok'),(5,18,'3'),(5,16,'ok'),(3,18,'3'),(3,16,'ok'),(4,22,'ok'),(4,20,'ok'),(4,19,'5'),(4,15,'5'),(2,23,'ok'),(2,5,'4'),(2,7,'Muy alto'),(5,17,'4'),(6,28,'10'),(6,30,'test');
/*!40000 ALTER TABLE `postulate_vacant_step_field_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulate_vacant_step_rel`
--

DROP TABLE IF EXISTS `postulate_vacant_step_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulate_vacant_step_rel` (
  `StepId` int DEFAULT NULL,
  `PostulateVacantRelId` int DEFAULT NULL,
  `Approved` tinyint(1) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `Created` datetime(6) DEFAULT NULL,
  `Updated` datetime(6) DEFAULT NULL,
  KEY `FK__Postulate__StepI__79FD19BE` (`StepId`),
  KEY `FK__Postulate__Postu__7AF13DF7` (`PostulateVacantRelId`),
  CONSTRAINT `FK__Postulate__Postu__7AF13DF7` FOREIGN KEY (`PostulateVacantRelId`) REFERENCES `postulate_vacant_rel` (`Id`),
  CONSTRAINT `FK__Postulate__StepI__79FD19BE` FOREIGN KEY (`StepId`) REFERENCES `step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulate_vacant_step_rel`
--

LOCK TABLES `postulate_vacant_step_rel` WRITE;
/*!40000 ALTER TABLE `postulate_vacant_step_rel` DISABLE KEYS */;
INSERT INTO `postulate_vacant_step_rel` VALUES (17,1,1,'ok','2023-10-11 12:26:37.067000','2023-10-11 12:26:37.067000'),(1,3,1,'Todo en orden','2023-10-19 19:38:21.413000','2023-10-19 19:38:21.413000'),(5,3,1,'ok','2023-10-19 19:39:35.333000','2023-10-19 19:39:35.333000'),(18,3,1,'todo ok','2023-10-19 19:41:01.770000','2023-10-19 19:41:01.770000'),(19,4,1,'ok','2023-10-23 21:30:30.677000','2023-10-23 21:30:30.680000'),(3,4,1,'ok','2023-10-23 21:30:46.620000','2023-10-23 21:30:46.620000'),(17,4,0,'no','2023-10-23 21:39:12.950000','2023-10-23 21:39:12.950000'),(17,4,1,'ok','2023-10-23 21:40:27.740000','2023-10-23 21:40:27.740000'),(17,4,1,'ok','2023-10-23 21:44:00.610000','2023-10-23 21:44:00.610000'),(8,2,1,'ok','2023-10-23 21:46:00.453000','2023-10-23 21:46:00.453000'),(17,4,1,'ok','2023-10-23 21:44:08.780000','2023-10-23 21:44:08.780000'),(17,4,1,'hh','2023-10-23 21:44:35.960000','2023-10-23 21:44:35.960000'),(17,2,1,'ok','2023-10-23 21:45:53.477000','2023-10-23 21:45:53.477000'),(14,2,1,'okk','2023-10-23 21:46:59.603000','2023-10-23 21:46:59.603000'),(1,5,1,'ok','2023-10-23 22:30:07.783000','2023-10-23 22:30:07.783000'),(5,5,1,'ok','2023-10-23 22:30:13.983000','2023-10-23 22:30:13.983000'),(18,5,1,'ok','2023-10-23 22:30:37.963000','2023-10-23 22:30:37.963000');
/*!40000 ALTER TABLE `postulate_vacant_step_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idcompetencia` int DEFAULT NULL,
  `pregunta` text,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,'¿ Eres puntual en el trabajo? ',1,'2024-02-23','2024-02-23'),(2,2,'test pregunta 2',1,'2024-02-23','2024-02-23'),(3,5,'test pregunta 3',1,'2024-02-23','2024-02-23'),(4,1,'hola ',1,'2024-02-23','2024-02-23'),(5,5,'hola 2',1,'2024-02-23','2024-02-23'),(6,5,'¿ Es autodidacta y se ve el compromiso por cumplir sus Objetivos? ',1,'2024-03-08','2024-03-08'),(7,8,'¿Eres puntual en tu trabajo?',1,'2024-03-15','2024-03-15');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas_usuario`
--

DROP TABLE IF EXISTS `respuestas_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pregunta` int DEFAULT NULL,
  `id_respuesta` int DEFAULT NULL,
  `id_usuario_califica` int DEFAULT NULL,
  `id_usuario_calificado` int DEFAULT NULL,
  `comentarios` text,
  `fecha_accion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas_usuario`
--

LOCK TABLES `respuestas_usuario` WRITE;
/*!40000 ALTER TABLE `respuestas_usuario` DISABLE KEYS */;
INSERT INTO `respuestas_usuario` VALUES (1,1,3,1,1,'','0001-01-01 00:00:00'),(2,4,2,1,1,'','0001-01-01 00:00:00'),(3,2,4,1,1,'','0001-01-01 00:00:00'),(4,3,5,1,1,'','0001-01-01 00:00:00'),(5,5,2,1,1,'','0001-01-01 00:00:00'),(6,1,1,1,16,'','0001-01-01 00:00:00'),(7,4,1,1,16,'','0001-01-01 00:00:00'),(8,2,3,1,16,'','0001-01-01 00:00:00'),(9,3,1,1,16,'','0001-01-01 00:00:00'),(10,5,3,1,16,'','0001-01-01 00:00:00'),(11,1,4,1,2,'','0001-01-01 00:00:00'),(12,1,1,1,3,'','0001-01-01 00:00:00'),(13,4,3,1,35,'','0001-01-01 00:00:00'),(14,1,2,1,35,'','0001-01-01 00:00:00'),(15,2,4,1,35,'','0001-01-01 00:00:00'),(16,3,4,1,35,'Puede mejorar ','0001-01-01 00:00:00'),(17,5,1,1,35,'','0001-01-01 00:00:00'),(18,6,5,1,1,'No cumplió','0001-01-01 00:00:00'),(19,7,1,1,1,'','0001-01-01 00:00:00');
/*!40000 ALTER TABLE `respuestas_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission_rel`
--

DROP TABLE IF EXISTS `role_permission_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission_rel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` int DEFAULT NULL,
  `PermissionId` int DEFAULT NULL,
  `Active` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Role_Permission_Rel_Permission_id` (`PermissionId`),
  KEY `FK_Role_Permission_Rel_Role_id` (`RoleId`),
  CONSTRAINT `FK_Role_Permission_Rel_Permission_id` FOREIGN KEY (`PermissionId`) REFERENCES `permission` (`Id`),
  CONSTRAINT `FK_Role_Permission_Rel_Role_id` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_rel`
--

LOCK TABLES `role_permission_rel` WRITE;
/*!40000 ALTER TABLE `role_permission_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permission_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RolID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `EmpresaID` int DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  `ColorId` int DEFAULT NULL,
  PRIMARY KEY (`RolID`),
  KEY `EmpresaID` (`EmpresaID`),
  KEY `Roles_ColorId_fk` (`ColorId`),
  CONSTRAINT `Roles_ColorId_fk` FOREIGN KEY (`ColorId`) REFERENCES `color` (`Id`),
  CONSTRAINT `Roles_ibfk_1` FOREIGN KEY (`EmpresaID`) REFERENCES `empresas` (`EmpresaID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Administrador del sistema',1,1,1),(6,'Gestión Tecnologica','Gestión Tecnologica desc',NULL,1,2),(7,'Gestion Operativa','Gestion Operativa Desc',NULL,1,3),(8,'Gestión comercial','Gestión comercial Desc',NULL,1,6),(9,'Gestion gerencial ','Gestion gerencial  Desc',NULL,1,4),(10,'Gestion administrativa','Gestion administrativa desc',NULL,0,5),(22,'ColorId','ColorIdColorId',NULL,0,30),(24,'Gestion IT','Gestion ITGestion ITGestion ITGestion ITGestion IT',NULL,0,17);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolespermisos`
--

DROP TABLE IF EXISTS `rolespermisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolespermisos` (
  `rolPermisoId` int NOT NULL AUTO_INCREMENT,
  `RolID` int DEFAULT NULL,
  `PermisoID` int DEFAULT NULL,
  PRIMARY KEY (`rolPermisoId`),
  KEY `RolID` (`RolID`),
  KEY `PermisoID` (`PermisoID`),
  CONSTRAINT `RolesPermisos_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`),
  CONSTRAINT `RolesPermisos_ibfk_2` FOREIGN KEY (`PermisoID`) REFERENCES `permisos` (`PermisoID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolespermisos`
--

LOCK TABLES `rolespermisos` WRITE;
/*!40000 ALTER TABLE `rolespermisos` DISABLE KEYS */;
INSERT INTO `rolespermisos` VALUES (1,1,1),(2,1,2),(6,1,3),(9,1,5),(11,1,7),(12,1,8),(13,1,9),(14,1,10),(16,1,6),(18,1,11),(19,1,12),(30,1,13),(31,1,14),(32,1,15),(33,1,16),(53,1,17),(54,1,4);
/*!40000 ALTER TABLE `rolespermisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `SesionID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int DEFAULT NULL,
  `Token` varchar(10000) NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SesionID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `Sesiones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
INSERT INTO `sesiones` VALUES (89,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiU3VwZXIgQWRtaW4gdXN1YXJpbyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImFkbWluQHNpc3RlbWEuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMSIsIm5iZiI6MTcyNjM2NDM3MCwiZXhwIjoxNzI2MzcxNTcwLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdC8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdC8ifQ.AwFrmSNNlwpdwEb2LVKO6C3V1-Ke3IJGWOtxybtSms0','2024-09-14 20:39:31',NULL,1);
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `Token` varchar(255) NOT NULL,
  `UserId` int DEFAULT NULL,
  `Created` datetime(6) DEFAULT NULL,
  `Reload` datetime(6) DEFAULT NULL,
  `IpAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Token`),
  KEY `FK__Session__UserId__6D9742D9` (`UserId`),
  CONSTRAINT `FK__Session__UserId__6D9742D9` FOREIGN KEY (`UserId`) REFERENCES `user_login` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('0C4F484A5AE0D54B51C794BBE935DB23D1B51CEAB594A76D2B97D940602CEBE6',1,'2024-02-13 19:17:33.270000','2024-02-13 19:17:33.270000','ip-172-31-87-148'),('0C56382A09C9F66ED1BC4B095A13969C1AB20CC73673A15AB07230396535444F',1,'2023-12-30 08:23:18.310000','2023-12-30 08:23:18.310000','DAVID_RODRIGUEZ'),('228E0009B972DE763F9DF35F8B2EB943986F25F2F9366116397D9550F3F875A7',1,'2024-03-23 22:32:23.360000','2024-03-23 22:32:23.360000','MacBook-Pro-de-MacBook.local'),('39792927EF0E574A5CD0468AF9A411A1B7A117BEEC0695A30D2B576D30096108',16,'2024-02-26 21:20:53.713000','2024-02-26 21:20:53.713000','ip-172-31-87-148'),('4EB8A7E671DB895440C55935BC1A37E3301358DB4D44A97A48CB11962BA1778E',1,'2024-02-12 20:39:41.853000','2024-02-12 20:39:41.853000','ip-172-31-87-148'),('4F633DF679839C313059E8F9861DB77DBB9D13D5A20265A6BAC59DE6393094FD',2,'2023-11-20 17:30:12.073000','2023-11-20 17:30:12.073000','ip-172-31-87-148'),('55D87210E2FAD38E306B843DDBCD834C9C0E88F94FBF90211581607B79306C80',1,'2024-08-03 10:56:04.919900','2024-08-03 10:56:04.920012','DAVID_RODRIGUEZ'),('5EEDBF4CD93920F5D9960DDF6599AD524DA1AE5C5D0A5E33B69CB6936ACF5D98',1,'2023-09-10 12:28:21.443000','2023-09-10 12:28:21.443000','MacBook-Pro-de-MacBook.local'),('60C58DE4ED242C0302D65BF9F70D62A20C2AAA6395C3006A810EB0DFBACD26C1',15,'2024-02-15 03:20:43.250000','2024-02-15 03:20:43.250000','ip-172-31-87-148'),('616D5868DDAD27250F12E9E91281F58E4DA7961F3D130F99936E774B900007CF',1,'2024-06-27 22:24:29.092835','2024-06-27 22:24:29.092836','DAVID_RODRIGUEZ'),('773ECC8063D239EC2E4E3FBE5E58CC17E15E896E9B28DBD412F039C9D068F6E9',15,'2024-02-13 13:49:03.580000','2024-02-13 13:49:03.580000','ip-172-31-87-148'),('79EB46E22A26E5D833F4BDF1009F0CBADC68B0FC642CC048C01F01E363F26724',4,'2023-08-19 06:37:26.670000','2023-08-19 06:37:26.670000','MacBook-Pro-de-MacBook.local'),('7E8E3C0F1E3230229B7DEBFACFB693C038281A730FCFD96DED4FF2DAF25CF0C6',1,'2024-06-01 21:50:02.728272','2024-06-01 21:50:02.728277','DAVID_RODRIGUEZ'),('7EEF9D6804B984DA1E28875FAA1C465904C240CD1FEE778CEE156B9D9ECF28F6',1,'2024-06-27 09:51:48.839322','2024-06-27 09:51:48.839323','DAVID_RODRIGUEZ'),('7F9E1161032A2337C4CADD85E893C542039B1F5326A12BE010771F8B322A6184',1,'2024-02-07 14:18:33.747000','2024-02-07 14:18:33.747000','ip-172-31-87-148'),('96EBA9C604F448902940C3A07B4C31A89265D9AA39915593FBB0C3F0DEBCDF69',1,'2024-02-20 14:40:06.040000','2024-02-20 14:40:06.040000','ip-172-31-87-148'),('A03474FC24DD388DCA7D688051545F8EBF85BCCD15317D648E2E4833EF681407',1,'2024-01-10 02:06:32.527000','2024-01-10 02:06:32.527000','DAVID_RODRIGUEZ'),('A85BF54F9736422BCB48F0BE38A58BA6FE168CAAE4E256B64BB7019CF067BA66',2,'2023-11-08 16:19:26.123000','2023-11-08 16:19:26.123000','ip-172-31-87-148'),('B2581AD2ED477F4E633910ECDAD4A45792D11B97CEDE6B142FD8386F30284866',1,'2024-03-22 10:07:25.423000','2024-03-22 10:07:25.423000','DAVID_RODRIGUEZ'),('B4D10ECA4764BE3CD9C90EE36B90CC2783B582EE91E887AB9012ADA4340C8663',1,'2024-06-01 21:12:48.135733','2024-06-01 21:12:48.533210','DAVID_RODRIGUEZ'),('BAE7D300518ABB75C8A30294EC0F9AAE3139FE9D532DDD5BC99E83DF93725448',1,'2023-10-11 12:21:54.417000','2023-10-11 12:21:54.417000','ip-172-31-87-148'),('D45E640F66D33D66649C879583D34A2362CDA0B67525AB4DD9F5C6002737C5CA',6,'2024-04-03 22:04:19.273000','2024-04-03 22:04:19.273000','ip-172-31-87-148'),('DE505E268AC23D567BDD393C11122AC90DAF6BB5F6E6938B696FA17993D32151',1,'2023-08-21 06:34:55.647000','2023-08-21 06:34:55.647000','MacBook-Pro-de-MacBook.local'),('EB7F1B246DA9EF22A24F3A54F1B801E297679DEC6D7DAC3E8F1F4ADCEC32777F',17,'2024-02-15 01:43:47.703000','2024-02-15 01:43:47.703000','ip-172-31-87-148'),('ECA3C216B1A00D75E6A911D5F569BCC64134B67A071FDF1B23EA54827339DF9F',1,'2024-01-09 08:11:42.830000','2024-01-09 08:11:42.830000','DAVID_RODRIGUEZ'),('F4A56CC52636EA4351A32EEF12A9DB19C4D5D7931E07C48E7B29F4CAE8B26FCD',1,'2023-08-22 05:14:09.187000','2023-08-22 05:14:09.190000','ip-172-31-87-148'),('F90A3DD521715741D94D3796E4816B06B51258C756A17BC2B48C5968E779A55A',1,'2024-03-05 13:09:00.590000','2024-03-05 13:09:00.590000','ip-172-31-87-148'),('FB13B14021B95E2B3DF03011E396B9943FD7DE3FADE58773ECC00F71123521F2',2,'2023-11-09 19:52:37.693000','2023-11-09 19:52:37.693000','ip-172-31-87-148');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `SexoId` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SexoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino',1),(2,'Femenino',1),(3,'Otro',1);
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,0,'Organización'),(2,0,'Pensamiento'),(3,0,'Creatividad'),(4,0,'Trabajo en equipo'),(5,0,'Programación'),(6,0,'Comunicación'),(7,0,'Sociable');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ__Step__737584F6A3955DA2` (`Name`),
  KEY `idx_Step_Available` (`Available`),
  KEY `idx_Step_Name` (`Name`),
  KEY `idx_Step_Available_Name` (`Available`,`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,1,'Requerimiento Personal','Son los criterios que requiere Asecofin y considera esenciales para que un candidato sea considerado apto para desempeñar una función específica en una organización. Consignados en perfil de cargo. Especifica numero de vacantes.'),(2,1,'Convocatoria','Esta se realiza a través de diversos medios, como anuncios en periódicos, publicaciones en sitios web de empleo, redes sociales, convenio con el sena, caja de compensación, secretaria de la mujer entre otras.'),(3,1,'Reclutamiento','En esta fase se realiza el filtro de hojas de vida que cumplan el requerimiento del perfil'),(5,1,'Citación candidatos(as)','Los candidatos(as) pre seleccionadas en el filtro de hojas de vida se citan para inicio de proceso de selección.'),(7,1,'Charla Informativa','Se realiza la presentación general de la compañía , socialización de oferta y condiciones.'),(8,1,'Aplicación de pruebas ','En esta fase se realiza la aplicación de pruebas '),(9,1,'Entrevista ','Se realiza una entrevista de competencias evalúa las habilidades, comportamientos y capacidades específicas de un candidato(a) en relación con las competencias requeridas para el puesto. Estas competencias incluyen habilidades técnicas, habilidades interpersonales en el contexto laboral.'),(10,1,'Entrevista en Ingles ','Se realiza la validación del idioma (aplica exclusivamente para cargos bilingües) '),(11,1,'Verificación antecedentes.','Se realiza proceso de verificación de antecedentes en base de datos: Consultas de fuentes a nivel nacional e internacional, referente a lavados de activos y financiación del terrorismo.'),(12,1,'Verificación de referencias y documentación','Se realiza se proceso de verificación de referencias personales, laborales y validación de documentos soporte de la hoja de vida.'),(13,1,'Visita domiciliaria y estudio de seguridad','Es un proceso sistemático de evaluación y análisis de riesgos que se realiza para determinar la idoneidad del candidato. '),(14,1,'Exámenes médicos ocupacionales','Se realiza el examen de ingreso de acuerdo al profesiograma previamente establecido'),(15,1,'Proceso de contratación','Se realiza firma de contrato, afiliaciones a seguridad socia entre otros.'),(16,1,'Prueba HS','Primera etapa de prueba editada'),(17,1,'prueba tecnica','etapa prueba'),(18,1,'Entrevista Tiindux','Pruebq'),(19,1,'Entrevista Carolina Neva','prueba'),(20,1,'Contratación','Etapa final'),(21,1,'Concepto nivel ingles','Elsy');
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step_field`
--

DROP TABLE IF EXISTS `step_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step_field` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `FieldType` varchar(10) DEFAULT NULL,
  `IsRequired` tinyint(1) DEFAULT NULL,
  `Config` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step_field`
--

LOCK TABLES `step_field` WRITE;
/*!40000 ALTER TABLE `step_field` DISABLE KEYS */;
INSERT INTO `step_field` VALUES (1,1,'Calificación','number',1,'min:1|max:10'),(2,1,'Descripción de la actividad','textarea',1,''),(3,1,'Nivel de conocimiento','list',0,'options:Muy alto, Alto, Medio, Bajo, Muy bajo'),(4,1,'prueba de conocimiento','text',1,''),(6,1,'campo prueba Tiindux','number',0,'min:1|max:5'),(7,1,'Fecha de la entrevista','date',1,''),(8,1,'Observaciones','text',1,''),(9,1,'Fecha de ingreso','date',1,''),(10,1,'Salario de ingreso','text',1,''),(11,1,'Documentación verificada','boolean',1,''),(12,1,'Firma documentación','boolean',1,'');
/*!40000 ALTER TABLE `step_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step_field_rel`
--

DROP TABLE IF EXISTS `step_field_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step_field_rel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StepId` int DEFAULT NULL,
  `StepFieldId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Step_Fiel__StepI__5F492382` (`StepId`),
  KEY `FK__Step_Fiel__StepF__603D47BB` (`StepFieldId`),
  CONSTRAINT `FK__Step_Fiel__StepF__603D47BB` FOREIGN KEY (`StepFieldId`) REFERENCES `step_field` (`Id`),
  CONSTRAINT `FK__Step_Fiel__StepI__5F492382` FOREIGN KEY (`StepId`) REFERENCES `step` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step_field_rel`
--

LOCK TABLES `step_field_rel` WRITE;
/*!40000 ALTER TABLE `step_field_rel` DISABLE KEYS */;
INSERT INTO `step_field_rel` VALUES (5,14,1,1,2),(6,15,1,1,0),(7,14,3,1,1),(8,15,2,1,1),(9,1,2,1,0),(10,13,3,1,2),(11,13,2,1,0),(12,13,1,1,1),(13,16,2,1,0),(14,16,1,1,0),(15,17,1,1,0),(16,18,2,1,0),(17,18,6,1,0),(18,18,1,1,0),(19,19,1,1,0),(20,19,2,1,0),(21,19,7,1,0),(22,19,8,1,0),(23,17,2,1,0),(24,20,9,1,0),(25,20,10,1,0),(26,20,11,1,0),(27,20,12,1,0),(28,21,1,1,0),(29,21,7,1,0),(30,21,8,1,0);
/*!40000 ALTER TABLE `step_field_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (13,1,'Encuesta test','Encuesta test con todos los campos'),(14,1,'Encuesta 2','Desc encuesta dos');
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_field`
--

DROP TABLE IF EXISTS `survey_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_field` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `FieldType` varchar(10) DEFAULT NULL,
  `IsRequired` tinyint(1) DEFAULT NULL,
  `Config` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_field`
--

LOCK TABLES `survey_field` WRITE;
/*!40000 ALTER TABLE `survey_field` DISABLE KEYS */;
INSERT INTO `survey_field` VALUES (15,1,'Apellidos','text',0,NULL),(16,1,'Nombres','text',0,''),(17,1,'Ciudad','internal',0,'score:|list:city|options:Bogotá D.C.,Medellín,Anolaima,Anserma,Ansermanuevo,Aracataca,Arauca,Arboletes,Armenia,Armero,Ataco,Barbosa,Barrancabermeja,Barranquilla,Bello,Bucaramanga,Calarca,Cali,Cañasgordas,Candelaria,Carepa,Cartagena,Cartago,Cerete,Cerro San Antonio,Chía,Chiquinquirá,Cienaga De Oro,Circasia,Cómbita,Copacabana,Córdoba,Cúcuta,Dosquebradas,Duitama,Envigado,Facatativá,Firavitoba,Florencia,Floridablanca,Funza,Fusagasugá,Gama,Gigante,Girardot,Girón,Guadalajara De Buga,Guatavita,Hobo,Honda,Ibagué,Ipiales,Itagüí,Jamundí,La Estrella,Lebrija,Líbano,Los Patios,Madrid,Málaga,Malambo,Manizales,Marinilla,Melgar,Moniquira,Montería,Mosquera,Neiva,Nobsa,Ocaña,Palmar De Varela,Palmira,Pasto,Pelaya,Pereira,Piedecuesta,Pivijay,Planeta Rica,Popayán,Puerto Colombia,Purificación,Quibdó,Remedios,Rionegro,Risaralda,Sabaneta,San Cayetano,San Pelayo,San Rafael,Santa Marta,Santo Tomas,Sincelejo,Soacha,Sogamoso,Soledad,Suan,Tuluá,Tunja,Turbaco,Ubaté,Valledupar,Villa De Leyva,Villa Del Rosario,Villa María,Villavicencio,Villeta,Yumbo,Buga,Pedraza,San Andrés de Sotavento'),(18,1,'fecha nacimiento','date',0,''),(19,1,'Lista opcional','list',0,'options:opcion 1,opcion 2,opcion 3score:'),(20,1,'campo seleccion','boolean',0,''),(21,1,'Descripcion','textarea',0,'');
/*!40000 ALTER TABLE `survey_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_field_rel`
--

DROP TABLE IF EXISTS `survey_field_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_field_rel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SurveyId` int DEFAULT NULL,
  `SurveyFieldId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Survey_Fi__Surve__690797E6` (`SurveyId`),
  KEY `FK__Survey_Fi__Surve__69FBBC1F` (`SurveyFieldId`),
  CONSTRAINT `FK__Survey_Fi__Surve__690797E6` FOREIGN KEY (`SurveyId`) REFERENCES `survey` (`Id`),
  CONSTRAINT `FK__Survey_Fi__Surve__69FBBC1F` FOREIGN KEY (`SurveyFieldId`) REFERENCES `survey_field` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_field_rel`
--

LOCK TABLES `survey_field_rel` WRITE;
/*!40000 ALTER TABLE `survey_field_rel` DISABLE KEYS */;
INSERT INTO `survey_field_rel` VALUES (54,13,16,1,0),(55,13,18,1,0),(56,13,17,1,0),(57,13,19,1,0),(58,13,15,1,0),(59,13,20,1,0),(60,13,21,1,0),(61,14,16,1,0),(62,14,21,1,0),(63,14,15,1,0);
/*!40000 ALTER TABLE `survey_field_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_field_response_rel`
--

DROP TABLE IF EXISTS `survey_field_response_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_field_response_rel` (
  `SurveyResponseId` int DEFAULT NULL,
  `SurveyFieldRelId` int DEFAULT NULL,
  `FieldValue` varchar(512) DEFAULT NULL,
  KEY `FK__Survey_Fi__Surve__0880433F` (`SurveyResponseId`),
  KEY `FK__Survey_Fi__Surve__09746778` (`SurveyFieldRelId`),
  CONSTRAINT `FK__Survey_Fi__Surve__0880433F` FOREIGN KEY (`SurveyResponseId`) REFERENCES `survey_response` (`Id`),
  CONSTRAINT `FK__Survey_Fi__Surve__09746778` FOREIGN KEY (`SurveyFieldRelId`) REFERENCES `survey_field_rel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_field_response_rel`
--

LOCK TABLES `survey_field_response_rel` WRITE;
/*!40000 ALTER TABLE `survey_field_response_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_field_response_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_header`
--

DROP TABLE IF EXISTS `survey_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_header` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SurveyId` int DEFAULT NULL,
  `Started` datetime(6) DEFAULT NULL,
  `Finished` datetime(6) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Survey_He__Surve__5D95E53A` (`SurveyId`),
  CONSTRAINT `FK__Survey_He__Surve__5D95E53A` FOREIGN KEY (`SurveyId`) REFERENCES `survey` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_header`
--

LOCK TABLES `survey_header` WRITE;
/*!40000 ALTER TABLE `survey_header` DISABLE KEYS */;
INSERT INTO `survey_header` VALUES (10,13,'2024-09-14 00:00:00.000000','2024-09-15 00:00:00.000000','cabecera Test'),(11,14,'2024-09-14 00:00:00.000000','2024-09-16 00:00:00.000000','cabcera 2'),(12,13,'2024-09-14 00:00:00.000000','2024-09-18 00:00:00.000000','cabecera 3'),(13,14,'2024-08-31 00:00:00.000000','2024-09-15 00:00:00.000000','cabecera 3'),(14,14,'2024-09-14 00:00:00.000000','2024-09-15 00:00:00.000000','cabecera 4');
/*!40000 ALTER TABLE `survey_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_response`
--

DROP TABLE IF EXISTS `survey_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_response` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SurveyUserId` int DEFAULT NULL,
  `Created` datetime(6) DEFAULT NULL,
  `Draft` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Survey_Re__Surve__04AFB25B` (`SurveyUserId`),
  CONSTRAINT `FK__Survey_Re__Surve__04AFB25B` FOREIGN KEY (`SurveyUserId`) REFERENCES `survey_user_login_rel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_response`
--

LOCK TABLES `survey_response` WRITE;
/*!40000 ALTER TABLE `survey_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_response_score_rel`
--

DROP TABLE IF EXISTS `survey_response_score_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_response_score_rel` (
  `SurveyResponseId` int DEFAULT NULL,
  `Item` varchar(255) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Score` int DEFAULT NULL,
  KEY `FK__Survey_Re__Surve__0697FACD` (`SurveyResponseId`),
  CONSTRAINT `FK__Survey_Re__Surve__0697FACD` FOREIGN KEY (`SurveyResponseId`) REFERENCES `survey_response` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_response_score_rel`
--

LOCK TABLES `survey_response_score_rel` WRITE;
/*!40000 ALTER TABLE `survey_response_score_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_response_score_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_responses`
--

DROP TABLE IF EXISTS `survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int DEFAULT NULL,
  `field_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `survey_header_id` int DEFAULT NULL,
  `response_value` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `survey_responses_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`Id`),
  CONSTRAINT `survey_responses_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `survey_field` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_responses`
--

LOCK TABLES `survey_responses` WRITE;
/*!40000 ALTER TABLE `survey_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_user_login_rel`
--

DROP TABLE IF EXISTS `survey_user_login_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_user_login_rel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SurveyHeaderId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Survey_Us__Surve__00DF2177` (`SurveyHeaderId`),
  KEY `FK__Survey_Us__UserI__01D345B0` (`UserId`),
  CONSTRAINT `FK__Survey_Us__Surve__00DF2177` FOREIGN KEY (`SurveyHeaderId`) REFERENCES `survey_header` (`Id`),
  CONSTRAINT `FK__Survey_Us__UserI__01D345B0` FOREIGN KEY (`UserId`) REFERENCES `user_login` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_user_login_rel`
--

LOCK TABLES `survey_user_login_rel` WRITE;
/*!40000 ALTER TABLE `survey_user_login_rel` DISABLE KEYS */;
INSERT INTO `survey_user_login_rel` VALUES (38,12,1,1),(39,12,2,1),(40,12,3,1),(41,12,4,1),(42,12,5,1),(43,12,6,1),(45,10,1,1),(46,10,2,1),(47,10,3,1),(48,10,4,1),(49,10,5,1),(52,11,3,1),(53,11,3,1);
/*!40000 ALTER TABLE `survey_user_login_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int NOT NULL,
  `diagram_id` int NOT NULL,
  `version` int DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdocumento`
--

DROP TABLE IF EXISTS `tiposdocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdocumento` (
  `TipoDocumento` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdocumento`
--

LOCK TABLES `tiposdocumento` WRITE;
/*!40000 ALTER TABLE `tiposdocumento` DISABLE KEYS */;
INSERT INTO `tiposdocumento` VALUES (1,'Cédula de Ciudadanía',1),(2,'Tarjeta de Identidad',1),(3,'Pasaporte',1);
/*!40000 ALTER TABLE `tiposdocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation`
--

DROP TABLE IF EXISTS `transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportation` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation`
--

LOCK TABLES `transportation` WRITE;
/*!40000 ALTER TABLE `transportation` DISABLE KEYS */;
INSERT INTO `transportation` VALUES (1,0,'Transporte Público'),(2,0,'Bicicleta'),(3,0,'Motocicleta'),(4,0,'Automóvil');
/*!40000 ALTER TABLE `transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreateAt` datetime(6) DEFAULT NULL,
  `Available` tinyint(1) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `EmployeeId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__User_Logi__Emplo__70A8B9AE` (`EmployeeId`),
  CONSTRAINT `FK__User_Logi__Emplo__70A8B9AE` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,'2022-06-07 12:14:38.273000',0,'admin','Asecofin123*',NULL),(2,'2022-06-07 12:14:38.277000',0,'gquigua','Asecofin123*',NULL),(3,'2022-06-07 12:14:38.277000',0,'grodriguez','Asecofin123*',NULL),(4,'2022-06-07 12:14:38.280000',0,'hsuarez','Asecofin123*',NULL),(5,'2023-08-01 18:34:56.000000',0,'ctorres','Asecofin123*',NULL),(6,'2023-10-10 23:37:24.670000',1,'1026261250','Asecofin123*',291),(7,'2023-10-16 04:58:00.140000',1,'800987646','Asecofin123*',292),(8,'2023-10-16 04:58:00.140000',1,'80123456','Asecofin123*',293),(9,'2023-10-16 04:58:00.140000',1,'7655567','Asecofin123*',395),(10,'2023-10-16 04:58:00.140000',1,'800987646','Asecofin123*',396),(11,'2023-10-16 04:58:00.140000',1,'23456789','Asecofin123*',415),(12,'2023-10-16 04:58:00.140000',1,'4567890','Asecofin123*',416),(13,'2023-10-16 04:58:00.140000',1,'80098764','Asecofin123*',417),(14,'2023-10-16 04:58:00.140000',1,'172172','Asecofin123*',486),(15,'2024-02-13 01:48:50.807000',0,'jtorres','Asecofin579*',NULL),(16,'2024-02-13 01:49:22.487000',0,'jbermont','Asecofin579*',NULL),(17,'2024-02-13 01:49:33.300000',0,'nperez','Asecofin579*',NULL);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_rel`
--

DROP TABLE IF EXISTS `user_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_rel` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `RoleId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Role_Rel_User_Login_id` (`UserId`),
  KEY `FK_User_Role_Rel_RoleId_id` (`RoleId`),
  CONSTRAINT `FK_User_Role_Rel_RoleId_id` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`),
  CONSTRAINT `FK_User_Role_Rel_User_Login_id` FOREIGN KEY (`UserId`) REFERENCES `user_login` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_rel`
--

LOCK TABLES `user_role_rel` WRITE;
/*!40000 ALTER TABLE `user_role_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `UsuarioID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `TipoDocumento` int NOT NULL,
  `NumDocumento` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `FechaNacimiento` datetime NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `SexoId` int DEFAULT NULL,
  `JefeId` int DEFAULT NULL,
  `RolID` int DEFAULT NULL,
  `CargoID` int DEFAULT NULL,
  `EmpresaID` int DEFAULT NULL,
  `UsuarioIdOpcional` int DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`UsuarioID`),
  KEY `RolID` (`RolID`),
  KEY `CargoID` (`CargoID`),
  KEY `EmpresaID` (`EmpresaID`),
  KEY `JefeId` (`JefeId`),
  KEY `SexoId` (`SexoId`),
  KEY `TipoDocumento` (`TipoDocumento`),
  CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`),
  CONSTRAINT `Usuarios_ibfk_2` FOREIGN KEY (`CargoID`) REFERENCES `cargos` (`CargoID`),
  CONSTRAINT `Usuarios_ibfk_3` FOREIGN KEY (`EmpresaID`) REFERENCES `empresas` (`EmpresaID`),
  CONSTRAINT `Usuarios_ibfk_4` FOREIGN KEY (`JefeId`) REFERENCES `usuarios` (`UsuarioID`),
  CONSTRAINT `Usuarios_ibfk_5` FOREIGN KEY (`SexoId`) REFERENCES `sexo` (`SexoId`),
  CONSTRAINT `Usuarios_ibfk_6` FOREIGN KEY (`TipoDocumento`) REFERENCES `tiposdocumento` (`TipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Super Admin usuario',1,'12345','admin@sistema.com','$2a$11$JIPxPk4FevNNeOnaaP/dB.zSP1Pqg/UOwC3FptuqpI4YpG3cS1.cC','1234567890','Calle Principal 123','1990-01-01 00:00:00','2024-04-24 00:00:00',1,NULL,1,1,1,28,0),(2,'usuario 1 integrado',1,'123456','usuario1@sistema.com','$2a$11$DlO49.S2MJyRLDSL1AiDI.VGILj13iSBJAuKv6YCgTHSsScZT0cje','3215633252','','2005-08-01 00:00:00','2005-08-01 00:00:00',1,1,1,1,1,1,1),(3,'usuario 2 integrado',1,'123456789','usuario2@sistema.com','$2a$11$fDjgH3PbRWv.jaNduKZzGe7BrjQG9x8SlaRJV9qRjur6d1ur8o4Qm','3216598569','','1990-09-08 00:00:00','2010-09-08 00:00:00',1,1,1,1,1,5,1),(4,'testsinemployee@sistema.com',1,'1234567893','testsinemployee@sistema.com','$2a$11$w1J7sNK5TZzzuXd.vfOccu1S8QJk.8udgqk/ItmutiD7acztByIR.','3215236369','calle 32 65 98','1998-01-08 00:00:00','2024-07-31 00:00:00',1,1,1,1,1,1,1),(5,'testsinemployee2@sistema.com',1,'12345678965','testsinemployee2@sistema.com','$2a$11$9MGJGHSlFzmLQQ3iklrEaOZ8zix.n.yLJSljxxxlbgTwnD985oN96','3215698569','calle 13 sur 25 63','2024-07-31 00:00:00','2024-07-31 00:00:00',1,1,1,1,1,29,1),(6,'testsinemployee3@sistema.com',1,'321654987','testsinemployee3@sistema.com','$2a$11$Ncok6Jh8AJIj0AlRXjhlgeafWa8/9KyuX15ECrFdg..sfC2YmYtx2','3216589656','av 13 15 63','1998-08-25 00:00:00','2024-07-31 00:00:00',2,1,1,3,1,6,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariospermisos`
--

DROP TABLE IF EXISTS `usuariospermisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariospermisos` (
  `UsuarioID` int NOT NULL,
  `PermisoID` int NOT NULL,
  PRIMARY KEY (`UsuarioID`,`PermisoID`),
  KEY `PermisoID` (`PermisoID`),
  CONSTRAINT `UsuariosPermisos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `UsuariosPermisos_ibfk_2` FOREIGN KEY (`PermisoID`) REFERENCES `permisos` (`PermisoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariospermisos`
--

LOCK TABLES `usuariospermisos` WRITE;
/*!40000 ALTER TABLE `usuariospermisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariospermisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacant`
--

DROP TABLE IF EXISTS `vacant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacant` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VacantStatusId` int DEFAULT NULL,
  `ContractTypeId` int DEFAULT NULL,
  `JobId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `Created` datetime(6) DEFAULT NULL,
  `Updated` datetime(6) DEFAULT NULL,
  `VacantNum` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Vacant__VacantSt__6501FCD8` (`VacantStatusId`),
  KEY `FK__Vacant__Contract__65F62111` (`ContractTypeId`),
  KEY `FK__Vacant__JobId__66EA454A` (`JobId`),
  KEY `FK__Vacant__UserId__67DE6983` (`UserId`),
  CONSTRAINT `FK__Vacant__Contract__65F62111` FOREIGN KEY (`ContractTypeId`) REFERENCES `contract_type` (`Id`),
  CONSTRAINT `FK__Vacant__JobId__66EA454A` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`),
  CONSTRAINT `FK__Vacant__UserId__67DE6983` FOREIGN KEY (`UserId`) REFERENCES `user_login` (`Id`),
  CONSTRAINT `FK__Vacant__VacantSt__6501FCD8` FOREIGN KEY (`VacantStatusId`) REFERENCES `vacant_status` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacant`
--

LOCK TABLES `vacant` WRITE;
/*!40000 ALTER TABLE `vacant` DISABLE KEYS */;
INSERT INTO `vacant` VALUES (1,2,1,2,1,'2023-08-17 21:46:59.570000','2024-09-06 16:17:09.270767',10,'Esta es una prueba de datos para editar la vacante creada previamente, en este caso editando la descripción y el número de vacantes.'),(2,2,1,1,1,'2023-08-17 21:48:47.123000','2023-08-17 21:48:47.123000',10,'Proceso para encontrar asesores de call center para la ciudad de Bogotá en horarios rotativos de 6 horas.'),(4,4,1,13,1,'2023-08-17 22:16:38.837000','2023-08-19 07:09:51.263000',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),(5,3,2,3,1,'2023-08-17 22:20:13.800000','2023-08-19 06:56:52.017000',2,'Aliquet enim tortor at auctor urna. In cursus turpis massa tincidunt dui ut ornare. Porttitor eget dolor morbi non arcu risus quis varius.'),(6,1,3,20,1,'2023-08-20 04:51:56.667000','2023-08-20 05:05:56.137000',1,'Esta es una prueba de datos para validar la creación de la vacante. Adicionalmente se valida la edición de la vacante.'),(7,1,1,29,1,'2023-10-03 18:12:46.367000','2023-10-03 18:12:46.367000',2,'Vacante de prueba'),(8,1,1,24,1,'2023-10-19 19:30:12.533000','2024-01-08 22:57:43.977000',3,'vacante prueba'),(9,1,1,20,1,'2023-10-23 20:18:04.053000','2023-10-23 21:43:16.737000',2,'PRUEBA'),(10,1,2,11,1,'2024-02-12 13:55:26.773000','2024-02-12 13:55:26.773000',1,'prueba Natalia');
/*!40000 ALTER TABLE `vacant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacant_status`
--

DROP TABLE IF EXISTS `vacant_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacant_status` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Available` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacant_status`
--

LOCK TABLES `vacant_status` WRITE;
/*!40000 ALTER TABLE `vacant_status` DISABLE KEYS */;
INSERT INTO `vacant_status` VALUES (1,1,'En proceso'),(2,1,'Pendiente'),(3,0,'No cubierta'),(4,0,'Terminada');
/*!40000 ALTER TABLE `vacant_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacant_step_rel`
--

DROP TABLE IF EXISTS `vacant_step_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacant_step_rel` (
  `VacantId` int DEFAULT NULL,
  `StepId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `IsRequired` tinyint(1) DEFAULT NULL,
  KEY `FK__Vacant_St__Vacan__69C6B1F5` (`VacantId`),
  KEY `FK__Vacant_St__StepI__6ABAD62E` (`StepId`),
  CONSTRAINT `FK__Vacant_St__StepI__6ABAD62E` FOREIGN KEY (`StepId`) REFERENCES `step` (`id`),
  CONSTRAINT `FK__Vacant_St__Vacan__69C6B1F5` FOREIGN KEY (`VacantId`) REFERENCES `vacant` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacant_step_rel`
--

LOCK TABLES `vacant_step_rel` WRITE;
/*!40000 ALTER TABLE `vacant_step_rel` DISABLE KEYS */;
INSERT INTO `vacant_step_rel` VALUES (6,5,1,0,0),(6,1,1,-1,1),(6,2,1,1,0),(6,16,1,2,1),(7,1,1,0,0),(7,17,1,0,0),(7,16,1,0,0),(1,17,1,0,1),(1,8,1,0,1),(1,14,1,0,1),(8,1,1,0,1),(8,5,1,0,1),(8,18,1,0,1),(9,19,1,0,1),(8,20,1,0,0),(10,21,1,0,1),(9,3,1,0,1),(9,17,1,0,0);
/*!40000 ALTER TABLE `vacant_step_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'integracionrrhh'
--

--
-- Dumping routines for database 'integracionrrhh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14 23:39:44

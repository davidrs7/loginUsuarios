CREATE DATABASE  IF NOT EXISTS `login_tiindux` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `login_tiindux`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: login_tiindux
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
  CONSTRAINT `accionesobjetivos_ibfk_1` FOREIGN KEY (`IdObjetivo`) REFERENCES `objetivos` (`Id`),
  CONSTRAINT `accionesobjetivos_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`UsuarioID`),
  CONSTRAINT `accionesobjetivos_ibfk_3` FOREIGN KEY (`IdEstado`) REFERENCES `estadosacciones` (`Id`)
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
  CONSTRAINT `cargos_ibfk_1` FOREIGN KEY (`EmpresaID`) REFERENCES `empresas` (`EmpresaID`)
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
  CONSTRAINT `jerarquias_ibfk_1` FOREIGN KEY (`JefeID`) REFERENCES `usuarios` (`UsuarioID`),
  CONSTRAINT `jerarquias_ibfk_2` FOREIGN KEY (`SubordinadoID`) REFERENCES `usuarios` (`UsuarioID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Estructura Organizacional','Acceso a estructura organizacional','employees/employee/list',0),(2,'Selección de personal','seleccion de personal RRHH','recruiter/vacancy/list',1),(3,'Encuestas','modulo encuestas','survey/pending/list',1),(4,'Roles','Roles de los usuarios','pages/roles',1),(5,'encuestas','Acceso a encuestas','/encuestas',1),(6,'Cargos','Cargos de los usuarios del sistema','pages/cargos',1),(7,'Usuarios','Accesos a modificacion de rutas para permisos','pages/usuarios',1),(8,'Empresas','Empresas para superadmin','pages/empresas',1),(9,'Accesos','Accesos a la plataforma','pages/rutaspermisos',1),(10,'Permisos','Concede los permisos entre roles y accesos','pages/permisos',1),(11,'Admin objetivos','Administración de los objetivos para desempeño de la empresa','pages/adminobjetivos',1),(12,'Objetivos usuarios','Modulo para registrar el desempeño por medio de los objetivos de los usuarios','pages/performance/objetiveUser',1),(13,'Admin preguntas competencias','Administración de las preguntas presentadas en el modulo desempeño-competencias','pages/adminPreguntas',1),(14,'respuestas','Administración de respuestas para el modulo desempeño-competencias','pages/adminRespuestas',1),(15,'Admin competencias','Administración de las competencias asociadas a las preguntas y respuestas de cada uno de los usuarios.','pages/adminCompetencias',1),(16,'reportes usuario ','reportes de los usuarios desempeño','pages/reportes-usuarios',0);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
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
INSERT INTO `preguntas` VALUES (1,1,'¿ Eres puntual en el trabajo? ',1,'2024-02-23','2024-02-23'),(2,2,'test pregunta 2',1,'2024-02-23','2024-02-23'),(3,5,'test pregunta 3',1,'2024-02-23','2024-02-23'),(4,1,'hola ',1,'2024-02-23','2024-02-23'),(5,5,'hola 2',1,'2024-02-23','2024-02-23'),(6,5,'¿ Es autodidacta y se ve el compromiso por cumplir sus objetivos? ',1,'2024-03-08','2024-03-08'),(7,8,'¿Eres puntual en tu trabajo?',1,'2024-03-15','2024-03-15');
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
  PRIMARY KEY (`RolID`),
  KEY `EmpresaID` (`EmpresaID`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`EmpresaID`) REFERENCES `empresas` (`EmpresaID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Administrador del sistema',1,1);
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
  CONSTRAINT `rolespermisos_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`),
  CONSTRAINT `rolespermisos_ibfk_2` FOREIGN KEY (`PermisoID`) REFERENCES `permisos` (`PermisoID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolespermisos`
--

LOCK TABLES `rolespermisos` WRITE;
/*!40000 ALTER TABLE `rolespermisos` DISABLE KEYS */;
INSERT INTO `rolespermisos` VALUES (1,1,1),(2,1,2),(6,1,3),(9,1,5),(11,1,7),(12,1,8),(13,1,9),(14,1,10),(16,1,6),(18,1,11),(19,1,12),(30,1,13),(31,1,14),(32,1,15),(33,1,16),(52,1,4);
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
  CONSTRAINT `sesiones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
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
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`CargoID`) REFERENCES `cargos` (`CargoID`),
  CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`EmpresaID`) REFERENCES `empresas` (`EmpresaID`),
  CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`JefeId`) REFERENCES `usuarios` (`UsuarioID`),
  CONSTRAINT `usuarios_ibfk_5` FOREIGN KEY (`SexoId`) REFERENCES `sexo` (`SexoId`),
  CONSTRAINT `usuarios_ibfk_6` FOREIGN KEY (`TipoDocumento`) REFERENCES `tiposdocumento` (`TipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Admin usuario',1,'1010209828','david@test.com','$2a$11$JIPxPk4FevNNeOnaaP/dB.zSP1Pqg/UOwC3FptuqpI4YpG3cS1.cC','1234567890','Calle Principal 123','1990-01-01 00:00:00','2024-04-24 00:00:00',1,35,1,1,1,1,0),(2,'Usuario1',1,'987654321','user1@example.com','$2a$11$ndbU72Zve/OIGrMaNpYnvuDJNM7jptF5gMQhRbjGHESR.RlXTHZD.','9876543210','Calle Secundaria 456','1995-05-15 00:00:00','2024-04-08 00:00:00',2,1,1,1,1,1,0),(3,'Usuario2',1,'456789012','user2@example.com','$2a$11$IkL3e1SN4B2PMAKMJOkxeuSI9PrkJQDsTIb3KV5PtVhNktTVhLDFK','4567890123','Calle Terciaria 789','1998-11-20 00:00:00','2024-04-05 00:00:00',1,2,1,2,2,1,0),(4,'Gerente1',1,'111111111','gerente1@example.com','$2a$11$OTEgW6x7y35XP6E74gfmv.tIBhgeb2VNTGJsM.Lg8TEF2WpVEEpXu','1111111111','Calle Gerente 123','1985-08-10 00:00:00','2024-01-13 15:21:01',2,NULL,1,3,3,NULL,1),(5,'Analista1',1,'222222222','analista1@example.com','$2a$11$OTEgW6x7y35XP6E74gfmv.tIBhgeb2VNTGJsM.Lg8TEF2WpVEEpXu','2222222222','Calle Analista 456','1992-04-25 00:00:00','2024-01-13 15:21:01',1,4,1,3,3,2,1),(15,'Maria Rodriguez',2,'987654321','mrodriguez@example.com','$2a$11$6WchW6ae5NUn7FyeMvePue553psMJtSiyf75XJvSeOZiZg2t31WWO','9876543210','Avenida 456','1985-05-15 00:00:00','2024-02-12 00:00:00',2,2,1,2,2,0,1),(16,'Pedro Gomez',1,'456789123','pgomez@example.com','$2a$11$/ChXppi.jmiS5dXuTs//TeQWD1sS3od9ANfvGf3poUNCL2uH1yKEe','4567891230','Plaza 789','1978-10-20 00:00:00','2024-02-12 00:00:00',1,1,1,3,3,0,1),(34,'Ana Martínez',2,'654321987','amartinez@example.com','$2a$11$2j8.N.iHv/.deyS.oxVwvO21Q/sGALmr4AYCmOq9xi/6wHCsvsGJ.','6543219870','Carretera 456','1982-12-30 00:00:00','2024-02-12 00:00:00',2,3,1,1,1,0,1),(35,'Juan Perez',1,'123456789','jperez@example.com','$2a$11$CuDUET4PDtvNkr2liIs4ju3GqLZ0yv.ihJjf1hOXJnq2zNVQeGQ/a','1234567890','Calle 123','1990-01-01 00:00:00','2024-02-12 00:00:00',1,1,1,1,1,0,1);
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
  CONSTRAINT `usuariospermisos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `usuariospermisos_ibfk_2` FOREIGN KEY (`PermisoID`) REFERENCES `permisos` (`PermisoID`)
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
-- Dumping events for database 'login_tiindux'
--

--
-- Dumping routines for database 'login_tiindux'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14 23:35:02

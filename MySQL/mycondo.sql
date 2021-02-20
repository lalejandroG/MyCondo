-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mycondo
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apartamento`
--

DROP TABLE IF EXISTS `apartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `apartamento` (
  `codigo` varchar(15) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `edificio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edificio_id` (`edificio_id`),
  CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`edificio_id`) REFERENCES `edificio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento`
--

LOCK TABLES `apartamento` WRITE;
/*!40000 ALTER TABLE `apartamento` DISABLE KEYS */;
INSERT INTO `apartamento` VALUES ('5-B',1,2),('5-A',2,2),('5-C',3,2),('1-A',4,2),('1-B',5,2),('1-C',6,2),('2-A',7,2),('2-B',8,2),('2-C',9,2),('3-A',10,2),('3-B',11,2),('3-C',12,2),('4-A',13,2),('4-B',14,2),('4-C',15,2);
/*!40000 ALTER TABLE `apartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chat` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nombre_chat` varchar(80) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'chat vecinal'),(2,'Solicitudes conserjeria'),(3,'Solicitudes junta comunal');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condominio`
--

DROP TABLE IF EXISTS `condominio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `condominio` (
  `Nombre` varchar(50) NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  `Pais` varchar(50) NOT NULL,
  `edificio_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `edificio_id` (`edificio_id`),
  CONSTRAINT `condominio_ibfk_1` FOREIGN KEY (`edificio_id`) REFERENCES `edificio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condominio`
--

LOCK TABLES `condominio` WRITE;
/*!40000 ALTER TABLE `condominio` DISABLE KEYS */;
INSERT INTO `condominio` VALUES ('Junta comunal El arroyo del Pilar',1,'Venezuela',NULL);
/*!40000 ALTER TABLE `condominio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `edificio` (
  `Nombre` varchar(50) NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_condominio` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_edificio` (`id_condominio`),
  CONSTRAINT `edificio_ibfk_1` FOREIGN KEY (`id_condominio`) REFERENCES `condominio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES ('El Arroyo del Pilar',2,1);
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envia_mensaje`
--

DROP TABLE IF EXISTS `envia_mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `envia_mensaje` (
  `ID_propietario` int NOT NULL,
  `mensaje` text,
  `Chat_destino` int NOT NULL,
  KEY `ID_propietario` (`ID_propietario`),
  KEY `Chat_destino` (`Chat_destino`),
  CONSTRAINT `envia_mensaje_ibfk_1` FOREIGN KEY (`ID_propietario`) REFERENCES `propietario` (`ID`),
  CONSTRAINT `envia_mensaje_ibfk_2` FOREIGN KEY (`Chat_destino`) REFERENCES `chat` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envia_mensaje`
--

LOCK TABLES `envia_mensaje` WRITE;
/*!40000 ALTER TABLE `envia_mensaje` DISABLE KEYS */;
INSERT INTO `envia_mensaje` VALUES (4,'La bombilla del pasillo se quemó, por favor reponerla lo antes posible',2);
/*!40000 ALTER TABLE `envia_mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasto_de_edificio`
--

DROP TABLE IF EXISTS `gasto_de_edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gasto_de_edificio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Motivo` text NOT NULL,
  `Descripcion` text NOT NULL,
  `Monto` double NOT NULL,
  `edificio_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `edificio_ID` (`edificio_ID`),
  CONSTRAINT `gasto_de_edificio_ibfk_1` FOREIGN KEY (`edificio_ID`) REFERENCES `edificio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto_de_edificio`
--

LOCK TABLES `gasto_de_edificio` WRITE;
/*!40000 ALTER TABLE `gasto_de_edificio` DISABLE KEYS */;
INSERT INTO `gasto_de_edificio` VALUES (1,'Pago del spa','Pago de la nueva maquinaria para el spa',15.2,2);
/*!40000 ALTER TABLE `gasto_de_edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugar_de_ocio`
--

DROP TABLE IF EXISTS `lugar_de_ocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lugar_de_ocio` (
  `Nombre` varchar(50) NOT NULL,
  `edificio_id` int NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `edificio_id` (`edificio_id`),
  CONSTRAINT `lugar_de_ocio_ibfk_1` FOREIGN KEY (`edificio_id`) REFERENCES `edificio` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar_de_ocio`
--

LOCK TABLES `lugar_de_ocio` WRITE;
/*!40000 ALTER TABLE `lugar_de_ocio` DISABLE KEYS */;
INSERT INTO `lugar_de_ocio` VALUES ('Spa',2,1),('Campo_de_golf',2,3);
/*!40000 ALTER TABLE `lugar_de_ocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paga_factura`
--

DROP TABLE IF EXISTS `paga_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paga_factura` (
  `id_gasto` int NOT NULL,
  `id_apartamento` int DEFAULT NULL,
  KEY `id_gasto` (`id_gasto`),
  KEY `id_apartamento` (`id_apartamento`),
  CONSTRAINT `paga_factura_ibfk_1` FOREIGN KEY (`id_gasto`) REFERENCES `edificio` (`ID`),
  CONSTRAINT `paga_factura_ibfk_2` FOREIGN KEY (`id_apartamento`) REFERENCES `apartamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paga_factura`
--

LOCK TABLES `paga_factura` WRITE;
/*!40000 ALTER TABLE `paga_factura` DISABLE KEYS */;
INSERT INTO `paga_factura` VALUES (1,1);
/*!40000 ALTER TABLE `paga_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `propietario` (
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `CI` int NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  `rol` int DEFAULT NULL,
  `apartamento_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `apartamento` (`apartamento_id`),
  KEY `rol` (`rol`),
  CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`),
  CONSTRAINT `propietario_ibfk_2` FOREIGN KEY (`rol`) REFERENCES `rol` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES ('Leandro','Zapata',45518985,1,NULL,1),('Dayana','Peralta',8179980,2,NULL,4),('Jacinto','Jaramillo',561062165,4,NULL,7);
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservacion` (
  `propietario_id` int DEFAULT NULL,
  `lugar_de_ocio_id` int NOT NULL,
  `hora` time NOT NULL,
  KEY `propietario_id` (`propietario_id`),
  KEY `lugar_de_ocio_id` (`lugar_de_ocio_id`),
  CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`propietario_id`) REFERENCES `propietario` (`ID`),
  CONSTRAINT `reservacion_ibfk_2` FOREIGN KEY (`lugar_de_ocio_id`) REFERENCES `lugar_de_ocio` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacion`
--

LOCK TABLES `reservacion` WRITE;
/*!40000 ALTER TABLE `reservacion` DISABLE KEYS */;
INSERT INTO `reservacion` VALUES (1,1,'10:30:00');
/*!40000 ALTER TABLE `reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rol` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'neutro'),(2,'conserje'),(3,'miembro de la junta de condominio');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-20 14:59:09

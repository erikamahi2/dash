-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_comercio_electronico_210439
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `tbb_bodegas`
--

DROP TABLE IF EXISTS `tbb_bodegas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_bodegas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `Empleado_Responsable_ID` int unsigned NOT NULL,
  `capacidad` varchar(150) NOT NULL,
  `Total_Empleados` int unsigned NOT NULL DEFAULT '0',
  `Estatus` enum('Activa','Inactiva','En remodelacion','Clasurada') NOT NULL DEFAULT 'Activa',
  `Fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Termino` datetime DEFAULT NULL,
  `fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_bodegas`
--

LOCK TABLES `tbb_bodegas` WRITE;
/*!40000 ALTER TABLE `tbb_bodegas` DISABLE KEYS */;
INSERT INTO `tbb_bodegas` VALUES (1,'Huauchinango 1',0,'4000 metros cuadrados',0,'Activa','2020-01-01 08:00:00',NULL,'2024-07-12 15:34:37',NULL),(2,'Xicotepec Norte',0,'1000 metros cuadrados',0,'Clasurada','2022-05-05 12:00:00','2023-12-31 17:00:00','2024-07-12 15:34:37',NULL),(3,'CDMX - Indios Verdes',0,'15000 metros cuadrados',0,'Activa','2020-01-01 08:00:00',NULL,'2024-07-12 15:34:37',NULL),(5,'PUE - Xonaca',0,'8000 metros cuadrados',0,'Clasurada','2022-02-14 13:00:00',NULL,'2024-07-12 15:34:37','2024-07-12 18:07:49'),(6,'GDL-Centro',0,'45000 mestros cudrados',70,'En remodelacion','2024-07-12 17:20:05',NULL,'2024-07-12 17:50:05','2024-07-12 18:38:18');
/*!40000 ALTER TABLE `tbb_bodegas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_bodegas_AFTER_INSERT` AFTER INSERT ON `tbb_bodegas` FOR EACH ROW BEGIN
  Insert INTO tbi_bitacora values
  (default,'tbb_bodegas','Create',
  concat_ws('','Se a registrado una nueva bodega con el ID:', 
  last_insert_id(),'con los siguientes datos: \n',
  'NOMBRE:',new.nombre,'\n',
  'EMPLEADO RESPONSABLE:',new.empleado_responsable_id,'\n',
  'CAPACIDDAD:',new.capacidad,'\n',
  'TOTAL_EMPLEADOS:',new.total_empleados,'\n',
  'ESTATUS:',new.estatus,'\n',
  'FECHA INICIO:',new.fecha_inicio,'\n',
  'FECHA TERMINO:',NULLIF(new.fecha_termino,'Sin definir'),
   'FECHA ACTUALIZACIÓN:',NULLIF(new.fecha_actualizacion,'Sin definir')),user(),default, default);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_bodegas_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_bodegas` FOR EACH ROW BEGIN
set new.fecha_actualizacion = current_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_bodegas_AFTER_UPDATE` AFTER UPDATE ON `tbb_bodegas` FOR EACH ROW BEGIN
Insert INTO tbi_bitacora values
  (default,'tbb_bodegas','Update',
  concat_ws('','Se han modificado los datos de la bodega con los siguientes cambios:\n', 
  'ID',old.id,'->',new.id,'\n',
  'NOMBRE:',old.nombre,'->',new.nombre,'\n',
  'EMPLEADO RESPONSABLE:',old.empleado_responsable_id,'->',new.empleado_responsable_id,'\n',
  'CAPACIDDAD:',old.capacidad,'->',new.capacidad,'\n',
  'TOTAL_EMPLEADOS:',old.total_empleados,'->',new.total_empleados,'\n',
  'ESTATUS:',old.estatus,'->',new.estatus,'\n',
  'FECHA INICIO:',old.fecha_inicio,'->',new.fecha_inicio,'\n',
  'FECHA TERMINO:',old.fecha_termino,'->',new.fecha_termino, '\n',
'FECHA ACTUALIZACIÓN:',old.fecha_actualizacion,'->',new.fecha_actualizacion),user(),default, default);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_bodegas_AFTER_DELETE` AFTER DELETE ON `tbb_bodegas` FOR EACH ROW BEGIN
Insert INTO tbi_bitacora values
  (default,'tbb_bodegas','Delete',
  concat_ws('','Se ha eliminado una bodega con el ID:', 
  old.id,'con los siguientes datos: \n',
  'NOMBRE:',old.nombre,'\n',
  'EMPLEADO RESPONSABLE:',old.empleado_responsable_id,'\n',
  'CAPACIDDAD:',old.capacidad,'\n',
  'TOTAL_EMPLEADOS:',old.total_empleados,'\n',
  'ESTATUS:',old.estatus,'\n',
  'FECHA INICIO:',old.fecha_inicio,'\n',
  'FECHA TERMINO:',old.fecha_termino, '\n',
'FECHA ACTUALIZACIÓN:',old.fecha_actualizacion),user(),default, default);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_campanias`
--

DROP TABLE IF EXISTS `tbb_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Tipo` enum('Temporada','Posicionamiento','Liquidacion','Lanzamiento','Emergente') NOT NULL DEFAULT 'Posicionamiento',
  `Estatus` enum('Programada','Activa','Concluida','Cancelada','Inactiva') NOT NULL DEFAULT 'Inactiva',
  `Descripcion` text NOT NULL,
  `Usuario_id` int unsigned NOT NULL,
  `Presupuesto` decimal(7,2) unsigned NOT NULL,
  `Fecha_Inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Termino` datetime NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_campanias`
--

LOCK TABLES `tbb_campanias` WRITE;
/*!40000 ALTER TABLE `tbb_campanias` DISABLE KEYS */;
INSERT INTO `tbb_campanias` VALUES (1,'Ropa para Veranos de SHEIN','Temporada','Programada','Conjunto de ropa y accesorios de la empresa SHEIN propone para el verano de 2024',0,2500.00,'2024-06-20 00:00:00','2024-09-22 23:59:59','2024-07-12 15:34:37',NULL),(2,'Electronicos para papa','Emergente','Activa','Conjunto de promociones y descuentos de productos electronicos para festejar el dia del padre',0,1250.00,'2024-06-10 00:00:00','2024-06-17 23:59:59','2024-07-12 15:34:37',NULL),(3,'HOT SALE','Liquidacion','Concluida','Venta de liquidacion de diferentes marcas y productos',0,500.00,'2024-05-20 00:00:00','2024-05-31 23:59:59','2024-05-01 10:05:25',NULL);
/*!40000 ALTER TABLE `tbb_campanias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_cancelaciones`
--

DROP TABLE IF EXISTS `tbb_cancelaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_cancelaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Usuario_ID` int unsigned NOT NULL,
  `Pedido_ID` int unsigned NOT NULL,
  `Descripcion` text NOT NULL,
  `Estatus` enum('Solicitada','Aprobada','Rechazada','Devuelta','Reembolsada') NOT NULL DEFAULT 'Solicitada',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Aprobacion` datetime DEFAULT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_cancelaciones`
--

LOCK TABLES `tbb_cancelaciones` WRITE;
/*!40000 ALTER TABLE `tbb_cancelaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_cancelaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_clientes`
--

DROP TABLE IF EXISTS `tbb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_clientes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Persona_ID` int unsigned NOT NULL,
  `Clave_Cliente` varchar(50) NOT NULL DEFAULT (uuid()),
  `Tipo_Volumen` enum('Mayorista','Minorista','Medio Mayoreo','Normal') NOT NULL DEFAULT 'Normal',
  `Tipo_Frecuencia` enum('Nuevo','Recurrente','Ocasional','Frecuente','Esporádico','Compra Única') NOT NULL DEFAULT 'Nuevo',
  `Tipo_Nivel` enum('Regular','Oro','Plata','Bronce','Diamante') NOT NULL DEFAULT 'Regular',
  `Total_Productos_Comprados` int unsigned NOT NULL DEFAULT '0',
  `Total_Compras` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Fecha_Ultima_Compra` datetime DEFAULT NULL,
  `Estatus` bit(1) DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_clientes`
--

LOCK TABLES `tbb_clientes` WRITE;
/*!40000 ALTER TABLE `tbb_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_devoluciones`
--

DROP TABLE IF EXISTS `tbb_devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_devoluciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Pedido_ID` int unsigned NOT NULL,
  `Producto_ID` int unsigned NOT NULL,
  `Motivo` enum('Defecto','Insatisfaccion','Producto Equivocado') NOT NULL,
  `Descripcion` text NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Fecha_Aprobacion` datetime DEFAULT NULL,
  `Estatus_Aprobacion` enum('Pendiente','Aprobado','Rechazado','Devuelto') NOT NULL DEFAULT 'Pendiente',
  `Fecha_Recepcion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_devoluciones`
--

LOCK TABLES `tbb_devoluciones` WRITE;
/*!40000 ALTER TABLE `tbb_devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_empleado`
--

DROP TABLE IF EXISTS `tbb_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_empleado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `puesto` varchar(150) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `fecha_contratacion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `foto` blob,
  `numero_trabajador` varchar(50) NOT NULL,
  `numero_seguro_social` varchar(50) NOT NULL,
  `departamento_id` int unsigned NOT NULL,
  `persona_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `persona_id` (`persona_id`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `tbb_empleado_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `tbc_departamentos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_empleado`
--

LOCK TABLES `tbb_empleado` WRITE;
/*!40000 ALTER TABLE `tbb_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_empleados_areas`
--

DROP TABLE IF EXISTS `tbb_empleados_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_empleados_areas` (
  `area_id` int DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `tbb_empleados_areas_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `tbb_empleado` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_empleados_areas`
--

LOCK TABLES `tbb_empleados_areas` WRITE;
/*!40000 ALTER TABLE `tbb_empleados_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_empleados_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_entrega`
--

DROP TABLE IF EXISTS `tbb_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_entrega` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `tipo_entrega` varchar(50) NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `fecha_actualizacion` datetime NOT NULL,
  `observaciones` text,
  `envio_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `envio_id` (`envio_id`),
  CONSTRAINT `tbb_entrega_ibfk_1` FOREIGN KEY (`envio_id`) REFERENCES `tbb_envio` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_entrega`
--

LOCK TABLES `tbb_entrega` WRITE;
/*!40000 ALTER TABLE `tbb_entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_envio`
--

DROP TABLE IF EXISTS `tbb_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_envio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `fecha_actualizacion` datetime NOT NULL,
  `numero_guia` varchar(50) NOT NULL,
  `direccion_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `direccion_id` (`direccion_id`),
  CONSTRAINT `tbb_envio_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `tbc_direccion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_envio`
--

LOCK TABLES `tbb_envio` WRITE;
/*!40000 ALTER TABLE `tbb_envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_lote`
--

DROP TABLE IF EXISTS `tbb_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_lote` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `total_productos` int NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `fecha_actualizacion` datetime DEFAULT NULL,
  `observaciones` text NOT NULL,
  `bodega_id` int unsigned DEFAULT NULL,
  `empleado_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `bodega_id` (`bodega_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `tbb_lote_ibfk_1` FOREIGN KEY (`bodega_id`) REFERENCES `tbb_bodegas` (`ID`),
  CONSTRAINT `tbb_lote_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `tbb_empleado` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_lote`
--

LOCK TABLES `tbb_lote` WRITE;
/*!40000 ALTER TABLE `tbb_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Primer_Apellido` varchar(80) NOT NULL,
  `Segundo_Apellido` varchar(80) DEFAULT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas`
--

LOCK TABLES `tbb_personas` WRITE;
/*!40000 ALTER TABLE `tbb_personas` DISABLE KEYS */;
INSERT INTO `tbb_personas` VALUES (1,'Ivan','Navarro','Urbia','1974-02-24'),(2,'Uruel','Navarro','Flores','1987-06-01'),(3,'Juana','Heras','Ximenes','1966-09-21'),(4,'Uruel','Espinoza','Ximenes','1973-10-03'),(5,'Ursuala','Lobardia','Vazquez','1997-05-12'),(6,'Marcia','Juarez','Oropeza','1961-11-06'),(7,'Samuel','Jiménez','Urbia','1999-03-23'),(8,'Perla','Lopez','Espinoza','1991-06-03'),(9,'Juan','Abasolo','Campos','1968-09-12'),(10,'Pedro','Barrios','Guerrero','1999-02-05'),(11,'Omar','Ximenes','Martinez','1961-01-01'),(12,'Damián','Férnandes','Duarte','1964-03-28'),(13,'Samuel','Dominguez','Campos','1971-11-09'),(14,'Emerson','Cruz','Férnandes','1995-10-28'),(15,'Carlos','Duarte','Férnandes','1976-04-11'),(16,'Benito','Carrasco','Baez','1962-05-27'),(17,'Ramiro','Ximenes','Duarte','2001-09-10'),(18,'Marco','Martinez','Guerrero','1993-06-19'),(19,'Uruel','Barrios','Férnandes','2000-05-01'),(20,'Carla','Dominguez','Carrasco','1971-06-16'),(21,'Tomas','Duarte','Gonzalez','1983-11-17'),(22,'Damián','Jiménez','Barrios','1985-07-25'),(23,'Esmeralda','Kuri','Amador','1965-11-22'),(24,'Gabriela','Gonzalez','Ibarra','1996-03-14'),(25,'Esmeralda','Zurita','Huerta','1970-04-20'),(26,'Gabriela','Heras','Torres','1984-10-15'),(27,'Fernanda','Abasolo','Lopez','1975-11-20'),(28,'Luisa','Carrasco','Dominguez','1960-10-05'),(29,'Uruel','Gutierréz','Ortega','1967-05-02'),(30,'Ramiro','Ortega','Huerta','1964-05-05'),(31,'Nora','Navarro','Guerrero','1989-07-07'),(32,'Damián','Flores','Espinoza','1977-12-15'),(33,'Daniela','Jiménez','Dominguez','1996-03-25'),(34,'Karen','Dominguez','Flores','1985-02-02'),(35,'Marcia','Kuri','Oropeza','1959-10-20'),(36,'Samanta','Ramirez','Santos','2005-04-09'),(37,'Anahi','Juarez','Gutierréz','1965-01-02'),(38,'Emerson','Ibarra','Oropeza','1974-05-21'),(39,'Samanta','Zurita','Kuri','1987-03-26'),(40,'Gabriel','Nuñes','Zurita','1966-08-28'),(41,'Samuel','Huerta','Navarro','1966-02-12'),(42,'Ursuala','Nuñes','Zurita','1965-04-09'),(43,'Esmeralda','Santos','Ximenes','1968-07-26'),(44,'Omar','Martinez','Martinez','1988-03-08'),(45,'Uruel','Urbia','Quiroz','1981-02-04'),(46,'Marco','Urbia','Santos','1998-10-05'),(47,'Ursuala','Carrasco','Santos','1961-09-09'),(48,'Juana','Ximenes','Ibañez','1984-04-08'),(49,'Kevin','Urbia','Ibarra','1988-08-14'),(50,'Perla','Amador','Dominguez','1985-01-29'),(51,'Esmeralda','Lobardia','Zurita','1972-09-23'),(52,'Perla','Barrios','Gonzalez','2005-07-13'),(53,'Hortencia','Heras','Marquez','1964-05-10'),(54,'Tomasa','Carrasco','Yañez','1984-04-25'),(55,'Marco','Torres','Baez','1970-01-02'),(56,'Kevin','Yañez','Espinoza','2005-02-19'),(57,'Olga','Baez','Torres','1999-01-19'),(58,'Samuel','Urbia','Flores','1968-09-05'),(59,'Nora','Lobardia','Juarez','1988-08-19'),(60,'Damián','Flores','Baez','2005-10-10'),(61,'Ivonne','Oropeza','Dominguez','1968-03-08'),(62,'Fernanda','Urbia','Urbia','2005-06-23'),(63,'Nora','Flores','Campos','2005-07-11'),(64,'Gabriel','Quiroz','Torres','1995-09-19'),(65,'Hortencia','Abasolo','Abasolo','2003-10-28'),(66,'Tomasa','Lopez','Flores','1993-05-13'),(67,'Fernando','Heras','Huerta','1988-06-25'),(68,'Perla','Juarez','Ortega','2005-04-04'),(69,'Juan','Abasolo','Flores','1985-12-30'),(70,'Olga','Zurita','Eslava','1990-07-21'),(71,'Luis','Nuñes','Lobardia','1984-08-18'),(72,'Benito','Cruz','Amador','1961-11-22'),(73,'Hortencia','Ramirez','Ortega','1979-01-07'),(74,'Emerson','Juarez','Yañez','2002-12-05'),(75,'Luis','Amador','Ibañez','1973-08-29'),(76,'Nora','Zurita','Lobardia','1986-07-13'),(77,'Tomas','Guerrero','Heras','1994-04-07'),(78,'Nestor','Lopez','Navarro','2000-12-13'),(79,'Ivan','Gonzalez','Amador','1992-09-12'),(80,'Olga','Quiroz','Gonzalez','1986-09-18'),(81,'Luisa','Ibarra','Ramirez','1989-07-07'),(82,'Samanta','Zurita','Gutierréz','1962-10-27'),(83,'Gabriela','Cruz','Jiménez','1971-03-26'),(84,'Carla','Juarez','Jiménez','1979-06-07'),(85,'Carla','Ximenes','Huerta','1978-11-07'),(86,'Ivonne','Amador','Campos','1980-01-04'),(87,'Benito','Zurita','Yañez','1962-07-17'),(88,'Gabriela','Santos','Juarez','2002-09-04'),(89,'Olga','Cruz','Amador','1960-01-09'),(90,'Omar','Ximenes','Santos','1988-04-02'),(91,'Carla','Navarro','Ibañez','1960-08-28'),(92,'Marcia','Santos','Quiroz','1988-09-24'),(93,'Ursuala','Lobardia','Vazquez','1995-10-22'),(94,'Adan','Gonzalez','Eslava','1964-08-04'),(95,'Gabriela','Espinoza','Zurita','1980-05-06'),(96,'Juana','Guerrero','Ibañez','1998-02-02'),(97,'Daniela','Lopez','Nuñes','1994-02-13'),(98,'Karen','Jiménez','Yañez','1970-07-16'),(99,'Berta','Guerrero','Ramirez','2001-03-24'),(100,'Juan','Zurita','Vazquez','1993-06-01'),(101,'Pedro','Lopez','Espinoza','1994-07-29'),(102,'Pedro','Zurita','Ximenes','1999-08-13'),(103,'Ivonne','Guerrero','Ramirez','2000-09-20'),(104,'Damián','Martinez','Espinoza','1988-11-12'),(105,'Carla','Kuri','Nuñes','1995-01-29'),(106,'Damián','Amador','Santos','1978-06-01'),(107,'Juana','Carrasco','Nuñes','1978-08-15'),(108,'Hugo','Nuñes','Urbia','1982-08-18'),(109,'Fernando','Ibarra','Kuri','2003-09-18'),(110,'Ramona','Martinez','Baez','1974-11-07'),(111,'Marcia','Ximenes','Flores','1960-04-03'),(112,'Perla','Carrasco','Cruz','1984-11-18'),(113,'Ramona','Navarro','Lopez','1981-05-05'),(114,'Tomas','Gutierréz','Baez','1995-06-28'),(115,'Gabriela','Santos','Gutierréz','1984-07-24'),(116,'Ivan','Amador','Amador','1968-07-25'),(117,'Kevin','Nuñes','Abasolo','1972-10-25'),(118,'Gabriel','Lopez','Vazquez','1985-03-03'),(119,'Tomas','Eslava','Dominguez','1969-01-28'),(120,'Pedro','Guerrero','Martinez','1973-07-28'),(121,'Daniela','Nuñes','Espinoza','1996-02-27'),(122,'Perla','Duarte','Baez','2003-06-16'),(123,'Daniela','Espinoza','Baez','1998-08-14'),(124,'Tomas','Martinez','Jiménez','1972-09-20'),(125,'Luisa','Lopez','Campos','1976-05-31'),(126,'Ivonne','Ramirez','Guerrero','1983-01-06'),(127,'Adan','Juarez','Carrasco','1985-11-21'),(128,'Perla','Eslava','Ibañez','2002-08-18'),(129,'Hugo','Lobardia','Gutierréz','1966-04-24'),(130,'Benito','Ramirez','Nuñes','1971-05-17'),(131,'Carla','Ortega','Martinez','1994-09-05'),(132,'Samanta','Lobardia','Dominguez','1992-10-12'),(133,'Ursuala','Cruz','Ortega','1994-06-27'),(134,'Marcia','Gutierréz','Torres','1977-12-27'),(135,'Carlos','Navarro','Ramirez','1959-04-12'),(136,'Tomasa','Huerta','Huerta','1978-08-24'),(137,'Emerson','Guerrero','Torres','1994-05-10'),(138,'Karen','Navarro','Gutierréz','1996-10-18'),(139,'Carla','Férnandes','Martinez','1967-04-25'),(140,'Ursuala','Gutierréz','Ortega','1968-08-03'),(141,'Emerson','Eslava','Gonzalez','1993-12-21'),(142,'Ramiro','Ortega','Férnandes','2003-05-02'),(143,'Luis','Ortega','Baez','1974-05-15'),(144,'Olga','Ortega','Ximenes','1996-12-13'),(145,'Uruel','Santos','Juarez','1999-08-25'),(146,'Karen','Lobardia','Campos','1988-10-24'),(147,'Gabriel','Heras','Abasolo','1992-08-18'),(148,'Karen','Abasolo','Vazquez','1980-06-28'),(149,'Karen','Juarez','Dominguez','1989-02-12'),(150,'Uruel','Juarez','Navarro','2002-12-22'),(151,'Marcia','Férnandes','Guerrero','1971-06-08'),(152,'Pedro','Amador','Zurita','1961-10-29'),(153,'Ramona','Ibañez','Flores','2002-02-11'),(154,'Ivan','Guerrero','Santos','2005-06-28'),(155,'Esmeralda','Ibañez','Navarro','1964-11-23'),(156,'Juana','Barrios','Flores','1993-11-24'),(157,'Juana','Gonzalez','Ramirez','1996-08-14'),(158,'Esmeralda','Abasolo','Quiroz','2000-10-23'),(159,'Nestor','Barrios','Cruz','1959-09-15'),(160,'Pedro','Oropeza','Urbia','1971-12-27'),(161,'Anahi','Espinoza','Zurita','1981-04-09'),(162,'Tomasa','Dominguez','Ximenes','1985-10-19'),(163,'Ramiro','Ibañez','Zurita','1966-01-26'),(164,'Tomas','Ramirez','Lopez','1966-03-23'),(165,'Carla','Ortega','Kuri','1983-09-29'),(166,'Karen','Ibañez','Santos','1984-10-22'),(167,'Kevin','Martinez','Abasolo','1962-11-04'),(168,'Marco','Baez','Martinez','1981-09-09'),(169,'Omar','Martinez','Santos','1971-09-13'),(170,'Carla','Guerrero','Kuri','1962-12-19'),(171,'Samanta','Amador','Juarez','1981-06-22'),(172,'Perla','Nuñes','Martinez','1996-10-03'),(173,'Tomas','Santos','Santos','1999-03-02'),(174,'Esmeralda','Ibañez','Ramirez','1979-01-12'),(175,'Carla','Baez','Guerrero','1988-09-26'),(176,'Olga','Jiménez','Torres','1982-09-15'),(177,'Anahi','Flores','Oropeza','1994-04-07'),(178,'Tomasa','Dominguez','Yañez','1995-09-12'),(179,'Tomas','Heras','Kuri','2000-04-09'),(180,'Karen','Dominguez','Gonzalez','1997-10-30'),(181,'Perla','Lopez','Gutierréz','2003-07-22'),(182,'Hugo','Duarte','Martinez','1974-03-22'),(183,'Hortencia','Marquez','Navarro','1960-10-07'),(184,'Kevin','Martinez','Torres','2005-08-26'),(185,'Tomasa','Heras','Duarte','1963-05-09'),(186,'Luis','Ramirez','Lopez','1968-04-04'),(187,'Adan','Eslava','Oropeza','1997-08-27'),(188,'Karen','Zurita','Martinez','1997-05-11'),(189,'Hugo','Santos','Abasolo','1992-07-27'),(190,'Nora','Amador','Torres','1965-05-02'),(191,'Daniela','Heras','Ramirez','1992-02-26'),(192,'Damián','Ibañez','Santos','1983-08-10'),(193,'Benito','Navarro','Vazquez','1978-11-06'),(194,'Ursuala','Lobardia','Urbia','1992-06-05'),(195,'Nestor','Lobardia','Lopez','2001-12-24'),(196,'Marcia','Duarte','Amador','1990-11-08'),(197,'Anahi','Lopez','Oropeza','2005-03-22'),(198,'Berta','Abasolo','Lobardia','1968-07-06'),(199,'Kevin','Santos','Ximenes','1970-03-11'),(200,'Marcia','Espinoza','Dominguez','2004-05-16'),(201,'Ivonne','Ximenes','Kuri','1997-10-15'),(202,'Carlos','Campos','Lobardia','1976-12-09'),(203,'Hugo','Baez','Cruz','1994-11-26'),(204,'Fernanda','Yañez','Marquez','2001-09-14'),(205,'Juana','Marquez','Cruz','1965-01-12'),(206,'Ivonne','Ortega','Martinez','1993-03-31'),(207,'Juana','Ibañez','Campos','1984-02-28'),(208,'Daniela','Amador','Quiroz','1969-02-25'),(209,'Ramona','Ramirez','Campos','2003-03-01'),(210,'Berta','Carrasco','Baez','1959-04-22'),(211,'Karen','Torres','Lopez','1980-11-01'),(212,'Tomas','Martinez','Guerrero','1992-10-31'),(213,'Samuel','Carrasco','Flores','1976-07-29'),(214,'Luisa','Dominguez','Barrios','1961-06-02'),(215,'Samuel','Gutierréz','Gutierréz','1975-11-07'),(216,'Gabriel','Jiménez','Huerta','1979-05-31'),(217,'Marcia','Ramirez','Ibañez','1995-12-17'),(218,'Carlos','Campos','Lobardia','1976-03-26'),(219,'Emerson','Navarro','Torres','2004-01-14'),(220,'Esmeralda','Amador','Lopez','1994-02-28'),(221,'Tomasa','Gutierréz','Abasolo','1988-07-31'),(222,'Ivan','Torres','Amador','2004-06-22'),(223,'Luis','Eslava','Eslava','1976-07-14'),(224,'Olga','Quiroz','Eslava','1970-09-30'),(225,'Fernando','Gonzalez','Baez','1997-08-16'),(226,'Nestor','Ibañez','Férnandes','2004-05-16'),(227,'Hugo','Santos','Duarte','1966-01-30'),(228,'Samuel','Carrasco','Campos','2005-04-06'),(229,'Carlos','Dominguez','Jiménez','1970-01-01'),(230,'Juana','Zurita','Navarro','1959-10-16'),(231,'Carlos','Yañez','Oropeza','1965-06-30'),(232,'Luisa','Huerta','Férnandes','1967-10-05'),(233,'Pedro','Santos','Lobardia','1960-02-11'),(234,'Juana','Lobardia','Nuñes','2005-01-08'),(235,'Pedro','Ramirez','Heras','1988-08-31'),(236,'Esmeralda','Barrios','Quiroz','1966-08-02'),(237,'Karen','Heras','Oropeza','1982-02-03'),(238,'Emerson','Huerta','Ibañez','1983-07-20'),(239,'Daniela','Abasolo','Amador','2000-05-09'),(240,'Karen','Eslava','Ortega','1986-03-26'),(241,'Nestor','Huerta','Jiménez','1989-07-07'),(242,'Nora','Kuri','Lopez','1986-05-14'),(243,'Luis','Heras','Espinoza','1967-11-07'),(244,'Juana','Barrios','Campos','1975-08-09'),(245,'Anahi','Gonzalez','Flores','1968-09-30'),(246,'Ursuala','Baez','Oropeza','1989-11-28'),(247,'Adan','Barrios','Cruz','2003-03-08'),(248,'Fernanda','Cruz','Nuñes','1992-11-24'),(249,'Berta','Ortega','Ramirez','1971-09-28'),(250,'Luis','Eslava','Campos','1966-01-23'),(251,'Nora','Cruz','Gonzalez','2003-10-26'),(252,'Ivan','Dominguez','Férnandes','1993-01-18'),(253,'Nestor','Lobardia','Juarez','1990-08-04'),(254,'Berta','Ximenes','Navarro','1964-11-01'),(255,'Nora','Barrios','Abasolo','1971-04-11'),(256,'Gabriel','Cruz','Jiménez','1974-07-09'),(257,'Kevin','Quiroz','Kuri','1970-07-02'),(258,'Damián','Guerrero','Gutierréz','1985-10-04'),(259,'Damián','Campos','Gonzalez','2000-01-23'),(260,'Ramiro','Gonzalez','Ramirez','1995-07-14'),(261,'Samanta','Quiroz','Navarro','1985-11-05'),(262,'Gabriela','Martinez','Vazquez','1983-11-02'),(263,'Emerson','Eslava','Eslava','1979-02-20'),(264,'Uruel','Guerrero','Heras','1990-10-17'),(265,'Carlos','Yañez','Lopez','1998-06-16'),(266,'Carlos','Guerrero','Juarez','2005-02-03'),(267,'Adan','Vazquez','Ramirez','1986-12-15'),(268,'Ramona','Carrasco','Ibarra','1998-01-24'),(269,'Carla','Vazquez','Abasolo','1985-11-25'),(270,'Karen','Duarte','Marquez','1964-03-07'),(271,'Daniela','Ibañez','Yañez','1959-07-15'),(272,'Damián','Yañez','Huerta','1972-06-27'),(273,'Karen','Carrasco','Dominguez','1966-03-12'),(274,'Gabriela','Oropeza','Lobardia','1971-03-26'),(275,'Karen','Eslava','Heras','2002-07-03'),(276,'Juan','Dominguez','Marquez','1978-04-08'),(277,'Omar','Urbia','Espinoza','1967-09-16'),(278,'Gabriela','Nuñes','Yañez','2005-01-11'),(279,'Juan','Amador','Santos','1978-03-06'),(280,'Juana','Kuri','Heras','1967-11-07'),(281,'Daniela','Martinez','Cruz','2002-07-05'),(282,'Ramona','Lobardia','Cruz','1965-07-12'),(283,'Nora','Baez','Carrasco','1969-04-28'),(284,'Ramona','Quiroz','Urbia','1965-11-05'),(285,'Fernando','Ramirez','Huerta','1991-07-20'),(286,'Ivonne','Ximenes','Kuri','1996-04-28'),(287,'Hugo','Quiroz','Heras','1996-08-19'),(288,'Ramona','Férnandes','Juarez','1993-06-24'),(289,'Olga','Dominguez','Espinoza','1987-05-09'),(290,'Karen','Barrios','Ximenes','1990-06-11'),(291,'Daniela','Lopez','Torres','1962-11-05'),(292,'Ramiro','Marquez','Torres','1970-11-14'),(293,'Nestor','Barrios','Ortega','1999-11-17'),(294,'Berta','Ibarra','Gonzalez','1977-07-24'),(295,'Esmeralda','Duarte','Gonzalez','1984-03-28'),(296,'Hugo','Dominguez','Juarez','1969-04-14'),(297,'Adan','Férnandes','Barrios','1989-10-29'),(298,'Damián','Yañez','Juarez','1985-12-10'),(299,'Tomas','Juarez','Oropeza','1966-02-01'),(300,'Olga','Jiménez','Marquez','2004-03-04'),(301,'Ramiro','Eslava','Cruz','1996-07-10'),(302,'Uruel','Amador','Baez','1981-05-19'),(303,'Omar','Torres','Eslava','1981-07-05'),(304,'Fernando','Lopez','Barrios','1971-11-13'),(305,'Marco','Barrios','Juarez','1973-06-21'),(306,'Fernanda','Gonzalez','Carrasco','1960-12-20'),(307,'Ramona','Espinoza','Férnandes','1972-12-16'),(308,'Kevin','Vazquez','Heras','1983-07-13'),(309,'Juan','Flores','Gutierréz','1993-03-22'),(310,'Hugo','Zurita','Dominguez','1986-11-21'),(311,'Esmeralda','Carrasco','Guerrero','1980-01-17'),(312,'Pedro','Ibarra','Gonzalez','1975-08-13'),(313,'Fernando','Abasolo','Kuri','1969-03-02'),(314,'Ramiro','Lopez','Ortega','1995-12-31'),(315,'Hugo','Quiroz','Heras','1999-10-18'),(316,'Berta','Barrios','Ibarra','1970-01-17'),(317,'Samanta','Gutierréz','Kuri','1998-06-25'),(318,'Ivan','Marquez','Kuri','1987-11-16'),(319,'Kevin','Marquez','Gonzalez','1967-11-20'),(320,'Marcia','Huerta','Baez','1990-06-29'),(321,'Benito','Jiménez','Jiménez','1994-10-12'),(322,'Uruel','Férnandes','Ibarra','1985-03-10'),(323,'Emerson','Marquez','Lobardia','1990-04-04'),(324,'Karen','Zurita','Juarez','1979-09-19'),(325,'Esmeralda','Yañez','Abasolo','1982-02-04'),(326,'Kevin','Urbia','Gonzalez','1975-09-05'),(327,'Ivan','Eslava','Espinoza','1983-06-14'),(328,'Nestor','Campos','Ibañez','1963-01-30'),(329,'Olga','Kuri','Gutierréz','1961-02-07'),(330,'Fernanda','Ramirez','Férnandes','1982-04-04'),(331,'Omar','Zurita','Amador','1969-04-18'),(332,'Benito','Lopez','Juarez','1975-08-24'),(333,'Benito','Quiroz','Campos','1961-01-22'),(334,'Fernando','Yañez','Marquez','1998-01-09'),(335,'Samuel','Nuñes','Ortega','2003-12-01'),(336,'Anahi','Férnandes','Barrios','1991-02-07'),(337,'Perla','Ibañez','Dominguez','1993-11-03'),(338,'Esmeralda','Gutierréz','Baez','1995-03-12'),(339,'Daniela','Ibarra','Yañez','1970-01-28'),(340,'Berta','Barrios','Nuñes','1992-07-22'),(341,'Anahi','Amador','Lobardia','1984-03-01'),(342,'Tomas','Kuri','Yañez','2001-05-23'),(343,'Ramona','Vazquez','Nuñes','1961-08-25'),(344,'Luisa','Navarro','Ortega','1987-04-01'),(345,'Fernando','Guerrero','Ibarra','2000-09-12'),(346,'Gabriela','Yañez','Gonzalez','1968-04-20'),(347,'Samanta','Navarro','Baez','1965-10-24'),(348,'Marcia','Quiroz','Baez','2004-05-01'),(349,'Perla','Eslava','Carrasco','1970-02-10'),(350,'Gabriel','Dominguez','Kuri','1973-08-13'),(351,'Ursuala','Zurita','Marquez','1994-08-03'),(352,'Fernando','Cruz','Baez','1972-05-20'),(353,'Omar','Barrios','Marquez','1988-07-21'),(354,'Kevin','Duarte','Nuñes','1972-08-08'),(355,'Nora','Lopez','Oropeza','2004-12-01'),(356,'Anahi','Gonzalez','Guerrero','1977-09-19'),(357,'Marcia','Jiménez','Navarro','1968-11-17'),(358,'Gabriela','Zurita','Nuñes','1997-06-11'),(359,'Juan','Huerta','Ximenes','2005-01-03'),(360,'Uruel','Flores','Dominguez','1968-08-27'),(361,'Hortencia','Jiménez','Duarte','2000-05-23'),(362,'Emerson','Barrios','Ramirez','1967-03-05'),(363,'Nora','Ramirez','Carrasco','1963-09-02'),(364,'Carlos','Dominguez','Carrasco','1970-07-24'),(365,'Luis','Campos','Zurita','1997-02-08'),(366,'Kevin','Yañez','Baez','1987-12-31'),(367,'Samanta','Ximenes','Cruz','1970-01-19'),(368,'Pedro','Carrasco','Marquez','1974-04-05'),(369,'Marcia','Ramirez','Espinoza','1974-11-07'),(370,'Omar','Campos','Abasolo','1965-03-19'),(371,'Marcia','Lopez','Zurita','2005-10-05'),(372,'Gabriel','Ortega','Campos','1978-11-19'),(373,'Kevin','Ibañez','Urbia','1992-02-14'),(374,'Hugo','Eslava','Ibañez','1960-01-26'),(375,'Emerson','Eslava','Heras','2002-12-06'),(376,'Luis','Férnandes','Jiménez','1999-08-17'),(377,'Fernanda','Duarte','Campos','1998-09-09'),(378,'Damián','Ibarra','Amador','1981-04-08'),(379,'Luisa','Gutierréz','Baez','1991-10-16'),(380,'Pedro','Dominguez','Abasolo','1965-11-18'),(381,'Perla','Baez','Jiménez','1960-06-21'),(382,'Carla','Barrios','Gonzalez','2005-04-17'),(383,'Daniela','Ortega','Juarez','1974-09-19'),(384,'Perla','Carrasco','Cruz','1987-08-02'),(385,'Tomas','Kuri','Urbia','1984-09-26'),(386,'Adan','Férnandes','Dominguez','1998-07-05'),(387,'Marco','Quiroz','Baez','1963-10-18'),(388,'Juan','Lopez','Baez','1972-07-04'),(389,'Ramiro','Baez','Guerrero','1986-03-12'),(390,'Nora','Quiroz','Lobardia','1966-11-05'),(391,'Marco','Urbia','Quiroz','1985-05-25'),(392,'Luisa','Nuñes','Jiménez','1980-05-17'),(393,'Hortencia','Flores','Navarro','1986-03-21'),(394,'Nora','Campos','Huerta','1961-02-21'),(395,'Carla','Campos','Lobardia','1979-07-27'),(396,'Ivonne','Amador','Amador','1969-08-30'),(397,'Tomas','Guerrero','Ibarra','2000-12-24'),(398,'Ivan','Duarte','Gutierréz','1983-01-11'),(399,'Samuel','Carrasco','Eslava','1974-04-15'),(400,'Marcia','Barrios','Espinoza','1993-10-08'),(401,'Marco','Abasolo','Huerta','2003-07-08'),(402,'Samuel','Nuñes','Torres','1965-12-13'),(403,'Juana','Abasolo','Dominguez','1971-01-09'),(404,'Nestor','Santos','Gutierréz','1986-06-26'),(405,'Emerson','Nuñes','Cruz','2005-10-08'),(406,'Luis','Campos','Santos','1968-03-21'),(407,'Ramona','Huerta','Navarro','1967-08-02'),(408,'Ramona','Santos','Flores','1972-10-25'),(409,'Nestor','Santos','Huerta','1988-12-29'),(410,'Carla','Flores','Ibañez','2004-06-24'),(411,'Adan','Campos','Carrasco','1980-02-28'),(412,'Omar','Dominguez','Espinoza','1987-07-31'),(413,'Juana','Oropeza','Santos','1963-06-18'),(414,'Hugo','Zurita','Campos','1984-03-13'),(415,'Berta','Duarte','Lopez','1967-09-09'),(416,'Luis','Marquez','Campos','1982-08-05'),(417,'Luisa','Cruz','Duarte','1987-03-19'),(418,'Perla','Ibarra','Dominguez','1998-05-13'),(419,'Nestor','Zurita','Marquez','1993-01-11'),(420,'Marcia','Gutierréz','Torres','1979-05-09'),(421,'Omar','Duarte','Gutierréz','1987-10-25'),(422,'Tomasa','Ortega','Marquez','1991-02-08'),(423,'Luisa','Heras','Huerta','1983-11-01'),(424,'Ramiro','Torres','Quiroz','1959-11-27'),(425,'Hortencia','Huerta','Marquez','1996-10-13'),(426,'Juan','Lopez','Ortega','1998-04-19'),(427,'Hugo','Ibarra','Lobardia','2000-10-23'),(428,'Marcia','Campos','Juarez','1973-08-08'),(429,'Carla','Gutierréz','Santos','1992-12-17'),(430,'Fernando','Zurita','Ortega','1960-09-02'),(431,'Kevin','Flores','Ortega','1984-01-21'),(432,'Olga','Ortega','Barrios','1967-07-03'),(433,'Samuel','Espinoza','Cruz','1978-10-09'),(434,'Tomas','Nuñes','Guerrero','1959-05-10'),(435,'Tomasa','Martinez','Guerrero','1995-02-24'),(436,'Ramona','Huerta','Yañez','1963-11-16'),(437,'Carla','Cruz','Ramirez','1969-12-29'),(438,'Perla','Duarte','Juarez','2001-06-16'),(439,'Fernanda','Marquez','Eslava','1995-12-05'),(440,'Samanta','Nuñes','Nuñes','1997-03-06'),(441,'Carlos','Heras','Urbia','2004-02-16'),(442,'Emerson','Lobardia','Eslava','1994-12-01'),(443,'Nora','Marquez','Yañez','2005-12-05'),(444,'Samuel','Juarez','Barrios','1972-09-11'),(445,'Fernanda','Santos','Oropeza','1986-01-04'),(446,'Ursuala','Guerrero','Flores','1977-07-29'),(447,'Perla','Yañez','Navarro','1961-01-09'),(448,'Tomas','Nuñes','Marquez','1990-02-16'),(449,'Fernanda','Oropeza','Abasolo','2005-01-26'),(450,'Hortencia','Oropeza','Dominguez','1967-04-15'),(451,'Ursuala','Espinoza','Guerrero','1973-06-02'),(452,'Marco','Kuri','Ramirez','1970-03-19'),(453,'Berta','Ximenes','Oropeza','1970-06-10'),(454,'Samuel','Carrasco','Campos','1961-06-16'),(455,'Hugo','Marquez','Ramirez','1977-06-27'),(456,'Gabriela','Vazquez','Urbia','2000-09-25'),(457,'Kevin','Vazquez','Nuñes','1961-02-19'),(458,'Gabriel','Gutierréz','Lobardia','1997-05-31'),(459,'Uruel','Urbia','Martinez','1970-03-15'),(460,'Hugo','Ibañez','Cruz','1966-04-21'),(461,'Tomasa','Abasolo','Navarro','1986-01-09'),(462,'Nora','Eslava','Ramirez','1962-01-26'),(463,'Adan','Cruz','Guerrero','1996-04-08'),(464,'Juana','Cruz','Santos','1973-06-25'),(465,'Damián','Huerta','Ramirez','1985-11-22'),(466,'Daniela','Duarte','Cruz','1987-01-13'),(467,'Juan','Férnandes','Martinez','1965-03-04'),(468,'Daniela','Jiménez','Amador','1978-08-14'),(469,'Hugo','Lobardia','Gutierréz','1972-12-24'),(470,'Tomasa','Eslava','Flores','1981-10-01'),(471,'Tomas','Jiménez','Quiroz','1981-03-12'),(472,'Hugo','Oropeza','Eslava','1975-02-14'),(473,'Fernanda','Navarro','Ortega','1990-08-13'),(474,'Marcia','Zurita','Cruz','1962-09-12'),(475,'Fernando','Jiménez','Santos','1989-08-08'),(476,'Nora','Eslava','Oropeza','1991-12-27'),(477,'Carlos','Kuri','Cruz','1962-01-31'),(478,'Pedro','Barrios','Ibarra','1969-08-23'),(479,'Nora','Quiroz','Lobardia','1967-11-17'),(480,'Benito','Vazquez','Espinoza','1966-03-07'),(481,'Juan','Navarro','Gutierréz','1995-11-27'),(482,'Tomas','Juarez','Santos','1981-03-19'),(483,'Pedro','Flores','Martinez','1979-01-15'),(484,'Kevin','Huerta','Navarro','1966-03-04'),(485,'Carla','Ramirez','Guerrero','1980-10-20'),(486,'Adan','Ortega','Zurita','1960-03-10'),(487,'Uruel','Amador','Carrasco','1984-04-23'),(488,'Samuel','Cruz','Espinoza','1993-06-20'),(489,'Fernando','Urbia','Yañez','1973-05-13'),(490,'Karen','Lobardia','Heras','1977-02-08'),(491,'Karen','Baez','Barrios','2005-10-23'),(492,'Kevin','Oropeza','Kuri','1966-11-20'),(493,'Omar','Yañez','Vazquez','1999-06-12'),(494,'Juana','Ortega','Kuri','1981-11-16'),(495,'Perla','Ortega','Navarro','2001-04-15'),(496,'Nestor','Carrasco','Gutierréz','1989-10-20'),(497,'Ursuala','Santos','Oropeza','1980-02-18'),(498,'Juan','Ibarra','Eslava','1959-09-11'),(499,'Samanta','Quiroz','Martinez','1979-10-01'),(500,'Samuel','Gonzalez','Férnandes','1979-03-18'),(501,'Daniela','Lobardia','Gonzalez','1967-04-09'),(502,'Juana','Barrios','Barrios','1968-03-01'),(503,'Carlos','Kuri','Lobardia','1986-11-17'),(504,'Tomas','Amador','Ibañez','1973-11-18'),(505,'Luisa','Espinoza','Lobardia','2004-09-23'),(506,'Kevin','Dominguez','Gonzalez','1997-05-30'),(507,'Marcia','Heras','Torres','1987-10-30'),(508,'Kevin','Oropeza','Lopez','1972-09-30'),(509,'Esmeralda','Huerta','Oropeza','1970-09-21'),(510,'Samuel','Torres','Navarro','1993-12-14'),(511,'Daniela','Lobardia','Gonzalez','1971-10-13'),(512,'Gabriel','Yañez','Flores','2002-07-22'),(513,'Perla','Ramirez','Dominguez','1965-02-25'),(514,'Olga','Gonzalez','Eslava','1963-03-04'),(515,'Marco','Carrasco','Santos','2005-11-23'),(516,'Fernanda','Vazquez','Zurita','1975-01-16'),(517,'Adan','Férnandes','Campos','1994-07-30'),(518,'Anahi','Vazquez','Quiroz','1982-07-11'),(519,'Carlos','Zurita','Urbia','1989-10-20'),(520,'Ivonne','Ximenes','Lopez','2001-07-04'),(521,'Karen','Eslava','Marquez','1976-09-08'),(522,'Ramiro','Amador','Urbia','1982-12-30'),(523,'Gabriel','Gutierréz','Heras','1983-05-13'),(524,'Gabriel','Ibañez','Torres','1974-08-19'),(525,'Hortencia','Marquez','Martinez','2001-05-28'),(526,'Berta','Heras','Eslava','1961-03-06'),(527,'Marco','Guerrero','Heras','1991-01-10'),(528,'Fernando','Espinoza','Gonzalez','1984-09-13'),(529,'Hugo','Amador','Nuñes','1996-03-23'),(530,'Marco','Amador','Abasolo','1972-11-26'),(531,'Fernando','Férnandes','Heras','1986-06-10'),(532,'Samanta','Ibarra','Urbia','2001-04-02'),(533,'Nestor','Férnandes','Dominguez','1999-09-14'),(534,'Emerson','Espinoza','Lobardia','2004-05-25'),(535,'Fernando','Campos','Santos','1968-02-10'),(536,'Perla','Marquez','Duarte','1996-07-08'),(537,'Daniela','Guerrero','Huerta','1993-06-29'),(538,'Emerson','Ibarra','Ramirez','1988-11-15'),(539,'Perla','Abasolo','Guerrero','1990-08-07'),(540,'Omar','Espinoza','Vazquez','1961-08-12'),(541,'Ramona','Jiménez','Barrios','1984-02-23'),(542,'Nora','Heras','Nuñes','1967-08-01'),(543,'Gabriel','Ibañez','Abasolo','1979-03-20'),(544,'Emerson','Gonzalez','Gutierréz','1985-11-04'),(545,'Uruel','Ibarra','Férnandes','1971-09-15'),(546,'Ramona','Oropeza','Oropeza','1991-12-04'),(547,'Tomas','Ximenes','Guerrero','1965-11-17'),(548,'Adan','Flores','Vazquez','1972-09-28'),(549,'Ursuala','Torres','Baez','1970-05-25'),(550,'Kevin','Amador','Kuri','1984-01-07'),(551,'Samanta','Barrios','Santos','1979-05-08'),(552,'Perla','Navarro','Vazquez','1975-12-22'),(553,'Nestor','Ibañez','Gutierréz','1965-05-18'),(554,'Juan','Marquez','Abasolo','1977-02-25'),(555,'Esmeralda','Zurita','Férnandes','2003-10-20'),(556,'Uruel','Guerrero','Guerrero','1983-07-24'),(557,'Gabriel','Zurita','Ibarra','1977-08-23'),(558,'Hortencia','Juarez','Férnandes','2003-04-03'),(559,'Pedro','Ibarra','Jiménez','1993-05-03'),(560,'Juan','Torres','Yañez','1992-04-02'),(561,'Juana','Yañez','Navarro','1963-08-20'),(562,'Samuel','Férnandes','Abasolo','1991-05-16'),(563,'Ramiro','Abasolo','Yañez','1990-06-21'),(564,'Nora','Duarte','Santos','2005-09-28'),(565,'Carla','Lobardia','Jiménez','1987-04-05'),(566,'Nestor','Cruz','Heras','1959-09-24'),(567,'Ivonne','Duarte','Gutierréz','1983-09-16'),(568,'Carlos','Espinoza','Martinez','1965-09-25'),(569,'Karen','Juarez','Campos','1978-11-30'),(570,'Samuel','Barrios','Ximenes','1991-04-01'),(571,'Juana','Barrios','Barrios','1974-01-04'),(572,'Luisa','Gonzalez','Espinoza','1973-02-18'),(573,'Omar','Huerta','Gonzalez','1972-02-07'),(574,'Marco','Nuñes','Amador','1972-09-10'),(575,'Hortencia','Jiménez','Huerta','1975-05-03'),(576,'Samuel','Nuñes','Lobardia','1985-05-05'),(577,'Ivan','Zurita','Santos','1985-08-07'),(578,'Nestor','Carrasco','Gutierréz','1990-12-17'),(579,'Ivonne','Santos','Cruz','1980-12-09'),(580,'Pedro','Dominguez','Marquez','1980-09-19'),(581,'Samanta','Navarro','Espinoza','1985-10-06'),(582,'Pedro','Lopez','Férnandes','2001-05-03'),(583,'Luis','Gonzalez','Duarte','1963-01-11'),(584,'Marco','Zurita','Abasolo','1976-08-10'),(585,'Samanta','Abasolo','Ramirez','1961-02-24'),(586,'Nora','Santos','Ibañez','1992-08-12'),(587,'Marcia','Juarez','Lopez','1995-12-04'),(588,'Ramiro','Espinoza','Abasolo','1991-03-27'),(589,'Adan','Nuñes','Santos','1982-03-10'),(590,'Damián','Quiroz','Yañez','1979-11-05'),(591,'Perla','Carrasco','Ortega','1984-12-12'),(592,'Tomasa','Heras','Ibañez','1991-05-05'),(593,'Ursuala','Yañez','Flores','2002-01-19'),(594,'Luis','Ramirez','Oropeza','1986-05-07'),(595,'Hortencia','Martinez','Urbia','1978-06-30'),(596,'Berta','Santos','Ortega','1974-06-17'),(597,'Esmeralda','Flores','Gonzalez','1994-09-02'),(598,'Benito','Ortega','Santos','1979-03-22'),(599,'Perla','Quiroz','Barrios','2004-05-11'),(600,'Tomasa','Campos','Urbia','1979-06-11'),(601,'Juana','Huerta','Ramirez','1984-04-15'),(602,'Luis','Campos','Quiroz','1960-06-15'),(603,'Ramona','Férnandes','Juarez','1997-07-20'),(604,'Gabriel','Yañez','Guerrero','1963-09-29'),(605,'Tomas','Torres','Férnandes','1990-07-14'),(606,'Perla','Cruz','Ximenes','1988-09-16'),(607,'Gabriela','Gonzalez','Jiménez','2000-03-05'),(608,'Nora','Heras','Marquez','1962-12-03'),(609,'Juana','Férnandes','Martinez','1964-03-14'),(610,'Nora','Dominguez','Huerta','1960-01-16'),(611,'Ivan','Dominguez','Baez','1968-11-03'),(612,'Samanta','Gonzalez','Férnandes','1978-06-12'),(613,'Tomasa','Flores','Gonzalez','1993-01-05'),(614,'Hugo','Cruz','Dominguez','1980-04-18'),(615,'Tomas','Jiménez','Ramirez','1983-11-08'),(616,'Kevin','Lopez','Ortega','1996-12-31'),(617,'Omar','Lobardia','Férnandes','1966-01-12'),(618,'Benito','Zurita','Urbia','1992-06-16'),(619,'Kevin','Lopez','Lobardia','1980-01-06'),(620,'Perla','Cruz','Urbia','1983-06-01'),(621,'Fernando','Heras','Gutierréz','1978-12-17'),(622,'Ursuala','Marquez','Amador','1969-03-06'),(623,'Uruel','Lobardia','Urbia','1992-12-28'),(624,'Ramiro','Barrios','Zurita','2005-11-05'),(625,'Gabriel','Marquez','Vazquez','1992-04-05'),(626,'Gabriel','Martinez','Campos','1972-06-02'),(627,'Juan','Abasolo','Amador','2002-07-31'),(628,'Luisa','Huerta','Juarez','1989-06-05'),(629,'Marcia','Barrios','Espinoza','1997-07-20'),(630,'Carla','Amador','Urbia','1985-12-09'),(631,'Marco','Campos','Quiroz','2004-12-27'),(632,'Ramona','Nuñes','Abasolo','1977-11-20'),(633,'Ivonne','Quiroz','Dominguez','1967-11-20'),(634,'Tomasa','Baez','Navarro','1985-10-12'),(635,'Juana','Ibarra','Flores','1966-01-01'),(636,'Gabriela','Abasolo','Abasolo','1963-04-28'),(637,'Marco','Torres','Carrasco','1975-02-05'),(638,'Luisa','Lopez','Guerrero','1997-02-13'),(639,'Ramona','Vazquez','Torres','1980-08-11'),(640,'Hugo','Lobardia','Férnandes','1964-08-31'),(641,'Juan','Cruz','Navarro','1995-06-20'),(642,'Berta','Dominguez','Duarte','1981-06-21'),(643,'Damián','Ximenes','Carrasco','1995-02-08'),(644,'Tomasa','Barrios','Martinez','1993-01-03'),(645,'Fernanda','Martinez','Guerrero','1992-03-29'),(646,'Marco','Baez','Martinez','1979-11-11'),(647,'Carlos','Flores','Gutierréz','1993-04-13'),(648,'Kevin','Ibañez','Santos','1985-01-21'),(649,'Nestor','Cruz','Jiménez','1973-07-17'),(650,'Anahi','Juarez','Duarte','1993-12-17'),(651,'Samuel','Huerta','Lopez','1999-01-02'),(652,'Ivan','Nuñes','Martinez','1996-09-01'),(653,'Uruel','Flores','Barrios','2002-03-15'),(654,'Anahi','Gonzalez','Heras','1989-09-12'),(655,'Karen','Abasolo','Vazquez','1975-05-12'),(656,'Gabriel','Lobardia','Martinez','2003-10-07'),(657,'Gabriela','Carrasco','Quiroz','1992-09-28'),(658,'Adan','Lobardia','Huerta','1974-07-21'),(659,'Kevin','Lopez','Nuñes','1988-10-23'),(660,'Hugo','Amador','Heras','1965-11-26'),(661,'Hugo','Gonzalez','Eslava','1969-04-25'),(662,'Esmeralda','Martinez','Gonzalez','2001-01-18'),(663,'Fernando','Lobardia','Ramirez','1982-03-28'),(664,'Nestor','Amador','Ortega','2005-01-12'),(665,'Hugo','Gonzalez','Campos','2003-08-28'),(666,'Daniela','Quiroz','Santos','1960-01-24'),(667,'Tomasa','Gutierréz','Carrasco','1996-06-21'),(668,'Olga','Juarez','Cruz','1963-04-30'),(669,'Karen','Nuñes','Cruz','1964-04-01'),(670,'Tomasa','Flores','Guerrero','1984-08-06'),(671,'Ursuala','Juarez','Lopez','1991-07-18'),(672,'Berta','Urbia','Espinoza','1964-11-01'),(673,'Carlos','Eslava','Duarte','1976-03-04'),(674,'Olga','Marquez','Martinez','2000-10-01'),(675,'Ramona','Guerrero','Espinoza','1977-06-18'),(676,'Ramona','Kuri','Ortega','1998-08-24'),(677,'Kevin','Vazquez','Guerrero','1974-01-25'),(678,'Omar','Dominguez','Férnandes','1993-06-06'),(679,'Ramiro','Amador','Ramirez','1975-03-01'),(680,'Damián','Vazquez','Cruz','1975-12-02'),(681,'Hortencia','Ibañez','Cruz','1967-12-12'),(682,'Kevin','Eslava','Guerrero','1990-05-23'),(683,'Luis','Vazquez','Gonzalez','1973-06-10'),(684,'Hugo','Abasolo','Cruz','1997-05-24'),(685,'Juan','Gonzalez','Quiroz','1991-02-02'),(686,'Damián','Carrasco','Marquez','1969-08-24'),(687,'Luis','Ximenes','Ibarra','1983-02-06'),(688,'Damián','Urbia','Gonzalez','1979-05-23'),(689,'Berta','Eslava','Martinez','1979-03-23'),(690,'Ramiro','Vazquez','Torres','1980-05-11'),(691,'Benito','Barrios','Ibarra','1967-11-24'),(692,'Tomas','Férnandes','Marquez','1962-08-25'),(693,'Daniela','Lobardia','Gonzalez','1970-12-16'),(694,'Anahi','Gutierréz','Jiménez','1990-06-04'),(695,'Carla','Ibañez','Dominguez','1990-04-29'),(696,'Nestor','Quiroz','Nuñes','1976-07-06'),(697,'Kevin','Ibañez','Zurita','1963-12-29'),(698,'Tomasa','Duarte','Campos','2000-12-16'),(699,'Esmeralda','Santos','Ximenes','1971-03-24'),(700,'Ramona','Baez','Barrios','2005-12-14'),(701,'Omar','Lopez','Juarez','1971-03-07'),(702,'Daniela','Ibañez','Santos','1985-10-21'),(703,'Tomasa','Férnandes','Jiménez','1994-10-01'),(704,'Emerson','Juarez','Zurita','1960-05-15'),(705,'Emerson','Eslava','Gonzalez','1996-10-11'),(706,'Carla','Zurita','Oropeza','1967-09-26'),(707,'Ivonne','Jiménez','Ibarra','1988-05-29'),(708,'Hortencia','Marquez','Martinez','1999-12-09'),(709,'Marco','Heras','Espinoza','1965-01-05'),(710,'Damián','Marquez','Torres','1972-02-08'),(711,'Damián','Amador','Urbia','1984-10-30'),(712,'Carlos','Barrios','Barrios','1972-03-08'),(713,'Ramona','Ximenes','Espinoza','1960-07-13'),(714,'Samanta','Abasolo','Urbia','1969-01-10'),(715,'Ramona','Torres','Zurita','1996-08-02'),(716,'Damián','Ortega','Ibañez','1966-10-03'),(717,'Kevin','Abasolo','Yañez','1989-09-06'),(718,'Carla','Marquez','Cruz','1966-03-09'),(719,'Samanta','Lobardia','Campos','1985-01-28'),(720,'Olga','Duarte','Ibañez','1994-01-11'),(721,'Gabriel','Oropeza','Jiménez','1961-03-23'),(722,'Ivonne','Duarte','Férnandes','1979-08-23'),(723,'Ivonne','Heras','Eslava','1964-11-18'),(724,'Fernanda','Ibarra','Ibañez','1990-07-24'),(725,'Ivonne','Baez','Ortega','1985-02-21'),(726,'Daniela','Torres','Ramirez','1964-08-31'),(727,'Fernando','Santos','Lopez','1969-03-14'),(728,'Damián','Santos','Barrios','1995-05-20'),(729,'Pedro','Ibarra','Guerrero','1971-06-25'),(730,'Nestor','Baez','Ibañez','2005-04-13'),(731,'Gabriel','Nuñes','Ximenes','1997-02-01'),(732,'Fernanda','Flores','Flores','1982-12-30'),(733,'Gabriel','Ximenes','Barrios','1981-12-28'),(734,'Luisa','Férnandes','Marquez','1959-05-29'),(735,'Samuel','Kuri','Eslava','1989-06-23'),(736,'Samuel','Cruz','Gutierréz','1999-11-02'),(737,'Perla','Navarro','Lopez','1978-06-02'),(738,'Pedro','Navarro','Oropeza','1993-10-04'),(739,'Tomasa','Dominguez','Campos','1965-01-29'),(740,'Gabriela','Santos','Gutierréz','1982-04-18'),(741,'Juana','Ximenes','Carrasco','1995-03-10'),(742,'Ursuala','Torres','Abasolo','1960-01-05'),(743,'Gabriel','Ramirez','Duarte','1968-08-17'),(744,'Berta','Huerta','Eslava','1998-10-05'),(745,'Ivan','Vazquez','Kuri','1995-12-15'),(746,'Ivan','Campos','Nuñes','1990-05-05'),(747,'Tomasa','Lobardia','Yañez','1966-07-31'),(748,'Emerson','Barrios','Vazquez','1988-05-22'),(749,'Esmeralda','Martinez','Jiménez','1972-08-21'),(750,'Nora','Amador','Ortega','2000-08-29'),(751,'Marcia','Duarte','Campos','2003-05-31'),(752,'Berta','Carrasco','Carrasco','1962-11-21'),(753,'Tomas','Abasolo','Juarez','1968-01-12'),(754,'Ivan','Ximenes','Navarro','1964-11-26'),(755,'Marcia','Kuri','Vazquez','1990-04-28'),(756,'Fernanda','Flores','Jiménez','2004-11-19'),(757,'Benito','Kuri','Abasolo','1974-06-17'),(758,'Ramona','Urbia','Heras','1986-01-18'),(759,'Ramona','Yañez','Ibañez','1980-03-28'),(760,'Perla','Duarte','Abasolo','2000-05-04'),(761,'Uruel','Nuñes','Barrios','1973-09-13'),(762,'Olga','Ramirez','Nuñes','1975-02-19'),(763,'Olga','Flores','Santos','1962-12-30'),(764,'Benito','Ibañez','Jiménez','1984-11-09'),(765,'Juan','Amador','Campos','1978-09-24'),(766,'Kevin','Gutierréz','Huerta','1983-10-12'),(767,'Luis','Jiménez','Ramirez','1986-11-20'),(768,'Olga','Urbia','Gutierréz','1979-09-27'),(769,'Esmeralda','Marquez','Lobardia','1991-03-20'),(770,'Tomasa','Kuri','Zurita','2005-10-20'),(771,'Juan','Vazquez','Abasolo','1988-01-25'),(772,'Gabriel','Zurita','Gonzalez','1966-02-25'),(773,'Ramiro','Jiménez','Eslava','2003-07-03'),(774,'Hortencia','Cruz','Campos','1972-12-29'),(775,'Anahi','Oropeza','Guerrero','1988-07-25'),(776,'Nora','Barrios','Baez','1978-06-05'),(777,'Fernanda','Heras','Torres','1989-04-20'),(778,'Emerson','Navarro','Duarte','1978-04-14'),(779,'Nora','Carrasco','Lopez','1971-09-23'),(780,'Juan','Ortega','Lopez','1990-06-26'),(781,'Fernando','Duarte','Amador','1987-09-10'),(782,'Omar','Guerrero','Santos','2005-03-28'),(783,'Daniela','Ortega','Huerta','1965-11-30'),(784,'Gabriel','Duarte','Urbia','1965-09-30'),(785,'Uruel','Ortega','Ibarra','1972-04-30'),(786,'Tomasa','Flores','Heras','1998-10-23'),(787,'Olga','Duarte','Lopez','1965-12-17'),(788,'Samanta','Flores','Baez','1960-09-28'),(789,'Benito','Navarro','Santos','1965-07-10'),(790,'Juan','Lopez','Torres','1963-10-27'),(791,'Fernanda','Guerrero','Ortega','1983-01-11'),(792,'Ursuala','Jiménez','Huerta','1982-02-05'),(793,'Perla','Ramirez','Eslava','1968-03-30'),(794,'Tomasa','Cruz','Cruz','2004-01-16'),(795,'Marcia','Ximenes','Amador','1978-10-05'),(796,'Ivan','Baez','Cruz','1991-06-02'),(797,'Perla','Duarte','Gutierréz','1983-05-27'),(798,'Benito','Ortega','Ximenes','1995-12-02'),(799,'Ivan','Duarte','Espinoza','1974-06-29'),(800,'Juan','Urbia','Ortega','1973-03-26'),(801,'Juana','Martinez','Gutierréz','2001-07-16'),(802,'Hugo','Gonzalez','Gonzalez','1984-08-02'),(803,'Gabriel','Yañez','Campos','1984-11-23'),(804,'Marcia','Campos','Kuri','1980-01-20'),(805,'Nestor','Juarez','Gutierréz','1960-02-06'),(806,'Carla','Gonzalez','Quiroz','1988-02-16'),(807,'Tomasa','Ibarra','Ibañez','1990-12-07'),(808,'Marcia','Cruz','Lobardia','1981-06-07'),(809,'Juana','Cruz','Ramirez','1966-10-13'),(810,'Juana','Zurita','Quiroz','1971-11-05'),(811,'Carlos','Torres','Campos','1967-09-29'),(812,'Kevin','Barrios','Urbia','1982-11-04'),(813,'Benito','Abasolo','Jiménez','1967-05-01'),(814,'Damián','Lobardia','Gonzalez','1970-06-29'),(815,'Samanta','Ximenes','Carrasco','1991-10-20'),(816,'Kevin','Dominguez','Eslava','1983-12-30'),(817,'Daniela','Huerta','Ramirez','1980-12-09'),(818,'Damián','Barrios','Ximenes','1992-11-19'),(819,'Benito','Martinez','Lopez','1981-03-28'),(820,'Carla','Férnandes','Juarez','1999-01-28'),(821,'Anahi','Barrios','Abasolo','1967-03-13'),(822,'Marcia','Campos','Martinez','1990-04-17'),(823,'Samuel','Lopez','Heras','1963-01-05'),(824,'Tomas','Barrios','Juarez','1975-04-09'),(825,'Uruel','Marquez','Vazquez','1998-05-14'),(826,'Tomasa','Yañez','Marquez','1998-11-23'),(827,'Hortencia','Duarte','Oropeza','1982-01-26'),(828,'Juan','Espinoza','Kuri','2000-12-18'),(829,'Ramona','Duarte','Cruz','1981-01-24'),(830,'Adan','Barrios','Carrasco','1978-01-15'),(831,'Berta','Heras','Gonzalez','1978-08-17'),(832,'Olga','Huerta','Jiménez','1988-01-13'),(833,'Tomasa','Cruz','Carrasco','1978-05-23'),(834,'Berta','Guerrero','Vazquez','1970-12-12'),(835,'Carla','Navarro','Lopez','1980-12-21'),(836,'Pedro','Yañez','Santos','1984-08-14'),(837,'Hugo','Campos','Duarte','1982-12-11'),(838,'Samuel','Campos','Ximenes','1989-03-27'),(839,'Ivonne','Baez','Abasolo','2000-08-13'),(840,'Hugo','Guerrero','Vazquez','1970-08-25'),(841,'Anahi','Nuñes','Urbia','1985-05-17'),(842,'Ivan','Heras','Dominguez','1959-12-16'),(843,'Fernando','Kuri','Urbia','1982-01-16'),(844,'Ramiro','Carrasco','Flores','1980-04-26'),(845,'Benito','Gutierréz','Yañez','1969-06-06'),(846,'Omar','Gutierréz','Barrios','1989-09-23'),(847,'Adan','Lobardia','Kuri','1991-08-17'),(848,'Juana','Juarez','Guerrero','2005-05-21'),(849,'Nora','Ibañez','Torres','1976-08-03'),(850,'Daniela','Oropeza','Kuri','1967-05-26'),(851,'Adan','Jiménez','Duarte','2002-11-29'),(852,'Damián','Heras','Lopez','1965-12-14'),(853,'Olga','Ibañez','Jiménez','1983-11-08'),(854,'Benito','Baez','Marquez','1974-06-01'),(855,'Tomasa','Dominguez','Ximenes','1985-07-22'),(856,'Ramiro','Kuri','Gonzalez','1963-12-31'),(857,'Marco','Barrios','Gutierréz','1960-02-10'),(858,'Ramona','Lopez','Carrasco','1978-09-28'),(859,'Fernanda','Flores','Flores','1980-03-27'),(860,'Benito','Férnandes','Santos','1996-11-07'),(861,'Berta','Juarez','Torres','1971-05-22'),(862,'Pedro','Abasolo','Flores','1981-08-24'),(863,'Uruel','Ortega','Lobardia','1981-10-16'),(864,'Marcia','Guerrero','Heras','1992-09-15'),(865,'Tomas','Abasolo','Lopez','1979-08-29'),(866,'Carlos','Flores','Ibañez','2001-12-26'),(867,'Ursuala','Duarte','Ximenes','1971-10-18'),(868,'Fernanda','Jiménez','Santos','1989-03-25'),(869,'Marcia','Ramirez','Huerta','1989-09-09'),(870,'Nora','Espinoza','Amador','1986-03-15'),(871,'Uruel','Santos','Lopez','1962-10-06'),(872,'Juana','Gonzalez','Quiroz','1991-12-01'),(873,'Hugo','Abasolo','Lobardia','1976-07-15'),(874,'Adan','Ramirez','Cruz','1988-11-12'),(875,'Ivan','Kuri','Baez','1981-06-23'),(876,'Omar','Abasolo','Marquez','1973-10-12'),(877,'Olga','Guerrero','Barrios','1999-10-29'),(878,'Pedro','Oropeza','Yañez','1988-08-25'),(879,'Nora','Nuñes','Urbia','1988-01-18'),(880,'Karen','Barrios','Ximenes','1992-10-19'),(881,'Adan','Espinoza','Santos','1998-12-20'),(882,'Berta','Eslava','Gutierréz','1991-09-21'),(883,'Adan','Abasolo','Abasolo','1961-12-25'),(884,'Uruel','Lopez','Urbia','1978-06-29'),(885,'Esmeralda','Ortega','Férnandes','1997-09-27'),(886,'Carla','Ramirez','Flores','1975-06-02'),(887,'Samanta','Campos','Amador','2004-09-20'),(888,'Nestor','Duarte','Oropeza','1986-05-11'),(889,'Esmeralda','Guerrero','Abasolo','2000-04-23'),(890,'Benito','Juarez','Carrasco','1985-02-09'),(891,'Gabriela','Marquez','Ramirez','1978-10-11'),(892,'Ursuala','Navarro','Flores','1988-07-25'),(893,'Ursuala','Marquez','Barrios','1976-03-12'),(894,'Perla','Carrasco','Marquez','1971-01-25'),(895,'Gabriela','Eslava','Zurita','1992-01-21'),(896,'Berta','Jiménez','Baez','1987-07-22'),(897,'Samanta','Ximenes','Abasolo','1980-12-21'),(898,'Carlos','Heras','Ximenes','1967-07-03'),(899,'Fernando','Lopez','Dominguez','1976-11-12'),(900,'Juana','Eslava','Torres','1998-03-24'),(901,'Marco','Quiroz','Carrasco','1966-08-04'),(902,'Luisa','Férnandes','Marquez','2005-03-02'),(903,'Juan','Yañez','Juarez','1984-02-19'),(904,'Gabriela','Flores','Ximenes','1980-09-13'),(905,'Ivonne','Guerrero','Yañez','1978-02-07'),(906,'Tomas','Quiroz','Duarte','1973-04-18'),(907,'Gabriel','Lobardia','Navarro','1966-08-21'),(908,'Fernanda','Baez','Santos','1961-08-28'),(909,'Marcia','Ibañez','Juarez','1981-12-26'),(910,'Gabriela','Lopez','Yañez','1997-12-01'),(911,'Berta','Gonzalez','Barrios','1995-11-03'),(912,'Benito','Espinoza','Oropeza','1978-06-20'),(913,'Pedro','Nuñes','Gutierréz','1965-12-16'),(914,'Luis','Navarro','Cruz','1993-07-11'),(915,'Ramona','Dominguez','Nuñes','1984-06-28'),(916,'Esmeralda','Férnandes','Espinoza','1966-03-19'),(917,'Juan','Kuri','Jiménez','1979-04-14'),(918,'Ramona','Juarez','Flores','1997-05-31'),(919,'Ivonne','Huerta','Eslava','2001-12-25'),(920,'Marco','Eslava','Amador','2000-10-13'),(921,'Nora','Lopez','Ramirez','1972-08-14'),(922,'Tomas','Juarez','Martinez','1999-02-02'),(923,'Damián','Gonzalez','Navarro','1979-07-31'),(924,'Hugo','Ximenes','Oropeza','1974-01-26'),(925,'Juan','Abasolo','Amador','2002-06-12'),(926,'Hortencia','Vazquez','Kuri','1996-09-02'),(927,'Pedro','Lopez','Torres','1964-02-07'),(928,'Juana','Flores','Férnandes','1983-09-17'),(929,'Kevin','Cruz','Lopez','1981-09-02'),(930,'Hortencia','Gutierréz','Guerrero','1967-07-05'),(931,'Ramona','Espinoza','Carrasco','2004-01-19'),(932,'Fernanda','Santos','Oropeza','1984-01-16'),(933,'Esmeralda','Navarro','Carrasco','1973-02-23'),(934,'Nestor','Navarro','Flores','1985-09-25'),(935,'Perla','Flores','Lopez','1972-10-07'),(936,'Berta','Eslava','Huerta','1997-10-23'),(937,'Ivonne','Urbia','Ortega','1974-10-17'),(938,'Fernanda','Flores','Ibarra','2004-04-05'),(939,'Ramiro','Huerta','Oropeza','1972-01-10'),(940,'Luis','Duarte','Dominguez','1960-11-08'),(941,'Tomas','Ortega','Abasolo','1967-09-05'),(942,'Samanta','Ibarra','Quiroz','1983-08-04'),(943,'Kevin','Urbia','Eslava','1963-05-20'),(944,'Juan','Martinez','Férnandes','1995-01-19'),(945,'Pedro','Zurita','Yañez','1961-03-31'),(946,'Olga','Marquez','Lopez','1997-01-10'),(947,'Gabriel','Ibañez','Abasolo','1981-06-22'),(948,'Emerson','Duarte','Ibarra','1996-06-06'),(949,'Fernanda','Ibarra','Huerta','1983-03-15'),(950,'Juan','Quiroz','Ximenes','1979-05-02'),(951,'Marcia','Quiroz','Baez','1961-05-27'),(952,'Ivan','Gonzalez','Yañez','1979-11-11'),(953,'Karen','Cruz','Huerta','1962-12-06'),(954,'Samanta','Lobardia','Eslava','2001-10-05'),(955,'Luis','Santos','Vazquez','1963-01-18'),(956,'Nora','Navarro','Gonzalez','1995-11-13'),(957,'Perla','Marquez','Juarez','1982-06-14'),(958,'Gabriela','Quiroz','Torres','1991-10-21'),(959,'Marcia','Yañez','Ibarra','1980-08-12'),(960,'Perla','Quiroz','Amador','1994-11-21'),(961,'Benito','Espinoza','Navarro','1976-12-14'),(962,'Esmeralda','Amador','Ibañez','1972-03-03'),(963,'Ursuala','Yañez','Lobardia','1987-10-12'),(964,'Marco','Gonzalez','Jiménez','2001-07-25'),(965,'Hugo','Marquez','Lopez','1994-12-07'),(966,'Juana','Vazquez','Carrasco','1997-01-15'),(967,'Tomasa','Torres','Gutierréz','1997-08-18'),(968,'Perla','Nuñes','Juarez','1978-11-17'),(969,'Ramiro','Ibarra','Campos','1995-09-28'),(970,'Juana','Ximenes','Gutierréz','1970-08-21'),(971,'Tomasa','Santos','Oropeza','1984-06-10'),(972,'Hortencia','Gutierréz','Barrios','1988-03-04'),(973,'Gabriel','Marquez','Santos','1986-10-20'),(974,'Fernanda','Barrios','Férnandes','2002-10-30'),(975,'Fernando','Jiménez','Juarez','1994-02-02'),(976,'Olga','Barrios','Nuñes','1991-06-07'),(977,'Luisa','Guerrero','Marquez','1971-02-08'),(978,'Fernanda','Yañez','Lobardia','1991-12-22'),(979,'Juana','Eslava','Cruz','1997-02-15'),(980,'Emerson','Campos','Zurita','2003-03-09'),(981,'Carla','Eslava','Duarte','1974-01-27'),(982,'Pedro','Gonzalez','Ximenes','1971-07-27'),(983,'Esmeralda','Dominguez','Flores','1984-02-23'),(984,'Berta','Ibarra','Gonzalez','1980-04-07'),(985,'Gabriela','Guerrero','Gonzalez','1988-11-18'),(986,'Ivonne','Santos','Abasolo','1991-10-27'),(987,'Emerson','Heras','Huerta','1985-10-02'),(988,'Pedro','Baez','Heras','1999-08-14'),(989,'Daniela','Nuñes','Espinoza','1999-06-14'),(990,'Berta','Eslava','Espinoza','1982-02-15'),(991,'Damián','Ximenes','Carrasco','1992-06-01'),(992,'Pedro','Jiménez','Ibarra','1983-07-27'),(993,'Gabriel','Abasolo','Gutierréz','1996-12-12'),(994,'Carla','Huerta','Ximenes','1959-10-22'),(995,'Karen','Abasolo','Ximenes','1984-04-15'),(996,'Carlos','Huerta','Ximenes','1961-04-05'),(997,'Esmeralda','Espinoza','Nuñes','1969-04-10'),(998,'Adan','Baez','Gutierréz','1994-06-11'),(999,'Uruel','Duarte','Vazquez','1971-01-19'),(1000,'Carla','Juarez','Ibarra','1975-12-09'),(1001,'Omar','Amador','Heras','1963-10-08'),(1002,'Juan','Jiménez','Lobardia','1994-06-06'),(1003,'Nestor','Heras','Cruz','1977-09-16'),(1004,'Hugo','Vazquez','Quiroz','1982-07-19'),(1005,'Uruel','Torres','Torres','1960-05-24'),(1006,'Marco','Eslava','Barrios','1959-12-15'),(1007,'Adan','Oropeza','Lobardia','1970-03-16'),(1008,'Berta','Guerrero','Ramirez','2001-01-12'),(1009,'Hugo','Navarro','Urbia','1976-01-19'),(1010,'Ramiro','Carrasco','Ibarra','1996-10-10'),(1011,'Nora','Santos','Huerta','1988-12-06'),(1012,'Esmeralda','Gutierréz','Huerta','1978-11-23'),(1013,'Luisa','Duarte','Guerrero','1981-02-01'),(1014,'Carlos','Ramirez','Barrios','1998-01-09'),(1015,'Benito','Navarro','Amador','1998-10-26'),(1016,'Tomas','Juarez','Martinez','1999-11-09'),(1017,'Ivan','Abasolo','Eslava','1979-01-03'),(1018,'Uruel','Flores','Eslava','1970-01-23'),(1019,'Tomas','Juarez','Ramirez','1976-11-06'),(1020,'Anahi','Juarez','Gutierréz','1960-12-21'),(1021,'Juana','Gutierréz','Urbia','1999-02-24'),(1022,'Nora','Gonzalez','Jiménez','2001-04-12'),(1023,'Esmeralda','Férnandes','Abasolo','1990-08-13'),(1024,'Luis','Jiménez','Ximenes','1963-05-16'),(1025,'Carla','Baez','Ibarra','2001-09-30'),(1026,'Samuel','Baez','Vazquez','1978-03-30'),(1027,'Juana','Heras','Yañez','1973-04-29'),(1028,'Karen','Abasolo','Vazquez','1975-11-29'),(1029,'Marco','Abasolo','Martinez','1980-01-03'),(1030,'Emerson','Gutierréz','Férnandes','1970-12-04'),(1031,'Gabriela','Duarte','Yañez','1978-06-02'),(1032,'Uruel','Amador','Cruz','1960-11-12'),(1033,'Ivan','Kuri','Abasolo','1972-09-05'),(1034,'Benito','Férnandes','Yañez','1973-09-19'),(1035,'Luisa','Férnandes','Abasolo','1989-06-20'),(1036,'Uruel','Oropeza','Lobardia','1969-03-12'),(1037,'Pedro','Urbia','Abasolo','1987-12-01'),(1038,'Hugo','Jiménez','Carrasco','1992-05-23'),(1039,'Ramiro','Cruz','Lopez','1987-02-23'),(1040,'Pedro','Urbia','Carrasco','2000-05-20'),(1041,'Kevin','Marquez','Marquez','1997-07-08'),(1042,'Kevin','Yañez','Abasolo','1983-06-26'),(1043,'Berta','Flores','Oropeza','1990-12-30'),(1044,'Luis','Lobardia','Dominguez','1989-05-27'),(1045,'Ivan','Martinez','Juarez','1974-07-20'),(1046,'Juana','Guerrero','Ibañez','2002-01-01'),(1047,'Perla','Férnandes','Navarro','1972-12-10'),(1048,'Ivan','Guerrero','Quiroz','1993-01-16'),(1049,'Damián','Santos','Dominguez','2005-11-10'),(1050,'Benito','Kuri','Férnandes','2001-01-24'),(1051,'Marco','Torres','Torres','1961-07-24'),(1052,'Carlos','Jiménez','Heras','1981-07-19'),(1053,'Luis','Torres','Duarte','1981-08-15'),(1054,'Gabriel','Espinoza','Campos','2000-06-13'),(1055,'Nestor','Baez','Férnandes','1986-09-10'),(1056,'Perla','Quiroz','Yañez','1987-11-09'),(1057,'Emerson','Lobardia','Eslava','1997-11-25'),(1058,'Samuel','Huerta','Kuri','1993-05-01'),(1059,'Fernanda','Amador','Juarez','1975-06-07'),(1060,'Emerson','Marquez','Heras','1973-11-25'),(1061,'Adan','Ximenes','Yañez','1965-03-31'),(1062,'Pedro','Guerrero','Santos','2003-07-16'),(1063,'Fernando','Carrasco','Urbia','1966-12-06'),(1064,'Nestor','Baez','Juarez','1960-04-20'),(1065,'Uruel','Guerrero','Eslava','1970-04-15'),(1066,'Samuel','Baez','Zurita','1993-11-13'),(1067,'Nora','Ximenes','Urbia','1996-04-30'),(1068,'Karen','Heras','Urbia','2002-03-06'),(1069,'Fernando','Ibarra','Ibañez','1987-03-10'),(1070,'Adan','Baez','Duarte','1973-05-15'),(1071,'Juan','Ximenes','Férnandes','1969-01-11'),(1072,'Hortencia','Férnandes','Ximenes','1966-03-09'),(1073,'Luis','Oropeza','Torres','2001-02-05'),(1074,'Ramiro','Ximenes','Gutierréz','1973-06-22'),(1075,'Carlos','Flores','Carrasco','1969-04-12'),(1076,'Perla','Huerta','Amador','1980-06-17'),(1077,'Adan','Campos','Huerta','1960-04-12'),(1078,'Luisa','Oropeza','Carrasco','1968-01-06'),(1079,'Fernanda','Abasolo','Juarez','1967-01-28'),(1080,'Damián','Quiroz','Vazquez','1973-12-02'),(1081,'Ivan','Jiménez','Ortega','1965-11-28'),(1082,'Esmeralda','Quiroz','Huerta','1998-05-31'),(1083,'Juana','Campos','Heras','2002-12-20'),(1084,'Tomas','Amador','Espinoza','1997-07-14'),(1085,'Hortencia','Barrios','Marquez','1988-03-01'),(1086,'Fernando','Gutierréz','Ortega','1969-09-14'),(1087,'Pedro','Carrasco','Ortega','1983-11-05'),(1088,'Ivonne','Jiménez','Ibarra','1986-03-03'),(1089,'Ivan','Nuñes','Juarez','1981-06-17'),(1090,'Perla','Baez','Gonzalez','1994-03-10'),(1091,'Tomas','Ramirez','Ibañez','2000-09-23'),(1092,'Daniela','Urbia','Marquez','1960-08-30'),(1093,'Hugo','Navarro','Amador','2004-11-14'),(1094,'Kevin','Martinez','Torres','1959-06-28'),(1095,'Gabriel','Ximenes','Amador','1974-01-29'),(1096,'Gabriela','Cruz','Marquez','1985-07-24'),(1097,'Benito','Lobardia','Espinoza','1960-04-29'),(1098,'Nora','Gutierréz','Flores','1964-10-18'),(1099,'Samuel','Férnandes','Cruz','1977-11-22'),(1100,'Ivan','Flores','Lopez','1973-09-28'),(1101,'Karen','Barrios','Santos','1974-10-18'),(1102,'Ramiro','Carrasco','Lobardia','1963-06-27'),(1103,'Berta','Flores','Quiroz','1996-08-01'),(1104,'Olga','Gutierréz','Eslava','2000-03-21'),(1105,'Benito','Ramirez','Guerrero','1983-11-25'),(1106,'Ivan','Lobardia','Carrasco','1992-01-06'),(1107,'Marco','Torres','Espinoza','1988-08-28'),(1108,'Berta','Duarte','Gutierréz','1982-10-03'),(1109,'Pedro','Campos','Nuñes','1991-12-13'),(1110,'Karen','Ramirez','Yañez','1981-04-01'),(1111,'Daniela','Dominguez','Ibarra','1962-02-26'),(1112,'Fernanda','Campos','Santos','1972-12-27'),(1113,'Pedro','Quiroz','Flores','1974-05-17'),(1114,'Marcia','Vazquez','Campos','1994-06-27'),(1115,'Samanta','Lobardia','Gonzalez','1965-09-25'),(1116,'Pedro','Amador','Barrios','1974-02-28'),(1117,'Olga','Quiroz','Gonzalez','1992-04-23'),(1118,'Uruel','Huerta','Baez','1986-07-31'),(1119,'Ivonne','Campos','Jiménez','1975-11-21'),(1120,'Carlos','Ortega','Navarro','1999-02-22'),(1121,'Nestor','Dominguez','Juarez','1967-08-31'),(1122,'Kevin','Carrasco','Campos','1961-08-09'),(1123,'Juan','Santos','Gonzalez','1983-04-18'),(1124,'Pedro','Baez','Marquez','1976-01-23'),(1125,'Juan','Férnandes','Férnandes','1976-03-12'),(1126,'Pedro','Dominguez','Baez','1969-12-27'),(1127,'Ivan','Baez','Cruz','1989-10-05'),(1128,'Uruel','Ibarra','Baez','1995-03-30'),(1129,'Hortencia','Flores','Santos','2004-10-20'),(1130,'Berta','Vazquez','Martinez','1963-07-24'),(1131,'Fernanda','Jiménez','Navarro','1967-05-21'),(1132,'Ramona','Amador','Quiroz','1967-10-17'),(1133,'Esmeralda','Cruz','Abasolo','1970-08-21'),(1134,'Benito','Lobardia','Duarte','1999-02-26'),(1135,'Kevin','Urbia','Jiménez','1996-06-30'),(1136,'Tomas','Ibañez','Kuri','1992-03-05'),(1137,'Luisa','Zurita','Huerta','1970-12-17'),(1138,'Marcia','Carrasco','Ximenes','1973-07-24'),(1139,'Damián','Heras','Quiroz','1989-09-27'),(1140,'Hugo','Eslava','Navarro','1984-12-21'),(1141,'Esmeralda','Heras','Lopez','1960-12-04'),(1142,'Luis','Jiménez','Yañez','1964-10-17'),(1143,'Marcia','Carrasco','Urbia','1967-07-17'),(1144,'Ramiro','Heras','Ramirez','1992-09-09'),(1145,'Juan','Urbia','Marquez','2004-08-20'),(1146,'Emerson','Santos','Vazquez','1966-06-12'),(1147,'Adan','Martinez','Quiroz','1962-02-09'),(1148,'Ivan','Heras','Campos','1995-07-28'),(1149,'Omar','Yañez','Yañez','1961-03-25'),(1150,'Anahi','Gutierréz','Jiménez','1988-05-21'),(1151,'Fernanda','Zurita','Nuñes','2003-02-11'),(1152,'Perla','Ibañez','Barrios','1983-01-06'),(1153,'Samanta','Kuri','Eslava','1993-10-01'),(1154,'Olga','Nuñes','Navarro','2004-05-09'),(1155,'Carla','Martinez','Férnandes','1991-09-03'),(1156,'Gabriel','Vazquez','Quiroz','1981-08-19'),(1157,'Omar','Marquez','Juarez','1986-05-20'),(1158,'Carlos','Gutierréz','Santos','1991-07-31'),(1159,'Luis','Yañez','Nuñes','2004-09-05'),(1160,'Marco','Nuñes','Amador','1971-05-09'),(1161,'Olga','Gutierréz','Campos','1989-11-18'),(1162,'Tomas','Zurita','Baez','1981-08-24'),(1163,'Tomas','Jiménez','Quiroz','1978-02-25'),(1164,'Daniela','Ibañez','Ximenes','2005-02-12'),(1165,'Ramiro','Abasolo','Amador','1999-12-24'),(1166,'Karen','Ibarra','Quiroz','1986-07-26'),(1167,'Samanta','Huerta','Navarro','1964-08-24'),(1168,'Juana','Campos','Jiménez','1969-03-20'),(1169,'Esmeralda','Santos','Yañez','1975-10-22'),(1170,'Nestor','Torres','Nuñes','1985-06-22'),(1171,'Nestor','Kuri','Ibañez','1974-04-03'),(1172,'Olga','Ibarra','Marquez','1960-05-02'),(1173,'Carlos','Kuri','Torres','1967-12-25'),(1174,'Carla','Ibarra','Campos','1997-12-01'),(1175,'Juan','Lobardia','Jiménez','1986-07-01'),(1176,'Gabriel','Santos','Huerta','1989-04-28'),(1177,'Esmeralda','Martinez','Ibarra','1965-12-19'),(1178,'Uruel','Ortega','Lobardia','1983-02-21'),(1179,'Daniela','Carrasco','Ibarra','1996-10-18'),(1180,'Nora','Ramirez','Férnandes','1981-11-20'),(1181,'Ivonne','Férnandes','Vazquez','1960-09-25'),(1182,'Fernanda','Quiroz','Carrasco','1966-05-07'),(1183,'Juana','Yañez','Oropeza','1966-04-24'),(1184,'Tomasa','Eslava','Amador','1998-08-17'),(1185,'Samuel','Marquez','Lobardia','1990-05-12'),(1186,'Marcia','Lobardia','Vazquez','2000-07-26'),(1187,'Anahi','Quiroz','Heras','1998-11-02'),(1188,'Marcia','Dominguez','Santos','1967-12-11'),(1189,'Karen','Guerrero','Férnandes','1981-09-15'),(1190,'Juana','Vazquez','Cruz','1973-05-25'),(1191,'Ivonne','Baez','Ortega','1986-12-05'),(1192,'Uruel','Vazquez','Santos','1992-04-07'),(1193,'Carlos','Jiménez','Lobardia','1995-05-31'),(1194,'Carlos','Guerrero','Martinez','1974-07-20'),(1195,'Marcia','Cruz','Nuñes','1992-01-28'),(1196,'Olga','Martinez','Ramirez','1962-01-27'),(1197,'Gabriel','Navarro','Eslava','1978-08-23'),(1198,'Samuel','Navarro','Abasolo','1964-03-23'),(1199,'Adan','Flores','Urbia','1967-04-16'),(1200,'Tomas','Gutierréz','Baez','1993-07-04'),(1201,'Ivonne','Barrios','Heras','1960-10-01'),(1202,'Anahi','Dominguez','Kuri','1971-11-17'),(1203,'Carla','Jiménez','Ibarra','1984-02-21'),(1204,'Marco','Ramirez','Gutierréz','1988-10-17'),(1205,'Fernanda','Zurita','Marquez','1994-07-26'),(1206,'Hugo','Ximenes','Santos','1988-05-23'),(1207,'Esmeralda','Amador','Martinez','1999-01-16'),(1208,'Samuel','Ximenes','Nuñes','2005-09-18'),(1209,'Hugo','Torres','Ibarra','1966-03-09'),(1210,'Adan','Kuri','Ibañez','1972-11-09'),(1211,'Daniela','Ximenes','Cruz','1971-01-03'),(1212,'Emerson','Baez','Urbia','1965-12-14'),(1213,'Hugo','Gonzalez','Guerrero','1975-04-17'),(1214,'Marcia','Vazquez','Yañez','1971-12-20'),(1215,'Samanta','Juarez','Ximenes','1998-01-21'),(1216,'Marcia','Martinez','Campos','1972-01-28'),(1217,'Ivan','Guerrero','Ramirez','1997-10-29'),(1218,'Carla','Jiménez','Heras','1980-07-22'),(1219,'Esmeralda','Martinez','Ortega','1991-08-20'),(1220,'Gabriela','Eslava','Ramirez','2003-09-19'),(1221,'Samanta','Dominguez','Flores','1986-12-12'),(1222,'Gabriela','Kuri','Lopez','1990-02-15'),(1223,'Carlos','Ramirez','Dominguez','1964-09-14'),(1224,'Juana','Barrios','Dominguez','1984-08-02'),(1225,'Ramona','Cruz','Quiroz','1960-11-21'),(1226,'Adan','Espinoza','Vazquez','1961-04-22'),(1227,'Olga','Quiroz','Eslava','1972-06-04'),(1228,'Tomas','Yañez','Nuñes','2003-09-23'),(1229,'Fernando','Martinez','Gonzalez','1997-10-03'),(1230,'Perla','Navarro','Navarro','1991-05-19'),(1231,'Benito','Abasolo','Nuñes','1983-04-14'),(1232,'Marcia','Zurita','Torres','1971-05-13'),(1233,'Ramiro','Ibañez','Amador','1969-09-21'),(1234,'Fernando','Martinez','Eslava','1980-02-08'),(1235,'Marco','Amador','Baez','1981-01-10'),(1236,'Kevin','Espinoza','Abasolo','1991-07-06'),(1237,'Uruel','Flores','Yañez','1987-06-28'),(1238,'Damián','Eslava','Lobardia','1972-06-20'),(1239,'Fernanda','Ortega','Ibarra','1970-05-05'),(1240,'Carla','Quiroz','Urbia','1969-06-30'),(1241,'Perla','Jiménez','Ibarra','1985-08-01'),(1242,'Emerson','Carrasco','Yañez','1983-06-18'),(1243,'Hortencia','Marquez','Martinez','2004-02-14'),(1244,'Fernanda','Lobardia','Vazquez','1998-07-14'),(1245,'Esmeralda','Ortega','Abasolo','1967-05-13'),(1246,'Perla','Quiroz','Amador','1992-12-18'),(1247,'Daniela','Gutierréz','Ramirez','1985-01-25'),(1248,'Tomasa','Baez','Vazquez','1972-07-27'),(1249,'Ursuala','Torres','Torres','2005-10-01'),(1250,'Adan','Ibañez','Marquez','1998-06-29'),(1251,'Carla','Cruz','Urbia','1978-10-14'),(1252,'Gabriela','Zurita','Ibarra','1975-01-12'),(1253,'Fernando','Dominguez','Vazquez','1976-06-12'),(1254,'Uruel','Amador','Carrasco','1982-06-04'),(1255,'Carlos','Zurita','Vazquez','1993-01-20'),(1256,'Omar','Duarte','Kuri','1963-04-08'),(1257,'Ramona','Lopez','Torres','1959-12-15'),(1258,'Marco','Ibarra','Férnandes','1971-02-18'),(1259,'Juana','Marquez','Cruz','1967-10-15'),(1260,'Juan','Urbia','Heras','1985-06-14'),(1261,'Luis','Santos','Ximenes','1970-05-07'),(1262,'Luisa','Torres','Gutierréz','1999-07-31'),(1263,'Juana','Ortega','Martinez','1991-04-17'),(1264,'Juana','Ortega','Ibañez','1971-01-10'),(1265,'Gabriela','Ibarra','Duarte','2003-02-08'),(1266,'Juan','Baez','Flores','1981-03-29'),(1267,'Nestor','Barrios','Férnandes','1998-08-14'),(1268,'Ivonne','Heras','Campos','1996-02-14'),(1269,'Tomas','Santos','Quiroz','1988-04-27'),(1270,'Ursuala','Nuñes','Dominguez','1984-02-10'),(1271,'Tomasa','Barrios','Ibañez','1970-05-21'),(1272,'Anahi','Urbia','Lopez','1962-02-20'),(1273,'Tomas','Martinez','Jiménez','1970-10-27'),(1274,'Ramona','Duarte','Jiménez','1959-07-23'),(1275,'Ivan','Eslava','Duarte','1980-07-20'),(1276,'Luisa','Lobardia','Barrios','1979-08-11'),(1277,'Kevin','Campos','Vazquez','1987-04-06'),(1278,'Olga','Férnandes','Urbia','2003-07-15'),(1279,'Ramiro','Duarte','Cruz','1986-02-08'),(1280,'Daniela','Ortega','Huerta','1966-04-01'),(1281,'Gabriel','Huerta','Ortega','1964-11-19'),(1282,'Marcia','Flores','Flores','1976-05-11'),(1283,'Karen','Yañez','Abasolo','1983-11-02'),(1284,'Esmeralda','Ramirez','Quiroz','1994-09-23'),(1285,'Olga','Jiménez','Abasolo','1984-09-21'),(1286,'Perla','Nuñes','Huerta','1970-06-28'),(1287,'Gabriela','Gonzalez','Marquez','1965-03-20'),(1288,'Karen','Barrios','Ximenes','1996-05-04'),(1289,'Luis','Flores','Lobardia','1967-04-06'),(1290,'Pedro','Carrasco','Baez','2003-06-21'),(1291,'Hortencia','Cruz','Eslava','1983-04-12'),(1292,'Berta','Marquez','Huerta','1969-06-04'),(1293,'Berta','Jiménez','Nuñes','1963-03-19'),(1294,'Anahi','Espinoza','Urbia','1961-03-08'),(1295,'Samanta','Torres','Kuri','1977-04-09'),(1296,'Kevin','Huerta','Ramirez','1982-05-03'),(1297,'Marco','Urbia','Ramirez','1990-02-12'),(1298,'Ivan','Torres','Zurita','1998-12-26'),(1299,'Gabriela','Nuñes','Amador','1968-05-23'),(1300,'Juan','Heras','Santos','1999-05-07'),(1301,'Fernanda','Yañez','Jiménez','1983-02-21'),(1302,'Ramiro','Torres','Urbia','1973-01-06'),(1303,'Marco','Guerrero','Lobardia','1966-05-16'),(1304,'Emerson','Ibarra','Martinez','1964-08-11'),(1305,'Samanta','Ximenes','Ortega','1964-02-09'),(1306,'Fernanda','Huerta','Huerta','1974-04-27'),(1307,'Gabriel','Ximenes','Yañez','1968-03-10'),(1308,'Adan','Férnandes','Barrios','1990-11-09'),(1309,'Marcia','Barrios','Duarte','1991-01-29'),(1310,'Juan','Férnandes','Kuri','1999-01-07'),(1311,'Ramiro','Flores','Duarte','1970-08-14'),(1312,'Esmeralda','Duarte','Jiménez','2002-09-14'),(1313,'Pedro','Campos','Guerrero','1998-02-27'),(1314,'Daniela','Espinoza','Abasolo','1992-06-10'),(1315,'Juana','Jiménez','Eslava','2005-06-13'),(1316,'Gabriela','Gutierréz','Flores','1963-10-07'),(1317,'Juan','Navarro','Kuri','1973-06-26'),(1318,'Olga','Quiroz','Guerrero','1987-10-13'),(1319,'Esmeralda','Dominguez','Campos','1966-11-24'),(1320,'Esmeralda','Juarez','Yañez','2004-05-13'),(1321,'Emerson','Ximenes','Ibarra','1987-05-07'),(1322,'Samanta','Dominguez','Heras','2004-08-17'),(1323,'Ivan','Barrios','Nuñes','1991-01-03'),(1324,'Fernanda','Vazquez','Ximenes','1962-09-08'),(1325,'Berta','Marquez','Huerta','1972-09-03'),(1326,'Hortencia','Navarro','Yañez','1991-01-07'),(1327,'Tomasa','Juarez','Urbia','1983-07-08'),(1328,'Nestor','Zurita','Jiménez','1981-01-05'),(1329,'Perla','Vazquez','Torres','1984-02-06'),(1330,'Perla','Ortega','Navarro','1998-08-11'),(1331,'Juan','Lobardia','Lobardia','1990-09-17'),(1332,'Ursuala','Santos','Kuri','1961-03-12'),(1333,'Tomas','Lopez','Guerrero','1995-06-24'),(1334,'Daniela','Eslava','Torres','2000-08-22'),(1335,'Luis','Barrios','Lopez','1986-12-23'),(1336,'Pedro','Urbia','Abasolo','1989-12-28'),(1337,'Ivan','Ibañez','Marquez','1993-09-30'),(1338,'Adan','Ortega','Eslava','1988-04-04'),(1339,'Emerson','Gutierréz','Duarte','2001-01-13'),(1340,'Kevin','Marquez','Jiménez','1985-07-10'),(1341,'Pedro','Nuñes','Lopez','1990-06-22'),(1342,'Karen','Carrasco','Guerrero','1982-04-13'),(1343,'Samuel','Zurita','Ibañez','1975-06-27'),(1344,'Juan','Férnandes','Huerta','1984-03-28'),(1345,'Uruel','Yañez','Flores','2003-07-25'),(1346,'Fernanda','Ximenes','Gonzalez','1970-05-03'),(1347,'Ramona','Urbia','Gonzalez','1978-11-06'),(1348,'Samanta','Cruz','Duarte','1989-01-05'),(1349,'Karen','Cruz','Ibañez','1966-03-12'),(1350,'Emerson','Gonzalez','Férnandes','1975-09-12'),(1351,'Pedro','Heras','Campos','1995-09-18'),(1352,'Nestor','Oropeza','Heras','2001-01-14'),(1353,'Omar','Lopez','Oropeza','2002-05-12'),(1354,'Samanta','Flores','Abasolo','2003-01-21'),(1355,'Gabriela','Gonzalez','Lobardia','1959-12-13'),(1356,'Gabriel','Juarez','Huerta','1971-07-10'),(1357,'Ramona','Abasolo','Ximenes','1985-02-03'),(1358,'Juan','Dominguez','Nuñes','1984-04-28'),(1359,'Esmeralda','Lopez','Flores','1991-09-16'),(1360,'Marco','Duarte','Barrios','1994-07-05'),(1361,'Juana','Vazquez','Baez','1993-01-31'),(1362,'Hortencia','Oropeza','Dominguez','1968-01-24'),(1363,'Hortencia','Marquez','Oropeza','1967-01-13'),(1364,'Berta','Kuri','Espinoza','1993-05-08'),(1365,'Ivan','Carrasco','Espinoza','1978-01-20'),(1366,'Anahi','Kuri','Gutierréz','2005-07-20'),(1367,'Kevin','Férnandes','Duarte','1961-03-18'),(1368,'Luisa','Férnandes','Nuñes','1968-04-25'),(1369,'Ivan','Urbia','Baez','1997-03-03'),(1370,'Gabriela','Jiménez','Férnandes','1969-08-18'),(1371,'Olga','Barrios','Ibarra','1974-02-05'),(1372,'Marco','Gonzalez','Cruz','1981-07-10'),(1373,'Daniela','Navarro','Espinoza','1984-11-29'),(1374,'Juan','Duarte','Baez','2000-04-25'),(1375,'Samuel','Yañez','Cruz','1971-08-29'),(1376,'Gabriel','Kuri','Navarro','2005-04-25'),(1377,'Juana','Dominguez','Cruz','1998-10-19'),(1378,'Adan','Espinoza','Yañez','1975-06-24'),(1379,'Luis','Zurita','Abasolo','1976-12-23'),(1380,'Esmeralda','Ximenes','Nuñes','2005-02-28'),(1381,'Uruel','Santos','Férnandes','1978-01-20'),(1382,'Ramona','Ibañez','Dominguez','1988-08-13'),(1383,'Adan','Yañez','Eslava','1997-01-20'),(1384,'Ivonne','Ibañez','Guerrero','1965-08-24'),(1385,'Pedro','Yañez','Oropeza','1970-06-26'),(1386,'Pedro','Urbia','Espinoza','1966-11-07'),(1387,'Ramiro','Flores','Duarte','1975-04-28'),(1388,'Carlos','Quiroz','Yañez','1982-12-27'),(1389,'Carla','Marquez','Abasolo','1976-05-13'),(1390,'Anahi','Campos','Duarte','1985-09-03'),(1391,'Berta','Dominguez','Férnandes','1993-04-02'),(1392,'Ramiro','Santos','Guerrero','1980-03-04'),(1393,'Marcia','Carrasco','Ximenes','1976-02-03'),(1394,'Emerson','Ramirez','Oropeza','1984-04-05'),(1395,'Ivonne','Kuri','Carrasco','1984-02-04'),(1396,'Omar','Martinez','Oropeza','1998-09-25'),(1397,'Damián','Urbia','Heras','1986-02-16'),(1398,'Omar','Gutierréz','Dominguez','1995-04-04'),(1399,'Carla','Cruz','Santos','1974-02-01'),(1400,'Hugo','Abasolo','Torres','2002-03-23'),(1401,'Gabriela','Ibarra','Baez','1993-06-12'),(1402,'Nora','Zurita','Jiménez','1983-02-09'),(1403,'Nestor','Gutierréz','Marquez','2003-04-10'),(1404,'Gabriel','Amador','Ortega','2002-01-20'),(1405,'Berta','Férnandes','Ramirez','1990-06-30'),(1406,'Juan','Espinoza','Espinoza','1971-08-23'),(1407,'Anahi','Ibañez','Baez','1984-07-10'),(1408,'Fernanda','Campos','Oropeza','2003-02-22'),(1409,'Berta','Dominguez','Espinoza','1984-06-07'),(1410,'Damián','Lobardia','Heras','1973-12-24'),(1411,'Carlos','Baez','Heras','1997-11-10'),(1412,'Gabriela','Navarro','Flores','1985-07-01'),(1413,'Marcia','Huerta','Torres','1978-07-15'),(1414,'Emerson','Marquez','Guerrero','1960-05-18'),(1415,'Juana','Barrios','Campos','1975-04-21'),(1416,'Berta','Marquez','Kuri','1987-06-30'),(1417,'Ivan','Ramirez','Heras','1991-04-30'),(1418,'Fernando','Ibañez','Gutierréz','1969-09-10'),(1419,'Ivonne','Lopez','Espinoza','1993-07-23'),(1420,'Ivan','Gutierréz','Ximenes','1965-03-05'),(1421,'Uruel','Amador','Carrasco','1986-06-14'),(1422,'Perla','Dominguez','Duarte','1978-06-08'),(1423,'Perla','Vazquez','Carrasco','1998-06-25'),(1424,'Nestor','Huerta','Nuñes','1961-05-14'),(1425,'Fernando','Nuñes','Flores','1998-08-19'),(1426,'Samuel','Espinoza','Cruz','1981-08-10'),(1427,'Adan','Guerrero','Zurita','1988-09-15'),(1428,'Fernando','Gutierréz','Ortega','1966-12-04'),(1429,'Nestor','Gutierréz','Marquez','2003-12-20'),(1430,'Nestor','Ortega','Gonzalez','2003-09-13'),(1431,'Luis','Vazquez','Eslava','2005-12-30'),(1432,'Karen','Torres','Oropeza','1995-12-24'),(1433,'Tomasa','Férnandes','Lobardia','1998-12-16'),(1434,'Tomasa','Vazquez','Dominguez','2001-01-25'),(1435,'Nestor','Cruz','Heras','1959-08-28'),(1436,'Karen','Urbia','Guerrero','1975-07-10'),(1437,'Juana','Marquez','Cruz','1969-02-25'),(1438,'Benito','Abasolo','Heras','1999-04-09'),(1439,'Daniela','Duarte','Marquez','1967-07-10'),(1440,'Kevin','Baez','Barrios','2000-06-05'),(1441,'Hortencia','Torres','Ibarra','1966-12-17'),(1442,'Gabriel','Barrios','Torres','1967-05-31'),(1443,'Samanta','Gonzalez','Férnandes','1978-09-02'),(1444,'Berta','Vazquez','Férnandes','1971-07-02'),(1445,'Luisa','Lopez','Eslava','1984-02-05'),(1446,'Karen','Jiménez','Zurita','1971-03-17'),(1447,'Gabriela','Gonzalez','Lobardia','1961-10-22'),(1448,'Carla','Barrios','Dominguez','1983-01-02'),(1449,'Esmeralda','Amador','Gutierréz','1963-07-19'),(1450,'Juana','Barrios','Zurita','1960-06-29'),(1451,'Adan','Gonzalez','Jiménez','2000-04-04'),(1452,'Olga','Carrasco','Espinoza','1977-09-20'),(1453,'Tomasa','Eslava','Flores','1983-01-15'),(1454,'Juan','Gutierréz','Ramirez','1986-03-21'),(1455,'Juana','Oropeza','Urbia','1968-03-18'),(1456,'Hortencia','Baez','Férnandes','1984-03-18'),(1457,'Pedro','Cruz','Zurita','2003-08-04'),(1458,'Gabriel','Santos','Lopez','1966-07-15'),(1459,'Ursuala','Huerta','Torres','1977-05-15'),(1460,'Perla','Marquez','Duarte','1997-05-17'),(1461,'Luisa','Ximenes','Jiménez','1990-09-09'),(1462,'Berta','Marquez','Lopez','1991-12-24'),(1463,'Esmeralda','Espinoza','Marquez','1966-05-05'),(1464,'Samuel','Gutierréz','Ibañez','1985-07-16'),(1465,'Damián','Santos','Zurita','1983-09-07'),(1466,'Berta','Dominguez','Baez','1970-12-14'),(1467,'Pedro','Yañez','Navarro','1965-02-16'),(1468,'Marcia','Martinez','Flores','1989-09-28'),(1469,'Kevin','Navarro','Duarte','1978-12-23'),(1470,'Anahi','Barrios','Ortega','1998-09-13'),(1471,'Kevin','Urbia','Flores','1966-10-14'),(1472,'Ramona','Juarez','Dominguez','1987-03-28'),(1473,'Daniela','Torres','Oropeza','1997-09-15'),(1474,'Omar','Vazquez','Kuri','1997-02-08'),(1475,'Benito','Quiroz','Guerrero','1983-03-08'),(1476,'Gabriel','Ximenes','Zurita','1972-10-20'),(1477,'Tomasa','Ramirez','Lopez','1968-08-15'),(1478,'Uruel','Amador','Torres','1967-01-14'),(1479,'Ramona','Barrios','Yañez','2001-04-02'),(1480,'Karen','Carrasco','Heras','1991-05-23'),(1481,'Juan','Torres','Yañez','1991-07-13'),(1482,'Fernanda','Lobardia','Quiroz','1976-09-04'),(1483,'Hortencia','Lobardia','Espinoza','2005-07-17'),(1484,'Berta','Barrios','Gonzalez','2004-10-31'),(1485,'Berta','Campos','Marquez','1985-05-26'),(1486,'Uruel','Quiroz','Baez','1961-08-27'),(1487,'Luis','Santos','Santos','2001-03-06'),(1488,'Damián','Kuri','Ibarra','1975-11-05'),(1489,'Ivan','Lopez','Duarte','1985-02-25'),(1490,'Anahi','Zurita','Guerrero','1959-09-12'),(1491,'Anahi','Flores','Ximenes','1976-09-24'),(1492,'Marco','Carrasco','Vazquez','1970-01-20'),(1493,'Olga','Campos','Cruz','2002-07-12'),(1494,'Samanta','Duarte','Nuñes','1970-04-27'),(1495,'Nestor','Lobardia','Oropeza','1970-07-08'),(1496,'Pedro','Ximenes','Lopez','2000-03-11'),(1497,'Anahi','Ximenes','Zurita','1968-09-10'),(1498,'Carlos','Yañez','Navarro','1963-09-24'),(1499,'Uruel','Amador','Torres','1968-04-14'),(1500,'Gabriela','Dominguez','Navarro','1992-04-27'),(1501,'Karen','Cruz','Kuri','1978-02-25'),(1502,'Benito','Dominguez','Duarte','1978-12-16'),(1503,'Ursuala','Kuri','Urbia','1981-05-04'),(1504,'Luisa','Lobardia','Barrios','1982-04-26'),(1505,'Luisa','Abasolo','Ramirez','2002-11-22'),(1506,'Kevin','Kuri','Gonzalez','2005-10-21'),(1507,'Juana','Ibañez','Guerrero','1959-11-27'),(1508,'Fernanda','Gonzalez','Torres','1989-06-11'),(1509,'Ivan','Ramirez','Dominguez','1966-06-27'),(1510,'Gabriela','Martinez','Dominguez','1973-12-28'),(1511,'Berta','Campos','Lobardia','1979-06-03'),(1512,'Luisa','Duarte','Ibarra','1994-01-16'),(1513,'Emerson','Navarro','Torres','1999-03-11'),(1514,'Carlos','Flores','Duarte','1972-11-28'),(1515,'Emerson','Santos','Ximenes','1973-07-01'),(1516,'Samanta','Vazquez','Heras','1984-02-29'),(1517,'Pedro','Férnandes','Kuri','2002-11-06'),(1518,'Luisa','Ibañez','Navarro','1961-04-23'),(1519,'Uruel','Lopez','Santos','1975-05-28'),(1520,'Adan','Marquez','Martinez','2003-01-17'),(1521,'Tomasa','Navarro','Cruz','1995-07-12'),(1522,'Nestor','Oropeza','Heras','1999-11-22'),(1523,'Fernanda','Quiroz','Huerta','1992-04-06'),(1524,'Samanta','Quiroz','Lopez','1973-10-06'),(1525,'Ivonne','Huerta','Zurita','1972-08-09'),(1526,'Ramona','Torres','Oropeza','2001-12-26'),(1527,'Luis','Vazquez','Dominguez','2002-02-13'),(1528,'Carla','Lobardia','Abasolo','1977-08-28'),(1529,'Marcia','Lopez','Zurita','2002-09-05'),(1530,'Ursuala','Espinoza','Zurita','1983-11-13'),(1531,'Ursuala','Ibañez','Espinoza','2000-07-19'),(1532,'Ramiro','Marquez','Ortega','2005-06-15'),(1533,'Pedro','Vazquez','Espinoza','1964-10-28'),(1534,'Pedro','Huerta','Campos','1989-11-11'),(1535,'Nestor','Urbia','Juarez','1999-02-06'),(1536,'Anahi','Ximenes','Yañez','1967-03-02'),(1537,'Luis','Juarez','Urbia','1987-02-20'),(1538,'Daniela','Espinoza','Abasolo','1991-09-24'),(1539,'Emerson','Heras','Juarez','1997-04-03'),(1540,'Gabriel','Dominguez','Juarez','1970-07-22'),(1541,'Nestor','Abasolo','Baez','1963-05-17'),(1542,'Juan','Lopez','Baez','1974-03-04'),(1543,'Juan','Torres','Urbia','1974-12-01'),(1544,'Juan','Yañez','Kuri','1993-02-28'),(1545,'Ramona','Jiménez','Amador','1981-02-04'),(1546,'Ivonne','Vazquez','Duarte','2004-11-09'),(1547,'Esmeralda','Kuri','Campos','1977-02-22'),(1548,'Samuel','Navarro','Duarte','1980-11-10'),(1549,'Omar','Urbia','Juarez','1997-01-03'),(1550,'Benito','Zurita','Yañez','2004-07-11'),(1551,'Gabriel','Nuñes','Amador','1969-10-27'),(1552,'Adan','Espinoza','Vazquez','1965-11-13'),(1553,'Marco','Zurita','Marquez','1995-06-06'),(1554,'Marco','Barrios','Huerta','1963-04-27'),(1555,'Berta','Eslava','Kuri','1970-02-23'),(1556,'Fernando','Gutierréz','Abasolo','1987-11-07'),(1557,'Carla','Dominguez','Ortega','1990-05-30'),(1558,'Nora','Lobardia','Ibañez','1980-07-19'),(1559,'Tomasa','Eslava','Amador','2003-07-24'),(1560,'Tomasa','Eslava','Dominguez','1973-07-17'),(1561,'Olga','Abasolo','Nuñes','1985-09-04'),(1562,'Luis','Heras','Gutierréz','1979-02-14'),(1563,'Ursuala','Abasolo','Férnandes','1985-11-12'),(1564,'Luis','Barrios','Juarez','1977-03-26'),(1565,'Ramiro','Barrios','Zurita','2004-02-16'),(1566,'Nestor','Abasolo','Duarte','1978-05-13'),(1567,'Luisa','Barrios','Martinez','1992-04-05'),(1568,'Tomasa','Marquez','Zurita','1966-01-30'),(1569,'Samuel','Juarez','Yañez','2002-12-29'),(1570,'Marco','Nuñes','Dominguez','1987-05-02'),(1571,'Daniela','Lobardia','Lobardia','1990-03-28'),(1572,'Olga','Quiroz','Gonzalez','1992-03-05'),(1573,'Samuel','Ibarra','Santos','1992-10-16'),(1574,'Fernando','Zurita','Cruz','1964-07-24'),(1575,'Berta','Quiroz','Eslava','1970-04-14'),(1576,'Uruel','Urbia','Oropeza','1981-06-04'),(1577,'Samuel','Dominguez','Campos','1969-10-19'),(1578,'Gabriel','Abasolo','Espinoza','1983-05-22'),(1579,'Nestor','Zurita','Marquez','1993-02-18'),(1580,'Marcia','Gutierréz','Abasolo','1985-01-23'),(1581,'Ursuala','Heras','Nuñes','1970-02-20'),(1582,'Ivan','Heras','Gonzalez','1977-03-24'),(1583,'Carla','Barrios','Dominguez','1984-05-20'),(1584,'Ramona','Torres','Ximenes','1985-08-12'),(1585,'Ramiro','Martinez','Abasolo','1964-12-16'),(1586,'Karen','Nuñes','Cruz','1962-07-13'),(1587,'Carlos','Martinez','Férnandes','1995-11-07'),(1588,'Adan','Eslava','Navarro','1991-08-07'),(1589,'Adan','Heras','Ortega','1976-01-25'),(1590,'Nora','Ximenes','Amador','1976-10-08'),(1591,'Ivan','Gonzalez','Ximenes','1973-05-23'),(1592,'Ursuala','Torres','Abasolo','1960-10-11'),(1593,'Nestor','Abasolo','Ortega','1989-10-05'),(1594,'Hugo','Ramirez','Torres','1989-05-24'),(1595,'Kevin','Jiménez','Barrios','1981-07-13'),(1596,'Ivonne','Navarro','Santos','1970-10-03'),(1597,'Nora','Eslava','Santos','1966-03-07'),(1598,'Marco','Lobardia','Vazquez','1995-11-18'),(1599,'Benito','Marquez','Kuri','1991-03-04'),(1600,'Tomasa','Guerrero','Torres','1991-04-14'),(1601,'Hugo','Vazquez','Juarez','1994-06-28'),(1602,'Uruel','Heras','Ortega','1973-05-19'),(1603,'Perla','Amador','Eslava','1988-09-09'),(1604,'Marco','Nuñes','Barrios','1976-12-27'),(1605,'Uruel','Marquez','Urbia','1989-02-18'),(1606,'Daniela','Martinez','Espinoza','1987-10-01'),(1607,'Perla','Eslava','Gutierréz','1994-08-18'),(1608,'Carlos','Flores','Kuri','1964-04-06'),(1609,'Luisa','Campos','Santos','1970-01-20'),(1610,'Luisa','Lopez','Guerrero','1997-01-16'),(1611,'Perla','Martinez','Ibañez','1969-04-16'),(1612,'Hugo','Zurita','Ibarra','1973-03-05'),(1613,'Juan','Kuri','Heras','1965-06-01'),(1614,'Emerson','Espinoza','Marquez','1966-03-25'),(1615,'Samuel','Férnandes','Espinoza','1963-03-31'),(1616,'Hugo','Urbia','Ibañez','1992-07-07'),(1617,'Gabriela','Torres','Ortega','1994-07-31'),(1618,'Juana','Santos','Ibarra','1993-06-08'),(1619,'Uruel','Kuri','Navarro','2002-04-04'),(1620,'Berta','Flores','Kuri','1968-11-06'),(1621,'Luis','Juarez','Quiroz','1971-04-08'),(1622,'Pedro','Amador','Amador','1967-05-22'),(1623,'Adan','Guerrero','Flores','1971-09-07'),(1624,'Gabriel','Marquez','Ximenes','2003-07-24'),(1625,'Uruel','Ramirez','Espinoza','1974-09-18'),(1626,'Luis','Cruz','Duarte','1984-06-09'),(1627,'Kevin','Quiroz','Lopez','1974-05-12'),(1628,'Olga','Santos','Abasolo','1995-02-08'),(1629,'Luisa','Zurita','Duarte','1993-10-13'),(1630,'Uruel','Vazquez','Ximenes','1967-02-04'),(1631,'Samuel','Barrios','Navarro','2002-12-10'),(1632,'Gabriela','Ibarra','Baez','1993-01-17'),(1633,'Ivonne','Eslava','Baez','1965-12-29'),(1634,'Nora','Ramirez','Carrasco','1962-01-07'),(1635,'Kevin','Huerta','Oropeza','1970-10-10'),(1636,'Adan','Dominguez','Juarez','1968-06-02'),(1637,'Pedro','Baez','Nuñes','1977-06-24'),(1638,'Adan','Navarro','Eslava','1980-01-11'),(1639,'Gabriel','Kuri','Martinez','1996-12-21'),(1640,'Uruel','Zurita','Cruz','1966-06-26'),(1641,'Ramona','Urbia','Nuñes','1965-09-10'),(1642,'Ivonne','Lopez','Duarte','1989-05-20'),(1643,'Nora','Flores','Urbia','1969-11-16'),(1644,'Samanta','Martinez','Nuñes','1986-08-05'),(1645,'Fernando','Eslava','Flores','1979-12-27'),(1646,'Carlos','Ramirez','Dominguez','1962-03-30'),(1647,'Juan','Navarro','Navarro','1989-02-15'),(1648,'Adan','Urbia','Kuri','2005-09-21'),(1649,'Pedro','Vazquez','Duarte','2001-11-16'),(1650,'Tomas','Amador','Ibañez','1972-07-01'),(1651,'Berta','Nuñes','Santos','1979-04-14'),(1652,'Samanta','Marquez','Gonzalez','1965-11-24'),(1653,'Ramiro','Gonzalez','Oropeza','1984-04-04'),(1654,'Fernanda','Zurita','Baez','1981-01-04'),(1655,'Ramiro','Oropeza','Martinez','1983-09-22'),(1656,'Perla','Jiménez','Nuñes','1961-01-14'),(1657,'Carlos','Kuri','Abasolo','1967-07-28'),(1658,'Tomasa','Nuñes','Heras','1968-12-04'),(1659,'Perla','Jiménez','Nuñes','2005-06-27'),(1660,'Damián','Férnandes','Huerta','1982-07-22'),(1661,'Fernanda','Vazquez','Eslava','2000-07-23'),(1662,'Gabriel','Oropeza','Lobardia','1968-09-29'),(1663,'Nestor','Torres','Cruz','1997-04-13'),(1664,'Juan','Nuñes','Baez','1983-08-30'),(1665,'Pedro','Urbia','Torres','1983-02-07'),(1666,'Luisa','Cruz','Duarte','1987-06-22'),(1667,'Samanta','Espinoza','Ortega','1977-12-18'),(1668,'Nestor','Guerrero','Heras','1992-03-02'),(1669,'Marco','Flores','Eslava','1970-07-11'),(1670,'Carlos','Ibañez','Dominguez','1988-12-21'),(1671,'Benito','Jiménez','Ortega','1964-12-03'),(1672,'Perla','Oropeza','Ximenes','1981-07-12'),(1673,'Perla','Oropeza','Vazquez','1975-10-12'),(1674,'Ivan','Lopez','Duarte','1989-01-23'),(1675,'Luisa','Kuri','Vazquez','1991-04-21'),(1676,'Perla','Marquez','Huerta','1972-05-28'),(1677,'Gabriela','Duarte','Yañez','1977-11-03'),(1678,'Nestor','Huerta','Ortega','1965-08-17'),(1679,'Tomasa','Férnandes','Heras','1984-12-02'),(1680,'Fernando','Navarro','Guerrero','1993-09-29'),(1681,'Benito','Ortega','Zurita','2001-09-01'),(1682,'Olga','Marquez','Navarro','1960-10-21'),(1683,'Luis','Urbia','Amador','1985-05-05'),(1684,'Juan','Huerta','Yañez','1964-06-06'),(1685,'Karen','Flores','Torres','1994-05-11'),(1686,'Samanta','Nuñes','Marquez','1994-01-25'),(1687,'Adan','Nuñes','Yañez','2005-06-30'),(1688,'Kevin','Heras','Lopez','1963-08-22'),(1689,'Perla','Baez','Jiménez','1961-08-17'),(1690,'Olga','Ibañez','Cruz','1967-05-20'),(1691,'Hortencia','Jiménez','Férnandes','1968-02-26'),(1692,'Berta','Flores','Navarro','1986-08-14'),(1693,'Ramona','Navarro','Juarez','1969-04-05'),(1694,'Adan','Duarte','Oropeza','1983-08-08'),(1695,'Daniela','Kuri','Ibarra','1970-07-24'),(1696,'Carla','Quiroz','Urbia','1970-02-17'),(1697,'Anahi','Jiménez','Ibañez','1980-12-22'),(1698,'Daniela','Gonzalez','Ibañez','1998-03-30'),(1699,'Berta','Marquez','Ibañez','1975-01-31'),(1700,'Hugo','Dominguez','Gutierréz','1996-10-12'),(1701,'Gabriela','Torres','Cruz','1998-07-25'),(1702,'Benito','Vazquez','Férnandes','1971-01-03'),(1703,'Ivonne','Eslava','Espinoza','1985-02-17'),(1704,'Gabriel','Oropeza','Nuñes','1980-03-29'),(1705,'Esmeralda','Yañez','Carrasco','1991-12-30'),(1706,'Ivan','Huerta','Flores','1959-06-06'),(1707,'Fernanda','Nuñes','Barrios','1977-07-19'),(1708,'Gabriel','Kuri','Ramirez','1973-02-16'),(1709,'Damián','Lopez','Ortega','1994-05-21'),(1710,'Luisa','Abasolo','Lopez','1978-06-24'),(1711,'Pedro','Ibañez','Guerrero','1961-01-19'),(1712,'Tomas','Zurita','Espinoza','1998-09-01'),(1713,'Samanta','Campos','Campos','1970-06-04'),(1714,'Pedro','Carrasco','Cruz','1988-12-11'),(1715,'Ivan','Navarro','Oropeza','1997-04-18'),(1716,'Karen','Campos','Amador','1959-08-25'),(1717,'Kevin','Barrios','Ximenes','1993-11-19'),(1718,'Marco','Campos','Martinez','1989-02-27'),(1719,'Hugo','Gutierréz','Barrios','1987-03-17'),(1720,'Uruel','Oropeza','Ortega','1987-05-13'),(1721,'Carlos','Carrasco','Cruz','1989-05-26'),(1722,'Marco','Ibañez','Férnandes','1962-12-25'),(1723,'Nora','Ramirez','Baez','2003-12-10'),(1724,'Juana','Oropeza','Navarro','1989-05-23'),(1725,'Benito','Lobardia','Carrasco','1989-08-21'),(1726,'Kevin','Oropeza','Ibañez','1960-06-14'),(1727,'Emerson','Guerrero','Abasolo','2001-03-12'),(1728,'Hugo','Guerrero','Urbia','1963-10-01'),(1729,'Fernando','Torres','Gutierréz','2000-06-21'),(1730,'Ramona','Quiroz','Urbia','1965-11-26'),(1731,'Gabriel','Ximenes','Campos','1989-05-05'),(1732,'Marco','Duarte','Barrios','1996-04-23'),(1733,'Gabriel','Ibañez','Espinoza','2000-02-20'),(1734,'Nestor','Duarte','Yañez','1976-11-11'),(1735,'Fernando','Ximenes','Guerrero','1967-05-12'),(1736,'Olga','Amador','Ibarra','1973-10-30'),(1737,'Nestor','Ortega','Guerrero','1998-06-03'),(1738,'Ivonne','Ibañez','Guerrero','1963-07-14'),(1739,'Ramiro','Zurita','Ibañez','1980-11-11'),(1740,'Ramona','Huerta','Ramirez','1986-02-26'),(1741,'Gabriela','Marquez','Santos','1981-12-17'),(1742,'Damián','Urbia','Ibarra','1990-12-27'),(1743,'Olga','Heras','Flores','1971-10-24'),(1744,'Benito','Jiménez','Cruz','1974-01-20'),(1745,'Juana','Oropeza','Oropeza','1992-06-11'),(1746,'Emerson','Flores','Marquez','1974-12-22'),(1747,'Ursuala','Ibarra','Huerta','1982-03-22'),(1748,'Anahi','Ramirez','Baez','2004-01-31'),(1749,'Ivonne','Carrasco','Carrasco','1965-08-10'),(1750,'Benito','Ortega','Urbia','1980-10-12'),(1751,'Esmeralda','Urbia','Yañez','1972-08-23'),(1752,'Hortencia','Kuri','Lopez','1986-12-08'),(1753,'Pedro','Barrios','Guerrero','1998-09-27'),(1754,'Ivonne','Gutierréz','Vazquez','2005-08-06'),(1755,'Juan','Ibarra','Eslava','1959-08-22'),(1756,'Samanta','Santos','Ximenes','1973-04-15'),(1757,'Samanta','Santos','Barrios','1996-10-15'),(1758,'Fernando','Baez','Martinez','1977-12-24'),(1759,'Fernando','Huerta','Carrasco','1994-03-16'),(1760,'Juana','Gonzalez','Oropeza','1982-04-24'),(1761,'Luis','Zurita','Espinoza','2001-08-18'),(1762,'Emerson','Ximenes','Ortega','1967-09-19'),(1763,'Pedro','Campos','Ortega','1996-02-04'),(1764,'Carlos','Navarro','Lopez','1977-05-11'),(1765,'Hugo','Barrios','Ortega','1998-01-12'),(1766,'Damián','Ibarra','Zurita','1978-10-10'),(1767,'Marco','Duarte','Yañez','1976-06-26'),(1768,'Damián','Baez','Eslava','1973-02-20'),(1769,'Hugo','Ximenes','Santos','1988-12-15'),(1770,'Juana','Guerrero','Juarez','2005-08-17'),(1771,'Fernando','Campos','Navarro','1997-01-07'),(1772,'Marco','Férnandes','Heras','1986-03-05'),(1773,'Nestor','Nuñes','Amador','1966-04-12'),(1774,'Luis','Marquez','Dominguez','1992-10-18'),(1775,'Nora','Guerrero','Campos','2002-04-01'),(1776,'Ramona','Torres','Santos','1971-05-04'),(1777,'Anahi','Navarro','Amador','1999-09-18'),(1778,'Gabriela','Cruz','Guerrero','1997-07-30'),(1779,'Ursuala','Martinez','Amador','2003-06-22'),(1780,'Carla','Guerrero','Juarez','1959-04-12'),(1781,'Hugo','Férnandes','Urbia','2002-04-30'),(1782,'Hugo','Espinoza','Urbia','1959-04-27'),(1783,'Berta','Ximenes','Oropeza','1970-01-06'),(1784,'Omar','Vazquez','Férnandes','1972-09-24'),(1785,'Damián','Lobardia','Heras','1973-11-20'),(1786,'Damián','Kuri','Eslava','1993-10-26'),(1787,'Perla','Gutierréz','Ramirez','1987-01-22'),(1788,'Samanta','Gutierréz','Juarez','1989-12-01'),(1789,'Tomasa','Nuñes','Guerrero','2005-02-17'),(1790,'Karen','Santos','Flores','1967-08-02'),(1791,'Ivonne','Flores','Martinez','1978-05-05'),(1792,'Hugo','Ramirez','Carrasco','1960-05-23'),(1793,'Marcia','Quiroz','Cruz','1992-05-09'),(1794,'Anahi','Navarro','Ximenes','1984-06-23'),(1795,'Fernando','Nuñes','Flores','1998-10-11'),(1796,'Pedro','Flores','Ibañez','2004-12-02'),(1797,'Carlos','Duarte','Ortega','1982-07-06'),(1798,'Perla','Nuñes','Kuri','1983-02-09'),(1799,'Juana','Marquez','Duarte','1996-07-25'),(1800,'Carla','Ximenes','Gutierréz','1972-05-16'),(1801,'Perla','Espinoza','Lopez','1960-11-06'),(1802,'Kevin','Eslava','Jiménez','1967-07-17'),(1803,'Damián','Guerrero','Lopez','1968-06-29'),(1804,'Adan','Flores','Yañez','1981-10-14'),(1805,'Olga','Férnandes','Urbia','2004-02-05'),(1806,'Benito','Espinoza','Santos','1996-07-19'),(1807,'Berta','Martinez','Navarro','1991-09-05'),(1808,'Hugo','Navarro','Campos','1967-12-28'),(1809,'Ivonne','Gutierréz','Yañez','1966-05-06'),(1810,'Hugo','Urbia','Férnandes','1974-08-22'),(1811,'Benito','Dominguez','Férnandes','1991-07-23'),(1812,'Damián','Flores','Duarte','1972-11-08'),(1813,'Adan','Zurita','Heras','1970-08-21'),(1814,'Juana','Nuñes','Baez','1983-10-02'),(1815,'Samuel','Heras','Santos','1998-02-19'),(1816,'Marcia','Zurita','Baez','1983-11-02'),(1817,'Ramiro','Eslava','Nuñes','1986-07-22'),(1818,'Uruel','Urbia','Ramirez','1988-11-09'),(1819,'Perla','Férnandes','Martinez','1968-01-16'),(1820,'Gabriela','Eslava','Ximenes','1980-05-08'),(1821,'Fernanda','Lopez','Amador','1961-03-03'),(1822,'Carlos','Kuri','Ortega','1999-10-03'),(1823,'Carla','Baez','Ibarra','2002-09-24'),(1824,'Fernando','Eslava','Dominguez','1972-09-07'),(1825,'Emerson','Ibarra','Urbia','1998-08-28'),(1826,'Marcia','Eslava','Vazquez','1979-01-18'),(1827,'Tomasa','Flores','Heras','1997-03-01'),(1828,'Ursuala','Lobardia','Oropeza','1971-12-11'),(1829,'Hugo','Huerta','Heras','1977-07-19'),(1830,'Perla','Baez','Lobardia','1971-02-27'),(1831,'Luisa','Ortega','Lobardia','1984-08-20'),(1832,'Uruel','Amador','Ortega','2005-05-22'),(1833,'Juan','Huerta','Urbia','1994-10-10'),(1834,'Omar','Ximenes','Martinez','2005-03-25'),(1835,'Carlos','Amador','Zurita','1962-07-31'),(1836,'Anahi','Kuri','Gutierréz','1960-05-01'),(1837,'Carla','Flores','Huerta','1995-09-12'),(1838,'Ivan','Cruz','Campos','1970-06-29'),(1839,'Samuel','Oropeza','Kuri','1970-06-01'),(1840,'Damián','Guerrero','Ibañez','1998-03-31'),(1841,'Carla','Ortega','Ramirez','1970-09-28'),(1842,'Daniela','Ortega','Férnandes','1998-06-17'),(1843,'Luisa','Oropeza','Duarte','1976-09-12'),(1844,'Tomasa','Guerrero','Torres','1989-12-22'),(1845,'Ramiro','Ortega','Martinez','1992-03-16'),(1846,'Tomasa','Gonzalez','Carrasco','1960-08-15'),(1847,'Nora','Barrios','Cruz','2002-10-24'),(1848,'Esmeralda','Gonzalez','Espinoza','1971-01-15'),(1849,'Tomasa','Heras','Gutierréz','1981-01-24'),(1850,'Ramona','Zurita','Navarro','1960-01-13'),(1851,'Fernando','Kuri','Ramirez','1972-04-20'),(1852,'Uruel','Santos','Huerta','1991-08-03'),(1853,'Fernanda','Guerrero','Nuñes','1976-05-27'),(1854,'Emerson','Baez','Santos','1963-09-21'),(1855,'Juan','Nuñes','Espinoza','1998-08-01'),(1856,'Ramona','Zurita','Kuri','1991-07-07'),(1857,'Carla','Eslava','Espinoza','1980-12-18'),(1858,'Luisa','Lobardia','Amador','1977-06-20'),(1859,'Nestor','Lobardia','Martinez','2001-11-16'),(1860,'Karen','Guerrero','Duarte','1969-01-23'),(1861,'Gabriela','Gutierréz','Marquez','1959-10-13'),(1862,'Omar','Eslava','Férnandes','1991-11-28'),(1863,'Damián','Campos','Flores','1987-10-07'),(1864,'Samanta','Yañez','Espinoza','2001-09-22'),(1865,'Gabriel','Duarte','Santos','1999-05-13'),(1866,'Juan','Kuri','Nuñes','1994-05-22'),(1867,'Adan','Lobardia','Navarro','1962-11-04'),(1868,'Marco','Torres','Férnandes','1989-03-12'),(1869,'Daniela','Santos','Eslava','1962-01-25'),(1870,'Carlos','Nuñes','Huerta','1968-02-04'),(1871,'Fernando','Juarez','Ramirez','1973-05-03'),(1872,'Kevin','Jiménez','Barrios','1982-02-19'),(1873,'Nora','Vazquez','Urbia','1997-07-06'),(1874,'Berta','Huerta','Gonzalez','1968-08-27'),(1875,'Daniela','Ximenes','Carrasco','1997-12-02'),(1876,'Daniela','Duarte','Lobardia','1964-10-06'),(1877,'Karen','Flores','Abasolo','2003-05-13'),(1878,'Ivonne','Gutierréz','Ximenes','1964-05-01'),(1879,'Nora','Martinez','Amador','2004-04-20'),(1880,'Juan','Juarez','Guerrero','1959-07-04'),(1881,'Samanta','Baez','Amador','1995-12-21'),(1882,'Kevin','Ibañez','Quiroz','1971-06-14'),(1883,'Carlos','Baez','Ibarra','2005-06-07'),(1884,'Juan','Cruz','Martinez','1990-10-15'),(1885,'Fernando','Marquez','Guerrero','2003-01-28'),(1886,'Olga','Huerta','Dominguez','1994-02-13'),(1887,'Luisa','Campos','Urbia','1977-06-09'),(1888,'Luisa','Juarez','Urbia','1984-11-05'),(1889,'Fernando','Juarez','Navarro','2005-05-05'),(1890,'Marcia','Quiroz','Duarte','1968-09-30'),(1891,'Gabriela','Kuri','Quiroz','1962-05-08'),(1892,'Ramiro','Vazquez','Cruz','1978-05-27'),(1893,'Ivan','Campos','Abasolo','1965-02-04'),(1894,'Luisa','Carrasco','Barrios','1998-10-20'),(1895,'Kevin','Santos','Zurita','1981-04-02'),(1896,'Berta','Ibañez','Jiménez','1985-07-07'),(1897,'Samuel','Santos','Ximenes','1972-05-23'),(1898,'Karen','Ortega','Huerta','1963-07-18'),(1899,'Fernanda','Yañez','Ortega','1964-03-12'),(1900,'Daniela','Eslava','Ortega','1991-10-16'),(1901,'Berta','Zurita','Ximenes','2002-05-26'),(1902,'Juan','Lopez','Abasolo','1968-11-12'),(1903,'Esmeralda','Huerta','Navarro','1961-05-29'),(1904,'Benito','Gonzalez','Urbia','1963-07-10'),(1905,'Uruel','Campos','Lopez','1982-07-12'),(1906,'Ramona','Espinoza','Espinoza','1968-05-01'),(1907,'Nora','Quiroz','Ortega','1981-06-05'),(1908,'Karen','Ortega','Carrasco','1980-02-21'),(1909,'Benito','Duarte','Ibañez','1996-04-27'),(1910,'Gabriel','Eslava','Santos','1961-12-05'),(1911,'Samuel','Kuri','Flores','1994-12-06'),(1912,'Esmeralda','Abasolo','Oropeza','1996-02-18'),(1913,'Tomasa','Duarte','Eslava','1965-12-18'),(1914,'Ramona','Ibañez','Yañez','1963-12-28'),(1915,'Anahi','Barrios','Marquez','1986-06-28'),(1916,'Nestor','Vazquez','Santos','1994-06-30'),(1917,'Tomas','Lopez','Dominguez','1978-05-31'),(1918,'Fernando','Abasolo','Lopez','1976-01-30'),(1919,'Olga','Guerrero','Ximenes','1976-08-18'),(1920,'Ivan','Huerta','Eslava','1998-02-10'),(1921,'Benito','Duarte','Huerta','1992-10-09'),(1922,'Perla','Cruz','Ximenes','1988-07-04'),(1923,'Carla','Ibarra','Campos','1998-01-11'),(1924,'Kevin','Espinoza','Cruz','1980-10-12'),(1925,'Marco','Abasolo','Férnandes','1990-10-10'),(1926,'Nora','Vazquez','Santos','1991-12-31'),(1927,'Uruel','Lopez','Santos','1974-10-09'),(1928,'Ramiro','Ortega','Kuri','1982-05-07'),(1929,'Ursuala','Lobardia','Martinez','1959-10-28'),(1930,'Kevin','Martinez','Torres','2003-12-05'),(1931,'Gabriela','Espinoza','Amador','1988-10-06'),(1932,'Uruel','Eslava','Barrios','2003-04-20'),(1933,'Marcia','Quiroz','Espinoza','1978-04-22'),(1934,'Esmeralda','Férnandes','Ortega','1970-12-29'),(1935,'Luis','Zurita','Abasolo','1978-01-28'),(1936,'Marcia','Huerta','Duarte','2001-12-31'),(1937,'Nestor','Vazquez','Vazquez','2003-03-21'),(1938,'Hugo','Gutierréz','Eslava','2003-06-05'),(1939,'Juana','Santos','Flores','1971-04-26'),(1940,'Adan','Yañez','Guerrero','1959-12-15'),(1941,'Hortencia','Espinoza','Zurita','1978-10-04'),(1942,'Ramiro','Lobardia','Marquez','1995-09-18'),(1943,'Uruel','Huerta','Nuñes','2005-05-21'),(1944,'Carlos','Carrasco','Lobardia','1964-09-02'),(1945,'Nestor','Quiroz','Lobardia','1969-04-24'),(1946,'Marco','Lobardia','Oropeza','1970-01-23'),(1947,'Marco','Abasolo','Gutierréz','1995-10-17'),(1948,'Nestor','Férnandes','Campos','1995-02-18'),(1949,'Juana','Ramirez','Dominguez','1965-06-06'),(1950,'Samanta','Quiroz','Martinez','1979-02-10'),(1951,'Marco','Yañez','Ibarra','1980-09-23'),(1952,'Ursuala','Ibañez','Ibañez','1978-07-21'),(1953,'Ramiro','Cruz','Juarez','1975-08-20'),(1954,'Benito','Oropeza','Ximenes','1983-05-11'),(1955,'Luis','Marquez','Barrios','1979-04-30'),(1956,'Fernando','Oropeza','Baez','1963-08-27'),(1957,'Kevin','Zurita','Juarez','1983-08-07'),(1958,'Perla','Martinez','Kuri','1973-07-06'),(1959,'Samanta','Gutierréz','Huerta','1978-09-11'),(1960,'Hortencia','Ibañez','Torres','1974-01-11'),(1961,'Carla','Flores','Kuri','1968-03-28'),(1962,'Damián','Oropeza','Oropeza','1991-12-20'),(1963,'Uruel','Amador','Carrasco','1986-02-19'),(1964,'Luisa','Marquez','Gonzalez','1966-02-08'),(1965,'Nestor','Huerta','Ibarra','1982-11-18'),(1966,'Adan','Heras','Lobardia','2003-09-14'),(1967,'Uruel','Vazquez','Ramirez','1989-08-06'),(1968,'Ursuala','Cruz','Lobardia','1977-01-22'),(1969,'Luis','Nuñes','Heras','1966-05-08'),(1970,'Omar','Ibañez','Abasolo','1977-04-08'),(1971,'Fernanda','Ibarra','Ibañez','1985-09-23'),(1972,'Hugo','Juarez','Duarte','1993-12-25'),(1973,'Samuel','Ibañez','Oropeza','1969-09-10'),(1974,'Gabriela','Barrios','Férnandes','1999-05-14'),(1975,'Nora','Marquez','Ramirez','1977-10-29'),(1976,'Juana','Espinoza','Huerta','1986-03-15'),(1977,'Tomas','Dominguez','Yañez','1993-06-27'),(1978,'Samuel','Quiroz','Juarez','1962-05-31'),(1979,'Samanta','Vazquez','Jiménez','1993-10-01'),(1980,'Marco','Dominguez','Ramirez','1961-02-14'),(1981,'Ramona','Duarte','Torres','1991-11-02'),(1982,'Karen','Ortega','Juarez','1976-11-30'),(1983,'Marco','Eslava','Amador','2000-10-24'),(1984,'Marcia','Carrasco','Yañez','1982-11-08'),(1985,'Tomasa','Torres','Espinoza','1988-03-08'),(1986,'Tomasa','Ramirez','Lopez','1968-03-21'),(1987,'Ramiro','Cruz','Lopez','1985-06-16'),(1988,'Ursuala','Duarte','Vazquez','1967-12-27'),(1989,'Ramiro','Barrios','Campos','1976-08-16'),(1990,'Luisa','Cruz','Férnandes','1995-12-26'),(1991,'Gabriela','Cruz','Nuñes','1989-05-30'),(1992,'Kevin','Espinoza','Torres','1989-09-02'),(1993,'Hugo','Férnandes','Vazquez','1960-07-15'),(1994,'Hortencia','Gonzalez','Guerrero','1977-12-25'),(1995,'Nora','Espinoza','Yañez','1973-12-10'),(1996,'Samanta','Urbia','Flores','1965-06-01'),(1997,'Gabriela','Carrasco','Kuri','1963-11-24'),(1998,'Ivonne','Heras','Heras','1984-02-19'),(1999,'Tomas','Dominguez','Amador','2003-08-07'),(2000,'Anahi','Huerta','Marquez','1998-06-16'),(2001,'Esmeralda','Vazquez','Heras','1981-12-17'),(2002,'Pedro','Eslava','Férnandes','1990-12-23'),(2003,'Nora','Dominguez','Gutierréz','2001-05-24'),(2004,'Esmeralda','Juarez','Ximenes','1995-11-03'),(2005,'Marco','Baez','Lopez','1972-08-10'),(2006,'Anahi','Navarro','Campos','1970-03-11'),(2007,'Ivan','Ramirez','Heras','1994-12-16'),(2008,'Ramiro','Lobardia','Lobardia','1993-05-01'),(2009,'Adan','Ortega','Flores','1990-09-16'),(2010,'Emerson','Urbia','Zurita','1977-11-26'),(2011,'Juan','Oropeza','Ramirez','1959-09-29'),(2012,'Samanta','Baez','Yañez','1985-06-08'),(2013,'Hugo','Huerta','Ibarra','1985-11-04'),(2014,'Damián','Gonzalez','Juarez','2000-10-24'),(2015,'Carla','Oropeza','Santos','1964-11-18'),(2016,'Uruel','Gutierréz','Ibarra','1987-08-28'),(2017,'Carla','Guerrero','Santos','2002-12-01'),(2018,'Adan','Abasolo','Abasolo','1961-12-15'),(2019,'Tomas','Abasolo','Lopez','1975-04-14'),(2020,'Hortencia','Férnandes','Campos','1996-06-09'),(2021,'Ramiro','Carrasco','Jiménez','2002-09-21'),(2022,'Adan','Dominguez','Juarez','1970-02-02'),(2023,'Hugo','Dominguez','Huerta','2003-11-24'),(2024,'Carlos','Carrasco','Nuñes','1974-07-24'),(2025,'Nora','Dominguez','Huerta','2003-03-21'),(2026,'Adan','Amador','Marquez','1989-12-23'),(2027,'Daniela','Duarte','Jiménez','2003-02-25'),(2028,'Benito','Heras','Gonzalez','1978-07-27'),(2029,'Olga','Navarro','Urbia','1971-10-01'),(2030,'Anahi','Juarez','Férnandes','2002-11-04'),(2031,'Kevin','Jiménez','Zurita','1975-09-21'),(2032,'Emerson','Baez','Santos','1964-02-15'),(2033,'Nestor','Heras','Marquez','1963-09-18'),(2034,'Perla','Ramirez','Guerrero','1978-12-26'),(2035,'Hortencia','Baez','Espinoza','1980-08-13'),(2036,'Gabriela','Guerrero','Guerrero','1981-08-18'),(2037,'Kevin','Torres','Ramirez','1961-04-30'),(2038,'Uruel','Gonzalez','Marquez','1969-03-01'),(2039,'Emerson','Cruz','Gutierréz','2002-05-20'),(2040,'Samuel','Baez','Vazquez','1976-05-31'),(2041,'Omar','Ximenes','Oropeza','1972-10-13'),(2042,'Uruel','Guerrero','Heras','1993-02-11'),(2043,'Carlos','Ibarra','Flores','1964-10-04'),(2044,'Tomas','Kuri','Ximenes','1994-07-11'),(2045,'Adan','Ramirez','Nuñes','1974-07-09'),(2046,'Luisa','Férnandes','Cruz','1975-08-08'),(2047,'Ivonne','Ximenes','Huerta','1980-10-01'),(2048,'Esmeralda','Ortega','Abasolo','1973-09-03'),(2049,'Ivan','Gonzalez','Ximenes','1971-05-07'),(2050,'Anahi','Nuñes','Urbia','1987-05-20'),(2051,'Daniela','Abasolo','Yañez','1990-11-04'),(2052,'Ramona','Lobardia','Ibarra','1983-02-16'),(2053,'Tomas','Kuri','Zurita','1964-01-08'),(2054,'Marcia','Gonzalez','Ortega','1976-07-22'),(2055,'Damián','Gonzalez','Lopez','1967-05-23'),(2056,'Gabriela','Gonzalez','Jiménez','1999-11-01'),(2057,'Luisa','Oropeza','Baez','1966-04-23'),(2058,'Olga','Dominguez','Férnandes','1992-03-21'),(2059,'Kevin','Juarez','Campos','1982-12-19'),(2060,'Ivonne','Quiroz','Barrios','1999-11-11'),(2061,'Carla','Marquez','Férnandes','1960-07-25'),(2062,'Karen','Urbia','Gonzalez','1976-09-30'),(2063,'Tomasa','Flores','Lobardia','1967-04-15'),(2064,'Ramiro','Kuri','Lobardia','1984-04-19'),(2065,'Ramiro','Cruz','Lopez','1983-01-24'),(2066,'Ursuala','Lobardia','Navarro','1963-12-19'),(2067,'Carlos','Huerta','Vazquez','2004-01-29'),(2068,'Marco','Lopez','Yañez','1996-07-06'),(2069,'Kevin','Vazquez','Ibarra','1990-03-11'),(2070,'Fernanda','Guerrero','Ortega','1982-09-06'),(2071,'Ramona','Férnandes','Gutierréz','1978-05-11'),(2072,'Marcia','Santos','Kuri','1962-06-11'),(2073,'Ivonne','Vazquez','Gutierréz','1976-03-18'),(2074,'Luis','Torres','Duarte','1982-09-13'),(2075,'Omar','Torres','Guerrero','1990-05-04'),(2076,'Nestor','Cruz','Gonzalez','2004-10-10'),(2077,'Samanta','Heras','Ibañez','1994-11-29'),(2078,'Juan','Marquez','Abasolo','1979-04-18'),(2079,'Damián','Eslava','Ibarra','2005-05-20'),(2080,'Nora','Guerrero','Flores','1976-01-03'),(2081,'Carla','Gonzalez','Santos','1998-08-24'),(2082,'Berta','Campos','Cruz','1998-11-11'),(2083,'Gabriel','Barrios','Cruz','1960-03-12'),(2084,'Uruel','Juarez','Martinez','1999-03-10'),(2085,'Uruel','Baez','Kuri','1965-04-26'),(2086,'Anahi','Urbia','Juarez','1998-01-15'),(2087,'Marco','Heras','Férnandes','1971-06-29'),(2088,'Samanta','Urbia','Ibarra','1987-07-01'),(2089,'Esmeralda','Oropeza','Férnandes','1984-09-04'),(2090,'Uruel','Abasolo','Duarte','1977-06-23'),(2091,'Fernanda','Ibañez','Lopez','1998-12-15'),(2092,'Emerson','Espinoza','Lobardia','2005-12-18'),(2093,'Tomas','Ximenes','Heras','1979-02-22'),(2094,'Hortencia','Gonzalez','Campos','1999-04-05'),(2095,'Ivan','Lobardia','Duarte','1999-03-04'),(2096,'Juan','Juarez','Lobardia','1987-02-15'),(2097,'Carlos','Yañez','Martinez','2002-04-25'),(2098,'Luisa','Marquez','Eslava','1997-05-13'),(2099,'Karen','Barrios','Vazquez','1988-04-05'),(2100,'Gabriela','Eslava','Santos','1967-08-04'),(2101,'Fernanda','Flores','Eslava','1974-01-01'),(2102,'Nora','Flores','Campos','1959-06-02'),(2103,'Luis','Zurita','Baez','1985-02-17'),(2104,'Juana','Yañez','Kuri','1989-10-28'),(2105,'Kevin','Huerta','Martinez','1961-12-10'),(2106,'Ivan','Duarte','Juarez','2004-03-21'),(2107,'Ivan','Nuñes','Martinez','1998-01-16'),(2108,'Kevin','Carrasco','Dominguez','1968-01-18'),(2109,'Berta','Campos','Cruz','1999-08-04'),(2110,'Luis','Eslava','Barrios','1959-05-04'),(2111,'Tomas','Torres','Huerta','1961-04-21'),(2112,'Ursuala','Baez','Lopez','1974-01-27'),(2113,'Luisa','Ibarra','Lopez','2004-08-01'),(2114,'Damián','Gonzalez','Martinez','1971-10-05'),(2115,'Fernando','Duarte','Dominguez','1959-04-27'),(2116,'Emerson','Nuñes','Cruz','1964-03-27'),(2117,'Olga','Lobardia','Duarte','2001-06-04'),(2118,'Hugo','Huerta','Lobardia','1991-02-19'),(2119,'Esmeralda','Dominguez','Yañez','1993-11-22'),(2120,'Damián','Campos','Campos','1972-04-22'),(2121,'Marco','Campos','Oropeza','1998-11-25'),(2122,'Fernando','Torres','Torres','1962-02-28'),(2123,'Hugo','Torres','Guerrero','1992-11-16'),(2124,'Samuel','Huerta','Kuri','1996-11-02'),(2125,'Marco','Yañez','Guerrero','1964-04-12'),(2126,'Gabriel','Amador','Abasolo','1973-02-08'),(2127,'Gabriel','Ibañez','Espinoza','2004-11-30'),(2128,'Nora','Nuñes','Vazquez','1993-03-16'),(2129,'Kevin','Ibañez','Ximenes','2003-03-24'),(2130,'Samuel','Cruz','Gutierréz','2003-12-11'),(2131,'Kevin','Jiménez','Barrios','1983-12-28'),(2132,'Ivonne','Ibarra','Flores','1967-05-19'),(2133,'Ursuala','Lobardia','Lopez','1998-03-22'),(2134,'Damián','Nuñes','Abasolo','1973-09-30'),(2135,'Nora','Ibarra','Baez','1996-08-25'),(2136,'Samanta','Gonzalez','Huerta','1988-05-08'),(2137,'Berta','Yañez','Urbia','1993-08-22'),(2138,'Emerson','Navarro','Cruz','1995-01-04'),(2139,'Karen','Eslava','Nuñes','1981-05-09'),(2140,'Perla','Nuñes','Juarez','1980-12-07'),(2141,'Nora','Ximenes','Zurita','1970-08-20'),(2142,'Anahi','Quiroz','Nuñes','1980-05-31'),(2143,'Carlos','Carrasco','Ortega','1984-08-01'),(2144,'Ramona','Vazquez','Ortega','1970-12-29'),(2145,'Hugo','Barrios','Ortega','1996-11-21'),(2146,'Pedro','Huerta','Barrios','1981-09-26'),(2147,'Ivonne','Oropeza','Zurita','1995-02-03'),(2148,'Fernando','Espinoza','Campos','2001-08-20'),(2149,'Fernanda','Dominguez','Quiroz','2003-04-01'),(2150,'Anahi','Ramirez','Abasolo','1997-09-07'),(2151,'Samuel','Duarte','Jiménez','2001-11-18'),(2152,'Marco','Marquez','Amador','1969-12-28'),(2153,'Hugo','Campos','Baez','1971-12-19'),(2154,'Juan','Dominguez','Lobardia','1974-03-21'),(2155,'Benito','Quiroz','Dominguez','1965-06-02'),(2156,'Berta','Oropeza','Amador','1995-04-16'),(2157,'Gabriel','Gutierréz','Marquez','2004-08-05'),(2158,'Uruel','Martinez','Dominguez','1974-08-30'),(2159,'Juana','Kuri','Lobardia','1985-01-13'),(2160,'Emerson','Amador','Ibañez','1976-08-06'),(2161,'Samuel','Guerrero','Duarte','1970-01-08'),(2162,'Perla','Duarte','Huerta','1988-08-17'),(2163,'Daniela','Abasolo','Amador','2001-03-14'),(2164,'Samanta','Gutierréz','Kuri','1998-07-23'),(2165,'Ivan','Baez','Lobardia','1965-12-06'),(2166,'Hugo','Urbia','Gutierréz','1977-03-27'),(2167,'Carlos','Huerta','Dominguez','1991-05-13'),(2168,'Fernando','Ortega','Marquez','1989-03-02'),(2169,'Olga','Torres','Heras','2004-03-13'),(2170,'Ivan','Dominguez','Espinoza','1987-11-30'),(2171,'Marcia','Torres','Férnandes','1991-03-13'),(2172,'Adan','Espinoza','Santos','2002-01-29'),(2173,'Ivan','Santos','Nuñes','1970-04-21'),(2174,'Kevin','Martinez','Abasolo','1964-02-23'),(2175,'Benito','Cruz','Zurita','2005-04-29'),(2176,'Benito','Eslava','Kuri','1970-01-22'),(2177,'Emerson','Marquez','Jiménez','1981-10-04'),(2178,'Carla','Cruz','Oropeza','2003-11-24'),(2179,'Karen','Zurita','Kuri','1989-01-15'),(2180,'Adan','Cruz','Guerrero','1996-05-15'),(2181,'Ivonne','Jiménez','Cruz','1972-12-16'),(2182,'Tomasa','Ortega','Lobardia','1985-08-16'),(2183,'Hugo','Kuri','Espinoza','1999-10-12'),(2184,'Daniela','Espinoza','Torres','1985-10-29'),(2185,'Perla','Duarte','Ibañez','1997-09-22'),(2186,'Pedro','Urbia','Baez','1997-03-29'),(2187,'Fernanda','Vazquez','Barrios','1988-11-10'),(2188,'Omar','Dominguez','Férnandes','1993-05-23'),(2189,'Samuel','Guerrero','Duarte','1970-02-27'),(2190,'Olga','Torres','Guerrero','1991-08-08'),(2191,'Gabriel','Flores','Barrios','2005-05-16'),(2192,'Hugo','Barrios','Cruz','1959-09-08'),(2193,'Nestor','Abasolo','Abasolo','2004-04-25'),(2194,'Daniela','Ximenes','Baez','1986-10-14'),(2195,'Juana','Jiménez','Heras','1980-06-20'),(2196,'Ursuala','Quiroz','Marquez','1973-12-09'),(2197,'Luisa','Gutierréz','Espinoza','1963-03-11'),(2198,'Benito','Huerta','Eslava','2002-04-21'),(2199,'Ramona','Barrios','Yañez','1999-10-18'),(2200,'Anahi','Marquez','Ramirez','1977-06-24'),(2201,'Ivonne','Marquez','Ibañez','1975-09-09'),(2202,'Omar','Gutierréz','Dominguez','1999-02-05'),(2203,'Marco','Ximenes','Dominguez','1996-01-06'),(2204,'Esmeralda','Oropeza','Huerta','1997-02-27'),(2205,'Benito','Ibarra','Lobardia','2002-06-26'),(2206,'Fernando','Martinez','Heras','1959-11-30'),(2207,'Hortencia','Lobardia','Gutierréz','1967-09-28'),(2208,'Omar','Huerta','Heras','1977-05-20'),(2209,'Olga','Cruz','Zurita','2005-04-04'),(2210,'Benito','Guerrero','Vazquez','1971-04-28'),(2211,'Esmeralda','Guerrero','Torres','1992-05-21'),(2212,'Samanta','Amador','Lopez','1991-08-07'),(2213,'Samanta','Dominguez','Eslava','1976-10-01'),(2214,'Berta','Nuñes','Navarro','2004-10-10'),(2215,'Daniela','Urbia','Guerrero','1975-04-14'),(2216,'Hugo','Urbia','Espinoza','1969-09-15'),(2217,'Daniela','Dominguez','Flores','1984-07-08'),(2218,'Gabriela','Cruz','Guerrero','1997-01-21'),(2219,'Perla','Martinez','Lopez','1980-11-24'),(2220,'Uruel','Oropeza','Nuñes','1983-09-02'),(2221,'Olga','Duarte','Ibañez','1999-06-20'),(2222,'Luisa','Baez','Quiroz','2001-03-10'),(2223,'Pedro','Ortega','Quiroz','1965-10-14'),(2224,'Esmeralda','Campos','Ramirez','1965-09-21'),(2225,'Uruel','Urbia','Martinez','1970-10-06'),(2226,'Marco','Martinez','Flores','1985-05-21'),(2227,'Perla','Heras','Barrios','1994-06-26'),(2228,'Esmeralda','Urbia','Campos','1993-12-15'),(2229,'Tomasa','Espinoza','Jiménez','1998-02-22'),(2230,'Olga','Dominguez','Férnandes','1993-10-08'),(2231,'Benito','Eslava','Ibañez','2001-08-26'),(2232,'Tomasa','Ortega','Jiménez','1976-01-17'),(2233,'Ivan','Gutierréz','Amador','1979-10-16'),(2234,'Samuel','Baez','Zurita','1993-12-23'),(2235,'Pedro','Ortega','Navarro','2001-06-05'),(2236,'Marco','Ibarra','Férnandes','1969-12-25'),(2237,'Anahi','Cruz','Campos','1976-12-02'),(2238,'Marcia','Ibañez','Lopez','1992-03-09'),(2239,'Hortencia','Gonzalez','Guerrero','1974-07-08'),(2240,'Fernando','Duarte','Yañez','1977-10-10'),(2241,'Ramiro','Ortega','Huerta','1963-11-19'),(2242,'Juana','Zurita','Martinez','1999-10-08'),(2243,'Kevin','Kuri','Ibarra','1973-07-09'),(2244,'Hugo','Guerrero','Zurita','1987-05-29'),(2245,'Omar','Heras','Eslava','1964-12-29'),(2246,'Fernanda','Gonzalez','Baez','2000-07-08'),(2247,'Ramiro','Martinez','Abasolo','1967-12-02'),(2248,'Olga','Férnandes','Urbia','2002-05-16'),(2249,'Fernando','Flores','Flores','1981-07-31'),(2250,'Pedro','Duarte','Férnandes','1978-02-14'),(2251,'Tomasa','Heras','Férnandes','1973-01-27'),(2252,'Kevin','Ramirez','Santos','2005-02-22'),(2253,'Ursuala','Huerta','Ortega','1965-08-12'),(2254,'Ursuala','Ibañez','Gutierréz','1966-08-05'),(2255,'Benito','Santos','Torres','1985-08-07'),(2256,'Perla','Espinoza','Lopez','1964-09-04'),(2257,'Esmeralda','Lobardia','Gonzalez','1970-02-22'),(2258,'Luisa','Ibañez','Ramirez','1980-06-27'),(2259,'Nestor','Quiroz','Nuñes','1979-05-29'),(2260,'Marco','Abasolo','Espinoza','1985-02-28'),(2261,'Kevin','Lopez','Ortega','1994-01-29'),(2262,'Juana','Ximenes','Férnandes','1965-01-12'),(2263,'Ramiro','Navarro','Lopez','1976-02-10'),(2264,'Perla','Torres','Zurita','2000-11-27'),(2265,'Berta','Juarez','Lobardia','1987-07-31'),(2266,'Ivan','Ibarra','Guerrero','1971-01-12'),(2267,'Kevin','Ximenes','Torres','1978-12-19'),(2268,'Fernando','Férnandes','Jiménez','1995-03-15'),(2269,'Fernando','Ximenes','Dominguez','1995-07-22'),(2270,'Daniela','Huerta','Ramirez','1982-10-10'),(2271,'Ramiro','Ramirez','Yañez','1980-06-07'),(2272,'Samanta','Ramirez','Urbia','1960-06-25'),(2273,'Perla','Barrios','Flores','1992-06-14'),(2274,'Uruel','Zurita','Cruz','1964-11-28'),(2275,'Carla','Amador','Yañez','2001-04-16'),(2276,'Perla','Ibañez','Flores','2003-11-03'),(2277,'Esmeralda','Kuri','Barrios','1972-04-16'),(2278,'Anahi','Oropeza','Guerrero','1988-08-16'),(2279,'Olga','Nuñes','Navarro','2005-08-04'),(2280,'Marcia','Ramirez','Férnandes','1979-04-23'),(2281,'Juana','Huerta','Ximenes','2002-06-27'),(2282,'Ramiro','Eslava','Torres','1998-12-07'),(2283,'Adan','Gutierréz','Gonzalez','1973-02-10'),(2284,'Damián','Gutierréz','Martinez','1962-06-19'),(2285,'Tomas','Kuri','Barrios','1972-05-10'),(2286,'Tomasa','Ortega','Nuñes','1996-10-13'),(2287,'Ramiro','Santos','Dominguez','1961-07-29'),(2288,'Adan','Quiroz','Lobardia','1968-07-11'),(2289,'Gabriel','Ramirez','Gutierréz','1985-01-18'),(2290,'Omar','Eslava','Oropeza','1995-04-05'),(2291,'Hortencia','Dominguez','Huerta','2004-02-22'),(2292,'Fernando','Flores','Dominguez','1970-10-27'),(2293,'Hugo','Juarez','Duarte','1990-01-16'),(2294,'Fernando','Martinez','Dominguez','1978-12-15'),(2295,'Emerson','Gonzalez','Gutierréz','1985-05-21'),(2296,'Pedro','Duarte','Duarte','1966-10-13'),(2297,'Esmeralda','Ramirez','Quiroz','1995-09-28'),(2298,'Esmeralda','Torres','Ibañez','1964-06-19'),(2299,'Gabriela','Nuñes','Ximenes','1998-02-19'),(2300,'Marcia','Lopez','Yañez','1995-10-29'),(2301,'Gabriel','Ximenes','Eslava','1999-06-12'),(2302,'Nestor','Campos','Huerta','1959-04-23'),(2303,'Emerson','Guerrero','Abasolo','2000-09-28'),(2304,'Fernando','Lopez','Ximenes','1995-08-26'),(2305,'Fernando','Urbia','Santos','1995-03-15'),(2306,'Juana','Heras','Vazquez','1960-05-09'),(2307,'Gabriela','Yañez','Flores','2002-04-16'),(2308,'Perla','Juarez','Torres','1967-01-16'),(2309,'Tomasa','Carrasco','Urbia','1965-08-21'),(2310,'Benito','Ramirez','Jiménez','1960-01-21'),(2311,'Nora','Jiménez','Férnandes','1966-05-08'),(2312,'Fernando','Kuri','Ximenes','1994-06-15'),(2313,'Adan','Martinez','Yañez','1994-11-10'),(2314,'Marco','Vazquez','Amador','1980-09-30'),(2315,'Ivonne','Yañez','Oropeza','1967-03-02'),(2316,'Hortencia','Urbia','Lopez','2005-04-21'),(2317,'Juan','Férnandes','Kuri','2000-08-25'),(2318,'Luisa','Lobardia','Eslava','1996-09-11'),(2319,'Hortencia','Ortega','Barrios','1970-01-19'),(2320,'Uruel','Heras','Espinoza','1965-07-10'),(2321,'Hugo','Marquez','Lopez','1993-12-16'),(2322,'Berta','Guerrero','Yañez','1978-12-01'),(2323,'Fernanda','Ortega','Gonzalez','1959-12-08'),(2324,'Tomasa','Lopez','Campos','1974-10-11'),(2325,'Olga','Martinez','Urbia','1974-08-18'),(2326,'Ivan','Ibañez','Ibarra','1982-01-01'),(2327,'Hortencia','Lobardia','Lopez','1999-10-11'),(2328,'Marco','Lobardia','Quiroz','1973-11-30'),(2329,'Emerson','Heras','Kuri','2003-12-30'),(2330,'Damián','Gonzalez','Oropeza','1981-04-26'),(2331,'Benito','Yañez','Urbia','1989-04-12'),(2332,'Gabriela','Cruz','Nuñes','1992-08-25'),(2333,'Samanta','Carrasco','Zurita','1992-01-21'),(2334,'Samanta','Cruz','Kuri','1976-01-30'),(2335,'Benito','Juarez','Baez','1981-09-11'),(2336,'Samuel','Amador','Lopez','1990-10-22'),(2337,'Luisa','Ramirez','Juarez','2003-08-25'),(2338,'Ivan','Nuñes','Lopez','1993-11-13'),(2339,'Tomasa','Duarte','Guerrero','1979-02-11'),(2340,'Daniela','Kuri','Flores','1994-11-25'),(2341,'Esmeralda','Torres','Lopez','1981-07-04'),(2342,'Carla','Huerta','Vazquez','2001-06-21'),(2343,'Juan','Martinez','Carrasco','1978-04-07'),(2344,'Anahi','Urbia','Oropeza','1978-09-04'),(2345,'Marcia','Huerta','Espinoza','2005-02-16'),(2346,'Samanta','Dominguez','Flores','1984-05-14'),(2347,'Esmeralda','Vazquez','Eslava','2003-07-09'),(2348,'Nora','Navarro','Campos','1966-09-10'),(2349,'Tomasa','Baez','Navarro','1988-02-08'),(2350,'Juan','Espinoza','Ibañez','1991-11-18'),(2351,'Daniela','Quiroz','Martinez','1981-08-20'),(2352,'Nestor','Huerta','Jiménez','1988-12-12'),(2353,'Ivonne','Férnandes','Ramirez','1988-05-24'),(2354,'Marcia','Navarro','Jiménez','1967-03-25'),(2355,'Fernando','Quiroz','Duarte','1968-07-26'),(2356,'Fernanda','Cruz','Carrasco','1979-04-18'),(2357,'Ivonne','Quiroz','Campos','2005-07-01'),(2358,'Emerson','Carrasco','Campos','2003-12-25'),(2359,'Luisa','Espinoza','Jiménez','2003-05-11'),(2360,'Adan','Barrios','Torres','1963-04-27'),(2361,'Carlos','Lopez','Torres','1960-12-13'),(2362,'Carlos','Torres','Vazquez','1979-08-13'),(2363,'Ivonne','Lobardia','Baez','1990-03-13'),(2364,'Ramiro','Campos','Eslava','1982-10-06'),(2365,'Samuel','Abasolo','Ramirez','2005-11-21'),(2366,'Ramona','Guerrero','Martinez','1974-03-17'),(2367,'Hortencia','Lobardia','Huerta','1977-12-12'),(2368,'Ramiro','Ortega','Huerta','1967-08-02'),(2369,'Tomas','Ibarra','Juarez','1994-07-23'),(2370,'Benito','Carrasco','Gutierréz','1987-11-06'),(2371,'Berta','Zurita','Eslava','1991-12-25'),(2372,'Carlos','Martinez','Huerta','1959-07-23'),(2373,'Fernando','Torres','Duarte','1984-04-01'),(2374,'Gabriel','Urbia','Lopez','1964-07-01'),(2375,'Berta','Martinez','Martinez','1987-12-26'),(2376,'Uruel','Lopez','Campos','1970-10-12'),(2377,'Uruel','Nuñes','Campos','1977-03-15'),(2378,'Adan','Ortega','Dominguez','1982-03-01'),(2379,'Samuel','Baez','Yañez','1986-11-22'),(2380,'Ramiro','Ibañez','Ximenes','2005-03-02'),(2381,'Ramiro','Carrasco','Jiménez','2005-04-05'),(2382,'Carlos','Urbia','Marquez','1959-11-03'),(2383,'Benito','Espinoza','Navarro','1975-11-05'),(2384,'Olga','Navarro','Ximenes','1982-10-03'),(2385,'Luis','Gonzalez','Espinoza','1973-08-15'),(2386,'Adan','Urbia','Martinez','1967-07-17'),(2387,'Daniela','Carrasco','Ibarra','1998-10-24'),(2388,'Juana','Lobardia','Ortega','1964-08-30'),(2389,'Juana','Espinoza','Duarte','1962-07-27'),(2390,'Ivan','Flores','Navarro','1985-11-23'),(2391,'Gabriela','Juarez','Ibañez','1976-10-20'),(2392,'Tomas','Abasolo','Kuri','1970-04-25'),(2393,'Ivan','Marquez','Duarte','1995-09-21'),(2394,'Tomasa','Guerrero','Marquez','1967-03-17'),(2395,'Luis','Huerta','Huerta','1978-06-27'),(2396,'Emerson','Eslava','Guerrero','1986-02-11'),(2397,'Perla','Eslava','Espinoza','1986-12-06'),(2398,'Daniela','Baez','Gonzalez','1988-02-05'),(2399,'Fernanda','Torres','Baez','1969-02-26'),(2400,'Daniela','Abasolo','Ximenes','1985-01-02'),(2401,'Hugo','Ibañez','Ortega','1961-11-13'),(2402,'Emerson','Eslava','Guerrero','1991-02-27'),(2403,'Ramiro','Zurita','Oropeza','1964-07-31'),(2404,'Carlos','Duarte','Espinoza','1971-12-28'),(2405,'Hugo','Gonzalez','Flores','1970-03-15'),(2406,'Kevin','Zurita','Huerta','1971-05-29'),(2407,'Samanta','Gutierréz','Ibañez','1987-06-03'),(2408,'Tomas','Dominguez','Ximenes','1986-01-18'),(2409,'Samuel','Oropeza','Juarez','1961-07-07'),(2410,'Nora','Amador','Cruz','1963-11-02'),(2411,'Luisa','Ibañez','Lopez','1999-01-16'),(2412,'Fernando','Ibañez','Kuri','1990-04-16'),(2413,'Perla','Férnandes','Oropeza','1980-10-03'),(2414,'Marco','Ramirez','Lopez','1965-09-09'),(2415,'Samanta','Heras','Navarro','1975-12-11'),(2416,'Marcia','Torres','Baez','1966-05-10'),(2417,'Ursuala','Gonzalez','Ortega','1975-01-05'),(2418,'Karen','Torres','Kuri','1975-09-09'),(2419,'Samanta','Ximenes','Jiménez','1991-09-11'),(2420,'Marcia','Oropeza','Jiménez','1967-07-13'),(2421,'Emerson','Torres','Lopez','1983-05-05'),(2422,'Ursuala','Flores','Barrios','1959-04-28'),(2423,'Omar','Gutierréz','Flores','2005-08-13'),(2424,'Fernanda','Lobardia','Ramirez','1983-04-17'),(2425,'Carlos','Zurita','Santos','1981-10-28'),(2426,'Emerson','Flores','Marquez','1971-05-31'),(2427,'Luisa','Ibarra','Oropeza','1975-02-25'),(2428,'Daniela','Abasolo','Ximenes','1981-02-16'),(2429,'Perla','Oropeza','Yañez','1986-09-27'),(2430,'Ramiro','Carrasco','Ortega','1983-10-23'),(2431,'Gabriela','Oropeza','Ibarra','2004-05-06'),(2432,'Adan','Lobardia','Oropeza','1966-01-11'),(2433,'Tomasa','Yañez','Abasolo','1978-05-13'),(2434,'Ramiro','Espinoza','Abasolo','1997-07-20'),(2435,'Nestor','Ibañez','Férnandes','1962-03-13'),(2436,'Daniela','Juarez','Flores','1999-10-12'),(2437,'Emerson','Eslava','Eslava','1977-03-19'),(2438,'Daniela','Oropeza','Juarez','1963-12-03'),(2439,'Marcia','Guerrero','Jiménez','2002-07-15'),(2440,'Uruel','Ramirez','Férnandes','1979-05-21'),(2441,'Juana','Ibañez','Amador','1971-07-25'),(2442,'Berta','Campos','Ortega','1996-05-11'),(2443,'Ivan','Campos','Cruz','1998-07-02'),(2444,'Carlos','Dominguez','Marquez','1981-02-08'),(2445,'Ursuala','Ortega','Eslava','1986-06-29'),(2446,'Nora','Heras','Jiménez','2000-03-09'),(2447,'Luisa','Urbia','Urbia','2004-01-03'),(2448,'Carlos','Urbia','Ortega','1972-04-11'),(2449,'Berta','Dominguez','Carrasco','1976-01-30'),(2450,'Samanta','Zurita','Huerta','1969-10-09'),(2451,'Fernanda','Eslava','Ximenes','1982-07-03'),(2452,'Hortencia','Ortega','Zurita','2004-04-12'),(2453,'Tomas','Carrasco','Barrios','1999-04-19'),(2454,'Nestor','Cruz','Lobardia','1978-11-21'),(2455,'Esmeralda','Guerrero','Ortega','1979-10-30'),(2456,'Pedro','Ximenes','Navarro','1967-03-11'),(2457,'Karen','Kuri','Dominguez','1983-07-05'),(2458,'Luisa','Baez','Santos','1962-06-29'),(2459,'Uruel','Gonzalez','Marquez','1967-04-27'),(2460,'Ivan','Vazquez','Juarez','1992-05-19'),(2461,'Anahi','Barrios','Baez','1974-12-01'),(2462,'Perla','Ibañez','Guerrero','1960-06-23'),(2463,'Luisa','Férnandes','Nuñes','1968-12-06'),(2464,'Nestor','Flores','Santos','1960-08-01'),(2465,'Daniela','Quiroz','Quiroz','1992-08-02'),(2466,'Adan','Marquez','Lopez','1997-03-04'),(2467,'Juan','Marquez','Cruz','1968-04-15'),(2468,'Nestor','Lopez','Quiroz','1960-08-21'),(2469,'Uruel','Guerrero','Heras','1995-09-22'),(2470,'Fernanda','Guerrero','Cruz','1983-11-20'),(2471,'Fernanda','Duarte','Zurita','1988-06-13'),(2472,'Carlos','Ramirez','Eslava','1968-01-04'),(2473,'Samanta','Flores','Ortega','1984-05-15'),(2474,'Ramona','Oropeza','Ramirez','2004-12-08'),(2475,'Fernanda','Ximenes','Eslava','1999-11-10'),(2476,'Tomas','Flores','Gonzalez','1992-05-25'),(2477,'Benito','Guerrero','Quiroz','1993-09-25'),(2478,'Ivonne','Vazquez','Ibañez','1988-06-04'),(2479,'Ivan','Gonzalez','Vazquez','1969-12-27'),(2480,'Luisa','Jiménez','Yañez','1965-03-06'),(2481,'Ramiro','Duarte','Marquez','1965-07-25'),(2482,'Ramiro','Baez','Eslava','1975-04-30'),(2483,'Daniela','Nuñes','Abasolo','1976-06-16'),(2484,'Samanta','Abasolo','Urbia','1972-11-25'),(2485,'Gabriel','Ximenes','Zurita','1970-04-26'),(2486,'Ursuala','Gutierréz','Nuñes','1966-06-02'),(2487,'Karen','Barrios','Vazquez','1987-02-08'),(2488,'Ramona','Campos','Flores','1986-11-13'),(2489,'Hortencia','Ramirez','Cruz','1982-10-31'),(2490,'Ramona','Abasolo','Eslava','1978-02-22'),(2491,'Karen','Eslava','Ortega','1985-09-17'),(2492,'Luis','Eslava','Gonzalez','1990-10-31'),(2493,'Marco','Campos','Navarro','1998-12-23'),(2494,'Juan','Guerrero','Lopez','1971-09-24'),(2495,'Hugo','Campos','Abasolo','1968-01-18'),(2496,'Ramona','Ximenes','Baez','1988-06-05'),(2497,'Gabriel','Amador','Ortega','1999-08-17'),(2498,'Berta','Heras','Flores','1967-08-23'),(2499,'Gabriela','Kuri','Martinez','1998-07-28'),(2500,'Omar','Lobardia','Espinoza','2005-02-09'),(2501,'Ursuala','Baez','Martinez','1983-02-01'),(2502,'Gabriela','Torres','Ortega','1991-02-09'),(2503,'Anahi','Juarez','Huerta','1968-06-15'),(2504,'Kevin','Lopez','Ortega','1995-06-13'),(2505,'Benito','Gutierréz','Yañez','1968-01-17'),(2506,'Damián','Nuñes','Torres','1970-03-23'),(2507,'Emerson','Yañez','Abasolo','1980-12-09'),(2508,'Adan','Kuri','Ibañez','1970-11-07'),(2509,'Ivonne','Martinez','Juarez','1969-07-11'),(2510,'Hugo','Zurita','Eslava','1998-11-11'),(2511,'Carlos','Lopez','Carrasco','1976-05-24'),(2512,'Gabriela','Yañez','Flores','2005-07-08'),(2513,'Anahi','Barrios','Espinoza','1989-05-14'),(2514,'Nora','Yañez','Dominguez','1992-12-22'),(2515,'Ursuala','Abasolo','Duarte','1980-07-05'),(2516,'Luisa','Cruz','Carrasco','1981-04-07'),(2517,'Emerson','Ibarra','Lopez','1962-03-12'),(2518,'Uruel','Amador','Baez','1978-07-28'),(2519,'Juana','Barrios','Campos','1972-09-09'),(2520,'Samanta','Flores','Ortega','1986-08-21'),(2521,'Omar','Oropeza','Dominguez','1967-10-16'),(2522,'Carla','Ibarra','Eslava','1961-05-22'),(2523,'Kevin','Navarro','Abasolo','1962-03-29'),(2524,'Emerson','Martinez','Ibarra','1966-10-16'),(2525,'Hugo','Dominguez','Kuri','1974-07-12'),(2526,'Esmeralda','Amador','Martinez','1996-08-12'),(2527,'Ramiro','Marquez','Abasolo','1979-11-15'),(2528,'Ivan','Dominguez','Duarte','1977-10-06'),(2529,'Juana','Juarez','Flores','2001-02-26'),(2530,'Samuel','Ximenes','Marquez','2003-09-09'),(2531,'Ivan','Ortega','Ramirez','1971-11-03'),(2532,'Omar','Ibañez','Cruz','1965-10-27'),(2533,'Olga','Juarez','Nuñes','1999-01-26'),(2534,'Carla','Torres','Campos','1967-09-06'),(2535,'Ivonne','Gutierréz','Vazquez','2004-04-28'),(2536,'Tomas','Barrios','Juarez','1973-04-26'),(2537,'Esmeralda','Campos','Vazquez','1983-02-01'),(2538,'Adan','Jiménez','Duarte','2000-11-13'),(2539,'Hugo','Kuri','Ibañez','1969-08-17'),(2540,'Pedro','Vazquez','Espinoza','1961-01-08'),(2541,'Esmeralda','Zurita','Espinoza','2000-10-28'),(2542,'Ramiro','Ibarra','Amador','1980-12-09'),(2543,'Karen','Torres','Juarez','1970-03-07'),(2544,'Nestor','Nuñes','Zurita','1961-03-06'),(2545,'Luisa','Martinez','Gonzalez','2003-11-05'),(2546,'Hugo','Urbia','Kuri','2002-10-10'),(2547,'Juana','Guerrero','Martinez','1977-04-21'),(2548,'Nora','Yañez','Amador','1974-10-28'),(2549,'Luisa','Duarte','Guerrero','1980-05-21'),(2550,'Pedro','Nuñes','Férnandes','2002-03-13'),(2551,'Gabriel','Marquez','Zurita','1964-01-26'),(2552,'Samanta','Cruz','Férnandes','1995-11-27'),(2553,'Esmeralda','Vazquez','Heras','1980-06-15'),(2554,'Gabriela','Jiménez','Ibañez','1982-08-23'),(2555,'Ursuala','Duarte','Barrios','1995-01-30'),(2556,'Omar','Zurita','Flores','1998-11-24'),(2557,'Uruel','Ximenes','Campos','1989-10-09'),(2558,'Samuel','Kuri','Guerrero','2002-04-16'),(2559,'Adan','Baez','Carrasco','1972-06-25'),(2560,'Carlos','Férnandes','Juarez','1993-07-07'),(2561,'Olga','Eslava','Kuri','1970-11-09'),(2562,'Kevin','Gutierréz','Martinez','1960-04-16'),(2563,'Uruel','Juarez','Juarez','1981-03-13'),(2564,'Samanta','Oropeza','Ibañez','1959-07-25'),(2565,'Samuel','Gutierréz','Juarez','1993-08-03'),(2566,'Juana','Amador','Ximenes','1996-01-15'),(2567,'Marco','Torres','Baez','1969-02-26'),(2568,'Carla','Guerrero','Lopez','1970-06-13'),(2569,'Adan','Baez','Huerta','1995-07-22'),(2570,'Gabriel','Campos','Ibañez','1967-01-23'),(2571,'Ivan','Yañez','Urbia','1993-01-26'),(2572,'Ramiro','Yañez','Ibañez','1982-03-27'),(2573,'Juana','Cruz','Urbia','1976-02-02'),(2574,'Carlos','Huerta','Dominguez','1995-09-25'),(2575,'Berta','Flores','Martinez','1981-11-16'),(2576,'Ramiro','Ibarra','Yañez','1969-06-05'),(2577,'Samanta','Jiménez','Amador','1980-06-03'),(2578,'Adan','Flores','Santos','1963-05-28'),(2579,'Gabriel','Oropeza','Ibarra','2005-05-31'),(2580,'Ivan','Amador','Guerrero','2000-03-06'),(2581,'Hugo','Ibañez','Abasolo','1976-02-12'),(2582,'Samanta','Duarte','Flores','1976-05-25'),(2583,'Esmeralda','Juarez','Quiroz','1973-06-25'),(2584,'Omar','Eslava','Huerta','1999-11-08'),(2585,'Ivonne','Flores','Juarez','1963-05-05'),(2586,'Gabriela','Zurita','Guerrero','2005-12-18'),(2587,'Anahi','Dominguez','Martinez','1986-02-19'),(2588,'Samanta','Zurita','Juarez','1980-08-12'),(2589,'Marcia','Juarez','Ramirez','1972-03-04'),(2590,'Benito','Guerrero','Amador','1989-03-14'),(2591,'Ivan','Guerrero','Quiroz','1993-08-22'),(2592,'Hortencia','Kuri','Ibañez','1974-08-18'),(2593,'Tomasa','Amador','Juarez','1980-03-29'),(2594,'Daniela','Urbia','Guerrero','1974-08-09'),(2595,'Adan','Marquez','Quiroz','1974-02-19'),(2596,'Adan','Cruz','Guerrero','1996-11-02'),(2597,'Luisa','Urbia','Amador','1986-11-01'),(2598,'Benito','Ibarra','Lobardia','2001-01-03'),(2599,'Nora','Heras','Nuñes','1966-01-07'),(2600,'Marco','Huerta','Torres','1979-02-13'),(2601,'Hugo','Ximenes','Santos','1990-12-14'),(2602,'Emerson','Nuñes','Ortega','2003-09-09'),(2603,'Ramona','Martinez','Baez','1973-05-19'),(2604,'Adan','Abasolo','Cruz','1996-09-19'),(2605,'Benito','Férnandes','Ramirez','1989-11-24'),(2606,'Fernando','Férnandes','Nuñes','1968-07-25'),(2607,'Luis','Duarte','Gonzalez','1984-12-17'),(2608,'Nestor','Torres','Ortega','1994-06-28'),(2609,'Gabriela','Cruz','Ibarra','1965-03-10'),(2610,'Nestor','Heras','Nuñes','1967-12-01'),(2611,'Hugo','Kuri','Kuri','1981-12-11'),(2612,'Perla','Torres','Amador','2002-09-14'),(2613,'Perla','Espinoza','Kuri','2005-12-10'),(2614,'Tomas','Espinoza','Flores','1973-07-11'),(2615,'Samuel','Kuri','Eslava','1991-08-09'),(2616,'Ramiro','Torres','Ximenes','1985-11-22'),(2617,'Ramiro','Ibañez','Barrios','1976-01-20'),(2618,'Samanta','Quiroz','Oropeza','1987-05-07'),(2619,'Samanta','Vazquez','Nuñes','1963-12-13'),(2620,'Ivonne','Jiménez','Ortega','1967-12-07'),(2621,'Adan','Flores','Yañez','1982-10-18'),(2622,'Daniela','Abasolo','Yañez','1991-08-10'),(2623,'Carla','Abasolo','Eslava','1982-06-29'),(2624,'Ivan','Baez','Jiménez','1964-06-22'),(2625,'Ramiro','Espinoza','Carrasco','2005-03-15'),(2626,'Luisa','Heras','Ibañez','1990-02-09'),(2627,'Ivonne','Duarte','Ibañez','1993-11-27'),(2628,'Damián','Flores','Baez','1959-10-30'),(2629,'Olga','Flores','Santos','1960-03-22'),(2630,'Ursuala','Ramirez','Gutierréz','1987-09-22'),(2631,'Ramona','Campos','Dominguez','1975-06-03'),(2632,'Ramona','Guerrero','Kuri','1965-06-07'),(2633,'Samanta','Flores','Abasolo','2002-12-24'),(2634,'Gabriela','Ibarra','Torres','1984-12-24'),(2635,'Fernanda','Nuñes','Jiménez','1981-07-18'),(2636,'Perla','Navarro','Navarro','1990-08-29'),(2637,'Ramiro','Cruz','Quiroz','1963-01-30'),(2638,'Samuel','Barrios','Vazquez','1986-11-05'),(2639,'Olga','Gutierréz','Campos','1993-03-12'),(2640,'Fernanda','Juarez','Santos','1982-10-08'),(2641,'Gabriel','Gutierréz','Ibarra','1985-03-27'),(2642,'Carlos','Urbia','Torres','1987-09-27'),(2643,'Ivan','Nuñes','Lopez','1994-05-17'),(2644,'Carla','Carrasco','Lobardia','1964-02-05'),(2645,'Juana','Amador','Ramirez','1974-05-19'),(2646,'Uruel','Barrios','Huerta','1965-10-29'),(2647,'Damián','Ximenes','Duarte','1998-02-03'),(2648,'Berta','Flores','Lopez','1971-12-19'),(2649,'Perla','Kuri','Abasolo','1972-02-19'),(2650,'Tomas','Vazquez','Gonzalez','1976-01-11'),(2651,'Gabriel','Huerta','Torres','1975-10-25'),(2652,'Ursuala','Ximenes','Amador','1976-09-21'),(2653,'Kevin','Juarez','Zurita','1965-06-13'),(2654,'Juana','Vazquez','Baez','1990-11-14'),(2655,'Hugo','Torres','Marquez','1978-11-19'),(2656,'Adan','Eslava','Santos','1962-05-16'),(2657,'Adan','Baez','Espinoza','1976-09-26'),(2658,'Olga','Ortega','Urbia','1983-03-04'),(2659,'Hugo','Lopez','Navarro','1997-04-26'),(2660,'Samuel','Lopez','Eslava','1989-12-30'),(2661,'Adan','Ramirez','Duarte','1969-10-10'),(2662,'Juana','Torres','Santos','1968-01-29'),(2663,'Olga','Dominguez','Férnandes','1993-09-28'),(2664,'Adan','Navarro','Dominguez','1974-10-07'),(2665,'Esmeralda','Espinoza','Nuñes','1969-06-10'),(2666,'Emerson','Nuñes','Nuñes','1999-04-13'),(2667,'Carla','Torres','Barrios','1961-01-25'),(2668,'Pedro','Jiménez','Gonzalez','1972-01-18'),(2669,'Pedro','Santos','Nuñes','1971-02-05'),(2670,'Samanta','Jiménez','Zurita','1970-04-27'),(2671,'Tomasa','Abasolo','Navarro','1987-09-09'),(2672,'Hugo','Jiménez','Carrasco','1992-07-25'),(2673,'Tomas','Martinez','Jiménez','1972-03-11'),(2674,'Ivonne','Barrios','Heras','1963-09-22'),(2675,'Emerson','Marquez','Flores','2000-10-30'),(2676,'Tomas','Dominguez','Ximenes','1987-02-23'),(2677,'Ivan','Jiménez','Nuñes','1959-05-14'),(2678,'Juan','Santos','Heras','1988-03-20'),(2679,'Samanta','Carrasco','Eslava','1971-12-25'),(2680,'Omar','Eslava','Juarez','1964-10-16'),(2681,'Carla','Baez','Gonzalez','1989-09-06'),(2682,'Anahi','Carrasco','Martinez','1973-11-26'),(2683,'Hortencia','Jiménez','Espinoza','1963-06-19'),(2684,'Carlos','Navarro','Oropeza','1995-06-28'),(2685,'Nora','Ortega','Campos','1977-12-22'),(2686,'Fernando','Espinoza','Guerrero','1977-07-01'),(2687,'Gabriela','Barrios','Baez','1977-04-20'),(2688,'Perla','Zurita','Urbia','1988-03-30'),(2689,'Olga','Quiroz','Jiménez','2004-11-22'),(2690,'Adan','Baez','Duarte','1975-02-15'),(2691,'Adan','Nuñes','Urbia','1986-04-16'),(2692,'Ramona','Yañez','Juarez','1987-04-04'),(2693,'Luis','Cruz','Huerta','1962-04-23'),(2694,'Juana','Huerta','Vazquez','1999-05-19'),(2695,'Nora','Heras','Nuñes','1968-10-29'),(2696,'Samuel','Santos','Zurita','1985-01-05'),(2697,'Luis','Gonzalez','Carrasco','1960-03-27'),(2698,'Luisa','Baez','Urbia','1967-05-02'),(2699,'Berta','Flores','Quiroz','1999-01-17'),(2700,'Pedro','Guerrero','Oropeza','1986-04-24'),(2701,'Fernanda','Cruz','Ortega','2000-11-11'),(2702,'Gabriela','Marquez','Quiroz','1971-05-13'),(2703,'Adan','Campos','Férnandes','1997-03-06'),(2704,'Marcia','Ibañez','Kuri','1992-01-18'),(2705,'Gabriela','Eslava','Navarro','1988-02-24'),(2706,'Nestor','Abasolo','Baez','1969-10-03'),(2707,'Daniela','Carrasco','Dominguez','1969-03-19'),(2708,'Luis','Heras','Ibañez','1991-10-06'),(2709,'Berta','Ibarra','Marquez','2005-09-12'),(2710,'Luis','Lobardia','Barrios','1982-10-22'),(2711,'Samanta','Martinez','Ortega','1995-06-28'),(2712,'Uruel','Amador','Férnandes','2000-04-13'),(2713,'Fernanda','Vazquez','Yañez','1969-06-29'),(2714,'Samanta','Ibarra','Urbia','1999-04-11'),(2715,'Ursuala','Férnandes','Ibarra','1986-11-30'),(2716,'Tomasa','Baez','Oropeza','1994-11-26'),(2717,'Daniela','Lobardia','Guerrero','1961-11-04'),(2718,'Gabriel','Navarro','Eslava','1979-11-04'),(2719,'Hugo','Santos','Espinoza','1967-10-11'),(2720,'Juana','Yañez','Martinez','2004-07-22'),(2721,'Juana','Heras','Ximenes','1965-12-11'),(2722,'Luis','Navarro','Ortega','1991-12-04'),(2723,'Daniela','Ortega','Huerta','1964-03-22'),(2724,'Juana','Zurita','Navarro','2003-10-30'),(2725,'Berta','Duarte','Huerta','1987-07-20'),(2726,'Nora','Ortega','Amador','1965-07-14'),(2727,'Daniela','Juarez','Zurita','1963-06-13'),(2728,'Marcia','Jiménez','Kuri','1994-12-30'),(2729,'Adan','Baez','Abasolo','2004-04-21'),(2730,'Anahi','Jiménez','Baez','1990-07-13'),(2731,'Fernando','Yañez','Lobardia','1994-01-03'),(2732,'Hugo','Yañez','Yañez','1961-05-04'),(2733,'Anahi','Martinez','Santos','1969-06-25'),(2734,'Gabriela','Martinez','Zurita','2000-08-20'),(2735,'Tomasa','Yañez','Jiménez','1987-05-15'),(2736,'Nestor','Ibarra','Duarte','2004-01-23'),(2737,'Tomasa','Ortega','Marquez','1987-12-02'),(2738,'Fernando','Huerta','Abasolo','1984-08-10'),(2739,'Olga','Yañez','Ximenes','1960-09-22'),(2740,'Ramona','Urbia','Ibarra','1991-11-23'),(2741,'Adan','Cruz','Jiménez','1971-07-05'),(2742,'Esmeralda','Ibarra','Lopez','1960-08-31'),(2743,'Gabriel','Ibarra','Carrasco','1999-12-06'),(2744,'Emerson','Barrios','Quiroz','1963-09-13'),(2745,'Gabriel','Barrios','Férnandes','1999-09-27'),(2746,'Samanta','Gonzalez','Espinoza','1974-01-16'),(2747,'Damián','Lopez','Ibarra','1968-12-30'),(2748,'Juana','Vazquez','Abasolo','1985-11-01'),(2749,'Juana','Marquez','Ortega','1964-06-12'),(2750,'Esmeralda','Abasolo','Navarro','1992-07-09'),(2751,'Juana','Gonzalez','Quiroz','1992-10-08'),(2752,'Ramiro','Lobardia','Jiménez','1989-01-25'),(2753,'Juana','Lopez','Carrasco','1982-04-29'),(2754,'Omar','Cruz','Amador','1960-09-21'),(2755,'Uruel','Amador','Baez','1981-10-27'),(2756,'Samuel','Zurita','Juarez','1980-01-12'),(2757,'Gabriela','Abasolo','Carrasco','1971-03-23'),(2758,'Samuel','Marquez','Lobardia','1990-07-08'),(2759,'Perla','Yañez','Oropeza','1970-08-26'),(2760,'Samuel','Carrasco','Dominguez','1966-10-25'),(2761,'Juana','Cruz','Urbia','1976-10-30'),(2762,'Hortencia','Ramirez','Nuñes','1973-01-15'),(2763,'Tomasa','Juarez','Vazquez','1993-12-20'),(2764,'Tomas','Baez','Oropeza','1990-11-21'),(2765,'Juan','Vazquez','Baez','1992-06-24'),(2766,'Adan','Marquez','Martinez','2002-08-27'),(2767,'Nora','Kuri','Lopez','1990-09-14'),(2768,'Juan','Lobardia','Lobardia','1995-02-06'),(2769,'Samuel','Dominguez','Flores','1986-11-10'),(2770,'Esmeralda','Campos','Ximenes','1993-09-15'),(2771,'Hugo','Ximenes','Santos','1987-06-11'),(2772,'Samanta','Ibañez','Quiroz','1975-01-15'),(2773,'Karen','Espinoza','Torres','1987-06-17'),(2774,'Ivan','Abasolo','Heras','2002-04-25'),(2775,'Gabriel','Abasolo','Abasolo','1961-03-11'),(2776,'Pedro','Oropeza','Vazquez','1976-12-21'),(2777,'Samuel','Huerta','Navarro','1962-06-21'),(2778,'Luis','Flores','Nuñes','1979-02-18'),(2779,'Marco','Carrasco','Navarro','1984-11-08'),(2780,'Tomasa','Ximenes','Heras','1979-07-26'),(2781,'Luisa','Zurita','Espinoza','1999-09-06'),(2782,'Fernanda','Ximenes','Eslava','2003-12-20'),(2783,'Luisa','Guerrero','Torres','1993-11-13'),(2784,'Juana','Huerta','Urbia','1993-06-15'),(2785,'Fernando','Zurita','Torres','1967-09-14'),(2786,'Fernanda','Zurita','Marquez','1997-11-28'),(2787,'Omar','Martinez','Navarro','1994-01-05'),(2788,'Ivonne','Nuñes','Martinez','1997-07-12'),(2789,'Gabriel','Férnandes','Eslava','1960-03-20'),(2790,'Emerson','Carrasco','Yañez','1983-01-25'),(2791,'Daniela','Baez','Flores','1977-03-27'),(2792,'Tomasa','Espinoza','Heras','1989-07-06'),(2793,'Hortencia','Kuri','Ibañez','1972-12-25'),(2794,'Daniela','Vazquez','Marquez','2003-12-16'),(2795,'Pedro','Vazquez','Espinoza','1964-10-20'),(2796,'Samuel','Amador','Lopez','1995-03-06'),(2797,'Ivonne','Ibañez','Lobardia','1987-09-23'),(2798,'Marco','Eslava','Yañez','1989-12-19'),(2799,'Fernanda','Urbia','Vazquez','1962-01-31'),(2800,'Tomasa','Gutierréz','Baez','1993-05-08'),(2801,'Hortencia','Oropeza','Campos','1964-12-31'),(2802,'Carla','Amador','Amador','1963-01-30'),(2803,'Daniela','Guerrero','Juarez','2002-11-26'),(2804,'Berta','Vazquez','Gutierréz','1976-11-18'),(2805,'Ramiro','Ortega','Juarez','1977-08-08'),(2806,'Uruel','Huerta','Torres','1975-11-29'),(2807,'Carla','Ibañez','Zurita','1971-03-01'),(2808,'Anahi','Santos','Duarte','1967-06-08'),(2809,'Ivonne','Urbia','Ortega','1972-02-11'),(2810,'Carla','Ortega','Ibañez','1971-10-14'),(2811,'Perla','Campos','Marquez','1985-09-19'),(2812,'Benito','Cruz','Zurita','2002-04-25'),(2813,'Ramona','Navarro','Ibañez','1963-08-02'),(2814,'Perla','Oropeza','Amador','1999-03-12'),(2815,'Samuel','Jiménez','Campos','1990-02-26'),(2816,'Uruel','Eslava','Ximenes','1981-05-02'),(2817,'Ramona','Zurita','Oropeza','1964-10-24'),(2818,'Daniela','Navarro','Férnandes','1990-06-10'),(2819,'Olga','Ibarra','Nuñes','1965-06-13'),(2820,'Carla','Ibarra','Gonzalez','1978-07-15'),(2821,'Juana','Ibañez','Amador','1971-03-09'),(2822,'Ursuala','Ibañez','Huerta','1972-09-18'),(2823,'Juana','Gonzalez','Ramirez','1994-10-01'),(2824,'Karen','Cruz','Gutierréz','1959-06-16'),(2825,'Karen','Férnandes','Carrasco','2002-03-05'),(2826,'Fernando','Duarte','Eslava','1968-10-07'),(2827,'Ursuala','Juarez','Gutierréz','1964-08-27'),(2828,'Carlos','Kuri','Ortega','2004-10-23'),(2829,'Emerson','Férnandes','Cruz','1978-12-08'),(2830,'Omar','Ortega','Barrios','1971-11-20'),(2831,'Marco','Zurita','Torres','1972-05-22'),(2832,'Gabriel','Juarez','Martinez','1997-08-16'),(2833,'Hugo','Oropeza','Flores','1980-09-14'),(2834,'Ivan','Barrios','Lobardia','1978-01-16'),(2835,'Adan','Ibarra','Cruz','1976-04-11'),(2836,'Marcia','Martinez','Eslava','1983-09-21'),(2837,'Berta','Lobardia','Baez','1987-01-24'),(2838,'Karen','Espinoza','Ortega','1974-09-21'),(2839,'Fernanda','Lobardia','Santos','1986-05-22'),(2840,'Gabriela','Gonzalez','Ibarra','1994-08-24'),(2841,'Marco','Abasolo','Férnandes','1991-12-19'),(2842,'Emerson','Torres','Juarez','1968-05-15'),(2843,'Pedro','Gutierréz','Santos','1990-02-12'),(2844,'Benito','Juarez','Baez','1979-07-11'),(2845,'Carlos','Martinez','Ibañez','1967-06-27'),(2846,'Kevin','Carrasco','Flores','1977-07-05'),(2847,'Perla','Barrios','Barrios','1971-07-22'),(2848,'Luis','Zurita','Torres','1970-06-02'),(2849,'Kevin','Torres','Kuri','1974-10-06'),(2850,'Juana','Gonzalez','Navarro','1977-07-28'),(2851,'Luisa','Espinoza','Guerrero','1977-09-01'),(2852,'Karen','Ximenes','Lobardia','1999-02-16'),(2853,'Nora','Santos','Férnandes','1979-11-23'),(2854,'Juana','Duarte','Carrasco','2005-01-19'),(2855,'Perla','Zurita','Vazquez','1997-01-28'),(2856,'Ivonne','Quiroz','Flores','1977-09-18'),(2857,'Tomasa','Juarez','Martinez','2002-06-23'),(2858,'Karen','Zurita','Martinez','1998-03-20'),(2859,'Omar','Torres','Guerrero','1989-09-07'),(2860,'Ivan','Lobardia','Carrasco','1991-05-18'),(2861,'Gabriel','Guerrero','Flores','1976-01-18'),(2862,'Fernanda','Oropeza','Abasolo','2003-03-13'),(2863,'Luisa','Gonzalez','Duarte','1968-07-14'),(2864,'Anahi','Marquez','Santos','1982-01-24'),(2865,'Emerson','Guerrero','Cruz','1986-02-06'),(2866,'Hugo','Gonzalez','Gonzalez','1984-02-01'),(2867,'Carlos','Campos','Gonzalez','2004-02-08'),(2868,'Kevin','Férnandes','Duarte','1964-09-23'),(2869,'Benito','Yañez','Santos','1988-04-30'),(2870,'Ursuala','Barrios','Gutierréz','2003-02-14'),(2871,'Emerson','Ramirez','Urbia','1961-08-08'),(2872,'Esmeralda','Urbia','Flores','1966-03-26'),(2873,'Luisa','Abasolo','Ramirez','1960-03-19'),(2874,'Daniela','Oropeza','Juarez','1964-05-19'),(2875,'Samanta','Nuñes','Nuñes','1998-03-22'),(2876,'Luis','Dominguez','Amador','2001-07-31'),(2877,'Esmeralda','Eslava','Ibarra','2004-08-11'),(2878,'Fernando','Abasolo','Juarez','1967-03-16'),(2879,'Damián','Yañez','Gutierréz','1965-02-06'),(2880,'Juan','Gonzalez','Ximenes','1967-12-02'),(2881,'Luis','Zurita','Gutierréz','1963-04-11'),(2882,'Juana','Vazquez','Carrasco','1999-07-09'),(2883,'Tomas','Navarro','Nuñes','1986-12-24'),(2884,'Damián','Navarro','Espinoza','1984-10-27'),(2885,'Ivan','Lobardia','Baez','1990-04-26'),(2886,'Samuel','Jiménez','Yañez','1969-11-13'),(2887,'Ramona','Eslava','Marquez','1980-04-06'),(2888,'Hortencia','Martinez','Navarro','1996-03-17'),(2889,'Gabriela','Gonzalez','Ibarra','1997-10-18'),(2890,'Tomasa','Yañez','Ortega','1960-08-07'),(2891,'Pedro','Dominguez','Baez','1969-11-06'),(2892,'Hugo','Ibarra','Cruz','1975-06-30'),(2893,'Fernanda','Lobardia','Quiroz','1978-11-09'),(2894,'Fernanda','Flores','Campos','1965-08-23'),(2895,'Fernanda','Juarez','Martinez','1996-08-05'),(2896,'Benito','Baez','Abasolo','2004-12-12'),(2897,'Daniela','Vazquez','Jiménez','1992-03-16'),(2898,'Benito','Juarez','Torres','1970-08-27'),(2899,'Juan','Barrios','Dominguez','1979-12-25'),(2900,'Tomas','Marquez','Eslava','1996-03-19'),(2901,'Tomasa','Espinoza','Gonzalez','1982-04-11'),(2902,'Fernando','Torres','Baez','1972-06-18'),(2903,'Kevin','Jiménez','Yañez','1968-08-11'),(2904,'Hugo','Eslava','Oropeza','1990-04-30'),(2905,'Hugo','Abasolo','Torres','1999-07-04'),(2906,'Emerson','Torres','Lopez','1983-09-01'),(2907,'Anahi','Baez','Baez','1964-03-25'),(2908,'Omar','Urbia','Espinoza','1966-10-22'),(2909,'Samuel','Ortega','Carrasco','1984-07-25'),(2910,'Samuel','Jiménez','Amador','1977-07-24'),(2911,'Tomas','Cruz','Abasolo','1966-06-26'),(2912,'Hortencia','Urbia','Kuri','2004-10-12'),(2913,'Gabriel','Santos','Kuri','2003-11-19'),(2914,'Damián','Ibarra','Amador','1981-07-27'),(2915,'Olga','Eslava','Juarez','1968-05-31'),(2916,'Marco','Santos','Kuri','1961-07-05'),(2917,'Adan','Gonzalez','Heras','1987-09-23'),(2918,'Olga','Santos','Abasolo','1993-11-12'),(2919,'Esmeralda','Carrasco','Dominguez','1964-08-15'),(2920,'Luisa','Baez','Ximenes','1982-06-19'),(2921,'Berta','Guerrero','Navarro','1984-04-01'),(2922,'Marcia','Ibañez','Férnandes','1961-07-08'),(2923,'Berta','Nuñes','Kuri','1984-11-22'),(2924,'Fernanda','Vazquez','Yañez','1970-08-10'),(2925,'Fernanda','Dominguez','Quiroz','2004-08-06'),(2926,'Luisa','Eslava','Guerrero','1991-06-01'),(2927,'Uruel','Gutierréz','Nuñes','1961-12-20'),(2928,'Olga','Ortega','Urbia','1985-02-18'),(2929,'Benito','Ramirez','Guerrero','1982-09-18'),(2930,'Tomas','Eslava','Gonzalez','1994-02-18'),(2931,'Samuel','Férnandes','Torres','1986-11-12'),(2932,'Berta','Ximenes','Lopez','2003-03-12'),(2933,'Fernanda','Nuñes','Guerrero','2001-12-09'),(2934,'Damián','Eslava','Marquez','1978-07-08'),(2935,'Omar','Zurita','Ximenes','2003-06-20'),(2936,'Uruel','Santos','Kuri','2003-04-30'),(2937,'Tomasa','Gonzalez','Abasolo','1998-04-04'),(2938,'Adan','Lobardia','Ibañez','1983-07-24'),(2939,'Berta','Zurita','Amador','1969-10-16'),(2940,'Fernando','Juarez','Quiroz','1967-08-15'),(2941,'Daniela','Campos','Campos','1972-03-17'),(2942,'Marco','Zurita','Torres','1973-07-03'),(2943,'Olga','Carrasco','Duarte','1974-01-26'),(2944,'Kevin','Eslava','Nuñes','1982-11-19'),(2945,'Hortencia','Zurita','Dominguez','1988-05-09'),(2946,'Pedro','Zurita','Quiroz','1975-01-29'),(2947,'Ivan','Gonzalez','Vazquez','1963-07-07'),(2948,'Samuel','Huerta','Navarro','1967-04-23'),(2949,'Nora','Ibarra','Duarte','1959-09-26'),(2950,'Ramona','Lobardia','Heras','1975-04-14'),(2951,'Pedro','Lobardia','Torres','1972-04-07'),(2952,'Ivan','Lobardia','Torres','1974-02-02'),(2953,'Fernanda','Navarro','Nuñes','1984-11-02'),(2954,'Ivan','Abasolo','Jiménez','1967-08-18'),(2955,'Fernando','Lopez','Campos','1974-08-23'),(2956,'Marcia','Lobardia','Yañez','1961-08-29'),(2957,'Daniela','Heras','Urbia','2005-12-29'),(2958,'Tomasa','Ibarra','Navarro','1969-12-23'),(2959,'Adan','Flores','Yañez','1980-07-02'),(2960,'Carla','Yañez','Kuri','1992-04-23'),(2961,'Olga','Juarez','Carrasco','1986-11-29'),(2962,'Carla','Kuri','Nuñes','1998-03-21'),(2963,'Kevin','Vazquez','Jiménez','1990-09-19'),(2964,'Hortencia','Gutierréz','Guerrero','1968-12-18'),(2965,'Juana','Cruz','Oropeza','2003-01-08'),(2966,'Carla','Gonzalez','Zurita','1979-12-10'),(2967,'Juana','Amador','Amador','1969-08-19'),(2968,'Tomas','Zurita','Férnandes','2005-06-19'),(2969,'Nora','Guerrero','Dominguez','1965-08-21'),(2970,'Anahi','Duarte','Martinez','1973-11-11'),(2971,'Esmeralda','Juarez','Vazquez','1995-09-19'),(2972,'Omar','Lopez','Lopez','1986-02-06'),(2973,'Ivan','Baez','Ortega','1984-04-08'),(2974,'Perla','Lopez','Férnandes','1993-11-09'),(2975,'Hugo','Torres','Gonzalez','1998-03-10'),(2976,'Ursuala','Duarte','Amador','1988-09-13'),(2977,'Damián','Flores','Torres','1998-02-15'),(2978,'Hugo','Martinez','Vazquez','1980-10-20'),(2979,'Tomasa','Torres','Gutierréz','2001-02-25'),(2980,'Esmeralda','Duarte','Lobardia','1960-03-24'),(2981,'Karen','Duarte','Jiménez','2004-07-13'),(2982,'Marco','Juarez','Kuri','1986-09-12'),(2983,'Benito','Cruz','Vazquez','1986-01-16'),(2984,'Gabriel','Navarro','Guerrero','1991-04-21'),(2985,'Adan','Urbia','Kuri','2004-05-07'),(2986,'Carlos','Yañez','Quiroz','1972-07-22'),(2987,'Kevin','Jiménez','Amador','1977-06-27'),(2988,'Samuel','Heras','Martinez','1969-02-24'),(2989,'Samuel','Abasolo','Ximenes','1985-02-01'),(2990,'Fernando','Lobardia','Urbia','1993-11-21'),(2991,'Fernando','Yañez','Jiménez','1985-09-12'),(2992,'Samuel','Santos','Yañez','1975-05-12'),(2993,'Nestor','Ortega','Flores','1993-09-21'),(2994,'Juana','Heras','Santos','2002-03-10'),(2995,'Juan','Zurita','Santos','1983-04-29'),(2996,'Omar','Ibarra','Cruz','1975-02-26'),(2997,'Berta','Marquez','Kuri','1990-01-11'),(2998,'Ivan','Heras','Zurita','1980-05-14'),(2999,'Luisa','Duarte','Flores','1972-03-03'),(3000,'Kevin','Ibarra','Santos','1997-08-26');
/*!40000 ALTER TABLE `tbb_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_areas`
--

DROP TABLE IF EXISTS `tbc_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_areas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL,
  `Empleado_Responsable_ID` int unsigned NOT NULL,
  `Total_Empleados` int unsigned NOT NULL DEFAULT '0',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Termino` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_areas`
--

LOCK TABLES `tbc_areas` WRITE;
/*!40000 ALTER TABLE `tbc_areas` DISABLE KEYS */;
INSERT INTO `tbc_areas` VALUES (1,'Envios','Unidad de Negocios enfocada en la gestion de los envios de los pedidos pagados realizados por el cliente',0,0,_binary '','2020-01-01 08:00:00',NULL),(2,'Devoluciones','Unidad de negocio enfocada en atender las devoluciones de productos realizadas por los clientes que por defectos o insatisficcion',0,0,_binary '','2020-01-01 08:00:00',NULL),(3,'Almacen','Unidad de negocio enfocada en controlar el inventario existente, controla las entregas desechos y movilidad de los prductos',0,0,_binary '','2020-01-01 08:00:00',NULL),(4,'Empaquetado','Unidad de negocio enfocada en localizar los productos del pedido pagado empaquetar los adecuadamente y entregarlo a la area de envios',0,0,_binary '','2020-01-01 08:00:00',NULL),(5,'Ventas','Unidad de negocio enfocada en controlar y contabilizar la compras realizadas por los clientes',0,0,_binary '','2020-01-01 08:00:00',NULL),(6,'Compras','Unidad de negocio enfocada en gestionar la adquisicion de productos en base al inventario',0,0,_binary '','2020-01-01 08:00:00',NULL),(7,'Mercadotécnia','Unidad de negocio enfocada en posicionar y promover la venta de productos a travez de campañas o promociones para mejorar las ganancias ',0,0,_binary '','2020-01-01 08:00:00',NULL),(8,'Atencion a cliente','Unidad de negocio cuya funcion es mejorar la experiencia del cliente y tomar accion para atender las quejas o denuncias ',0,0,_binary '','2020-01-01 08:00:00',NULL),(9,'Gerencia','Unidad de negocio Destinada a medir la funcionalidad de la empresa, tomando decisiones criticos sobre el negocio',0,0,_binary '','2020-01-01 08:00:00',NULL);
/*!40000 ALTER TABLE `tbc_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_categorias`
--

DROP TABLE IF EXISTS `tbc_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_categorias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Total_productos` int NOT NULL DEFAULT '0',
  `Categoria_Superior_ID` int unsigned DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_categorias_1_idx` (`Categoria_Superior_ID`),
  CONSTRAINT `fk_categorias_1` FOREIGN KEY (`Categoria_Superior_ID`) REFERENCES `tbc_categorias` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_categorias`
--

LOCK TABLES `tbc_categorias` WRITE;
/*!40000 ALTER TABLE `tbc_categorias` DISABLE KEYS */;
INSERT INTO `tbc_categorias` VALUES (1,'Ropa','Amplia coleccion de prendas para toda la familia, estilos y gustos.',0,NULL,_binary '','2024-07-12 15:34:38',NULL),(2,'Elecetronicos','Articulos electronicos para el hogar.',0,NULL,_binary '','2024-07-12 15:34:38',NULL),(3,'Alimentos','Articulos comestibles para toda la familia.',0,NULL,_binary '','2024-07-12 15:34:38',NULL),(4,'Bebidas','Productos bebibles alcoholicos y no alcoholicos.',0,NULL,_binary '','2024-07-12 15:34:38',NULL),(5,'Deportes','Articulos y accesos para diferentes disciplinas deportivas.',0,NULL,_binary '','2024-07-12 15:34:38',NULL),(6,'Muebleria','Diversos productos para los diferentes espacios del hogar.',0,NULL,_binary '','2024-07-12 15:34:38',NULL),(7,'Hombres','Prendas y accesorios para personas mayores de 20 años del genero masculino.',0,1,_binary '','2024-07-12 15:34:38',NULL),(8,'Mujeres','Prendas y accesorios para personas mayores de 20 años del genero femenino.',0,1,_binary '','2024-07-12 15:34:38',NULL),(9,'Niños','Prendas y accesorios de vestimenta para infantes de 3 a 12 años de ambos generos.',0,1,_binary '','2024-07-12 15:34:38',NULL),(10,'Bebes','Prendas y accesoris de vestimenta para infantes de 0 a 3 años de ambos generos.',0,1,_binary '','2024-07-12 15:34:38',NULL),(11,'Jovenes','Prendas y accesoris de vestimenta para infantes de 13 a 19 años de ambos generos.',0,1,_binary '','2024-07-12 15:34:38',NULL),(12,'Oficina','Aparatos electronicos para el trabajo.',0,2,_binary '','2024-07-12 15:34:38',NULL),(13,'Linea blanca','Aparatos electronicos para el desempeños de las actividades del hogar.',0,2,_binary '','2024-07-12 15:34:38',NULL),(14,'Telefonia','Aparatos electronicos para el desempeño de las actividades del hogar.',0,2,_binary '','2024-07-12 15:34:38',NULL),(15,'Ocio','Aparatos enfocados en el cine en casa, gaming y esparcimiento.',0,2,_binary '','2024-07-12 15:34:38',NULL),(16,'Lacteos','Productos elaborados a base de leche de origen animal o vegetal.',0,4,_binary '','2024-07-12 15:34:38',NULL),(17,'Alcoholicas','Bebida con factor embriagante, exclusivos para mayores de edad.',0,4,_binary '','2024-07-12 15:34:38',NULL),(18,'Bebidas saborizantes','Bebidas endulzantes para todas las edades.',0,4,_binary '','2024-07-12 15:34:38',NULL),(19,'Acuaticos','Productos o articulos resistentes y sumergibles al agua.',0,5,_binary '','2024-07-12 15:34:38',NULL),(20,'Invernales','Prendas y accesorios de vestimenta Invernales.',0,4,_binary '','2024-07-12 15:34:38',NULL),(21,'Pesca','Prendas y accesorios Para poder practicar pesca.',0,19,_binary '','2024-07-12 15:34:38',NULL);
/*!40000 ALTER TABLE `tbc_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_departamentos`
--

DROP TABLE IF EXISTS `tbc_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Area_ID` int unsigned NOT NULL,
  `Empleado_ID` int unsigned NOT NULL,
  `Descripcion` text NOT NULL,
  `Total_Empleados` int NOT NULL DEFAULT '0',
  `Tipo` enum('Administrativo','Operativo','Directivo') NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Fecha_Termino` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_areas_1` (`Area_ID`),
  CONSTRAINT `fk_areas_1` FOREIGN KEY (`Area_ID`) REFERENCES `tbc_areas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_departamentos`
--

LOCK TABLES `tbc_departamentos` WRITE;
/*!40000 ALTER TABLE `tbc_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_direccion`
--

DROP TABLE IF EXISTS `tbc_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_direccion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(150) NOT NULL,
  `Calle` varchar(150) NOT NULL,
  `Numero_exterior` varchar(50) NOT NULL,
  `Referencias` text NOT NULL,
  `Colonia` varchar(150) NOT NULL,
  `Codigo_postal` varchar(10) NOT NULL,
  `Localidad` varchar(150) NOT NULL,
  `Estado` varchar(150) NOT NULL,
  `Pais` varchar(150) NOT NULL,
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_actualizacion` datetime DEFAULT NULL,
  `Longitud` decimal(9,6) DEFAULT NULL,
  `Latitud` decimal(9,6) DEFAULT NULL,
  `Tipo` varchar(150) NOT NULL,
  `Cliente_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Cliente_ID` (`Cliente_ID`),
  CONSTRAINT `tbc_direccion_ibfk_1` FOREIGN KEY (`Cliente_ID`) REFERENCES `tbb_clientes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_direccion`
--

LOCK TABLES `tbc_direccion` WRITE;
/*!40000 ALTER TABLE `tbc_direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_garantia`
--

DROP TABLE IF EXISTS `tbc_garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_garantia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `fecha_actualizacion` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_termino` datetime DEFAULT NULL,
  `tipo_garantia` varchar(50) NOT NULL,
  `restricciones` text NOT NULL,
  `direccion_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `direccion_id` (`direccion_id`),
  CONSTRAINT `tbc_garantia_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `tbc_direccion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_garantia`
--

LOCK TABLES `tbc_garantia` WRITE;
/*!40000 ALTER TABLE `tbc_garantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_metodopagos`
--

DROP TABLE IF EXISTS `tbc_metodopagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_metodopagos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NUMERO_CUENTA` varchar(50) DEFAULT NULL,
  `CLAVE_BANCARIA` varchar(20) DEFAULT NULL,
  `INSTITUCION_BANCARIA` varchar(100) DEFAULT NULL,
  `ESTATUS` bit(1) NOT NULL DEFAULT b'1',
  `TIPO` varchar(50) DEFAULT NULL,
  `FECHA_VIGENCIA` datetime DEFAULT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_metodopagos`
--

LOCK TABLES `tbc_metodopagos` WRITE;
/*!40000 ALTER TABLE `tbc_metodopagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_metodopagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_areas_ubicaciones`
--

DROP TABLE IF EXISTS `tbd_areas_ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_areas_ubicaciones` (
  `Area_ID` int unsigned NOT NULL,
  `Direccion_ID` int unsigned NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Area_ID`,`Direccion_ID`),
  CONSTRAINT `fk_area_id_1` FOREIGN KEY (`Area_ID`) REFERENCES `tbc_areas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_areas_ubicaciones`
--

LOCK TABLES `tbd_areas_ubicaciones` WRITE;
/*!40000 ALTER TABLE `tbd_areas_ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_areas_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_detalles_campanias`
--

DROP TABLE IF EXISTS `tbd_detalles_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_detalles_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Campania_ID` int unsigned NOT NULL,
  `Aspecto` varchar(150) NOT NULL,
  `Valor` text NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_campania_1` (`Campania_ID`),
  CONSTRAINT `fk_campania_1` FOREIGN KEY (`Campania_ID`) REFERENCES `tbb_campanias` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_detalles_campanias`
--

LOCK TABLES `tbd_detalles_campanias` WRITE;
/*!40000 ALTER TABLE `tbd_detalles_campanias` DISABLE KEYS */;
INSERT INTO `tbd_detalles_campanias` VALUES (1,1,'Marca','SHEIN',_binary '','2024-07-12 15:34:37',NULL),(2,1,'Duracion','3 meses',_binary '','2024-07-12 15:34:37',NULL),(3,1,'Productos','Ropa',_binary '','2024-07-12 15:34:37',NULL),(4,1,'Publico objetivo','Toda la familia',_binary '','2024-07-12 15:34:37',NULL),(5,2,'Marcas','Varias',_binary '','2024-07-12 15:34:37',NULL),(6,2,'Duracion','10 dias',_binary '','2024-07-12 15:34:37',NULL),(7,2,'Productos','Smarthphones, smartwatches, audifonos, consolas de videojuegos',_binary '','2024-07-12 15:34:37',NULL),(8,2,'Publico objetivo','Padres',_binary '','2024-07-12 15:34:37',NULL),(9,2,'Metrica','Ventas',_binary '','2024-07-12 15:34:37',NULL),(10,3,'Marcas','Varias',_binary '','2024-07-12 15:34:37',NULL),(11,3,'Duracion','14 dias',_binary '','2024-07-12 15:34:37',NULL),(12,3,'Productos','Todos los productos',_binary '','2024-07-12 15:34:37',NULL),(13,3,'Publico Objetivo','Toda la familia',_binary '','2024-07-12 15:34:37',NULL),(14,3,'Amplitud','Nacional',_binary '','2024-07-12 15:34:37',NULL),(15,3,'Origen de productos','Importaciones',_binary '','2024-07-12 15:34:37',NULL);
/*!40000 ALTER TABLE `tbd_detalles_campanias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_inventarios`
--

DROP TABLE IF EXISTS `tbd_inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventarios` (
  `Bodega_ID` int unsigned NOT NULL,
  `Producto_ID` int unsigned NOT NULL,
  `Cantidad_Disponible` int NOT NULL DEFAULT '0',
  `Total_Devoluciones` int NOT NULL DEFAULT '0',
  `Estatus` enum('Descontinuado','Activo','Restringido','Agotado','Poca Existencia') NOT NULL DEFAULT 'Activo',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Bodega_ID`,`Producto_ID`),
  CONSTRAINT `fk_bodega_1` FOREIGN KEY (`Bodega_ID`) REFERENCES `tbb_bodegas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_inventarios`
--

LOCK TABLES `tbd_inventarios` WRITE;
/*!40000 ALTER TABLE `tbd_inventarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_motivos_cancelaciones`
--

DROP TABLE IF EXISTS `tbd_motivos_cancelaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_motivos_cancelaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cancelacion_ID` int unsigned NOT NULL,
  `Motivo` varchar(50) NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_cancelacion_1` (`Cancelacion_ID`),
  CONSTRAINT `fk_cancelacion_1` FOREIGN KEY (`Cancelacion_ID`) REFERENCES `tbb_cancelaciones` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_motivos_cancelaciones`
--

LOCK TABLES `tbd_motivos_cancelaciones` WRITE;
/*!40000 ALTER TABLE `tbd_motivos_cancelaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_motivos_cancelaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Tabla` varchar(45) NOT NULL,
  `Opercion` enum('Create','Read','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Usuario` varchar(100) NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
INSERT INTO `tbi_bitacora` VALUES (1,'tbb_bodegas','Create','Se a registrado una nueva bodega','root@localhost',_binary '','2024-07-12 17:21:32'),(2,'tbb_bodegas','Create','Se a registrado una nueva bodega con el ID:6con los siguientes datos: \nNOMBRE:QROO-CANCÚN\nEMPLEADO RESPONSABLE:0\nCAPACIDDAD:75000 metros cuadrados\nTOTAL_EMPLEADOS:0\nESTATUS:Activa\nFECHA INICIO:2024-07-12 17:49:54\nFECHA TERMINO:\n','root@localhost',_binary '','2024-07-12 17:51:59'),(4,'tbb_bodegas','Delete','Se a registrado una nueva bodega con el ID:7con los siguientes datos: \nNOMBRE:QROO-CANCÚN\nEMPLEADO RESPONSABLE:0\nCAPACIDDAD:75000 metros cuadrados\nTOTAL_EMPLEADOS:0\nESTATUS:Activa\nFECHA INICIO:2024-07-12 17:49:54\nFECHA TERMINO:\nFECHA ACTUALIZACIÓN:','root@localhost',_binary '','2024-07-12 18:19:28'),(5,'tbb_bodegas','Update','Se han modificado los datos de la bodega con los siguientes cambios:\nID6->6\nNOMBRE:GDL-Centro->GDL-Centro\nEMPLEADO RESPONSABLE:0->0\nCAPACIDDAD:45000 mestros cudrados->45000 mestros cudrados\nTOTAL_EMPLEADOS:0->70\nESTATUS:Activa->En remodelacion\nFECHA INICIO:2024-07-12 17:20:05->2024-07-12 17:20:05\nFECHA TERMINO:->\nFECHA ACTUALIZACIÓN:->2024-07-12 18:38:18','root@localhost',_binary '','2024-07-12 18:38:18'),(6,'tbb_bodegas','Delete','Se ha eliminado una bodega con el ID:4con los siguientes datos: \nNOMBRE:MTY - Este\nEMPLEADO RESPONSABLE:0\nCAPACIDDAD:10000 metros cuadrados\nTOTAL_EMPLEADOS:0\nESTATUS:Activa\nFECHA INICIO:2021-01-01 20:00:00\nFECHA TERMINO:\nFECHA ACTUALIZACIÓN:','root@localhost',_binary '','2024-07-12 18:42:37');
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_comercio_electronico_210439'
--

--
-- Dumping routines for database 'bd_comercio_electronico_210439'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_apellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_apellido`() RETURNS varchar(80) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  RETURN elt(fn_numero_aleatorio_rango(1,40),
  "Abasolo","Baez","Carrasco","Duarte","Espinoza",
  "Férnandes","Gutierréz","Huerta","Ibañez","Juarez",
  "Kuri","Lopez","Martinez","Navarro","Oropeza",
  "Quiroz","Ramirez","Santos","Urbia","Vazquez",
  "Ximenes","Yañez","Zurita","Amador","Barrios",
  "Campos","Dominguez","Eslava","Flores","Guerrero",
  "Gonzalez","Heras","Ibarra","Jiménez","Lobardia",
  "Marquez","Nuñes","Ortega","Cruz","Torres");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fecha_nacimiento`(fecha_inicio date , fecha_fin date) RETURNS date
    DETERMINISTIC
BEGIN
  declare min_dias int;
  declare max_dias int;
  declare dias_aleatorios int;
  declare fecha_aleatoria date;
  
  
  set min_dias = datediff(fecha_inicio, "1900-10-01");
  set max_dias = datediff(fecha_fin, "1900-01-01");
  set dias_aleatorios =fn_numero_aleatorio_rango(min_dias,max_dias);
  set fecha_aleatoria = date_add('1900-01-01', INTERVAL dias_aleatorios DAY);
  
  
RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_compuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_compuesto`(genero char (1)) RETURNS varchar(80) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  declare nombre1 varchar (40);
  declare nombre2 varchar(40);
  set nombre1 = fn_genera_nombre_simple(genero);
  
  while nombre1 =nombre2 or nombre2 is null do
  set nombre2= fn_genera_nombre_simple(genero);
  end while;
  
RETURN concat_ws(" ", nombre1,nombre2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_simple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_simple`(genero char(1)) RETURNS varchar(80) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  declare nombre varchar(80);
  if genero = 'M' then 
  set nombre =elt(fn_numero_aleatorio_rango(1,20),
  "Adan","Benito","Carlos","Damián","Emerson","Fernando","Gabriel","Hugo",
  "Ivan","Juan","Kevin","Luis","Marco","Nestor","Omar","Pedro",
  "Ramiro","Samuel","Tomas","Uruel");
  else
  set nombre=elt(fn_numero_aleatorio_rango(1,20),
  "Anahi","Berta","Carla","Daniela","Esmeralda","Fernanda","Gabriela","Hortencia",
  "Ivonne","Juana","Karen","Luisa","Marcia","Nora","Olga","Perla",
  "Ramona","Samanta","Tomasa","Ursuala");
  end if;
RETURN nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleaterio_rango` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleaterio_rango`(limite_inferior int, limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN
Declare numero_generado int
default floor(Rand()*(limite_superior-limite_inferior+1)+limite_inferior);
RETURN numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleaterio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleaterio_rangos`(limit_inferior int, limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN
Declare numero_generado int
default floor(Rand()*(limite_superior-limite_inferior+1)+limite_inferior);
RETURN numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rango` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rango`(limite_inferior int, limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN
Declare numero_generado int
default floor(Rand()*(limite_superior-limite_inferior+1)+limite_inferior);
RETURN numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `saluda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `saluda`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
   declare mensaje varchar(50); -- DEclaramos una variable
   Set mensaje= ("Hola");
RETURN  Mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `saluda_hora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `saluda_hora`(nombre varchar(50),hora time) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
 declare saludo Varchar(50);
 if hora > "06:00:00" and hora < "11:59:59" then
 set saludo ="Buenos dias";
 
 elseif hora > "12:00:00" and hora < "18:00:00" then
 set  saludo ="Buenas tardees";
 
 else 
 set saludo ="Buenas noches";
 
 end if;
 
 set saludo=CONCAT_WS(",",saludo, nombre);
 
 
RETURN saludo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `saluda_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `saluda_nombre`(nombre varchar(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
   declare mensaje varchar(50); -- DEclaramos una variable
   Set mensaje= concat_ws(",","Hola", nombre);
RETURN  Mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserta_personas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserta_personas`(Cantidad int)
BEGIN

declare i int default 0;
declare genero char (1);
while i < cantidad do 
set genero = ELT(fn_numero_aleatorio_rango(1,2),"M","F");
INSERT INTO tbb_personas
values(Default,
fn_genera_nombre_simple(genero),
fn_genera_apellido(),
fn_genera_apellido(),
fn_genera_fecha_nacimiento("1960-01-01","2005-12-31"));
set i = i+1;
end while;
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

-- Dump completed on 2024-07-18 14:40:20

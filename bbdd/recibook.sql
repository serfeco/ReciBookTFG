CREATE DATABASE  IF NOT EXISTS `recibook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recibook`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: recibook
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `escandallo_ingrediente`
--

DROP TABLE IF EXISTS `escandallo_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escandallo_ingrediente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` float DEFAULT NULL,
  `precio_kg` float DEFAULT NULL,
  `precio_racion` float DEFAULT NULL,
  `ud_medida` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `id_escandallo` int DEFAULT NULL,
  `id_ingrediente` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_escandallo` (`id_escandallo`),
  CONSTRAINT `escandallo_ingrediente_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `escandallo_ingrediente_ibfk_2` FOREIGN KEY (`id_escandallo`) REFERENCES `escandallos` (`id_escandallo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escandallo_ingrediente`
--

LOCK TABLES `escandallo_ingrediente` WRITE;
/*!40000 ALTER TABLE `escandallo_ingrediente` DISABLE KEYS */;
INSERT INTO `escandallo_ingrediente` VALUES (1,100,7,0.7,'gr',NULL,441),(2,10,9,0.09,'ml',NULL,8),(3,100,2.1,0.3,'gr',NULL,745),(4,0,1,0.1,'al gusto',NULL,21),(5,200,9,3,'gr',NULL,119),(6,200,8,0.7,'gr',NULL,437),(7,1,0,0.4,'barra',NULL,612),(8,200,8,0.7,'gr',NULL,437),(9,1,0,0.4,'barra',NULL,612),(10,100,3,0.5,'gr',NULL,467),(11,2,2,0.2,'lonchas',NULL,672),(13,2,5,3,'gr',NULL,1),(14,2,5,3,'gr',NULL,1),(15,2,5,3,'gr',NULL,1),(16,2,5,3,'gr',NULL,1),(19,2,5,3,'gr',303,1),(20,1,4,0.5,'UNIDAD',303,444),(21,2,4,0.5,'lonchas',353,441),(22,1,0,0.4,'barra',353,612),(23,10,11,0.2,'ml',353,8),(24,20,2,0.4,'ml',353,748),(25,4,2,5,'100',402,614);
/*!40000 ALTER TABLE `escandallo_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escandallos`
--

DROP TABLE IF EXISTS `escandallos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escandallos` (
  `id_escandallo` int NOT NULL AUTO_INCREMENT,
  `coste` float DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `num_raciones` int DEFAULT NULL,
  `id_usuario` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `escandallo_ingrediente` int DEFAULT NULL,
  PRIMARY KEY (`id_escandallo`),
  KEY `id_usuario` (`id_usuario`),
  KEY `escandallo_ingrediente` (`escandallo_ingrediente`),
  CONSTRAINT `escandallos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `escandallos_ibfk_2` FOREIGN KEY (`escandallo_ingrediente`) REFERENCES `escandallo_ingrediente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escandallos`
--

LOCK TABLES `escandallos` WRITE;
/*!40000 ALTER TABLE `escandallos` DISABLE KEYS */;
INSERT INTO `escandallos` VALUES (303,5,'Prueba',2,'serfeco21@gmail.com',NULL),(353,1.5,'Bocata Jamón',1,'serfeco21@gmail.com',NULL),(402,0,'patatas al ali oli',2,'franfrancg@gmail.com',NULL);
/*!40000 ALTER TABLE `escandallos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escandallos_seq`
--

DROP TABLE IF EXISTS `escandallos_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escandallos_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escandallos_seq`
--

LOCK TABLES `escandallos_seq` WRITE;
/*!40000 ALTER TABLE `escandallos_seq` DISABLE KEYS */;
INSERT INTO `escandallos_seq` VALUES (551);
/*!40000 ALTER TABLE `escandallos_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoja_pedido_ingrediente`
--

DROP TABLE IF EXISTS `hoja_pedido_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoja_pedido_ingrediente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` float DEFAULT NULL,
  `precio_total` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `ud_medida` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `id_hoja_pedido` int DEFAULT NULL,
  `id_ingrediente` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_hoja_pedido` (`id_hoja_pedido`),
  CONSTRAINT `hoja_pedido_ingrediente_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `hoja_pedido_ingrediente_ibfk_2` FOREIGN KEY (`id_hoja_pedido`) REFERENCES `hojas_pedido` (`id_hoja_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoja_pedido_ingrediente`
--

LOCK TABLES `hoja_pedido_ingrediente` WRITE;
/*!40000 ALTER TABLE `hoja_pedido_ingrediente` DISABLE KEYS */;
INSERT INTO `hoja_pedido_ingrediente` VALUES (3,10,3,2,'gr',3,640);
/*!40000 ALTER TABLE `hoja_pedido_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_pedido`
--

DROP TABLE IF EXISTS `hojas_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_pedido` (
  `id_hoja_pedido` int NOT NULL AUTO_INCREMENT,
  `completado` bit(1) DEFAULT NULL,
  `email_proveedor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `id_local` int DEFAULT NULL,
  `id_usuario` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `hoja_pedido_ingrediente` int DEFAULT NULL,
  PRIMARY KEY (`id_hoja_pedido`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_local` (`id_local`),
  KEY `hoja_pedido_ingrediente` (`hoja_pedido_ingrediente`),
  CONSTRAINT `hojas_pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `hojas_pedido_ibfk_2` FOREIGN KEY (`id_local`) REFERENCES `locales` (`id_local`),
  CONSTRAINT `hojas_pedido_ibfk_3` FOREIGN KEY (`hoja_pedido_ingrediente`) REFERENCES `hoja_pedido_ingrediente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_pedido`
--

LOCK TABLES `hojas_pedido` WRITE;
/*!40000 ALTER TABLE `hojas_pedido` DISABLE KEYS */;
INSERT INTO `hojas_pedido` VALUES (3,_binary '\0','proveedor@gmail.com',NULL,'2023-06-14',2,'serfeco21@gmail.com',NULL),(52,_binary '','proveedor@gmail.com','2023-06-12','2023-06-16',1,'serfeco21@gmail.com',NULL);
/*!40000 ALTER TABLE `hojas_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_pedido_seq`
--

DROP TABLE IF EXISTS `hojas_pedido_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_pedido_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_pedido_seq`
--

LOCK TABLES `hojas_pedido_seq` WRITE;
/*!40000 ALTER TABLE `hojas_pedido_seq` DISABLE KEYS */;
INSERT INTO `hojas_pedido_seq` VALUES (151);
/*!40000 ALTER TABLE `hojas_pedido_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nombre_ingrediente` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=756 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'Acelga'),(2,'Aceitunas'),(3,'Aceitunas negras'),(4,'Aceitunas verdes'),(5,'Aceite de canola'),(6,'Aceite de coco'),(7,'Aceite de girasol'),(8,'Aceite de oliva'),(9,'Aceite de sésamo'),(10,'Aceite de trufa'),(11,'Aceituna'),(12,'Achicoria'),(13,'Adobo'),(14,'Agar-agar'),(15,'Agave'),(16,'Agua'),(17,'Agua de coco'),(18,'Agua de rosas'),(19,'Agua mineral'),(20,'Ajo'),(21,'Ajo en polvo'),(22,'Ajo negro'),(23,'Ajo picado'),(24,'Albahaca'),(25,'Albaricoque'),(26,'Albóndigas'),(27,'Alcachofa'),(28,'Alcaparras'),(29,'Alcaravea'),(30,'Alcayota'),(31,'Alcornoque'),(32,'Alga agar-agar'),(33,'Alga nori'),(34,'Algas'),(35,'Algodón de azúcar'),(36,'Alitas de pollo'),(37,'Almejas'),(38,'Almendras'),(39,'Aloe vera'),(40,'Amaranto'),(41,'Amaranto inflado'),(42,'Amaretti'),(43,'Anacardos'),(44,'Anchoas'),(45,'Anguila'),(46,'Anís'),(47,'Anticuchos'),(48,'Apio'),(49,'Apio nabo'),(50,'Arándanos'),(51,'Arándanos rojos'),(52,'Arándanos secos'),(53,'Arroz'),(54,'Arroz con leche'),(55,'Arroz inflado'),(56,'Arroz inteal'),(57,'Arroz rojo'),(58,'Arroz salvaje'),(59,'Arroz blanco'),(60,'Arvejas'),(61,'Asado'),(62,'Aspic'),(63,'Atún'),(64,'Auyama'),(65,'Avena'),(66,'Azafrán'),(67,'Azúcar'),(68,'Azúcar glass'),(69,'Azúcar mascabado'),(70,'Azúcar moreno'),(71,'Azúcar rubia'),(72,'Bacalao'),(73,'Berenjena'),(74,'Brocoli'),(75,'Batata'),(76,'Bok choy'),(77,'Bayas de enebro'),(78,'Bayas de Goji'),(79,'Berros'),(80,'Bimi'),(81,'Boletus'),(82,'Bistec'),(83,'Brioche'),(84,'Buey'),(85,'Bue'),(86,'Berenjena blanca'),(87,'Bolsa de te'),(88,'Bebida de soja'),(89,'Bimi baby'),(90,'Buey de mar'),(91,'Barquillo'),(92,'Bimi fresco'),(93,'Boquerones'),(94,'Bayas de sauco'),(95,'Bollito de pan'),(96,'Buey Wagyu'),(97,'Brocheta'),(98,'Bacon'),(99,'Bacalao fresco'),(100,'Bagel'),(101,'Batido de chocolate'),(102,'Berberechos'),(103,'Besugo'),(104,'Bizcocho'),(105,'Boletus edulis'),(106,'Borrajas'),(107,'Bovril'),(108,'Brocoli baby'),(109,'Butifarra'),(110,'Barquillo de helado'),(111,'Batido de vainilla'),(112,'Bebida de avena'),(113,'Black pudding'),(114,'Boquerones en vinagre'),(115,'Cacahuetes'),(116,'Café'),(117,'Calabacín'),(118,'Calabaza'),(119,'Calamares'),(120,'Camarones'),(121,'Camote'),(122,'Canelagusto'),(123,'Canejo'),(124,'Carambola'),(125,'Cebada'),(126,'Cebolla'),(127,'Cebolla verde'),(128,'Cebollino'),(129,'Cereales'),(130,'Cereza'),(131,'Cerveza'),(132,'Champiñones'),(133,'Cheddar'),(134,'Chía'),(135,'Chicharos'),(136,'Chiles'),(137,'Chocolate'),(138,'Cilantrogusto'),(139,'Cítricos'),(140,'Coco'),(141,'Coles de Bruselas'),(142,'Coliflor'),(143,'Cominogusto'),(144,'Concentrado de tomate'),(145,'Condimentos'),(146,'Conejo'),(147,'Cordero'),(148,'Crema agria'),(149,'Crema de cacahuete'),(150,'Cúrcuma'),(151,'Curry'),(152,'Cuscús'),(153,'Custard'),(154,'Cebada perlada'),(155,'Chalotes'),(156,'Callos'),(157,'Camote morado'),(158,'Carbonato'),(159,'Carne seca'),(160,'Cebolla caramelizada'),(161,'Cebolla confitada'),(162,'Cebolla frita'),(163,'Cebolla morada'),(164,'Cebolla perla'),(165,'Cebolla roja'),(166,'Chayote'),(167,'Chía blanca'),(168,'Chía negra'),(169,'Chicharos congelados'),(170,'Chiles en lata'),(171,'Chiles jalapeños'),(172,'Chiles poblanos'),(173,'Chiles serranos'),(174,'Chimichurri'),(175,'Datiles'),(176,'Diente de ajo'),(177,'Dill'),(178,'Durazno'),(179,'Dulce de leche'),(180,'Durazno seco'),(181,'Dorado'),(182,'Daikon'),(183,'Delicia de leche'),(184,'Donuts'),(185,'Dulce de batata'),(186,'Dulce de membrillo'),(187,'Dulce de leche en polvo'),(188,'Dulce de leche repostero'),(189,'Dragon fruit'),(190,'Diente de leon'),(191,'Durazno en almíbar'),(192,'Dashi'),(193,'Dulse'),(194,'Dulce de tamarindo'),(195,'Datiles secos'),(196,'Diente de dragón'),(197,'Datiles frescos'),(198,'Dorsay'),(199,'Dulce de mora'),(200,'Dulce de frutilla'),(201,'Dulce de zapallo'),(202,'Dulce de leche light'),(203,'Dijon'),(204,'Dorada'),(205,'Datiles medjoul'),(206,'Dulce de cereza'),(207,'Dulce de cayote'),(208,'Datiles deshidratados'),(209,'Dulce de almendras'),(210,'Dulce de guayaba'),(211,'Dulce de arándanos'),(212,'Dulce de manzana'),(213,'Dulce de naranja'),(214,'Dulce de leche casero'),(215,'Dulce de frambuesa'),(216,'Durazno enlatado'),(217,'Dulce de higo'),(218,'Dulce de leche vegano'),(219,'Dulce de membrillo light'),(220,'Dulce de leche sin azúcar'),(221,'Endivia'),(222,'Escarola'),(223,'Edamame'),(224,'Endrina'),(225,'Espárragos'),(226,'Espelta'),(227,'Espinaca'),(228,'Espino blanco'),(229,'Espino amarillo'),(230,'Espino cerval'),(231,'Espino negro'),(232,'Espino blanco en polvo'),(233,'Espárragos trigueros'),(234,'Especias chinas'),(235,'Especias garam masala'),(236,'Especias ras el hanout'),(237,'Espuma de pollo'),(238,'Espuma de vainilla'),(239,'Espuma de yogur'),(240,'Esponja de chocolate'),(241,'Estevia'),(242,'Estofado de ternera'),(243,'Estragón'),(244,'Estragón seco'),(245,'Estragón fresco'),(246,'Esturión'),(247,'Estrella de anís'),(248,'Estrella de badiana'),(249,'Estrella de mar'),(250,'Eucalipto'),(251,'Eucalipto en hojas'),(252,'Eucalipto en aceite esencial'),(253,'Eucalipto en infusión'),(254,'Eufrasia'),(255,'Eugenia'),(256,'Eugenia en bayas'),(257,'Evaporadores'),(258,'Exótica'),(259,'Exquisito'),(260,'Extensión de vainilla'),(261,'Extracto de agave'),(262,'Extracto de algarrobo'),(263,'Extracto de almendra'),(264,'Extracto de anís'),(265,'Fideos'),(266,'Fajitas'),(267,'Falafel'),(268,'Farro'),(269,'Fécula de maíz'),(270,'Feta'),(271,'Feijoa'),(272,'Fideos de arroz'),(273,'Fideos soba'),(274,'Fideos udon'),(275,'Figs'),(276,'Filete de res'),(277,'Filete de cerdo'),(278,'Flan'),(279,'Flatbread'),(280,'Flounder'),(281,'Flores de calabaza'),(282,'Flour'),(283,'Focaccia'),(284,'Fondant'),(285,'Fondue'),(286,'Fortaleza'),(287,'Fourme d\'Ambert'),(288,'Fowl'),(289,'Frambuesa'),(290,'Frangipane'),(291,'Frangelico'),(292,'Frappe'),(293,'Leche'),(294,'Freesias'),(295,'Fresón'),(296,'Frente de cerdo'),(297,'Frente de res'),(298,'Frijoles'),(299,'Frijoles neos'),(300,'Frijoles pintos'),(301,'Frisée'),(302,'Fructose'),(303,'Frutas de la pasión'),(304,'Fudge'),(305,'Fuente de chocolate'),(306,'Fuet'),(307,'Funghi porcini'),(308,'Fungi'),(309,'Fusilli'),(310,'Fuyu'),(311,'Fideos de huevo'),(312,'Fideos de huevo chinos'),(313,'Fideos de arroz inteales'),(314,'Garbanzos'),(315,'Garam masala'),(316,'Gelatina'),(317,'Ginebra'),(318,'Gofio'),(319,'Gorgonzola'),(320,'Granada'),(321,'Guacamole'),(322,'Guayaba'),(323,'Guindilla'),(324,'Galletas'),(325,'Gamba'),(326,'Garambulla'),(327,'Garrafalitros'),(328,'Gazpacho'),(329,'Gel'),(330,'Germinados'),(331,'Ghee'),(332,'Gin tonic'),(333,'Ginebrón'),(334,'Gofre'),(335,'Guacamayo'),(336,'Guajillo'),(337,'Guama'),(338,'Guanciale'),(339,'Guaraná'),(340,'Guarrillo'),(341,'Guayabate'),(342,'Guindas'),(343,'Gulas'),(344,'Gumbo'),(345,'Gusanitos'),(346,'Guacamole suave'),(347,'Harina'),(348,'Huevo'),(349,'Hamburguesa'),(350,'Habas'),(351,'Helado'),(352,'Hinojo'),(353,'Hierbabuena'),(354,'Hojas de parra'),(355,'Hojaldre'),(356,'Hongos'),(357,'Hummus'),(358,'Hueso de jamón'),(359,'Hueso de ternera'),(360,'Huevo de codorniz'),(361,'Huevas de '),(362,'Hígado de cerdo'),(363,'Hígado de pollo'),(364,'Hígado de ternera'),(365,'Harina de avena'),(366,'Harina de almendras'),(367,'Harina de arroz'),(368,'Harina de garbanzos'),(369,'Harina de maíz'),(370,'Harina de trigo'),(371,'Harina de trigo sarraceno'),(372,'Harina integral'),(373,'Harina leudante'),(374,'Harina de coco'),(375,'Harina de tapioca'),(376,'Harina de centeno'),(377,'Harina de quinoa'),(378,'Harina de espelta'),(379,'Harina de semillas de lino'),(380,'Harina de semillas de girasol'),(381,'Harina de semillas de chía'),(382,'Hinojo fresco'),(383,'Hojas de lima'),(384,'Hojas de cilantro'),(385,'Hojas de menta'),(386,'Hojas de albahaca'),(387,'Hojas de hierbabuena'),(388,'Hojas de perejil'),(389,'Hojas de salvia'),(390,'Hojas de romero'),(391,'Hojas de tomillo'),(392,'Hojas de laurel'),(393,'Hojas de limonero'),(394,'Hojas de algarrobo'),(395,'Hojas de lechuga'),(396,'Hojas de espinaca'),(397,'Hojas de rúcula'),(398,'Hojas de endivia'),(399,'Hojas de achicoria'),(400,'Hojas de apio'),(401,'Hojas de berza'),(402,'Hojas de col'),(403,'Hojas de repollo'),(404,'Hojas de brócoli'),(405,'Hojas de acelga'),(406,'Hojas de borraja'),(407,'Hojas de escarola'),(408,'Hojas de kale'),(409,'Hojas de mostaza'),(410,'Hojas de ortiga'),(411,'Hojas de rábano'),(412,'Hojas de remolacha'),(413,'Hojas de zanahoria'),(414,'Hojas de nabo'),(415,'Hojas de col rizada'),(416,'Hojas de espirulina'),(417,'Hojas de diente de león'),(418,'Hojas de alcachofa'),(419,'Hojas de espárragos'),(420,'Hojas de cardo'),(421,'Hojas de trébol'),(422,'Hojas de higuera'),(423,'Hojas de vid'),(424,'Hojas de guanábana'),(425,'Hojas de yuca'),(426,'Hojas de té'),(427,'Hojas de mate'),(428,'Hojas de eucalipto'),(429,'Hojas de laurel'),(430,'Iberico'),(431,'Jabalí'),(432,'Jalea real'),(433,'Jamón de York'),(434,'Jicama'),(435,'Jarabe de arce'),(436,'Jarabe de maíz'),(437,'Jamón'),(438,'Jengibre'),(439,'Jalapeño'),(440,'Judías'),(441,'Jamón serrano'),(442,'Jitomate'),(443,'Jerez'),(444,'Kiwi'),(445,'Ketchup'),(446,'Lacón'),(447,'Lentejas'),(448,'Lomo'),(449,'Lubina'),(450,'Lechuga'),(451,'Langostinos'),(452,'Lenguado'),(453,'Limón'),(454,'Langosta'),(455,'Lomos de bacalao'),(456,'Leche'),(457,'Lomo ibérico'),(458,'Lichis'),(459,'Longaniza'),(460,'Láminas de pimiento'),(461,'Lechazo'),(462,'Lomos de merluza'),(463,'Lardones'),(464,'Limanda'),(465,'Lechecillas de cordero'),(466,'Lenguas de cordero'),(467,'Lomo de cerdo'),(468,'Langosta de río'),(469,'Langostinos tigre'),(470,'Lomo de atún'),(471,'Lechecillas de cabrito'),(472,'Lomo embuchado'),(473,'Láminas de setas'),(474,'Láminas de queso'),(475,'Lomos de salmón'),(476,'Láminas de berenjena'),(477,'Lomo de ternera'),(478,'Lomo de buey'),(479,'Lomitos de cerdo'),(480,'Lentejas'),(481,'Lengua de vaca'),(482,'Lenguas de cerdo'),(483,'Láminas de calabacín'),(484,'Lomos de lubina'),(485,'Lenguas de bacalao'),(486,'Langostinos'),(487,'Lengua de ternera'),(488,'Láminas de tomate'),(489,'Lenguado'),(490,'Láminas de zanahoria'),(491,'Magro de cerdo'),(492,'Merluza'),(493,'Manzana'),(494,'Morcilla'),(495,'Melón'),(496,'Mejillones'),(497,'Miel'),(498,'Melocotón'),(499,'Mantequilla'),(500,'Mermelada'),(501,'Macarrones'),(502,'Mahonesa'),(503,'Manteca'),(504,'Masa madre'),(505,'Morcón'),(506,'Membrillo'),(507,'Moras'),(508,'Mermelada de fresa'),(509,'Masa de hojaldre'),(510,'Morcilla de Burgos'),(511,'Mozzarella'),(512,'Mantequilla de maní'),(513,'Mostaza'),(514,'Mollejas'),(515,'Miga de pan'),(516,'Miel de abeja'),(517,'Mantequilla clarificada'),(518,'Miga de pan rallado'),(519,'Magdalenas'),(520,'Migas'),(521,'Mermelada de naranja'),(522,'Menta'),(523,'Muesli'),(524,'Melaza'),(525,'Mantecados'),(526,'Melocotón en almíbar'),(527,'Morcilla de cebolla'),(528,'Morcilla de arroz'),(529,'Mostachones'),(530,'Maní'),(531,'Mijo'),(532,'Mojito'),(533,'Mortadela'),(534,'Mermelada de arándanos'),(535,'Mahi-mahi'),(536,'Magdalenas de chocolate'),(537,'Manzanas asadas'),(538,'Mermelada de higos'),(539,'Masa de pizza'),(540,'Morcilla de León'),(541,'Mora'),(542,'Miel de caña'),(543,'Mazapán'),(544,'Manzanas caramelizadas'),(545,'Mermelada de melocotón'),(546,'Mozzarella de búfala'),(547,'Morcilla de Ronda'),(548,'Mousse de mango'),(549,'Mantequilla de cacahuete'),(550,'Mermelada de pera'),(551,'Muslos de pollo'),(552,'Miga de pan integral'),(553,'Milhojas'),(554,'Mantequilla de almendra'),(555,'Mermelada de frambuesa'),(556,'Mora silvestre'),(557,'Manteca de cerdo'),(558,'Mejillones en escabeche'),(559,'Migas de pastor'),(560,'Melocotones en almíbar'),(561,'Magret de pato'),(562,'Mermelada de grosella'),(563,'Masa brisa'),(564,'Morro de cerdo'),(565,'Mozzarella fresca'),(566,'Membrillo en almíbar'),(567,'Morcilla de Burgos'),(568,'Melocotones'),(569,'Mousse de pistacho'),(570,'Mermelada de albaricoque'),(571,'Magdalenas caseras'),(572,'Mostaza Dijon'),(573,'Morcilla de Aranda'),(574,'Manteca colorá'),(575,'Mermelada de ciruela'),(576,'Manzanas reinetas'),(577,'Mousse de avellana'),(578,'Mermelada de tomate'),(579,'Mantequilla sin sal'),(580,'Naranja'),(581,'Nueces'),(582,'Nabo'),(583,'Níspero'),(584,'Nata'),(585,'Nabo blanco'),(586,'Nueces de macadamia'),(587,'Nectarina'),(588,'Natillas'),(589,'Nopal'),(590,'Nabo rojo'),(591,'Nísperos en almíbar'),(592,'Níscalos'),(593,'Nécoras'),(594,'Noodles'),(595,'Néctar de frutas'),(596,'Nata líquida'),(597,'Nata para cocinar'),(598,'Ostras'),(599,'Orégano'),(600,'Olivas'),(601,'Orejones'),(602,'Obleas'),(603,'Obleas de barquillo'),(604,'Oca'),(605,'Orujo'),(606,'Obleas de arroz'),(607,'Oreja de cerdo'),(608,'Obleas de maíz'),(609,'Orujo blanco'),(610,'Obleas de chocolate'),(611,'Orujo de café'),(612,'Pan'),(613,'Pimientos'),(614,'Patatas'),(615,'Pollo'),(616,'Pera'),(617,'Piña'),(618,'Puerro'),(619,'Pavo'),(620,'Pepino'),(621,'Pasas'),(622,'Piñones'),(623,'Pomelo'),(624,'Pimientos de Padrón'),(625,'Pan integral'),(626,'Pechuga de pollo'),(627,'Pulpo'),(628,'Pan de centeno'),(629,'Piña colada'),(630,'Pollo'),(631,'Patatas'),(632,'Pargo'),(633,'Pargo rojo'),(634,'Palomitas de maíz'),(635,'Pasta'),(636,'Piña natural'),(637,'Panceta'),(638,'Pechuga de pavo'),(639,'Pimientos rojos'),(640,'Pan de molde'),(641,'Pan rallado'),(642,'Pepinillos en vinagre'),(643,'Pan integral de centeno'),(644,'Panceta ibérica'),(645,'Pimientos verdes'),(646,'Palta'),(647,'Paté'),(648,'Pan de ajo'),(649,'Piña en almíbar'),(650,'Pimientos del piquillo'),(651,'Pasta fresca'),(652,'Pan de espelta'),(653,'Panceta de cerdo'),(654,'Piñones tostados'),(655,'Papaya'),(656,'Pan de trigo'),(657,'Panceta ahumada'),(658,'Piña en rodajas'),(659,'Paté de foie'),(660,'Pepinillos agridulces'),(661,'Pimientos de colores'),(662,'Panna cotta'),(663,'Pan de cebada'),(664,'Piña deshidratada'),(665,'Pan de centeno integral'),(666,'Pargo al horno con patatas'),(667,'Pato'),(668,'Piña en conserva'),(669,'Pan de molde integral'),(670,'Piña en lata'),(671,'Pan de avena'),(672,'Queso'),(673,'Queso de cabra'),(674,'Queso manchego'),(675,'Queso fresco'),(676,'Quinoa'),(677,'Quiche'),(678,'Quisquillas'),(679,'Queso azul'),(680,'Queso de bola'),(681,'Queso curado'),(682,'Queso rallado'),(683,'Queso de oveja'),(684,'Queso de untar'),(685,'Queso de Burgos'),(686,'Queso de Tetilla'),(687,'Queso Parmesano'),(688,'Queso Gouda'),(689,'Queso de tetilla'),(690,'Rabas'),(691,'Rabo de toro'),(692,'Ralladura de limón'),(693,'Ralladura de naranja'),(694,'Redondo de ternera'),(695,'Refresco'),(696,'Remolacha'),(697,'Repollo'),(698,'Rabanito'),(699,'Rábano'),(700,'Rama de apio'),(701,'Romero'),(702,'Rúcula'),(703,'Ruibarbo'),(704,'Requesón'),(705,'Ron'),(706,'Regaliz'),(707,'Salmón'),(708,'Sardina'),(709,'Sepia'),(710,'Setas'),(711,'Solomillo de cerdo'),(712,'Solomillo de ternera'),(713,'Sobrasada'),(714,'Sopa'),(715,'Sopa de pescado'),(716,'Sopa de marisco'),(717,'Sopa de verduras'),(718,'Sopa de pollo'),(719,'Solomillo de buey'),(720,'Ternera'),(721,'Tomate'),(722,'Trucha'),(723,'Trufa blanca'),(724,'Trufa negra'),(725,'Tocino'),(726,'Tofu'),(727,'Turrón'),(728,'Tomate cherry'),(729,'Trufa negra'),(730,'Tocino ibérico'),(731,'Tofu marinado'),(732,'Turrón de Jijona'),(733,'Tomate seco'),(734,'Trufa blanca'),(735,'Tocino de cielo'),(736,'Turrón de Alicante'),(737,'Tomate verde'),(738,'Trufa de verano'),(739,'Tocino de jamón'),(740,'Turrón de yema'),(741,'Tomate frito'),(742,'Tocino de panceta'),(743,'Tofu agridulce'),(744,'Turrón de coco'),(745,'Tomate natural'),(746,'Tocino de pavo'),(747,'Turrón de almendra'),(748,'Tomate rallado'),(749,'Turrón de avellana'),(750,'Tocino de cerdo ibérico'),(751,'Guisantes'),(752,'Sal'),(753,'Sal rosa'),(754,'Zanahoria'),(755,'Salsa de soja');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes_seq`
--

DROP TABLE IF EXISTS `ingredientes_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes_seq`
--

LOCK TABLES `ingredientes_seq` WRITE;
/*!40000 ALTER TABLE `ingredientes_seq` DISABLE KEYS */;
INSERT INTO `ingredientes_seq` VALUES (1);
/*!40000 ALTER TABLE `ingredientes_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id_local` int NOT NULL AUTO_INCREMENT,
  `cif` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre_local` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `usuario` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_local`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `locales_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'09208160H','País de la Lluvia','amegakure@gmail.com','Restaurante Amegakure','645888448','serfeco21@gmail.com'),(2,'09223615V','País del Fuego','konoha@gmail.com','Restaurante Konohagakure','123456789','serfeco21@gmail.com'),(102,'09208160H','País de la Lluvia','akatsuki_occ@gmail.com','Akatsuki','645888448','yone@gmail.com'),(152,'09208160H','calderon de la barca','amegakure@gmail.com','Akatsuki','645888448','serfeco21@gmail.com');
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_seq`
--

DROP TABLE IF EXISTS `locales_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales_seq`
--

LOCK TABLES `locales_seq` WRITE;
/*!40000 ALTER TABLE `locales_seq` DISABLE KEYS */;
INSERT INTO `locales_seq` VALUES (251);
/*!40000 ALTER TABLE `locales_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_ingrediente`
--

DROP TABLE IF EXISTS `receta_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_ingrediente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` float DEFAULT NULL,
  `ud_medida` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `id_ingrediente` int DEFAULT NULL,
  `id_receta` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_receta` (`id_receta`),
  CONSTRAINT `receta_ingrediente_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`),
  CONSTRAINT `receta_ingrediente_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_receta`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_ingrediente`
--

LOCK TABLES `receta_ingrediente` WRITE;
/*!40000 ALTER TABLE `receta_ingrediente` DISABLE KEYS */;
INSERT INTO `receta_ingrediente` VALUES (15,1,'unidad',348,152),(35,250,'gr',626,206),(36,20,'mg',151,206),(37,30,'ml',597,206),(38,0,'media pieza',126,206),(40,250,'GR',53,302),(41,20,'gr',751,302),(42,20,'gr',754,302),(43,10,'ml',755,302),(44,10,'mg',599,206),(46,0,'gusto',752,152),(51,200,'gr',501,452),(52,20,'gr',647,452),(53,50,'gr',741,452);
/*!40000 ALTER TABLE `receta_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `imagen` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `num_raciones` int DEFAULT NULL,
  `observaciones` mediumtext COLLATE utf8mb3_spanish_ci,
  `procedimiento` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `id_usuario` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `receta_ingrediente` int DEFAULT NULL,
  PRIMARY KEY (`id_receta`),
  KEY `id_usuario` (`id_usuario`),
  KEY `receta_ingrediente` (`receta_ingrediente`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`receta_ingrediente`) REFERENCES `receta_ingrediente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (152,'https://media.istockphoto.com/id/972182702/es/foto/huevo-frito-aislado.jpg?s=2048x2048&w=is&k=20&c=tht-LuowrN6ymAsjzzHy49sDXFeZ5zJTV4BxGsVVkwU=','Webo',1,'sal','freir, comer','serfeco21@gmail.com',NULL),(206,'data:image/jpeg;base64,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','Pollo al Curry',3,'Ta muy rico lo ha hecho gonza','No se, El que sabe es gonzalo, que diga el','serfeco21@gmail.com',NULL),(302,'https://t2.uc.ltmcdn.com/es/posts/2/7/6/como_hacer_arroz_tres_delicias_28672_orig.jpg','Arroz tres delicias',3,'echale salsa d esoja queda increible','No se cuece eso o algo y le metes el resto','serfeco21@gmail.com',NULL),(452,'\"C:\\Users\\deadm\\Downloads\\chad.jpg\"','Macarrones de Mario',2,'Esa noche no se me olvidará','Mario procede a cocer los mapcarrones caducados, despues les echó tomate y paté y comimos como cerdos','yone@gmail.com',NULL);
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas_seq`
--

DROP TABLE IF EXISTS `recetas_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas_seq`
--

LOCK TABLES `recetas_seq` WRITE;
/*!40000 ALTER TABLE `recetas_seq` DISABLE KEYS */;
INSERT INTO `recetas_seq` VALUES (551);
/*!40000 ALTER TABLE `recetas_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `dni` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `nombre` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('franfrancg@gmail.com','Castro García','20540492C','2023-06-08','francisco ','601341559c380348733f39f8e6162426912fb4d1f0f273faef9c019608c9cd9d','640267075'),('serfeco21@gmail.com','Fernandez Collado','09223615V','2023-06-05','Sergio','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','657779085'),('yone@gmail.com','Fortuna Ramos','09216969H','2023-06-09','Mario','1234','');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'recibook'
--

--
-- Dumping routines for database 'recibook'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-10 21:06:47

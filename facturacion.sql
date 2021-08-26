/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.14-MariaDB : Database - facturacion
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`facturacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `facturacion`;

/*Table structure for table `bodega` */

DROP TABLE IF EXISTS `bodega`;

CREATE TABLE `bodega` (
  `id_bodega` int(20) NOT NULL AUTO_INCREMENT,
  `direccion_bodega` char(30) DEFAULT NULL,
  `telefono_bodega` char(20) DEFAULT NULL,
  `codigo_product` char(20) DEFAULT NULL,
  `cantitad_product` int(100) DEFAULT NULL,
  `nombre_product` char(30) DEFAULT NULL,
  PRIMARY KEY (`id_bodega`),
  KEY `fk_cod_product` (`codigo_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `bodega` */

LOCK TABLES `bodega` WRITE;

UNLOCK TABLES;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `categorias` */

LOCK TABLES `categorias` WRITE;

UNLOCK TABLES;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `mail` varchar(70) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

LOCK TABLES `clientes` WRITE;

UNLOCK TABLES;

/*Table structure for table `detallefactura` */

DROP TABLE IF EXISTS `detallefactura`;

CREATE TABLE `detallefactura` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigofactura` int(11) DEFAULT NULL,
  `codigoproducto` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `factura` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_factura` (`factura`),
  CONSTRAINT `fk_factura` FOREIGN KEY (`factura`) REFERENCES `facturas` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

/*Data for the table `detallefactura` */

LOCK TABLES `detallefactura` WRITE;

UNLOCK TABLES;

/*Table structure for table `facturas` */

DROP TABLE IF EXISTS `facturas`;

CREATE TABLE `facturas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `codigocliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_cliente` (`codigocliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`codigocliente`) REFERENCES `clientes` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

/*Data for the table `facturas` */

LOCK TABLES `facturas` WRITE;

UNLOCK TABLES;

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `codigocategoria` int(11) DEFAULT NULL,
  `bodega` int(11) DEFAULT NULL,
  `proveedor` int(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_categoria` (`codigocategoria`),
  KEY `fk_bodeg` (`bodega`),
  KEY `fk_proveedor` (`proveedor`),
  CONSTRAINT `fk_bodeg` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`codigocategoria`) REFERENCES `categorias` (`codigo`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `productos` */

LOCK TABLES `productos` WRITE;

UNLOCK TABLES;

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `id_prov` int(50) NOT NULL,
  `numdoc_prov` char(20) DEFAULT NULL,
  `nombres_prov` char(30) DEFAULT NULL,
  `apellidos_prov` char(30) DEFAULT NULL,
  `nom_comercial_prov` char(30) DEFAULT NULL,
  `ciudad_prov` char(30) DEFAULT NULL,
  `telefono_prov` char(15) DEFAULT NULL,
  PRIMARY KEY (`id_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `proveedor` */

LOCK TABLES `proveedor` WRITE;

UNLOCK TABLES;

/*Table structure for table `sucursales` */

DROP TABLE IF EXISTS `sucursales`;

CREATE TABLE `sucursales` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nit_sucursal` char(20) NOT NULL,
  `nombre_sucursal` char(30) DEFAULT NULL,
  `direccion_sucursal` char(30) DEFAULT NULL,
  `numero_factura` int(20) DEFAULT NULL,
  `cod_bodeg` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`,`nit_sucursal`),
  KEY `fk_num_factu` (`numero_factura`),
  KEY `fk_cod_bodeg` (`cod_bodeg`),
  CONSTRAINT `fk_cod_bodeg` FOREIGN KEY (`cod_bodeg`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_num_factu` FOREIGN KEY (`numero_factura`) REFERENCES `facturas` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sucursales` */

LOCK TABLES `sucursales` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.14-MariaDB : Database - bd_multitenant
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd_multitenant` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bd_multitenant`;

/*Table structure for table `bodega` */

DROP TABLE IF EXISTS `bodega`;

CREATE TABLE `bodega` (
  `id_bodega` int(11) NOT NULL AUTO_INCREMENT,
  `nit_bod` int(20) NOT NULL,
  `nombre_bod` char(30) DEFAULT NULL,
  `direccion_bod` char(30) DEFAULT NULL,
  `proveedor` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_bodega`,`nit_bod`),
  KEY `fk_proveedor` (`proveedor`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `bodega` */

LOCK TABLES `bodega` WRITE;

UNLOCK TABLES;

/*Table structure for table `facturacion` */

DROP TABLE IF EXISTS `facturacion`;

CREATE TABLE `facturacion` (
  `id_fac` int(11) NOT NULL AUTO_INCREMENT,
  `nit_loc` int(11) NOT NULL,
  `fecha_fac` datetime DEFAULT NULL,
  `nombre_empleado` char(30) DEFAULT NULL,
  `nombre_clien` char(30) DEFAULT NULL,
  `valor_iva` decimal(10,0) DEFAULT NULL,
  `valor_total` decimal(10,0) DEFAULT NULL,
  `nombre_produc` char(30) DEFAULT NULL,
  `cantidad_produc` char(30) DEFAULT NULL,
  `facturas` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_fac`,`nit_loc`),
  KEY `fk_facturas` (`facturas`),
  CONSTRAINT `fk_facturas` FOREIGN KEY (`facturas`) REFERENCES `facturas` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `facturacion` */

LOCK TABLES `facturacion` WRITE;

UNLOCK TABLES;

/*Table structure for table `facturas` */

DROP TABLE IF EXISTS `facturas`;

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `num_factura` int(11) NOT NULL,
  `nombre_client` char(30) DEFAULT NULL,
  `sucursal` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_factura`,`num_factura`),
  KEY `fk_sucursal` (`sucursal`),
  CONSTRAINT `fk_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `facturas` */

LOCK TABLES `facturas` WRITE;

UNLOCK TABLES;

/*Table structure for table `local` */

DROP TABLE IF EXISTS `local`;

CREATE TABLE `local` (
  `id_local` int(11) NOT NULL AUTO_INCREMENT,
  `nit_local` int(30) NOT NULL,
  `nombre_local` char(30) DEFAULT NULL,
  `tipo_local` char(30) DEFAULT NULL,
  PRIMARY KEY (`id_local`,`nit_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `local` */

LOCK TABLES `local` WRITE;

UNLOCK TABLES;

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id_prov` int(11) NOT NULL AUTO_INCREMENT,
  `nit_prov` int(20) NOT NULL,
  `nombre_prov` char(30) DEFAULT NULL,
  `direccion_prov` char(30) DEFAULT NULL,
  PRIMARY KEY (`id_prov`,`nit_prov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `proveedores` */

LOCK TABLES `proveedores` WRITE;

UNLOCK TABLES;

/*Table structure for table `sucursales` */

DROP TABLE IF EXISTS `sucursales`;

CREATE TABLE `sucursales` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nit_sucursal` char(20) DEFAULT NULL,
  `nombre_sucursal` char(30) DEFAULT NULL,
  `direccion_sucursal` char(30) DEFAULT NULL,
  `numero_factura` int(20) DEFAULT NULL,
  `bodegas` int(20) DEFAULT NULL,
  `locales` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `fk_bodegas` (`bodegas`),
  KEY `fk_locales` (`locales`),
  CONSTRAINT `fk_bodegas` FOREIGN KEY (`bodegas`) REFERENCES `bodega` (`id_bodega`),
  CONSTRAINT `fk_locales` FOREIGN KEY (`locales`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sucursales` */

LOCK TABLES `sucursales` WRITE;

UNLOCK TABLES;

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usu` int(11) NOT NULL AUTO_INCREMENT,
  `num_doc_usu` char(15) NOT NULL,
  `nombres_usu` char(30) DEFAULT NULL,
  `direccion_usu` char(30) DEFAULT NULL,
  `tipo_cliente` char(14) DEFAULT NULL,
  `tipo_usuario` char(15) DEFAULT NULL,
  `local` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_usu`,`num_doc_usu`),
  KEY `fk_local` (`local`),
  CONSTRAINT `fk_local` FOREIGN KEY (`local`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

LOCK TABLES `usuarios` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

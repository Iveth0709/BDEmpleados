-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-03-2025 a las 17:00:12
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `ActualizarSalarioEmpleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSalarioEmpleados` (IN `Actualizar` TEXT)   UPDATE Empleado_general SET salario = 33000 WHERE nombre = 'Juan Pérez'$$

DROP PROCEDURE IF EXISTS `BuscarEmpleadosPorSalario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarEmpleadosPorSalario` (IN `Buscar` DECIMAL(10,2))   BEGIN
    SELECT * FROM Empleado_general WHERE salario > salario_limite;
END$$

DROP PROCEDURE IF EXISTS `Consultas Miscelanea`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultas Miscelanea` (IN `Stok` DECIMAL(10))   SELECT * FROM Miscelanea WHERE stock < 10$$

DROP PROCEDURE IF EXISTS `ContarEmpleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarEmpleados` (IN `Contar` INT)   SELECT puesto, COUNT(*) AS total_empleados FROM Empleado_general GROUP BY puesto$$

DROP PROCEDURE IF EXISTS `Eliminacion de productos Electronica`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminacion de productos Electronica` (IN `Electronica` TEXT)   CALL EliminarProductoPorCategoria('Electronica')$$

DROP PROCEDURE IF EXISTS `Eliminar Productos Mobiliario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar Productos Mobiliario` (IN `Eliminar Mobiliario` INT)   DELETE FROM Miscelanea WHERE categoria = 'Mobiliario'$$

DROP PROCEDURE IF EXISTS `Modificar Precio Teclado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Modificar Precio Teclado` (IN `Precioteclado` INT(10))   UPDATE Miscelanea SET precio = 180.00 WHERE producto = 'Teclado'$$

DROP PROCEDURE IF EXISTS `QuitarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `QuitarEmpleado` (IN `Eliminar` TEXT)   DELETE FROM Empleado_general WHERE nombre = 'Claudia Ramírez'$$

DROP PROCEDURE IF EXISTS `Reemplazar precio mouse`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Reemplazar precio mouse` (IN `mouse` INT)   CALL ActualizarPrecioProducto('mouse', 120.00)$$

DROP PROCEDURE IF EXISTS `Ver empleados Contratados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver empleados Contratados` (IN `Contratos` DATE)   SELECT * FROM Empleado_general WHERE fecha_contratacion > '2022-01-01'$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_general`
--

DROP TABLE IF EXISTS `empleado_general`;
CREATE TABLE IF NOT EXISTS `empleado_general` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `puesto` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado_general`
--

INSERT INTO `empleado_general` (`id`, `nombre`, `puesto`, `salario`, `fecha_contratacion`) VALUES
(1, 'Juan Pérez', 'Gerente', 33000.00, '2021-03-15'),
(2, 'Ana López', 'Desarrolladora', 28000.00, '2022-01-10'),
(3, 'Luis González', 'Asistente', 20000.00, '2023-06-20'),
(4, 'Carlos Martínez', 'Supervisor', 25000.00, '2021-09-05'),
(5, 'Lucía Rodríguez', 'Administrador', 30000.00, '2020-05-15'),
(6, 'Marta Sánchez', 'Técnico', 22000.00, '2022-08-10'),
(7, 'José Torres', 'Analista', 27000.00, '2021-11-25'),
(8, 'Raúl García', 'Programador', 32000.00, '2023-03-01'),
(10, 'Esteban Díaz', 'Contador', 29000.00, '2022-07-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelanea`
--

DROP TABLE IF EXISTS `miscelanea`;
CREATE TABLE IF NOT EXISTS `miscelanea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `proveedor` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `miscelanea`
--

INSERT INTO `miscelanea` (`id`, `producto`, `categoria`, `precio`, `stock`, `proveedor`) VALUES
(1, 'Lámpara', 'Electrónica', 150.00, 30, 'Proveedor A'),
(2, 'Silla', 'Mobiliario', 250.00, 20, 'Proveedor B'),
(3, 'Monitor', 'Electrónica', 300.00, 15, 'Proveedor C'),
(4, 'Teclado', 'Electrónica', 100.00, 50, 'Proveedor A'),
(5, 'Escritorio', 'Mobiliario', 400.00, 10, 'Proveedor D'),
(6, 'Auriculares', 'Electrónica', 80.00, 70, 'Proveedor E'),
(7, 'Móvil', 'Electrónica', 1500.00, 5, 'Proveedor F'),
(8, 'Cafetera', 'Electrodomésticos', 350.00, 25, 'Proveedor G'),
(9, 'Lentes', 'Ópticos', 80.00, 100, 'Proveedor H'),
(10, 'Silla ejecutiva', 'Mobiliario', 450.00, 15, 'Proveedor B'),
(11, 'Mouse', 'Electrónica', 50.00, 60, 'Proveedor C'),
(12, 'Cámara', 'Electrónica', 500.00, 8, 'Proveedor D'),
(13, 'Ventilador', 'Electrodomésticos', 200.00, 40, 'Proveedor E'),
(14, 'Proyector', 'Electrónica', 600.00, 3, 'Proveedor F'),
(15, 'Frigorífico', 'Electrodomésticos', 1200.00, 7, 'Proveedor G');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

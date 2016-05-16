-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2016 a las 05:32:36
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vetsena`
--
CREATE DATABASE IF NOT EXISTS `vetsena` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `vetsena`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `registrarCliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCliente` (IN `DniPersona` INT, IN `PerNombres` VARCHAR(50), IN `PerApellidos` VARCHAR(50), IN `PerTelefono` INT, IN `PerDireccion` VARCHAR(100), IN `PerEmail` VARCHAR(100), IN `CliCelular` VARCHAR(12))  NO SQL
BEGIN 
DECLARE filas INT; 
SELECT COUNT(PerDni) INTO filas FROM tblpersona WHERE PerDni = DniPersona; IF filas = 0 THEN 
INSERT INTO `tblpersona`(`PerDni`, `PerNombres`, `PerApellidos`, `PerTelefono`, `PerEmail`, `PerDireccion`) VALUES (`DniPersona`,`PerNombres`,`PerApellidos`,`PerTelefono`,`PerEmail`,`PerDireccion`); 
END IF; 
INSERT INTO `tblcliente`(`DniPersona`, `CLCelular`) VALUES (`DniPersona`,`CliCelular`); 
END$$

DROP PROCEDURE IF EXISTS `registrarConsulta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarConsulta` (IN `CodigoMascota` INT, IN `DniEmpleado` INT, IN `ConFecha` DATE, IN `ConReceta` VARCHAR(255), IN `ConCausa` VARCHAR(255))  NO SQL
INSERT INTO `tblconsulta`(`CodigoMascota`, `DniEmpleado`, `ConFecha`, `ConReceta`, `ConCausa`) VALUES (`CodigoMascota`,`DniEmpleado`,`ConFecha`,`ConReceta`,`ConCausa`)$$

DROP PROCEDURE IF EXISTS `registrarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarEmpleado` (IN `DniPersona` INT, IN `EmpTipo` VARCHAR(20), IN `EmpPass` VARCHAR(100), IN `PerNombres` VARCHAR(50), IN `PerApellidos` VARCHAR(50), IN `PerTelefono` INT, IN `PerEmail` VARCHAR(100), IN `PerDireccion` VARCHAR(100))  NO SQL
    DETERMINISTIC
BEGIN
DECLARE filas INT;
SELECT COUNT(PerDni) INTO filas FROM tblpersona WHERE PerDni = DniPersona LIMIT 1;
IF filas = 0 THEN
INSERT INTO `tblpersona`(`PerDni`, `PerNombres`, `PerApellidos`, `PerTelefono`, `PerEmail`, `PerDireccion`) VALUES (`DniPersona`,`PerNombres`,`PerApellidos`,`PerTelefono`,`PerEmail`,`PerDireccion`);
END IF;
INSERT INTO `tblempleado`(`DniPersona`, `EmpTipo`, `EmpPass`) VALUES (`DniPersona`,`EmpTipo`,`EmpPass`);
END$$

DROP PROCEDURE IF EXISTS `registrarExamen`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarExamen` (IN `ExaNombre` VARCHAR(100), IN `ExaNotas` VARCHAR(255))  NO SQL
INSERT INTO `tblexamen`(`ExaNombre`, `ExaNotas`) VALUES (`ExaNombre`,`ExaNotas`)$$

DROP PROCEDURE IF EXISTS `registrarExamenMascota`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarExamenMascota` (IN `ExMCodigo` INT, IN `CodigoMascota` INT, IN `ExMFecha` DATE, IN `ExMDescripcion` VARCHAR(255), IN `ExMImagen` BLOB)  NO SQL
INSERT INTO `tblexamenmascota`(`ExMCodigo`, `CodigoMascota`, `ExMFecha`, `ExMDescripcion`, `ExMImagen`) VALUES (`ExMCodigo`,`CodigoMascota`,`ExMFecha`,`ExMDescripcion`,`ExMImagen`)$$

DROP PROCEDURE IF EXISTS `registrarHospitalizacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarHospitalizacion` (IN `CodigoMascota` INT, IN `HosFechaEntrada` DATE, IN `HosFechaSalida` DATE, IN `HosCausa` VARCHAR(255), IN `HosNotas` VARCHAR(255))  NO SQL
INSERT INTO `tblhospitalizacion`(`CodigoMascota`, `HosFechaEntrada`, `HosFechaSalida`, `HosCausa`, `HosNotas`) VALUES (`CodigoMascota`,`HosFechaEntrada`,`HosFechaSalida`,`HosCausa`,`HosNotas`)$$

DROP PROCEDURE IF EXISTS `registrarMascota`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarMascota` (IN `DniCliente` INT, IN `MasNombre` VARCHAR(50), IN `MasEspecie` VARCHAR(30), IN `MasRaza` VARCHAR(50), IN `MasSexo` VARCHAR(10), IN `MasNacimiento` DATE, IN `MasTamanio` VARCHAR(30), IN `MasColor` VARCHAR(50), IN `MasPelo` VARCHAR(10), IN `MasNotas` VARCHAR(255))  NO SQL
INSERT INTO `tblmascota`(`DniCliente`, `MasNombre`, `MasEspecie`, `MasRaza`, `MasSexo`, `MasNacimiento`, `MasTamanio`, `MasColor`, `MasPelo`, `MasNotas`) VALUES (`DniCliente`,`MasNombre`,`MasEspecie`,`MasRaza`,`MasSexo`,`MasNacimiento`,`MasTamanio`,`MasColor`,`MasPelo`,`MasNotas`)$$

DROP PROCEDURE IF EXISTS `registrarPeso`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarPeso` (IN `CodigoMascota` INT, IN `PesFecha` DATE, IN `PesPeso` DOUBLE)  NO SQL
INSERT INTO `tblpeso`(`CodigoMascota`, `PesFecha`, `PesPeso`) VALUES (`CodigoMascota`,`PesFecha`,`PesPeso`)$$

DROP PROCEDURE IF EXISTS `registrarProcedimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarProcedimiento` (IN `CodigoMascota` INT, IN `CodigoServicio` INT, IN `DniEmpleado` INT, IN `ProFecha` DATE, IN `ProNotas` VARCHAR(255))  NO SQL
INSERT INTO `tblprocedimiento`(`CodigoMascota`, `CodigoServicio`, `DniEmpleado`, `ProFecha`, `ProNotas`) VALUES (`CodigoMascota`,`CodigoServicio`,`DniEmpleado`,`ProFecha`,`ProNotas`)$$

DROP PROCEDURE IF EXISTS `registrarServicio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarServicio` (IN `SerNombre` VARCHAR(50), IN `SerCaracter` VARCHAR(100), IN `SerNotas` VARCHAR(255))  NO SQL
INSERT INTO `tblservicio`(`SerNombre`, `SerCaracter`, `SerNotas`) VALUES (`SerNombre`,`SerCaracter`,`SerNotas`)$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `iniciarSesion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `iniciarSesion` (`DniEmpleado` INT, `cont` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET latin1 COLLATE latin1_spanish_ci NO SQL
BEGIN
DECLARE empleado VARCHAR(100); 
SELECT CONCAT(EmpTipo, '-', EmpHabilitado) INTO empleado FROM tblempleado WHERE DniPersona = DniEmpleado AND EmpPass = cont LIMIT 1; 
RETURN empleado;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcliente`
--

DROP TABLE IF EXISTS `tblcliente`;
CREATE TABLE `tblcliente` (
  `DniPersona` int(11) NOT NULL,
  `CLCelular` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tblcliente`
--

INSERT INTO `tblcliente` (`DniPersona`, `CLCelular`) VALUES
(1093784391, '3208456890'),
(1093784392, '3208416840');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblconsulta`
--

DROP TABLE IF EXISTS `tblconsulta`;
CREATE TABLE `tblconsulta` (
  `ConCodigo` int(11) NOT NULL,
  `CodigoMascota` int(11) DEFAULT NULL,
  `DniEmpleado` int(11) DEFAULT NULL,
  `ConFecha` date DEFAULT NULL,
  `ConReceta` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `ConCausa` varchar(255) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempleado`
--

DROP TABLE IF EXISTS `tblempleado`;
CREATE TABLE `tblempleado` (
  `DniPersona` int(11) NOT NULL,
  `EmpTipo` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EmpPass` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `EmpHabilitado` varchar(2) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'si'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tblempleado`
--

INSERT INTO `tblempleado` (`DniPersona`, `EmpTipo`, `EmpPass`, `EmpHabilitado`) VALUES
(1093784391, 'Secretario', 'XVLdPq4qk8c=', 'no'),
(1093784392, 'Administrador', 'XVLdPq4qk8c=', 'si'),
(1093784393, 'Medico', 'XVLdPq4qk8c=', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblexamen`
--

DROP TABLE IF EXISTS `tblexamen`;
CREATE TABLE `tblexamen` (
  `ExaCodigo` int(11) NOT NULL,
  `ExaNombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `ExaNotas` varchar(255) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tblexamen`
--

INSERT INTO `tblexamen` (`ExaCodigo`, `ExaNombre`, `ExaNotas`) VALUES
(1, 'Examen de Sangre ', 'sin comer 12 horas antes de la toma de la muestra'),
(2, 'Examen de Orina', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblexamenmascota`
--

DROP TABLE IF EXISTS `tblexamenmascota`;
CREATE TABLE `tblexamenmascota` (
  `ExMCodigo` int(11) NOT NULL,
  `CodigoExamen` int(11) DEFAULT NULL,
  `CodigoMascota` int(11) DEFAULT NULL,
  `ExMFecha` date DEFAULT NULL,
  `ExMDescripcion` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `ExMImagen` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblhospitalizacion`
--

DROP TABLE IF EXISTS `tblhospitalizacion`;
CREATE TABLE `tblhospitalizacion` (
  `HostCodigo` int(11) NOT NULL,
  `CodigoMascota` int(11) DEFAULT NULL,
  `HosFechaEntrada` date DEFAULT NULL,
  `HosFechaSalida` date DEFAULT NULL,
  `HosCausa` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL,
  `HosNotas` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmascota`
--

DROP TABLE IF EXISTS `tblmascota`;
CREATE TABLE `tblmascota` (
  `MasCodigo` int(11) NOT NULL,
  `DniCliente` int(11) DEFAULT NULL,
  `MasNombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `MasEspecie` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `MasRaza` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `MasSexo` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `MasNacimiento` date DEFAULT NULL,
  `MasTamanio` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `MasColor` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `MasPelo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `MasNotas` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tblmascota`
--

INSERT INTO `tblmascota` (`MasCodigo`, `DniCliente`, `MasNombre`, `MasEspecie`, `MasRaza`, `MasSexo`, `MasNacimiento`, `MasTamanio`, `MasColor`, `MasPelo`, `MasNotas`) VALUES
(1, 1093784391, 'Sisi', 'Canino', 'Pinsher', 'Hembra', '2016-05-10', 'Pequeño', 'Negra', 'Corto', 'linda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpersona`
--

DROP TABLE IF EXISTS `tblpersona`;
CREATE TABLE `tblpersona` (
  `PerDni` int(11) NOT NULL,
  `PerNombres` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `PerApellidos` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `PerTelefono` int(11) DEFAULT NULL,
  `PerEmail` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `PerDireccion` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tblpersona`
--

INSERT INTO `tblpersona` (`PerDni`, `PerNombres`, `PerApellidos`, `PerTelefono`, `PerEmail`, `PerDireccion`) VALUES
(1093784391, 'Diana', 'Ramírez', 5776453, 'dianaprv@hotmail.com', 'Prados del Este'),
(1093784392, 'José Alejandro', 'Ramírez Villamizar', 5772125, 'alejandrorvilla07@gmail.com', 'Villas del Campo'),
(1093784393, 'Giancarlo', 'Bastos', 5713453, 'giancarlo@hotmail.com', 'Colsag');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpeso`
--

DROP TABLE IF EXISTS `tblpeso`;
CREATE TABLE `tblpeso` (
  `PesCodigo` int(11) NOT NULL,
  `CodigoMascota` int(11) DEFAULT NULL,
  `PesFecha` date DEFAULT NULL,
  `PesPeso` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblprocedimiento`
--

DROP TABLE IF EXISTS `tblprocedimiento`;
CREATE TABLE `tblprocedimiento` (
  `ProCodigo` int(11) NOT NULL,
  `CodigoMascota` int(11) DEFAULT NULL,
  `CodigoServicio` int(11) DEFAULT NULL,
  `DniEmpleado` int(11) DEFAULT NULL,
  `ProFecha` date DEFAULT NULL,
  `ProNotas` varchar(255) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblservicio`
--

DROP TABLE IF EXISTS `tblservicio`;
CREATE TABLE `tblservicio` (
  `SerCodigo` int(11) NOT NULL,
  `SerNombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `SerCaracter` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `SerNotas` varchar(255) COLLATE latin1_spanish_ci DEFAULT NULL,
  `SerHabilitado` varchar(2) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'si'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tblservicio`
--

INSERT INTO `tblservicio` (`SerCodigo`, `SerNombre`, `SerCaracter`, `SerNotas`, `SerHabilitado`) VALUES
(1, 'Estirilización', 'Cirugía', '', 'si');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcliente`
--
ALTER TABLE `tblcliente`
  ADD PRIMARY KEY (`DniPersona`);

--
-- Indices de la tabla `tblconsulta`
--
ALTER TABLE `tblconsulta`
  ADD PRIMARY KEY (`ConCodigo`),
  ADD KEY `CodigoMascota` (`CodigoMascota`),
  ADD KEY `DniEmpleado` (`DniEmpleado`);

--
-- Indices de la tabla `tblempleado`
--
ALTER TABLE `tblempleado`
  ADD PRIMARY KEY (`DniPersona`);

--
-- Indices de la tabla `tblexamen`
--
ALTER TABLE `tblexamen`
  ADD PRIMARY KEY (`ExaCodigo`);

--
-- Indices de la tabla `tblexamenmascota`
--
ALTER TABLE `tblexamenmascota`
  ADD PRIMARY KEY (`ExMCodigo`),
  ADD KEY `CodigoMascota` (`CodigoMascota`),
  ADD KEY `CodigoExamen` (`CodigoExamen`);

--
-- Indices de la tabla `tblhospitalizacion`
--
ALTER TABLE `tblhospitalizacion`
  ADD PRIMARY KEY (`HostCodigo`),
  ADD KEY `CodigoMascota` (`CodigoMascota`);

--
-- Indices de la tabla `tblmascota`
--
ALTER TABLE `tblmascota`
  ADD PRIMARY KEY (`MasCodigo`),
  ADD KEY `DniCliente` (`DniCliente`);

--
-- Indices de la tabla `tblpersona`
--
ALTER TABLE `tblpersona`
  ADD PRIMARY KEY (`PerDni`);

--
-- Indices de la tabla `tblpeso`
--
ALTER TABLE `tblpeso`
  ADD PRIMARY KEY (`PesCodigo`),
  ADD KEY `CodigoMascota` (`CodigoMascota`);

--
-- Indices de la tabla `tblprocedimiento`
--
ALTER TABLE `tblprocedimiento`
  ADD PRIMARY KEY (`ProCodigo`),
  ADD KEY `CodigoMascota` (`CodigoMascota`),
  ADD KEY `DniEmpleado` (`DniEmpleado`),
  ADD KEY `CodigoServicio` (`CodigoServicio`);

--
-- Indices de la tabla `tblservicio`
--
ALTER TABLE `tblservicio`
  ADD PRIMARY KEY (`SerCodigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblconsulta`
--
ALTER TABLE `tblconsulta`
  MODIFY `ConCodigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblexamen`
--
ALTER TABLE `tblexamen`
  MODIFY `ExaCodigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tblexamenmascota`
--
ALTER TABLE `tblexamenmascota`
  MODIFY `ExMCodigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblhospitalizacion`
--
ALTER TABLE `tblhospitalizacion`
  MODIFY `HostCodigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblmascota`
--
ALTER TABLE `tblmascota`
  MODIFY `MasCodigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tblpeso`
--
ALTER TABLE `tblpeso`
  MODIFY `PesCodigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblprocedimiento`
--
ALTER TABLE `tblprocedimiento`
  MODIFY `ProCodigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblservicio`
--
ALTER TABLE `tblservicio`
  MODIFY `SerCodigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblcliente`
--
ALTER TABLE `tblcliente`
  ADD CONSTRAINT `tblcliente_ibfk_1` FOREIGN KEY (`DniPersona`) REFERENCES `tblpersona` (`PerDni`);

--
-- Filtros para la tabla `tblconsulta`
--
ALTER TABLE `tblconsulta`
  ADD CONSTRAINT `tblconsulta_ibfk_1` FOREIGN KEY (`CodigoMascota`) REFERENCES `tblmascota` (`MasCodigo`),
  ADD CONSTRAINT `tblconsulta_ibfk_2` FOREIGN KEY (`DniEmpleado`) REFERENCES `tblempleado` (`DniPersona`);

--
-- Filtros para la tabla `tblempleado`
--
ALTER TABLE `tblempleado`
  ADD CONSTRAINT `tblempleado_ibfk_1` FOREIGN KEY (`DniPersona`) REFERENCES `tblpersona` (`PerDni`);

--
-- Filtros para la tabla `tblexamenmascota`
--
ALTER TABLE `tblexamenmascota`
  ADD CONSTRAINT `tblexamenmascota_ibfk_1` FOREIGN KEY (`CodigoMascota`) REFERENCES `tblmascota` (`MasCodigo`),
  ADD CONSTRAINT `tblexamenmascota_ibfk_2` FOREIGN KEY (`CodigoExamen`) REFERENCES `tblexamen` (`ExaCodigo`);

--
-- Filtros para la tabla `tblhospitalizacion`
--
ALTER TABLE `tblhospitalizacion`
  ADD CONSTRAINT `tblhospitalizacion_ibfk_1` FOREIGN KEY (`CodigoMascota`) REFERENCES `tblmascota` (`MasCodigo`);

--
-- Filtros para la tabla `tblmascota`
--
ALTER TABLE `tblmascota`
  ADD CONSTRAINT `tblmascota_ibfk_1` FOREIGN KEY (`DniCliente`) REFERENCES `tblcliente` (`DniPersona`);

--
-- Filtros para la tabla `tblpeso`
--
ALTER TABLE `tblpeso`
  ADD CONSTRAINT `tblpeso_ibfk_1` FOREIGN KEY (`CodigoMascota`) REFERENCES `tblmascota` (`MasCodigo`);

--
-- Filtros para la tabla `tblprocedimiento`
--
ALTER TABLE `tblprocedimiento`
  ADD CONSTRAINT `tblprocedimiento_ibfk_1` FOREIGN KEY (`CodigoMascota`) REFERENCES `tblmascota` (`MasCodigo`),
  ADD CONSTRAINT `tblprocedimiento_ibfk_2` FOREIGN KEY (`DniEmpleado`) REFERENCES `tblempleado` (`DniPersona`),
  ADD CONSTRAINT `tblprocedimiento_ibfk_3` FOREIGN KEY (`CodigoServicio`) REFERENCES `tblservicio` (`SerCodigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

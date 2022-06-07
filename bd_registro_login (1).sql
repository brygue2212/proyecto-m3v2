-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2022 a las 08:53:55
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_registro_login`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `factura` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID` int(50) UNSIGNED NOT NULL,
  `Nombre completo` text NOT NULL,
  `cedula` int(50) NOT NULL,
  `pruducto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inicio_seccion`
--

CREATE TABLE `inicio_seccion` (
  `usuario` varchar(40) DEFAULT NULL,
  `clave` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Pro` int(10) UNSIGNED NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `tipo_produto` tinytext,
  `cantidad_produto` int(11) NOT NULL,
  `Tiempo` set('1 mes','3 meses','6 meses','12 meses') DEFAULT NULL,
  `mone_pro` set('bolivares','dolares','pesos','Euros') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Pro`, `codigo_producto`, `nombre_producto`, `tipo_produto`, `cantidad_produto`, `Tiempo`, `mone_pro`) VALUES
(1, 2545, 'ADS Intagram', 'publicidad', 445, '', 'Euros'),
(2, 5446, 'ADSFacebbok', 'publicidad', 45, '', 'pesos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nombre_completo` text,
  `correo` varchar(40) DEFAULT NULL,
  `usuario` varchar(30) NOT NULL,
  `nivel_acceso` set('Usuario','Admin','','') DEFAULT NULL,
  `clave` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`ID`, `nombre_completo`, `correo`, `usuario`, `nivel_acceso`, `clave`) VALUES
(1, 'BRYAN GUERRERO', 'bryanguerrero16@gmail.com', 'brygue2474', 'Admin', '$2b$10$2ExiPtDhPC7ObtbkPJV6IOECKHNyK6byO'),
(2, 'BRYAN   ALBERTO GUERRERO', 'bryanguerrero1896@gmail.com', 'brygue24744', 'Usuario', '$2b$10$TRLnNVuI1QiRFB9XWujXYenH0FDq6fGhG'),
(3, 'BRYAN   ALBERTO GUERRERO', 'bryanguerrero16@gmail.com', 'brygue247445', 'Admin', '$2b$10$TDJHyr8Ayh0e0WBqXkdaWuLwvV/zU3FHw'),
(4, 'jeesica Pulido', 'jessica@gmail.com', 'jessica123', 'Admin', '$2b$10$ls2k/JvvhHcEnVzgbddr6.9R5IbDWEbl6'),
(5, 'jessica j pulido', 'jessica1@gmail.com', 'jessica1234', 'Usuario', '$2b$10$6fPfuJlI8ib0D.u/SylJ9uGKXHjunbmLP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `producto` varchar(50) NOT NULL,
  `codigo_producto` varchar(50) NOT NULL,
  `precio` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inicio_seccion`
--
ALTER TABLE `inicio_seccion`
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD UNIQUE KEY `ID_Pro` (`ID_Pro`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`usuario`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Pro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inicio_seccion`
--
ALTER TABLE `inicio_seccion`
  ADD CONSTRAINT `inicio_seccion_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `registro` (`usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

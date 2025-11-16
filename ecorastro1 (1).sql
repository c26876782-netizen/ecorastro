-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2025 a las 21:32:03
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecorastro1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consejos`
--

CREATE TABLE `consejos` (
  `Id_consejo` int(11) NOT NULL,
  `Titulo` varchar(30) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consejos`
--

INSERT INTO `consejos` (`Id_consejo`, `Titulo`, `Descripcion`) VALUES
(1, 'Reduce el uso de plásticos', 'Lleva tu propia bolsa de tela al mercado y evita el uso de bolsas plásticas.'),
(2, 'Planta un árbol', 'Cada árbol ayuda a mejorar la calidad del aire y regula la temperatura.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `Id_evento` int(11) NOT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `Hora_in` time DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Lugar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`Id_evento`, `Id_usuario`, `Hora_in`, `Fecha`, `Descripcion`, `Lugar`) VALUES
(1, 1, '03:00:00', '2025-08-28', 'Jornada de limpieza comunitaria', 'Parque principal'),
(2, 1, '04:00:00', '2025-08-29', 'Siembra de árboles', 'vereda circita');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lecturas`
--

CREATE TABLE `lecturas` (
  `Id_lectura` int(11) NOT NULL,
  `Id_sensor` int(11) DEFAULT NULL,
  `Fecha_hora` datetime DEFAULT NULL,
  `PM25` float DEFAULT NULL,
  `PM10` float DEFAULT NULL,
  `CO2` float DEFAULT NULL,
  `Temperatura` float DEFAULT NULL,
  `Humedad` float DEFAULT NULL,
  `ICA` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensores`
--

CREATE TABLE `sensores` (
  `Id_sensor` int(11) NOT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `Ubicacion` varchar(20) DEFAULT NULL,
  `Proveedor` varchar(20) DEFAULT NULL,
  `Fecha_instalacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_usuario` int(11) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellido` varchar(20) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Contrasenia` varchar(25) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id_usuario`, `Nombre`, `Apellido`, `Correo`, `Direccion`, `Edad`, `Contrasenia`, `Tel`) VALUES
(1, 'Cristina', 'Álvarez', 'c26876782@gmail.com', 'Carrera 55 #49-59, A', 14, '12345', '3054347915'),
(2, 'blanca ines', 'franco ocampo', 'blancafranco@gmail.com', 'carrera 55 #49-56', 42, '12345', '3217895616');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consejos`
--
ALTER TABLE `consejos`
  ADD PRIMARY KEY (`Id_consejo`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`Id_evento`);

--
-- Indices de la tabla `lecturas`
--
ALTER TABLE `lecturas`
  ADD PRIMARY KEY (`Id_lectura`),
  ADD KEY `Id_sensor` (`Id_sensor`);

--
-- Indices de la tabla `sensores`
--
ALTER TABLE `sensores`
  ADD PRIMARY KEY (`Id_sensor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consejos`
--
ALTER TABLE `consejos`
  MODIFY `Id_consejo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `Id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `lecturas`
--
ALTER TABLE `lecturas`
  MODIFY `Id_lectura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sensores`
--
ALTER TABLE `sensores`
  MODIFY `Id_sensor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lecturas`
--
ALTER TABLE `lecturas`
  ADD CONSTRAINT `lecturas_ibfk_1` FOREIGN KEY (`Id_sensor`) REFERENCES `sensores` (`Id_sensor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

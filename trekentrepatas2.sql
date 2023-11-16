-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2022 a las 07:04:14
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trekentrepatas2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL,
  `departamento` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`iddepartamento`, `departamento`) VALUES
(1, 'Amazonas'),
(2, 'Ancash'),
(3, 'Apurimac'),
(4, 'Arequipa'),
(5, 'Ayacucho'),
(6, 'Cajamarca'),
(7, 'Amazonas'),
(8, 'Ancash'),
(9, 'Apurimac'),
(10, 'Arequipa'),
(11, 'Ayacucho'),
(12, 'Cajamarca'),
(13, 'Callao'),
(14, 'Cusco'),
(15, 'Huancavelica'),
(16, 'Huánuco'),
(17, 'Ica'),
(18, 'Junín'),
(19, 'La Libertad'),
(20, 'Lambayeque'),
(21, 'Lima'),
(22, 'Loreto'),
(23, 'Madre de Dios'),
(24, 'Moquegua'),
(25, 'Pasco'),
(26, 'Piura'),
(27, 'Puno'),
(28, 'San Martín'),
(29, 'Tacna'),
(30, 'Tumbes'),
(31, 'Ucayali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

CREATE TABLE `destino` (
  `iddestino` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  `destino` varchar(150) NOT NULL,
  `region` varchar(150) NOT NULL,
  `provincia` varchar(150) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `destino`
--

INSERT INTO `destino` (`iddestino`, `idproveedor`, `fecha`, `iddepartamento`, `destino`, `region`, `provincia`, `precio`) VALUES
(1, 1, '2022-05-11', 1, 'nombre destino', 'nombre region', 'nombre provincia', 120),
(2, 1, '2022-05-17', 4, 'nombre destino 2', 'region 2', 'provincia 2', 150),
(4, 1, '2022-05-11', 5, 'nombre destino 3', 'region 3', 'provincia 3', 130),
(5, 1, '2022-05-11', 4, 'nombre destino 3', 'region 3', 'provincia 3', 130);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `ruc` varchar(150) DEFAULT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `telefono` varchar(150) DEFAULT NULL,
  `costo` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idproveedor`, `ruc`, `razon_social`, `correo`, `telefono`, `costo`) VALUES
(1, '1234567897', 'Empresa de Transportes SAC', 'emp@gmail.com', '123456789', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `iddestino` int(11) NOT NULL,
  `estado` varchar(150) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idreserva`, `idcliente`, `iddestino`, `estado`, `cantidad`) VALUES
(14, 1, 1, 'no pagado', 5),
(15, 11, 2, 'pendiente', 3),
(16, 13, 4, 'pendiente', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'cliente'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idcliente` int(11) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `dni` varchar(150) NOT NULL,
  `numerovacunas` int(11) NOT NULL,
  `fecha_nac` date NOT NULL,
  `celular` varchar(150) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `contraseña` varchar(150) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idcliente`, `nombres`, `apellidos`, `dni`, `numerovacunas`, `fecha_nac`, `celular`, `correo`, `usuario`, `contraseña`, `id_rol`) VALUES
(1, 'Karin123', 'Gutierrez', '77459823', 3, '2000-09-20', '998767653', 'karin123@gmail.com', 'karingut', 'karin123', 1),
(2, 'admin', 'assfdga', '12345678', 2, '2000-05-17', '987654321', 'admin@admin.com', 'admin', 'admin123', 2),
(11, 'aaaaaaaaaa1234', 'aa', '12345678', 1, '2022-05-09', '12324324', 'aa@gmail.com', 'usuario1', 'contra123', 1),
(13, 'eee123', 'eee', '1234567', 2, '2022-05-11', '909484985', 'aa@gmail.com', 'usuario2', 'contra123', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`iddestino`),
  ADD KEY `idproveedor` (`idproveedor`),
  ADD KEY `iddepartamento` (`iddepartamento`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idreserva`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `iddestino` (`iddestino`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idcliente`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `destino`
--
ALTER TABLE `destino`
  MODIFY `iddestino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

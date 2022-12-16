-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2022 a las 03:44:48
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(250) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `imagen`, `condicion`) VALUES
(10, 2, '', 'Celular XIAOMI Redmi Note 11 128 GB Griss', 132, '', '1671038653.jpg', 1),
(11, 2, '', 'Celular MOTOROLA Moto G60S 128 GB Azul', 326, '', '1671038673.jpg', 1),
(12, 2, '', 'Celular poco Poco M3 Pro 5G 128 MB Negro', 585, '', '1671038690.jpg', 1),
(13, 1, '', 'Camisa Blanca Manga Larga Hombre', 92, '', '1671038730.jpg', 1),
(14, 1, '', 'Camisa Roja Manga Larga Hombre', 91, '', '1671038745.jpg', 1),
(15, 1, '', 'Camisa Negra Hombre', 234, '', '1671038762.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` varchar(150) NOT NULL,
  `condicion` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Camisas', 'descripcion 1', 1),
(2, 'Celulares', 'Celulares', 1),
(3, 'CATEGORIA 3', 'descripcion 3', 0),
(4, 'CATEGORIA 4', 'descripcion 4', 0),
(5, 'CATEGORIA 5', 'descripcion 5', 0),
(6, 'CATEGORIA 6', 'descripcion 6', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL,
  `id_ingreso` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_compra` decimal(11,2) DEFAULT NULL,
  `precio_venta` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `id_ingreso`, `id_articulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(32, 45, 10, 30, '775300.00', '870000.00'),
(33, 45, 11, 40, '620200.00', '850000.00'),
(34, 46, 12, 43, '12334.00', '600000.00'),
(35, 47, 14, 34, '30000.00', '123443.00'),
(36, 48, 14, 10, '23422.00', '45000.00'),
(37, 49, 11, 52, '520004.00', '823000.00'),
(38, 50, 13, 52, '34000.00', '52000.00'),
(39, 50, 14, 23, '84000.00', '92000.00'),
(40, 51, 10, 2, '34554.00', '223458.00');

--
-- Disparadores `detalle_ingreso`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
 UPDATE articulo SET stock = stock + NEW.cantidad 
 WHERE articulo.idarticulo = NEW.id_articulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) NOT NULL,
  `num_comprobante` varchar(10) DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
(45, 1, 1, 'Factura', '23424', '5332', '2022-12-14 00:00:00', '19.00', '48067000.00', 'Anulado'),
(46, 9, 1, 'Factura', '123', '123', '2022-12-14 00:00:00', '18.00', '530362.00', 'Anulado'),
(47, 2, 1, 'Factura', '123123', '123', '2022-12-14 00:00:00', '18.00', '1020000.00', 'Anulado'),
(48, 8, 1, 'Factura', '3', '123123', '2022-12-14 00:00:00', '18.00', '234220.00', 'Anulado'),
(49, 8, 1, 'Factura', '123', '123123', '2022-12-16 00:00:00', '18.00', '27040208.00', 'Aceptado'),
(50, 8, 1, 'Factura', '123123', '123123', '2022-12-17 00:00:00', '18.00', '3700000.00', 'Aceptado'),
(51, 8, 1, 'Factura', '3435', '343', '2022-12-14 00:00:00', '18.00', '69108.00', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `idusuario`, `descripcion`, `fecha`, `estado`) VALUES
(6, 13, 'se actualizo sus datos', '2020-04-11', 1),
(10, 13, 'se actualizo sus datos', '2020-04-11', 1),
(12, 13, 'se actualizo sus datos', '2020-04-11', 1),
(13, 13, 'se actualizo su contraseña 1', '2020-04-11', 1),
(14, 18, 'se actualizo sus datos', '2020-04-11', 1),
(15, 18, 'se actualizo su contraseña', '2020-04-11', 1),
(16, 18, 'se actualizo sus datos', '2020-04-11', 1),
(17, 18, 'se actualizo su contraseña', '2020-04-11', 1),
(18, 18, 'se actualizo sus datos', '2020-04-11', 1),
(19, 18, 'se actualizo sus datos', '2020-04-11', 1),
(20, 18, 'se actualizo sus datos', '2020-04-11', 1),
(21, 18, 'se actualizo su contraseña', '2020-04-11', 1),
(22, 18, 'se actualizo sus datos', '2020-04-11', 1),
(23, 18, 'se actualizo su contraseña', '2020-04-11', 1),
(24, 18, 'se actualizo su contraseña', '2020-04-16', 1),
(25, 13, 'se actualizo su contraseña', '2020-04-16', 1),
(26, 13, 'se actualizo sus datos', '2020-04-16', 1),
(27, 13, 'se actualizo su contraseña', '2020-04-16', 1),
(28, 18, 'se actualizo su contraseña', '2020-04-16', 1),
(29, 18, 'se actualizo sus datos', '2020-04-16', 1),
(30, 18, 'se actualizo sus datos', '2020-04-16', 1),
(31, 18, 'se actualizo sus datos', '2020-04-16', 1),
(32, 16, 'se actualizo sus datos', '2020-04-16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacenar'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acesso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(1, 'Proveedor', 'Jiame villa', 'CEDULA', '1003250255', 'el caguan', '123213213', 'jaumaen@gmail.com'),
(2, 'Proveedor', 'felipe', 'RUT', '10030032', 'neiva', '317658431', 'felipemanrique018@gmail.com'),
(3, 'Cliente', 'jose alfredo', 'C.C', '1122555', 'neiva-huila', '33546565', 'josealfredo@gmail.com'),
(6, 'Cliente', 'felipe', 'CEDULA', '10038012312', 'el caguan', '1232134', 'test@gmail.com'),
(7, 'Proveedor', 'jairo', 'CEDULA', '123213123', 'neiva-huila', '320868585', 'jairo@gmail.com'),
(8, 'Proveedor', 'Proveedor prueba', 'CEDULA', '12321', 'sdsadsad', '123123', 'felipemanrique18@gmail.com'),
(9, 'Proveedor', 'Proveedor Nacional', 'CEDULA', '123453', 'Calle 2 #23 43', '8745234', 'provedornacional@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `condicion`, `imagen`) VALUES
(1, 'Super admin', 'RUT', '12321312', 'neiva', '12321321', 'jorge@gmail.com', '0', 'admin', 'f69ed3a744195d7d1429b167f449ed9a76f36ba6a74f997a7bfe179649de32c4', 1, '1671027489.png'),
(2, 'Super admin', 'DNI', '1000323232', 'Neiva-Huila', '12321312', 'felipe18@gmail.com', '0', 'admin123', 'da1a51f975cd750be255d21548eaae1dbaa96ffc997283a6a204f9213a8aca71', 1, '1671027489.png'),
(3, 'felipe', 'CEDULA', '12312312', 'Bogota', '123123', 'test@gmail.com', 'empleado', 'asd123', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, '1671027489.png'),
(4, 'dsadas', 'RUT', '123123', 'sadasd', '123123', 'felipe4@gmail.com', '0', 'sadasd', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, '1671027489.png'),
(5, 'fe', 'DNI', '12312', '', '', '', '0', 'fe', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 0, '1671027489.png'),
(6, 'cristian', 'CEDULA', '123', '', '', '', '', 'admin', 'ac9689e2272427085e35b9d3e3e8bed88cb3434828b43b86fc0596cad4c6e270', 1, '1671027489.png'),
(7, 'jaime', 'CEDULA', '12321312', '', '', '', '', 'jose1', '1cd763f4482ed8c2f58fe7608542b975c0b158c81aae7aaade5d58b0164b4a37', 1, '1671027489.png'),
(8, 'josefa', 'RUT', '123123', '', '', '', '', 'josefa14', '6332d633900c542c332f68b828b2220c528d0df98c166d5be8b3630f58fe36bb', 1, '1671027489.png'),
(9, 'mono', 'DNI', '123123', '', '', '', '', 'mono12', 'aaafdda8069a2528b8eeaadb56743d25c9d44e3a43efef15a60c5be7304099e1', 1, '1671027489.png'),
(10, 'tengo', 'RUT', '23213', '', '', '', '', 'tengo12', 'b6194028112a036c2822f47d6b43f95de0f0d9bc049634b004a10edc1855a22a', 1, '1671027489.png'),
(11, 'binomia', 'DNI', '12312', '', '', '', '', 'binmio', '20a7c72fe20eae0ff0cb5a655e2cbc7c54f9fd968e053a1de2e8038392ce279e', 1, '1671027489.png'),
(12, 'felipe', 'DNI', '10038012312', '', '', 'felipemanrique018@gmail.com', '0', 'felipeadmin', '8412c18b0e934fdf7d1c1e6022bc1e6283ecef72834d2c2d7b3918fdf6769e97', 1, '1671027489.png'),
(13, 'Super admin', 'CEDULA', '1003803278', '', '', 'felipemanrique018@gmail.com', '0', 'felipe123', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, '1671027489.png'),
(14, 'felipe', 'CEDULA', '123123123', '', '', 'felipemanrique018@gmail.com', '0', 'juan', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, '1671027489.png'),
(15, 'ines perdomo', 'CEDULA', '123213213', '', '', '', 'empleado', 'ines', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, '1671027489.png'),
(16, 'jaime andres alberto', 'CEDULA', '10038012312', 'Bogota', '1232312', 'jaime@gmail.com', '0', 'jaime12', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, '1671027489.png'),
(17, 'jose alfredo gutierrez', 'CEDULA', '10038012312', 'Medellin', '', 'jose@gmail.com', 'jefe', 'josealfredo', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, '1671027489.png'),
(18, 'Jaime Manrique', 'CEDULA', '2358887', 'Bogota', '8686472', 'jose@gmail.com', 'empleado', 'jose123', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 1, '1671027489.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idpermiso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(2, 7, 1),
(3, 8, 1),
(4, 10, 3),
(5, 10, 4),
(6, 11, 1),
(7, 11, 2),
(8, 11, 3),
(9, 11, 4),
(10, 11, 5),
(19, 12, 1),
(20, 12, 2),
(21, 12, 3),
(22, 12, 4),
(29, 14, 1),
(30, 14, 1),
(31, 14, 2),
(32, 14, 1),
(33, 14, 2),
(34, 14, 3),
(35, 14, 4),
(36, 14, 5),
(37, 14, 6),
(38, 14, 7),
(39, 14, 1),
(40, 14, 2),
(41, 14, 3),
(42, 14, 4),
(43, 14, 5),
(44, 14, 6),
(45, 14, 7),
(46, 14, 1),
(47, 14, 3),
(48, 14, 4),
(49, 14, 5),
(50, 14, 6),
(51, 14, 7),
(59, 14, 1),
(60, 14, 2),
(61, 14, 3),
(62, 14, 4),
(63, 14, 5),
(64, 14, 7),
(65, 14, 1),
(66, 14, 3),
(67, 14, 4),
(68, 14, 5),
(69, 14, 6),
(70, 14, 7),
(74, 14, 1),
(75, 14, 2),
(76, 14, 3),
(77, 14, 4),
(78, 14, 5),
(79, 14, 6),
(80, 14, 7),
(154, 15, 1),
(155, 15, 3),
(156, 15, 4),
(320, 4, 1),
(321, 4, 2),
(322, 4, 3),
(323, 4, 4),
(324, 4, 5),
(335, 3, 1),
(336, 3, 2),
(337, 3, 3),
(338, 3, 4),
(339, 3, 5),
(346, 17, 1),
(347, 17, 2),
(348, 17, 3),
(349, 17, 4),
(350, 17, 5),
(351, 17, 6),
(463, 13, 1),
(464, 13, 2),
(465, 13, 3),
(466, 13, 4),
(467, 13, 5),
(468, 13, 6),
(469, 13, 7),
(484, 18, 1),
(485, 18, 2),
(486, 18, 3),
(487, 18, 4),
(488, 18, 5),
(489, 18, 6),
(490, 18, 7),
(491, 16, 1),
(492, 16, 2),
(493, 16, 3),
(494, 16, 4),
(495, 16, 6),
(496, 16, 7),
(503, 5, 1),
(504, 5, 2),
(505, 5, 3),
(506, 5, 4),
(507, 5, 5),
(508, 5, 6),
(509, 5, 7),
(517, 1, 1),
(518, 1, 2),
(519, 1, 3),
(520, 1, 4),
(521, 1, 5),
(522, 1, 6),
(523, 1, 7),
(531, 2, 1),
(532, 2, 2),
(533, 2, 3),
(534, 2, 4),
(535, 2, 5),
(536, 2, 6),
(537, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(20) DEFAULT NULL,
  `serie_comprobante` varchar(7) NOT NULL,
  `num_comprobante` varchar(10) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total_venta` decimal(11,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(1, 6, 13, 'Boleta', '001', '002', '2020-04-06 00:00:00', '0.00', '1000.00', 'Aceptado'),
(2, 6, 13, 'Boleta', '', '002', '2020-04-06 00:00:00', '0.00', '500.00', 'Aceptado'),
(3, 3, 13, 'Boleta', '002', '001', '2020-04-06 00:00:00', '0.00', '500.00', 'Aceptado'),
(4, 6, 13, 'Ticket', '001', '002', '2020-04-08 00:00:00', '0.00', '200.00', 'Aceptado'),
(5, 6, 13, 'Boleta', '001', '002', '2020-04-09 00:00:00', '0.00', '1200.00', 'Aceptado'),
(6, 3, 13, 'Boleta', '004', '005', '2020-04-09 00:00:00', '0.00', '1200.00', 'Aceptado'),
(7, 6, 13, 'Boleta', '004', '117', '2020-04-09 00:00:00', '0.00', '1200.00', 'Aceptado'),
(8, 6, 13, 'Boleta', '008', '008', '2020-04-16 00:00:00', '0.00', '2100.00', 'Aceptado'),
(9, 3, 1, 'Ticket', '213', '123123', '2022-12-14 00:00:00', '99.99', '700.00', 'Aceptado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD KEY `fk_articulo_categoria` (`idcategoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_ingreso` (`id_ingreso`),
  ADD KEY `fk_detalle_ingreso_articulo` (`id_articulo`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta` (`idventa`),
  ADD KEY `fk_detalle_venta_articulo` (`idarticulo`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_usuario` (`idusuario`),
  ADD KEY `fk_ingreso_persona` (`idproveedor`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario-notificaion` (`idusuario`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_usuario_permiso_usuario` (`idusuario`),
  ADD KEY `fk_usuario_permiso_permiso` (`idpermiso`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_usuario` (`idusuario`),
  ADD KEY `fk_venta_persona` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_ingreso_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`idarticulo`),
  ADD CONSTRAINT `fk_detalle_ingreso_ingreso` FOREIGN KEY (`id_ingreso`) REFERENCES `ingreso` (`idingreso`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`),
  ADD CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `id_usuario-notificaion` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_usuario_permiso_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`),
  ADD CONSTRAINT `fk_usuario_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2017 a las 07:32:37
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nombre` varchar(45) NOT NULL,
  `img` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombre`, `img`) VALUES
('Musica', 'muxl.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `fecha` date NOT NULL,
  `id_compra` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `tipo_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion`
--

CREATE TABLE `descripcion` (
  `producto` varchar(45) NOT NULL,
  `sn` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `tam` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `grantia` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `usuario` varchar(45) NOT NULL,
  `tipo` int(11) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `num_int` varchar(45) DEFAULT NULL,
  `num_ext` varchar(45) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `delegacion` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `entre_calles` varchar(60) DEFAULT NULL,
  `instrucciones` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`usuario`, `tipo`, `calle`, `num_int`, `num_ext`, `cp`, `estado`, `ciudad`, `delegacion`, `colonia`, `entre_calles`, `instrucciones`) VALUES
('aasd', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('awe', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('dsa', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('email0', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('email1', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('email5', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('g', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('Juan', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('q', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('qA', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('w', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c'),
('ww', 0, 'c', 'c', 'c', '0', 'c', 'c', 'c', 'c', 'c', 'c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `producto` varchar(45) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`usuario`, `password`) VALUES
('aasd', '123'),
('awe', '123'),
('Charly', 'Charly'),
('dsa', '123'),
('email0', '123'),
('email1', '123'),
('email5', '123'),
('g', '123'),
('Juan', '123'),
('q', '123'),
('qA', '123'),
('w', '123'),
('ww', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_contacto`
--

CREATE TABLE `medio_contacto` (
  `usuario` varchar(45) NOT NULL,
  `contacto` varchar(45) NOT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `tipo` varchar(45) NOT NULL,
  `in_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_compra` int(11) NOT NULL,
  `producto` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `numRas` varchar(45) NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `id_pedido` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_compra`
--

CREATE TABLE `pedidos_compra` (
  `pedido` varchar(45) NOT NULL,
  `compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos_compra`
--

INSERT INTO `pedidos_compra` (`pedido`, `compra`) VALUES
('d', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `descripbreve` text,
  `vendedor` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `marca`, `calificacion`, `precio`, `descripbreve`, `vendedor`, `categoria`) VALUES
('CSNP00000001', 'Teclado y Mause', 'Yamaha', 0, 2500, 'El script esta desarrollado en PHP, y ademas de generar la cadena aleatoria, te permite indicarle de que longitud deseas que devuelva el string aleatorio.', 'Juan', 'Musica'),
('CSNP00000002', 'Memoria USB', 'Linio', 0, 585.2, 'a', 'Juan', 'Musica'),
('CSNP00000003', 'Pantalla Led', 'Linio', 0, 585.2, 'a', 'Juan', 'Musica'),
('CSNP00000004', 'Pedal Sustain', 'Linio', 0, 585.2, 'a', 'Juan', 'Musica'),
('CSNP00000005', 'Moto Z Play', 'Lenovo', 0, 5000, 'a', 'Juan', 'Musica'),
('CSNP00000006', 'Refrigerador', 'Linio', 0, 585.2, 'a', 'Juan', 'Musica'),
('CSNP00000007', 'Teclado Musical', 'Linio', 0, 585.2, 'a', 'Juan', 'Musica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resena`
--

CREATE TABLE `resena` (
  `usuario` varchar(45) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `texto` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resena`
--

INSERT INTO `resena` (`usuario`, `producto`, `texto`) VALUES
('aasd', 'CSNP00000001', 'asdfasdfanfda df a sdf as df'),
('aasd', 'CSNP00000002', 'asdfasdfanfda df a sdf as df'),
('aasd', 'CSNP00000004', 'asdfasdfanfda df a sdf as df'),
('awe', 'CSNP00000001', 'asdfasdfanfda df a sdf as df'),
('awe', 'CSNP00000006', 'asdfasdfanfda df a sdf as df'),
('Juan', 'CSNP00000002', 'asdfghjk'),
('Juan', 'CSNP00000004', 'asdfghjk'),
('q', 'CSNP00000001', 'asdfasdfanfda df a sdf as df');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `email` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `foto` varchar(80) NOT NULL,
  `sexo` char(1) NOT NULL,
  `fecha_nac` date NOT NULL,
  `num` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`email`, `nombre`, `apellido`, `foto`, `sexo`, `fecha_nac`, `num`) VALUES
('aasd', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('awe', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('Charly', 'Charly', 'Charly', 'Charly', 'M', '2017-04-04', '5567582223'),
('dsa', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('email0', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('email1', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('email5', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('g', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('Juan', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('q', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('qA', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('w', 'J', 'A', '/foto', 'M', '2017-03-01', '5'),
('ww', 'J', 'A', '/foto', 'M', '2017-03-01', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `idVendedor` varchar(45) NOT NULL,
  `razonSocial` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `logo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`idVendedor`, `razonSocial`, `descripcion`, `logo`) VALUES
('Juan', 'ChinaPost', 'El mejor vendedor', 'juanVende.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`usuario`,`id_compra`),
  ADD KEY `2_idx` (`usuario`);

--
-- Indices de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  ADD PRIMARY KEY (`producto`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`usuario`,`tipo`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`producto`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `medio_contacto`
--
ALTER TABLE `medio_contacto`
  ADD PRIMARY KEY (`usuario`,`contacto`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`in_tipo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `1_idx` (`producto`);

--
-- Indices de la tabla `pedidos_compra`
--
ALTER TABLE `pedidos_compra`
  ADD PRIMARY KEY (`pedido`,`compra`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idVe_idx` (`vendedor`),
  ADD KEY `cat_idx` (`categoria`);

--
-- Indices de la tabla `resena`
--
ALTER TABLE `resena`
  ADD PRIMARY KEY (`usuario`,`producto`),
  ADD KEY `ResID_idx` (`producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`idVendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `in_tipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `usr1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`email`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `cvbnm` FOREIGN KEY (`producto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`email`) ON DELETE CASCADE;

--
-- Filtros para la tabla `medio_contacto`
--
ALTER TABLE `medio_contacto`
  ADD CONSTRAINT `asd` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`email`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `1` FOREIGN KEY (`producto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `cat` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`nombre`),
  ADD CONSTRAINT `idVe` FOREIGN KEY (`vendedor`) REFERENCES `vendedor` (`idVendedor`);

--
-- Filtros para la tabla `resena`
--
ALTER TABLE `resena`
  ADD CONSTRAINT `Redid` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`email`),
  ADD CONSTRAINT `ResID` FOREIGN KEY (`producto`) REFERENCES `producto` (`idproducto`);

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `venID` FOREIGN KEY (`idVendedor`) REFERENCES `usuario` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2023 a las 23:06:06
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_libros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id_autor` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Edad` varchar(255) DEFAULT NULL,
  `Nacionalidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `Nombre`, `Edad`, `Nacionalidad`) VALUES
(1, 'Dmitri Glujovski', '44', 'Ruso'),
(2, 'Arkadi y Borís Strugatski', 'Fallecidos', 'Rusos'),
(3, 'Vladimir Berezin', '56', 'Ruso'),
(4, 'Brandon Sanderson', '49', 'Estados Unidos'),
(5, 'robert jordan', 'fallecido', 'Estados Unidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libros` int(255) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Saga` varchar(255) NOT NULL,
  `Genero` varchar(255) NOT NULL,
  `id_autor` int(255) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libros`, `Titulo`, `Saga`, `Genero`, `id_autor`, `Fecha_de_publicacion_original`, `Fecha_de_publicacion_traduccion`, `Editorial_original`, `Editorial_traduccion`) VALUES
(1, 'Metro 2033', 'Metro', 'Ciencia Ficcion', 1, '2007', '2009', 'Eksmo', 'Gollancz'),
(2, 'Pícnic junto al Camino', 'S.T.A.L.K.E.R.', 'Ciencia ficcion', 2, '1972', '1978', 'Molodaya gvardiya', 'Emecé Editores'),
(3, 'Metro 2034', 'Metro', 'Ciencia Ficcion', 1, '2010', '2010', 'Eksmo', 'Timunmas'),
(4, 'Metro 2033: Road Signs', 'Metro', 'Ciencia Ficcion', 3, '2009', '2010', 'AST', 'Sin traduccion.'),
(7, 'El camino de los reyes', 'El Archivo de las tormentas', 'Fantasia', 1, '2009', '2010', 'tor', 'Nova'),
(8, 'palabras radiantes', 'el archivo de las tormentas ', 'fantasia', 4, '2012', NULL, 'tor', 'nova');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(260) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user_id`, `user_name`, `password`) VALUES
(1, 'webadmin', '$2y$10$pH0G4tVtvT1dNUGvC5DXU.xLK64rheExLyCwfKnqGAR6O4h0iq6Ei'),
(3, 'Bhikoz', '$2y$10$SPKPM/7qlYi8LK2dO9gFiu//dl0/Hvei3JL3OawudnEhkcBvWv9jW');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libros`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libros` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2021 a las 22:12:51
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arya`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academiclevels`
--

CREATE TABLE `academiclevels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academiclevels`
--

INSERT INTO `academiclevels` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Licenciado', 'Graduado Universitario', '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41'),
(2, 'Bachiller', 'Finalizo Bachillerato', '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code_one` int(11) NOT NULL,
  `code_two` int(11) NOT NULL,
  `code_three` int(11) NOT NULL,
  `code_four` int(11) NOT NULL,
  `code_five` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `balance_previus` decimal(64,2) NOT NULL,
  `rate` decimal(64,2) DEFAULT NULL,
  `coin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id`, `code_one`, `code_two`, `code_three`, `code_four`, `code_five`, `period`, `description`, `type`, `level`, `balance_previus`, `rate`, `coin`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, 0, 'ACTIVO', 'Debe', 1, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(2, 1, 1, 0, 0, 0, 0, 'CORRIENTE', 'Debe', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(3, 1, 1, 1, 0, 0, 0, 'Efectivo y Equivalente de Efectivo', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(4, 1, 1, 1, 1, 0, 0, 'Caja', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(5, 1, 1, 1, 1, 1, 0, 'Caja General', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(6, 1, 1, 1, 1, 2, 0, 'Caja Chica', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(7, 1, 1, 1, 2, 0, 0, 'Bancos', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(8, 1, 1, 1, 2, 1, 0, 'Banco 1', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(9, 1, 1, 1, 2, 2, 0, 'Punto de Venta Banco 1', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(10, 1, 1, 2, 0, 0, 0, 'Activos Exigibles', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(11, 1, 1, 2, 1, 0, 0, 'Cuentas por Cobrar', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(12, 1, 1, 2, 1, 1, 0, 'Cuentas por Cobrar Clientes', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(13, 1, 1, 2, 1, 2, 0, 'Cuentas por Cobrar Empleados', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(14, 1, 1, 2, 1, 3, 0, 'Cuentas por Cobrar Accionistas', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(15, 1, 1, 2, 1, 4, 0, 'Cuentas por Cobrar Inter-compañías', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(16, 1, 1, 3, 0, 0, 0, 'Activos Realizables', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(17, 1, 1, 3, 1, 0, 0, 'Inventario', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(18, 1, 1, 3, 1, 1, 0, 'Mercancia para la Venta', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(19, 1, 1, 3, 1, 2, 0, 'Materiales y articulo de Oficina', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(20, 1, 1, 3, 1, 3, 0, 'Materiales de Limpieza', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(21, 1, 1, 3, 1, 4, 0, 'Repuestos Maquinaria y Equipo', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(22, 1, 1, 3, 2, 0, 0, 'Inventario Materia Prima', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(23, 1, 1, 3, 2, 1, 0, 'Materia Prima', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(24, 1, 1, 3, 2, 2, 0, 'Proceso', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(25, 1, 1, 4, 0, 0, 0, 'Otros Activos Circulantes', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(26, 1, 1, 4, 1, 0, 0, 'Impuestos Anticipados y Retenidos', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(27, 1, 1, 4, 1, 1, 0, 'IVA (Credito Fiscal)', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(28, 1, 1, 4, 1, 2, 0, 'IVA Retenido por Terceros', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(29, 1, 1, 4, 1, 3, 0, 'Impuesto Sobre la Renta Retenido por Terceros', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(30, 1, 1, 4, 1, 4, 0, 'ISLR Pagado en Declaración Anticipada', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(31, 1, 1, 4, 1, 5, 0, 'Impuesto Sobre la Renta (Diferido Activo)', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(32, 1, 1, 4, 1, 6, 0, 'Impuestos Municipales en Declaración Estimada', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(33, 1, 1, 4, 1, 7, 0, 'Impuestos Retenidos Agentes SENIAT', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(34, 1, 1, 4, 2, 0, 0, 'Anticipos a Proveedores', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(35, 1, 1, 4, 2, 1, 0, 'Anticipos a Proveedores Nacionales', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(36, 1, 1, 4, 2, 2, 0, 'Anticipos a Proveedores Internacionales', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(37, 1, 2, 0, 0, 0, 0, 'Activo Fijo', 'Debe', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(38, 1, 2, 1, 0, 0, 0, 'Activos Tangibles', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(39, 1, 2, 1, 1, 0, 0, 'Activos Depreciables', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(40, 1, 2, 1, 1, 1, 0, 'Propiedad, Planta y Equipo', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(41, 1, 2, 1, 1, 2, 0, 'Mobiliario y Equipos de Oficina', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(42, 1, 2, 1, 1, 3, 0, 'Herramientas y Maquinaria de Trabajo', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(43, 1, 2, 1, 1, 4, 0, 'Vehiculos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(44, 1, 2, 1, 1, 5, 0, 'Equipos de Computacion', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(45, 1, 2, 1, 2, 0, 0, 'Activos No Depreciables', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(46, 1, 2, 1, 2, 1, 0, 'Terreno', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(47, 1, 2, 1, 3, 0, 0, 'Depreciación Acumulada', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(48, 1, 2, 1, 3, 1, 0, 'Depreciación Acumulada Mobiliario y Equipos de Oficina', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(49, 1, 2, 1, 3, 2, 0, 'Depreciación Acumulada Herramientas y Equipos de Trabajo', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:31', '2021-08-11 20:12:31'),
(50, 1, 2, 1, 3, 3, 0, 'Depreciación Acumulada Vehículo', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(51, 1, 2, 1, 3, 4, 0, 'Depreciación Equipos de Computación', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(52, 1, 2, 2, 0, 0, 0, 'Activos Intangibles', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(53, 1, 2, 2, 1, 0, 0, 'Marcas', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(54, 1, 2, 2, 1, 1, 0, 'Servicio de Empresa', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(55, 1, 2, 2, 1, 2, 0, 'Marca de Producto', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(56, 1, 2, 2, 2, 0, 0, 'Software', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(57, 1, 2, 2, 2, 1, 0, 'Software Contable', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(58, 1, 3, 0, 0, 0, 0, 'Otros Activos', 'Debe', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(59, 1, 3, 1, 0, 0, 0, 'Activos Diferidos', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(60, 1, 3, 1, 1, 0, 0, 'Gastos de Constitucion', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(61, 1, 3, 1, 1, 1, 0, 'Gastos de Constitucion', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(62, 1, 3, 1, 2, 0, 0, 'Gastos de Construccion', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(63, 1, 3, 2, 0, 0, 0, 'Otros Activos Varios', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(64, 1, 3, 2, 1, 0, 0, 'Otras Inversiones', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(65, 1, 3, 2, 1, 1, 0, 'Inversiones en Acciones', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(66, 2, 0, 0, 0, 0, 0, 'PASIVO', 'Haber', 1, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(67, 2, 1, 0, 0, 0, 0, 'Pasivos a Corto Plazo', 'Haber', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(68, 2, 1, 1, 0, 0, 0, 'Cuentas por Pagar', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(69, 2, 1, 1, 1, 0, 0, 'Cuentas por Pagar Comerciales', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(70, 2, 1, 1, 1, 1, 0, 'Cuentas por Pagar Proveedores', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(71, 2, 1, 1, 1, 2, 0, 'Cuentas por Pagar Accionistas', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(72, 2, 1, 1, 1, 3, 0, 'Cuentas por Pagar Intercompañias', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(73, 2, 1, 1, 1, 4, 0, 'Descuentos en Pago', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(74, 2, 1, 2, 0, 0, 0, 'Nomina por Pagar', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(75, 2, 1, 2, 1, 0, 0, 'Remuneraciones por Pagar', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(76, 2, 1, 2, 1, 1, 0, 'Sueldos por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(77, 2, 1, 2, 1, 2, 0, 'Prestaciones Sociales', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(78, 2, 1, 2, 1, 3, 0, 'Bono Vacacional', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(79, 2, 1, 2, 1, 4, 0, 'Vacaciones', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(80, 2, 1, 2, 1, 5, 0, 'Utilidades', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(81, 2, 1, 2, 1, 6, 0, 'Otras provisiones', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(82, 2, 1, 2, 2, 0, 0, 'Aportes Personal por Pagar', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(83, 2, 1, 2, 2, 1, 0, 'Aportes al Seguro Social Obligatorio por pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(84, 2, 1, 2, 2, 2, 0, 'Aportes al Sistema de Paro Forzoso por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(85, 2, 1, 2, 2, 3, 0, 'Aportes al INCES por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(86, 2, 1, 2, 2, 4, 0, 'Aportes al Fondo de Ahorro Obligatorio para la Vivienda por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(87, 2, 1, 2, 2, 5, 0, 'Aporte para la Ciencia y tecnologia por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(88, 2, 1, 2, 2, 6, 0, 'Responsabilidad Social Por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(89, 2, 1, 2, 2, 7, 0, 'Otros Aportes Institucionales por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(90, 2, 1, 3, 0, 0, 0, 'Obligaciones Fiscales por Pagar', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(91, 2, 1, 3, 1, 0, 0, 'Impuestos Tributarios por Pagar', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(92, 2, 1, 3, 1, 1, 0, 'Impuesto Sobre la Renta por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(93, 2, 1, 3, 1, 2, 0, 'Impuesto Sobre la Renta por Enterar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(94, 2, 1, 3, 1, 3, 0, 'Impuesto Sobre la Renta Diferido de Pasivos', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(95, 2, 1, 3, 1, 3, 0, 'Impuesto Sobre la Renta Diferido de Pasivos', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:32', '2021-08-11 20:12:32'),
(96, 2, 1, 3, 1, 4, 0, 'Debito Fiscal IVA por Pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(97, 2, 1, 3, 1, 5, 0, 'Debitos Fiscales IVA por Enterar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(98, 2, 1, 3, 1, 6, 0, 'Impuesto Municipal por pagar', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(99, 2, 1, 3, 1, 7, 0, 'IVA por pagar retenido', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(100, 2, 1, 4, 0, 0, 0, 'Creditos Bancarios por Pagar', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(101, 2, 1, 4, 1, 0, 0, 'Creditos Corto Planzo', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(102, 2, 1, 4, 1, 1, 0, 'Banco 1', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(103, 2, 2, 0, 0, 0, 0, 'Pasivos a Largo Plazo', 'Haber', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(104, 2, 2, 1, 0, 0, 0, 'Prestamos a Largo Plazo', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(105, 2, 2, 1, 1, 0, 0, 'Prestamos a Largo Plazo', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(106, 2, 2, 1, 1, 1, 0, 'Cuentas por Pagar Accionistas', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(107, 2, 2, 1, 1, 2, 0, 'Cuentas por Pagar Intercompañias', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(108, 2, 2, 1, 1, 3, 0, 'Creditos por Pagar Largo Plazo', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(109, 2, 3, 0, 0, 0, 0, 'Otros Pasivos', 'Haber', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(110, 2, 3, 1, 0, 0, 0, 'Anticipos', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(111, 2, 3, 1, 1, 0, 0, 'Pasivos sin identificar', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(112, 2, 3, 1, 1, 1, 0, 'Anticipos Clientes', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(113, 2, 3, 1, 1, 2, 0, 'Anticipos Clientes Nacionales', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(114, 2, 3, 1, 1, 3, 0, 'Anticipos Clientes Internacionales', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(115, 3, 0, 0, 0, 0, 0, 'Patrimonio', 'Haber', 1, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(116, 3, 1, 0, 0, 0, 0, 'Patrimonio Negocio', 'Haber', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(117, 3, 1, 1, 0, 0, 0, 'Capital Social', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(118, 3, 1, 1, 1, 0, 0, 'Capital Social Suscrito y Pagado', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(119, 3, 1, 1, 1, 1, 0, 'Accionista 1', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(120, 3, 1, 1, 1, 2, 0, 'Accionista 2', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(121, 3, 1, 1, 2, 0, 0, 'Capital Social Suscripto y No Pagado', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(122, 3, 1, 1, 2, 1, 0, 'Accionista A', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(123, 3, 1, 2, 0, 0, 0, 'Fondos y Reservas', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(124, 3, 1, 2, 1, 0, 0, 'Reservas', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(125, 3, 1, 2, 1, 1, 0, 'Reserva Legal', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(126, 3, 1, 2, 1, 2, 0, 'Reserva por Revalorizacion de Activos', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(127, 3, 2, 0, 0, 0, 0, 'Superavit o Deficit', 'Haber', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(128, 3, 2, 1, 0, 0, 0, 'Superavit o Deficit', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(129, 3, 2, 1, 1, 0, 0, 'Superavit o Deficit', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(130, 3, 2, 1, 1, 1, 0, 'Superavit o Deficit', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(131, 3, 1, 3, 0, 0, 0, 'Resultados', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(132, 3, 1, 3, 1, 0, 0, 'Resultados Anteriores', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(133, 3, 1, 3, 1, 1, 0, 'Utilidad de Ejercicios Anteriores', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(134, 3, 1, 3, 1, 2, 0, 'Perdida de Ejercicios Anteriores', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(135, 3, 1, 3, 1, 3, 0, 'Amortización de Ejercicios Anteriores', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(136, 3, 1, 3, 2, 0, 0, 'Resultado del Ejercicio', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(137, 3, 1, 3, 2, 1, 0, 'Utilidades del Ejercicio', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(138, 4, 0, 0, 0, 0, 0, 'Ingresos', 'Haber', 1, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(139, 4, 1, 0, 0, 0, 0, 'Ingresos Operacionales', 'Haber', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(140, 4, 1, 1, 0, 0, 0, 'Venta Generales', 'Haber', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(141, 4, 1, 1, 1, 0, 0, 'Venta Netas', 'Haber', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(142, 4, 1, 1, 1, 1, 0, 'Ventas por Bienes', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(143, 4, 1, 1, 1, 2, 0, 'Ventas por Servicios', 'Haber', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(144, 5, 0, 0, 0, 0, 0, 'Costos', 'Debe', 1, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(145, 5, 1, 0, 0, 0, 0, 'Costos Operacionales', 'Debe', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(146, 5, 1, 1, 0, 0, 0, 'Costo de Ventas', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(147, 5, 1, 1, 1, 0, 0, 'Costo de Venta Mercancía', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(148, 5, 1, 1, 1, 1, 0, 'Costo de Mercancía', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(149, 5, 1, 1, 1, 2, 0, 'Gastos de importacion', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(150, 5, 1, 1, 1, 3, 0, 'Gastos de aduanas', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:33', '2021-08-11 20:12:33'),
(151, 5, 1, 1, 1, 4, 0, 'Gastos de aranceles', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(152, 5, 1, 1, 1, 5, 0, 'Gastos de Transporte de Mercancia', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(153, 5, 1, 1, 1, 6, 0, 'Desaduanaje', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(154, 5, 1, 1, 1, 7, 0, 'Gastos de Exportación', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(155, 6, 0, 0, 0, 0, 0, 'Gastos', 'Debe', 1, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(156, 6, 1, 0, 0, 0, 0, 'Gastos Generales', 'Debe', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(157, 6, 1, 1, 0, 0, 0, 'Gastos Operacionales', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(158, 6, 1, 1, 1, 0, 0, 'Gastos de Personal', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(159, 6, 1, 1, 1, 1, 0, 'Sueldos y Salarios', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(160, 6, 1, 1, 1, 2, 0, 'Bono de Alimentacion', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(161, 6, 1, 1, 1, 3, 0, 'Utilidades', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(162, 6, 1, 1, 1, 4, 0, 'Prestaciones Sociales', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(163, 6, 1, 1, 1, 5, 0, 'Capacitacion del Personal', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(164, 6, 1, 1, 1, 6, 0, 'Uniformes', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(165, 6, 1, 1, 1, 7, 0, 'Bonos especiales por Eficiencia', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(166, 6, 1, 1, 1, 8, 0, 'Seguro H.C. al Personal', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(167, 6, 1, 1, 1, 9, 0, 'Otros Beneficios al Personal', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(168, 6, 1, 1, 1, 10, 0, 'Viáticos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(169, 6, 1, 1, 1, 11, 0, 'Bono Vacacional', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(170, 6, 1, 1, 1, 12, 0, 'Vacaciones', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(171, 6, 1, 1, 1, 13, 0, 'IVVS', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(172, 6, 1, 1, 1, 14, 0, 'Liquidación', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(173, 6, 1, 1, 2, 0, 0, 'Gastos por Aportes al Trabajador', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(174, 6, 1, 1, 2, 1, 0, 'Aportes al Seguro Social Obligatorio', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(175, 6, 1, 1, 2, 2, 0, 'Aportes al Sistema de Paro Forzoso', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(176, 6, 1, 1, 2, 3, 0, 'Aportes al INCE', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(177, 6, 1, 1, 2, 4, 0, 'Aportes al Fondo de Ahorro Obligatorio', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(178, 6, 1, 1, 2, 5, 0, 'Aportes y para la Ciencia y tecnología', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(179, 6, 1, 1, 2, 6, 0, 'Responsabilidad Social', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(180, 6, 1, 1, 2, 7, 0, 'Otros Aportes Institucionales', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(181, 6, 1, 1, 3, 0, 0, 'Gastos por Tributos Municipales', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(182, 6, 1, 1, 3, 1, 0, 'Impuesto sobre Actividades Economicas', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(183, 6, 1, 1, 3, 2, 0, 'Impuesto Vehicular', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(184, 6, 1, 1, 3, 3, 0, 'Impuesto sobre Publicidad y Propaganda', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(185, 6, 1, 1, 3, 4, 0, 'Impuesto Sobre Inmuebles Urbanos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(186, 6, 1, 1, 3, 5, 0, 'Solvencias', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(187, 6, 1, 1, 3, 6, 0, 'Permisos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(188, 6, 1, 1, 3, 7, 0, 'Inspeccion de Bomberos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(189, 6, 1, 1, 3, 8, 0, 'Patente', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(190, 6, 1, 2, 0, 0, 0, 'Gastos de Administracion y Ventas', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(191, 6, 1, 2, 1, 0, 0, 'Gastos de Administracion', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(192, 6, 1, 2, 1, 1, 0, 'Gastos de Alquiler', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(193, 6, 1, 2, 1, 2, 0, 'Papeleria y articulos de Oficina', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:34', '2021-08-11 20:12:34'),
(194, 6, 1, 2, 1, 3, 0, 'Gastos de Permisología', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(195, 6, 1, 2, 1, 4, 0, 'Gastos de Seguros', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(196, 6, 1, 2, 1, 5, 0, 'Gastos Legales', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(197, 6, 1, 2, 1, 6, 0, 'Gastos de Honorarios Profesionales', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(198, 6, 1, 2, 1, 7, 0, 'Gastos de Comida y Representación', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(199, 6, 1, 2, 1, 8, 0, 'Gastos de Oficina', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(200, 6, 1, 2, 1, 9, 0, 'Gastos de Seguro', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(201, 6, 1, 2, 1, 10, 0, 'Gasto de Luz', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(202, 6, 1, 2, 1, 11, 0, 'Gasto de Agua', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(203, 6, 1, 2, 1, 12, 0, 'Gasto de Aseo', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(204, 6, 1, 2, 1, 13, 0, 'Gastos de Internet', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(205, 6, 1, 2, 1, 14, 0, 'Gastos de Telefono', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(206, 6, 1, 2, 1, 15, 0, 'Gastos de Servicio Estacionamiento', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(207, 6, 1, 2, 1, 16, 0, 'Gasto de Membresia', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(208, 6, 1, 2, 1, 17, 0, 'Gastos de Transporte', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(209, 6, 1, 2, 2, 0, 0, 'Gasto de Ventas', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(210, 6, 1, 2, 2, 1, 0, 'Gasto de Publicidad', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(211, 6, 1, 2, 2, 2, 0, 'Gasto de Representación', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(212, 6, 1, 3, 0, 0, 0, 'Gastos Operación Activos', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(213, 6, 1, 3, 1, 0, 0, 'Gastos de Depreciación', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(214, 6, 1, 3, 1, 1, 0, 'Gastos de Depreciación', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(215, 6, 1, 3, 2, 0, 0, 'Gastos de Inventario', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(216, 6, 1, 3, 2, 1, 0, 'Gastos de ajuste de inventario', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(217, 6, 1, 4, 0, 0, 0, 'Gastos Parafiscales', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(218, 6, 1, 4, 1, 0, 0, 'Tributos Estados', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(219, 6, 1, 4, 1, 1, 0, 'Impuestos Sobre la Renta', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:35', '2021-08-11 20:12:35'),
(220, 6, 1, 4, 1, 2, 0, 'Aportes a franqueo postal', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(221, 7, 0, 0, 0, 0, 0, 'Otros Ingresos y Egresos', 'Debe', 1, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(222, 7, 1, 0, 0, 0, 0, 'Otros Ingresos', 'Debe', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(223, 7, 1, 1, 0, 0, 0, 'Otros Ingresos', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(224, 7, 1, 1, 1, 0, 0, 'Otros Ingresos', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(225, 7, 1, 1, 1, 1, 0, 'Intereses Ganados', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(226, 7, 1, 1, 1, 2, 0, 'Ganancias en Cambio de Divisas', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(227, 7, 1, 1, 1, 3, 0, 'Ganancias en Ventas de Activos Fijos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(228, 7, 1, 1, 1, 4, 0, 'Otros Ingresos No Identificados', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(229, 7, 2, 0, 0, 0, 0, 'Otros Egresos', 'Debe', 2, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:36', '2021-08-11 20:12:36'),
(230, 7, 2, 1, 0, 0, 0, 'Otros Egresos', 'Debe', 3, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(231, 7, 2, 1, 1, 0, 0, 'Costos Integral de Financiamiento', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(232, 7, 2, 1, 1, 1, 0, 'Intereses Gastos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(233, 7, 2, 1, 1, 2, 0, 'Pérdidas en Cambio de Divisas', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(234, 7, 2, 1, 1, 3, 0, 'Comisiones Bancarias', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(235, 7, 2, 1, 1, 4, 0, 'Pérdidas en Ventas de Activos Fijos', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(236, 7, 2, 1, 1, 5, 0, 'Pérdidas en Cuentas Incobrables', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(237, 7, 2, 1, 2, 0, 0, 'Impuestos No Deducibles', 'Debe', 4, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(238, 7, 2, 1, 2, 1, 0, 'Impuesto a las Grandes Transacciones', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(239, 7, 2, 1, 2, 2, 0, 'Gasto corriente ISLR', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(240, 7, 2, 1, 2, 3, 0, 'Impuesto Diferido', 'Debe', 5, '0.00', '0.00', NULL, '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_historials`
--

CREATE TABLE `account_historials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_account` bigint(20) UNSIGNED NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `period` int(11) NOT NULL,
  `balance_previous` decimal(64,2) NOT NULL,
  `balance_current` decimal(64,2) NOT NULL,
  `debe` decimal(64,2) NOT NULL,
  `haber` decimal(64,2) NOT NULL,
  `debe_coin` decimal(64,2) DEFAULT NULL,
  `haber_coin` decimal(64,2) DEFAULT NULL,
  `rate` decimal(64,2) DEFAULT NULL,
  `coin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anticipos`
--

CREATE TABLE `anticipos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_client` bigint(20) UNSIGNED DEFAULT NULL,
  `id_provider` bigint(20) UNSIGNED DEFAULT NULL,
  `id_account` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_quotation` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `amount` decimal(64,2) NOT NULL,
  `rate` decimal(64,2) NOT NULL,
  `coin` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `parroquia_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_contact` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_contact` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observation` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `branches`
--

INSERT INTO `branches` (`id`, `company_id`, `parroquia_id`, `description`, `direction`, `phone`, `phone2`, `person_contact`, `phone_contact`, `observation`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 10111, 'Sucursal Principal', 'Chacaito', '0212-7651562', '0212-7651569', 'Nestor', '0414-2351562', 'Ninguna', '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_vendor` bigint(20) UNSIGNED DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `type_code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_rif` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days_credit` int(11) NOT NULL,
  `amount_max_credit` decimal(64,2) DEFAULT NULL,
  `percentage_retencion_iva` decimal(64,2) DEFAULT NULL,
  `percentage_retencion_islr` decimal(64,2) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `id_vendor`, `id_user`, `type_code`, `name`, `cedula_rif`, `direction`, `city`, `country`, `phone1`, `phone2`, `days_credit`, `amount_max_credit`, `percentage_retencion_iva`, `percentage_retencion_islr`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'V-', 'Primer Cliente', '17.615.785', 'Chacao', 'Caracas', 'Venezuela', '0414 265-1651', '0424 965-2952', 9, '999999999999.99', '12.00', '10.00', '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `colors`
--

INSERT INTO `colors` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Negro', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40'),
(2, 'Blanco', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision_types`
--

CREATE TABLE `comision_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comision_types`
--

INSERT INTO `comision_types` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Comision 1', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `login` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_rif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `franqueo_postal` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_1` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax_2` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax_3` decimal(15,2) NOT NULL DEFAULT 0.00,
  `retention_islr` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tipoinv_id` bigint(20) UNSIGNED NOT NULL,
  `tiporate_id` bigint(20) UNSIGNED NOT NULL,
  `rate` decimal(64,2) NOT NULL,
  `rate_petro` decimal(64,2) NOT NULL,
  `foto_company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `login`, `email`, `code_rif`, `razon_social`, `period`, `phone`, `address`, `franqueo_postal`, `tax_1`, `tax_2`, `tax_3`, `retention_islr`, `tipoinv_id`, `tiporate_id`, `rate`, `rate_petro`, `foto_company`, `status`, `created_at`, `updated_at`) VALUES
(1, 'trekexol', 'CEFREITAS.16@GMAIL.COM', '003548625-9', 'Empresa DEMO ARYA', '2021', '0424 201-3215', 'PLAZA VENEZUELA', '1010', '16.00', '0.00', '0.00', '0.00', 1, 1, '3115193.41', '9000000.00', 'default', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detail_vouchers`
--

CREATE TABLE `detail_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_account` bigint(20) UNSIGNED NOT NULL,
  `id_header_voucher` bigint(20) UNSIGNED DEFAULT NULL,
  `id_invoice` bigint(20) UNSIGNED DEFAULT NULL,
  `id_expense` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tasa` decimal(64,2) NOT NULL,
  `debe` decimal(64,2) NOT NULL,
  `haber` decimal(64,2) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `salary_types_id` bigint(20) UNSIGNED NOT NULL,
  `profession_id` bigint(20) UNSIGNED NOT NULL,
  `estado_id` bigint(20) UNSIGNED NOT NULL,
  `municipio_id` bigint(20) UNSIGNED NOT NULL,
  `parroquia_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `id_empleado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto_pago` double(64,2) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acumulado_prestaciones` double(64,2) NOT NULL,
  `acumulado_utilidades` double(64,2) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_employee` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_utilities` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `position_id`, `salary_types_id`, `profession_id`, `estado_id`, `municipio_id`, `parroquia_id`, `branch_id`, `id_empleado`, `apellidos`, `nombres`, `fecha_ingreso`, `fecha_egreso`, `fecha_nacimiento`, `direccion`, `monto_pago`, `email`, `telefono1`, `acumulado_prestaciones`, `acumulado_utilidades`, `status`, `code_employee`, `amount_utilities`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 101, 10102, 1, '26.396.591', 'Prueba', 'Primer Empleado', '2021-04-01', NULL, '1997-09-09', 'Fuerzas Armadas', 1561651156.10, 'cefreitas.16@gmail.com', '0414 236-1514', 0.00, 0.00, '1', NULL, 'Ma', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'DISTRITO CAPITAL', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2, 'ANZOATEGUI', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(3, 'APURE', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(4, 'ARAGUA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(5, 'BARINAS', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(6, 'BOLIVAR', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(7, 'CARABOBO', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(8, 'COJEDES', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(9, 'FALCON', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10, 'GUARICO', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(11, 'LARA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(12, 'MERIDA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(13, 'MIRANDA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(14, 'MONAGAS', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(15, 'NUEVA ESPARTA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(16, 'PORTUGUESA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(17, 'SUCRE', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(18, 'TACHIRA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(19, 'TRUJILLO', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20, 'YARACUY', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21, 'ZULIA', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(22, 'AMAZONAS', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(23, 'DELTA AMACURO', '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(24, 'LA GUAIRA', '2020-04-20 05:55:55', '2020-04-20 05:55:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses_and_purchases`
--

CREATE TABLE `expenses_and_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_provider` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serie` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observation` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `date_payment` date DEFAULT NULL,
  `anticipo` decimal(64,2) DEFAULT NULL,
  `iva_percentage` int(11) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `base_imponible` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_iva` decimal(64,2) DEFAULT NULL,
  `amount_with_iva` decimal(64,2) DEFAULT NULL,
  `coin` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(64,2) DEFAULT NULL COMMENT 'Tasa',
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses_details`
--

CREATE TABLE `expenses_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_expense` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_inventory` bigint(20) UNSIGNED DEFAULT NULL,
  `id_account` bigint(20) UNSIGNED DEFAULT NULL,
  `id_branch` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exento` tinyint(1) NOT NULL,
  `islr` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(64,2) NOT NULL,
  `rate` decimal(64,2) NOT NULL COMMENT 'Tasa',
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_payments`
--

CREATE TABLE `expense_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_expense` bigint(20) UNSIGNED NOT NULL,
  `id_account` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `amount` decimal(64,2) NOT NULL,
  `reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_nomina`
--

CREATE TABLE `general_nomina` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `tax_unit` decimal(8,2) NOT NULL,
  `days_utilities_minimun` int(11) NOT NULL,
  `days_utilities_maximun` int(11) NOT NULL,
  `vacation_bonus_days` int(11) NOT NULL,
  `sso` decimal(8,2) NOT NULL,
  `faov` decimal(8,2) NOT NULL,
  `pie` decimal(8,2) NOT NULL,
  `sso_company` decimal(8,2) NOT NULL,
  `faov_company` decimal(8,2) NOT NULL,
  `pie_company` decimal(8,2) NOT NULL,
  `days_benefits` int(11) NOT NULL,
  `cestaticket` int(11) NOT NULL,
  `cestaticket_amount` decimal(64,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `header_vouchers`
--

CREATE TABLE `header_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_anticipo` bigint(20) UNSIGNED DEFAULT NULL,
  `id_payment_order` bigint(20) UNSIGNED DEFAULT NULL,
  `reference` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `centro_cos` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historic_transports`
--

CREATE TABLE `historic_transports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `transport_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `index_bcvs`
--

CREATE TABLE `index_bcvs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `period` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(64,2) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventary_types`
--

CREATE TABLE `inventary_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventary_types`
--

INSERT INTO `inventary_types` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PRECIO DE ULTIMA COMPRA', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(2, 'PRECIO PROMEDIO', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(3, 'LIFO', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventories`
--

INSERT INTO `inventories` (`id`, `product_id`, `id_user`, `code`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1001', 100, '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41'),
(2, 2, 1, '1002', 100, '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chevrolet', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40'),
(2, 'Toyota', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `descripcion`, `estado_id`, `created_at`, `updated_at`) VALUES
(101, 'LIBERTADOR', 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(201, 'ANACO', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(202, 'ARAGUA', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(203, 'SIMON BOLIVAR', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(204, 'MANUEL EZEQUIEL BRUZUAL', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(205, 'JUAN MANUEL CAJIGAL', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(206, 'PEDRO MARIA FREITES', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(207, 'INDEPENDENCIA', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(208, 'LIBERTAD', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(209, 'FRANCISCO DE MIRANDA', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210, 'JOSE GREGORIO MONAGAS', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211, 'FERNANDO PEÑALVER', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212, 'SIMON RODRIGUEZ', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(213, 'JUAN ANTONIO SOTILLO', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(214, 'SAN JOSE DE GUANIPA', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(215, 'GUANTA', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(216, 'PIRITU', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(217, 'DIEGO BAUTISTA URBANEJA', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(218, 'FRANCISCO DEL CARMEN CARVAJAL', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(219, 'SANTA ANA', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220, 'GENERAL SIR ARTHUR MCGREGOR', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(221, 'SAN JUAN DE CAPISTRANO', 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(301, 'ACHAGUAS', 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(302, 'MUÑOZ', 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(303, 'PAEZ', 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(304, 'PEDRO CAMEJO', 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(305, 'ROMULO GALLEGOS', 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(306, 'SAN FERNANDO', 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(307, 'BIRUACA', 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(401, 'GIRARDOT', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(402, 'SANTIAGO MARIÑO', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(403, 'JOSE FELIX RIBAS', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(404, 'SAN CASIMIRO', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(405, 'SAN SEBASTIAN', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(406, 'SUCRE', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(407, 'URDANETA', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(408, 'ZAMORA', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(409, 'LIBERTADOR', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(410, 'JOSE ANGEL LAMAS', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(411, 'BOLIVAR', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(412, 'SANTOS MICHELENA', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(413, 'MARIO BRICEÑO IRAGORRY', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(414, 'TOVAR', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(415, 'CAMATAGUA', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(416, 'JOSE RAFAEL REVENGA', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(417, 'FRANCISCO LINARES ALCANTARA', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(418, 'OCUMARE DE LA COSTA DE ORO', 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(501, 'ARISMENDI', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(502, 'BARINAS', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(503, 'BOLIVAR', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(504, 'EZEQUIEL ZAMORA', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(505, 'OBISPOS', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(506, 'PEDRAZA', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(507, 'ROJAS', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(508, 'SOSA', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(509, 'ALBERTO ARVELO TORREALBA', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(510, 'ANTONIO JOSE DE SUCRE', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(511, 'CRUZ PAREDES', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(512, 'ANDRES ELOY BLANCO', 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(601, 'CARONI', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(602, 'CEDEÑO', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(603, 'HERES', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(604, 'PIAR', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(605, 'ROSCIO', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(606, 'SUCRE', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(607, 'SIFONTES', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(608, 'ANGOSTURA', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(609, 'GRAN SABANA', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(610, 'EL CALLAO', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(611, 'PADRE PEDRO CHIEN', 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(701, 'BEJUMA', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(702, 'CARLOS ARVELO', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(703, 'DIEGO IBARRA', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(704, 'GUACARA', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(705, 'MONTALBAN', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(706, 'JUAN JOSE MORA', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(707, 'PUERTO CABELLO', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(708, 'SAN JOAQUIN', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(709, 'VALENCIA', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(710, 'MIRANDA', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(711, 'LOS GUAYOS', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(712, 'NAGUANAGUA', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(713, 'SAN DIEGO', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(714, 'LIBERTADOR', 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(801, 'ANZOATEGUI', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(802, 'TINAQUILLO', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(803, 'GIRARDOT', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(804, 'PAO DE SAN JUAN BAUTISTA', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(805, 'RICAURTE', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(806, 'EZEQUIEL ZAMORA', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(807, 'TINACO', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(808, 'LIMA BLANCO', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(809, 'ROMULO GALLEGOS', 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(901, 'ACOSTA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(902, 'BOLIVAR', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(903, 'BUCHIVACOA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(904, 'CARIRUBANA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(905, 'COLINA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(906, 'DEMOCRACIA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(907, 'FALCON', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(908, 'FEDERACION', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(909, 'MAUROA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(910, 'MIRANDA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(911, 'PETIT', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(912, 'JOSE LAURENCIO SILVA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(913, 'ZAMORA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(914, 'DABAJURO', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(915, 'MONSEÑOR ITURRIZA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(916, 'LOS TAQUES', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(917, 'PIRITU', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(918, 'UNION', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(919, 'SAN FRANCISCO', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(920, 'JACURA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(921, 'CACIQUE MANAURE', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(922, 'PALMASOLA', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(923, 'SUCRE', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(924, 'URUMACO', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(925, 'TOCOPERO', 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1001, 'LEONARDO INFANTE', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1002, 'JULIAN MELLADO', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1003, 'FRANCISCO DE MIRANDA', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1004, 'JOSE TADEO MONAGAS', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1005, 'JOSE FELIX RIBAS', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1006, 'JUAN GERMAN ROSCIO', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1007, 'PEDRO ZARAZA', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1008, 'CAMAGUAN', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1009, 'SAN JOSE DE GUARIBE', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1010, 'LAS MERCEDES', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1011, 'EL SOCORRO', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1012, 'ORTIZ', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1013, 'SANTA MARIA DE IPIRE', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1014, 'CHAGUARAMAS', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1015, 'SAN GERONIMO DE GUAYABAL', 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1101, 'CRESPO', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1102, 'IRIBARREN', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1103, 'JIMENEZ', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1104, 'MORAN', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1105, 'PALAVECINO', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1106, 'TORRES', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1107, 'URDANETA', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1108, 'ANDRES ELOY BLANCO', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1109, 'SIMON PLANAS', 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1201, 'ALBERTO ADRIANI', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1202, 'ANDRES BELLO', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1203, 'ARZOBISPO CHACON', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1204, 'CAMPO ELIAS', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1205, 'GUARAQUE', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1206, 'JULIO CESAR SALAS', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1207, 'JUSTO BRICEÑO', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1208, 'LIBERTADOR', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1209, 'SANTOS MARQUINA', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1210, 'MIRANDA', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1211, 'ANTONIO PINTO SALINAS', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1212, 'OBISPO RAMOS DE LORA', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1213, 'CARACCIOLO PARRA OLMEDO', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1214, 'CARDENAL QUINTERO', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1215, 'PUEBLO LLANO', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1216, 'RANGEL', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1217, 'RIVAS DAVILA', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1218, 'SUCRE', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1219, 'TOVAR', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1220, 'TULIO FEBRES CORDERO', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1221, 'PADRE NOGUERA', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1222, 'ARICAGUA', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1223, 'ZEA', 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1301, 'ACEVEDO', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1302, 'BRION', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1303, 'GUAICAIPURO', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1304, 'INDEPENDENCIA', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1305, 'LANDER', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1306, 'PAEZ', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1307, 'PAZ CASTILLO', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1308, 'PLAZA', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1309, 'SUCRE', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1310, 'URDANETA', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1311, 'ZAMORA', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1312, 'CRISTOBAL ROJAS', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1313, 'LOS SALIAS', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1314, 'ANDRES BELLO', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1315, 'SIMON BOLIVAR', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1316, 'BARUTA', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1317, 'CARRIZAL', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1318, 'CHACAO', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1319, 'EL HATILLO', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1320, 'BUROZ', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1321, 'PEDRO GUAL', 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1401, 'ACOSTA', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1402, 'BOLIVAR', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1403, 'CARIPE', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1404, 'CEDEÑO', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1405, 'EZEQUIEL ZAMORA', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1406, 'LIBERTADOR', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1407, 'MATURIN', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1408, 'PIAR', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1409, 'PUNCERES', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1410, 'SOTILLO', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1411, 'AGUASAY', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1412, 'SANTA BARBARA', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1413, 'URACOA', 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1501, 'ARISMENDI', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1502, 'DIAZ', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1503, 'GOMEZ', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1504, 'MANEIRO', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1505, 'MARCANO', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1506, 'MARIÑO', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1507, 'MACANAO', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1508, 'VILLALBA', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1509, 'TUBORES', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1510, 'ANTOLIN DEL CAMPO', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1511, 'GARCIA', 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1601, 'ARAURE', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1602, 'ESTELLER', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1603, 'GUANARE', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1604, 'GUANARITO', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1605, 'OSPINO', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1606, 'PAEZ', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1607, 'SUCRE', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1608, 'TUREN', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1609, 'MONSEÑOR JOSE VICENTE DE UNDA', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1610, 'AGUA BLANCA', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1611, 'PAPELON', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1612, 'SAN GENARO DE BOCONOITO', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1613, 'SAN RAFAEL DE ONOTO', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1614, 'SANTA ROSALIA', 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1701, 'ARISMENDI', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1702, 'BENITEZ', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1703, 'BERMUDEZ', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1704, 'CAJIGAL', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1705, 'MARIÑO', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1706, 'MEJIA', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1707, 'MONTES', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1708, 'RIBERO', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1709, 'SUCRE', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1710, 'VALDEZ', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1711, 'ANDRES ELOY BLANCO', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1712, 'LIBERTADOR', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1713, 'ANDRES MATA', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1714, 'BOLIVAR', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1715, 'CRUZ SALMERON ACOSTA', 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1801, 'AYACUCHO', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1802, 'BOLIVAR', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1803, 'INDEPENDENCIA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1804, 'CARDENAS', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1805, 'JAUREGUI', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1806, 'JUNIN', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1807, 'LOBATERA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1808, 'SAN CRISTOBAL', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1809, 'URIBANTE', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1810, 'CORDOBA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1811, 'GARCIA DE HEVIA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1812, 'GUASIMOS', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1813, 'MICHELENA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1814, 'LIBERTADOR', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1815, 'PANAMERICANO', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1816, 'PEDRO MARIA UREÑA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1817, 'SUCRE', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1818, 'ANDRES BELLO', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1819, 'FERNANDEZ FEO', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1820, 'LIBERTAD', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1821, 'SAMUEL DARIO MALDONADO', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1822, 'SEBORUCO', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1823, 'ANTONIO ROMULO COSTA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1824, 'FRANCISCO DE MIRANDA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1825, 'JOSE MARIA VARGAS', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1826, 'RAFAEL URDANETA', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1827, 'SIMON RODRIGUEZ', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1828, 'TORBES', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1829, 'SAN JUDAS TADEO', 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1901, 'RAFAEL RANGEL', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1902, 'BOCONO', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1903, 'CARACHE', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1904, 'ESCUQUE', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1905, 'TRUJILLO', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1906, 'URDANETA', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1907, 'VALERA', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1908, 'CANDELARIA', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1909, 'MIRANDA', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1910, 'MONTE CARMELO', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1911, 'MOTATAN', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1912, 'PAMPAN', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1913, 'SAN RAFAEL DE CARVAJAL', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1914, 'SUCRE', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1915, 'ANDRES BELLO', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1916, 'BOLIVAR', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1917, 'JOSE FELIPE MARQUEZ CAÑIZALES', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1918, 'JUAN VICENTE CAMPO ELIAS', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1919, 'LA CEIBA', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(1920, 'PAMPANITO', 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2001, 'BOLIVAR', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2002, 'BRUZUAL', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2003, 'NIRGUA', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2004, 'SAN FELIPE', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2005, 'SUCRE', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2006, 'URACHICHE', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2007, 'PEÑA', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2008, 'JOSE ANTONIO PAEZ', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2009, 'LA TRINIDAD', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2010, 'COCOROTE', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2011, 'INDEPENDENCIA', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2012, 'ARISTIDES BASTIDAS', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2013, 'MANUEL MONGE', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2014, 'JOSE JOAQUIN VEROES', 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2101, 'BARALT', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2102, 'SANTA RITA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2103, 'COLON', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2104, 'MARA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2105, 'MARACAIBO', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2106, 'MIRANDA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2107, 'GUAJIRA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2108, 'MACHIQUES DE PERIJA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2109, 'SUCRE', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2110, 'LA CAÑADA DE URDANETA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2111, 'LAGUNILLAS', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2112, 'CATATUMBO', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2113, 'ROSARIO DE PERIJA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2114, 'CABIMAS', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2115, 'VALMORE RODRIGUEZ', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2116, 'JESUS ENRIQUE LOSSADA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2117, 'ALMIRANTE PADILLA', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2118, 'SAN FRANCISCO', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2119, 'JESUS MARIA SEMPRUM', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2120, 'FRANCISCO JAVIER PULGAR', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2121, 'SIMON BOLIVAR', 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2201, 'ATURES', 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2202, 'ATABAPO', 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2203, 'MAROA', 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2204, 'RIO NEGRO', 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2205, 'AUTANA', 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2206, 'MANAPIARE', 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2207, 'ALTO ORINOCO', 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2301, 'TUCUPITA', 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2302, 'PEDERNALES', 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2303, 'ANTONIO DIAZ', 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2304, 'CASACOIMA', 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(2401, 'LA GUAIRA', 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominas`
--

CREATE TABLE `nominas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_profession` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_calculations`
--

CREATE TABLE `nomina_calculations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_nomina` bigint(20) UNSIGNED NOT NULL,
  `id_nomina_concept` bigint(20) UNSIGNED NOT NULL,
  `id_employee` bigint(20) UNSIGNED NOT NULL,
  `number_receipt` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,2) NOT NULL,
  `hours` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `cantidad` decimal(64,2) DEFAULT NULL,
  `voucher` int(11) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_concepts`
--

CREATE TABLE `nomina_concepts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_formula_q` bigint(20) UNSIGNED DEFAULT NULL,
  `id_formula_m` bigint(20) UNSIGNED DEFAULT NULL,
  `id_formula_s` bigint(20) UNSIGNED DEFAULT NULL,
  `id_account_debe` bigint(20) UNSIGNED DEFAULT NULL,
  `id_account_haber` bigint(20) UNSIGNED DEFAULT NULL,
  `abbreviation` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `description` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calculate` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` decimal(64,2) DEFAULT NULL,
  `maximum` decimal(64,2) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nomina_concepts`
--

INSERT INTO `nomina_concepts` (`id`, `id_formula_q`, `id_formula_m`, `id_formula_s`, `id_account_debe`, `id_account_haber`, `abbreviation`, `order`, `description`, `type`, `sign`, `calculate`, `minimum`, `maximum`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'VAC', 1, 'Vacaciones', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(2, 3, 3, 3, NULL, NULL, 'SUES', 2, 'Sueldo Semanal', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(3, NULL, 6, NULL, NULL, NULL, 'SUEQ', 3, 'Sueldo Quincenal', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(4, 7, 7, 7, NULL, NULL, 'SUEM', 4, 'Sueldo Mensual', 'Segunda Quincena', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(5, NULL, NULL, NULL, NULL, NULL, 'RSAL', 5, 'Retroactivo de Salario', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(6, NULL, NULL, NULL, NULL, NULL, 'RCT', 6, 'Retroactivo de Cestatiket', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(7, NULL, NULL, NULL, NULL, NULL, 'RAYU', 7, 'Retroactivo Ayuda Economica', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(8, NULL, NULL, NULL, NULL, NULL, 'LIQU', 8, 'Liquidacion', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(9, 8, 8, 8, NULL, NULL, 'HEXT', 9, 'Horas Extras Diurna', 'Especial', 'A', 'N', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(10, 9, 9, 9, NULL, NULL, 'HENO', 10, 'Horas Extras Nocturnas', 'Especial', 'A', 'N', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(11, NULL, 10, NULL, NULL, NULL, 'DTRA', 11, 'Dias Trabajados', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(12, NULL, NULL, NULL, NULL, NULL, 'DIF', 12, 'Diferencial', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(13, 11, 11, 11, NULL, NULL, 'DFTR', 13, 'Dias Feriados', 'Especial', 'A', 'N', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(14, NULL, NULL, NULL, NULL, NULL, 'CTS', 14, 'Cestaticket Semanal', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(15, 12, 12, NULL, NULL, NULL, 'CT', 15, 'Cestaticket Quincenal', 'Especial', 'A', 'N', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(16, NULL, NULL, NULL, NULL, NULL, 'COMP', 16, 'Complemento', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(17, NULL, NULL, NULL, NULL, NULL, 'BVAC', 16, 'Bono Vacacional', 'Especial', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(18, 6, 6, 6, NULL, NULL, 'ANTC', 17, 'Anticipo Primera Quincena', 'Primera Quincena', 'A', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(19, 1, 1, 2, NULL, NULL, 'SSO', 17, 'Seguro Social Obligatorio', 'Quincenal', 'D', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(20, NULL, 13, NULL, NULL, NULL, 'RIMP', 18, 'Retencion Impuesto sobre la Renta', 'Especial', 'D', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(21, 14, 14, 15, NULL, NULL, 'PIE', 19, 'Ley de Regimen Prestacional de empleo', 'Especial', 'D', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(22, NULL, 16, NULL, NULL, NULL, 'FINJ', 20, 'Faltas Injustificadas', 'Especial', 'D', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(23, 4, 4, 5, NULL, NULL, 'FAOV', 21, 'Fondo de Ahorro para la Vivienda', 'Quincenal', 'D', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(24, NULL, 6, NULL, NULL, NULL, 'DAPQ', 22, 'Fondo de Ahorro para la Vivienda', 'Segunda Quincena', 'D', 'S', '0.00', '1000000000000000000.00', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_formulas`
--

CREATE TABLE `nomina_formulas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nomina_formulas`
--

INSERT INTO `nomina_formulas` (`id`, `description`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, '{{sueldo}} * 12 / 52 * {{lunes}} * 0.04', 'Q', '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(2, '{{sueldo}} * 12 / 52 * {{lunes}} * 0.04 * 5 / 5', 'S', '1', '2021-08-11 20:12:37', '2021-08-11 20:12:37'),
(3, '{{sueldo}} / 30 * 7.5', 'Q', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(4, '{{sueldo}} * 0.01 / 2', 'Q', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(5, '{{sueldo}} * 0.01 / 4', 'Q', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(6, '{{sueldo}} / 2', 'Q', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(7, '{{sueldo}}', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(8, '{{sueldo}} / 30 / 8 * 1.6 / {{horas}}', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(9, '{{sueldo}} / 30 / 8 * 1.8 / {{horas}}', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(10, '{{sueldo}} / 30*1.5 *{{dias}}', 'M', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(11, '{{sueldo}} / 30 * 1.5 * {{diasferiados}}', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(12, '{{cestaticket}} / 2', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(13, '{{sueldo}} * 0.03', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(14, '{{sueldo}} * 12 / 52 * {{lunes}} * 0.005', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(15, '{{sueldo}} * 12 / 52 * {{lunes}} * 0.004', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38'),
(16, '{{sueldo}} / 30 * {{dias_faltados}}', 'T', '1', '2021-08-11 20:12:38', '2021-08-11 20:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_types`
--

CREATE TABLE `nomina_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquias`
--

CREATE TABLE `parroquias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio_id` bigint(20) UNSIGNED NOT NULL,
  `estado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parroquias`
--

INSERT INTO `parroquias` (`id`, `descripcion`, `municipio_id`, `estado_id`, `created_at`, `updated_at`) VALUES
(10101, 'ALTAGRACIA', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10102, 'CANDELARIA', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10103, 'CATEDRAL', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10104, 'LA PASTORA', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10105, 'SAN AGUSTIN', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10106, 'SAN JOSE', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10107, 'SAN JUAN', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10108, 'SANTA ROSALIA', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10109, 'SANTA TERESA', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10110, 'SUCRE', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10111, '23 DE ENERO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10112, 'ANTIMANO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10113, 'EL RECREO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10114, 'EL VALLE', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10115, 'LA VEGA', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10116, 'MACARAO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10117, 'CARICUAO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10118, 'EL JUNQUITO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10119, 'COCHE', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10120, 'SAN PEDRO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10121, 'SAN BERNARDINO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(10122, 'EL PARAISO', 101, 1, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20101, 'ANACO', 201, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20102, 'SAN JOAQUIN', 201, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20201, 'ARAGUA DE BARCELONA', 202, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20202, 'CACHIPO', 202, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20301, 'EL CARMEN', 203, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20302, 'SAN CRISTOBAL', 203, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20303, 'BERGANTIN', 203, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20304, 'CAIGUA', 203, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20305, 'EL PILAR', 203, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20306, 'NARICUAL', 203, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20401, 'CLARINES', 204, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20402, 'GUANAPE', 204, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20403, 'SABANA DE UCHIRE', 204, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20501, 'ONOTO', 205, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20502, 'SAN PABLO', 205, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20601, 'CANTAURA', 206, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20602, 'LIBERTADOR', 206, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20603, 'SANTA ROSA', 206, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20604, 'URICA', 206, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20701, 'SOLEDAD', 207, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20702, 'MAMO', 207, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20801, 'SAN MATEO', 208, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20802, 'EL CARITO', 208, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20803, 'SANTA INES', 208, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20901, 'PARIAGUAN', 209, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20902, 'ATAPIRIRE', 209, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20903, 'BOCA DEL PAO', 209, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(20904, 'EL PAO', 209, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21001, 'MAPIRE', 210, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21002, 'PIAR', 210, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21003, 'SAN DIEGO DE CABRUTICA', 210, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21004, 'SANTA CLARA', 210, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21005, 'UVERITO', 210, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21006, 'ZUATA', 210, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21101, 'PUERTO PIRITU', 211, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21102, 'SAN MIGUEL', 211, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21103, 'SUCRE', 211, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21201, 'EDMUNDO BARRIOS', 212, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21202, 'MIGUEL OTERO SILVA', 212, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21301, 'POZUELOS', 213, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21302, 'PUERTO LA CRUZ', 213, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21401, 'SAN JOSE DE GUANIPA', 214, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21501, 'GUANTA', 215, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21502, 'CHORRERON', 215, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21601, 'PIRITU', 216, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21602, 'SAN FRANCISCO', 216, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21701, 'LECHERIA', 217, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21702, 'EL MORRO', 217, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21801, 'VALLE DE GUANAPE', 218, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21802, 'SANTA BARBARA', 218, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21901, 'SANTA ANA', 219, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(21902, 'PUEBLO NUEVO', 219, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(22001, 'EL CHAPARRO', 220, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(22002, 'TOMAS ALFARO', 220, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(22101, 'BOCA DE UCHIRE', 221, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(22102, 'BOCA DE CHAVEZ', 221, 2, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30101, 'ACHAGUAS', 301, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30102, 'APURITO', 301, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30103, 'EL YAGUAL', 301, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30104, 'GUACHARA', 301, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30105, 'MUCURITAS', 301, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30106, 'QUESERAS DEL MEDIO', 301, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30201, 'BRUZUAL', 302, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30202, 'MANTECAL', 302, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30203, 'QUINTERO', 302, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30204, 'SAN VICENTE', 302, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30205, 'RINCON HONDO', 302, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30301, 'GUASDUALITO', 303, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30302, 'ARAMENDI', 303, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30303, 'EL AMPARO', 303, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30304, 'SAN CAMILO', 303, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30305, 'URDANETA', 303, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30401, 'SAN JUAN DE PAYARA', 304, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30402, 'CODAZZI', 304, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30403, 'CUNAVICHE', 304, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30501, 'ELORZA', 305, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30502, 'LA TRINIDAD', 305, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30601, 'SAN FERNANDO', 306, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30602, 'PEÑALVER', 306, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30603, 'EL RECREO', 306, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30604, 'SN RAFAEL DE ATAMAICA', 306, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(30701, 'BIRUACA', 307, 3, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40101, 'LAS DELICIAS', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40102, 'CHORONI', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40103, 'MADRE MARIA DE SAN JOSE', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40104, 'JOAQUIN CRESPO', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40105, 'PEDRO JOSE OVALLES', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40106, 'JOSE CASANOVA GODOY', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40107, 'ANDRES ELOY BLANCO', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40108, 'LOS TACARIGUAS', 401, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40201, 'TURMERO', 402, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40202, 'SAMAN DE GUERE', 402, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40203, 'ALFREDO PACHECO M', 402, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40204, 'CHUAO', 402, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40205, 'AREVALO APONTE', 402, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40301, 'JUAN VICENTE BOLIVAR', 403, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40302, 'ZUATA', 403, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40303, 'PAO DE ZARATE', 403, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40304, 'CASTOR NIEVES RIOS', 403, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40305, 'LAS GUACAMAYAS', 403, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40401, 'SAN CASIMIRO', 404, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40402, 'VALLE MORIN', 404, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40403, 'GUIRIPA', 404, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40404, 'OLLAS DE CARAMACATE', 404, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40501, 'SAN SEBASTIAN', 405, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40601, 'CAGUA', 406, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40602, 'BELLA VISTA', 406, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40701, 'BARBACOAS', 407, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40702, 'SAN FRANCISCO DE CARA', 407, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40703, 'TAGUAY', 407, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40704, 'LAS PEÑITAS', 407, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40801, 'VILLA DE CURA', 408, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40802, 'MAGDALENO', 408, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40803, 'SAN FRANCISCO DE ASIS', 408, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40804, 'VALLES DE TUCUTUNEMO', 408, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40805, 'AUGUSTO MIJARES', 408, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40901, 'PALO NEGRO', 409, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(40902, 'SAN MARTIN DE PORRES', 409, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41001, 'SANTA CRUZ', 410, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41101, 'SAN MATEO', 411, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41201, 'LAS TEJERIAS', 412, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41202, 'TIARA', 412, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41301, 'EL LIMON', 413, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41302, 'CAÑA DE AZUCAR', 413, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41401, 'TOVAR', 414, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41501, 'CAMATAGUA', 415, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41502, 'CARMEN DE CURA', 415, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41601, 'EL CONSEJO', 416, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41701, 'SANTA RITA', 417, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41702, 'FRANCISCO DE MIRANDA', 417, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41703, 'MONS FELICIANO G', 417, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(41801, 'OCUMARE DE LA COSTA', 418, 4, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50101, 'ARISMENDI', 501, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50102, 'GUADARRAMA', 501, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50103, 'LA UNION', 501, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50104, 'SAN ANTONIO', 501, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50201, 'ALFREDO ARVELO LARRIVA', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50202, 'BARINAS', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50203, 'SAN SILVESTRE', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50204, 'SANTA INES', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50205, 'SANTA LUCIA', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50206, 'TORUNOS', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50207, 'EL CARMEN', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50208, 'ROMULO BETANCOURT', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50209, 'CORAZON DE JESUS', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50210, 'RAMON IGNACIO MENDEZ', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50211, 'ALTO BARINAS', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50212, 'MANUEL PALACIO FAJARDO', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50213, 'JUAN ANTONIO RODRIGUEZ DOMINGUEZ', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50214, 'DOMINGA ORTIZ DE PAEZ', 502, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50301, 'ALTAMIRA DE CACERES', 503, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50302, 'BARINITAS', 503, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50303, 'CALDERAS', 503, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50401, 'SANTA BARBARA', 504, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50402, 'JOSE IGNACIO DEL PUMAR', 504, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50403, 'RAMON IGNACIO MENDEZ', 504, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50404, 'PEDRO BRICEÑO MENDEZ', 504, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50501, 'EL REAL', 505, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50502, 'LA LUZ', 505, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50503, 'OBISPOS', 505, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50504, 'LOS GUASIMITOS', 505, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50601, 'CIUDAD BOLIVIA', 506, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50602, 'JOSE IGNACIO BRICEÑO', 506, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50603, 'PAEZ', 506, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50604, 'JOSE FELIX RIBAS', 506, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50701, 'DOLORES', 507, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50702, 'LIBERTAD', 507, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50703, 'PALACIO FAJARDO', 507, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50704, 'SANTA ROSA', 507, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50705, 'SIMÓN RODRÍGUEZ', 507, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50801, 'CIUDAD DE NUTRIAS', 508, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50802, 'EL REGALO', 508, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50803, 'PUERTO DE NUTRIAS', 508, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50804, 'SANTA CATALINA', 508, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50805, 'SIMÓN BOLÍVAR', 508, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50901, 'RODRIGUEZ DOMINGUEZ', 509, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(50902, 'SABANETA', 509, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51001, 'TICOPORO', 510, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51002, 'NICOLAS PULIDO', 510, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51003, 'ANDRES BELLO', 510, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51101, 'BARRANCAS', 511, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51102, 'EL SOCORRO', 511, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51103, 'MASPARRITO', 511, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51201, 'EL CANTON', 512, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51202, 'SANTA CRUZ DE GUACAS', 512, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(51203, 'PUERTO VIVAS', 512, 5, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60101, 'SIMON BOLIVAR', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60102, 'ONCE DE ABRIL', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60103, 'VISTA AL SOL', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60104, 'CHIRICA', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60105, 'DALLA COSTA', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60106, 'CACHAMAY', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60107, 'UNIVERSIDAD', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60108, 'UNARE', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60109, 'YOCOIMA', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60110, 'POZO VERDE', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60111, '5 DE JULIO', 601, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60201, 'CAICARA DEL ORINOCO', 602, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60202, 'ASCENSION FARRERAS', 602, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60203, 'ALTAGRACIA', 602, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60204, 'LA URBANA', 602, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60205, 'GUANIAMO', 602, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60206, 'PIJIGUAOS', 602, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60301, 'CATEDRAL', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60302, 'AGUA SALADA', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60303, 'LA SABANITA', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60304, 'VISTA HERMOSA', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60305, 'MARHUANTA', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60306, 'JOSE ANTONIO PAEZ', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60307, 'ORINOCO', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60308, 'PANAPANA', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60309, 'ZEA', 603, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60401, 'UPATA', 604, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60402, 'ANDRES ELOY BLANCO', 604, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60403, 'PEDRO COVA', 604, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60501, 'GUASIPATI', 605, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60502, 'SALOM', 605, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60601, 'MARIPA', 606, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60602, 'ARIPAO', 606, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60603, 'LAS MAJADAS', 606, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60604, 'MOITACO', 606, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60605, 'GUARATARO', 606, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60701, 'TUMEREMO', 607, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60702, 'DALLA COSTA', 607, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60703, 'SAN ISIDRO', 607, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60801, 'CIUDAD PIAR', 608, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60802, 'SAN FRANCISCO', 608, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60803, 'BARCELONETA', 608, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60804, 'SANTA BARBARA', 608, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60901, 'SANTA ELENA DE UAIREN', 609, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(60902, 'IKABARU', 609, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(61001, 'EL CALLAO', 610, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(61101, 'EL PALMAR', 611, 6, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70101, 'BEJUMA', 701, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70102, 'CANOABO', 701, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70103, 'SIMON BOLIVAR', 701, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70201, 'GUIGUE', 702, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70202, 'BELEN', 702, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70203, 'TACARIGUA', 702, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70301, 'MARIARA', 703, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70302, 'AGUAS CALIENTES', 703, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70401, 'GUACARA', 704, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70402, 'CIUDAD ALIANZA', 704, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70403, 'YAGUA', 704, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70501, 'MONTALBAN', 705, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70601, 'MORON', 706, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70602, 'URAMA', 706, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70701, 'DEMOCRACIA', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70702, 'FRATERNIDAD', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70703, 'GOAIGOAZA', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70704, 'JUAN JOSE FLORES', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70705, 'BARTOLOME SALOM', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70706, 'UNION', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70707, 'BORBURATA', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70708, 'PATANEMO', 707, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70801, 'SAN JOAQUIN', 708, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70901, 'CANDELARIA', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70902, 'CATEDRAL', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70903, 'EL SOCORRO', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70904, 'MIGUEL PEÑA', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70905, 'SAN BLAS', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70906, 'SAN JOSE', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70907, 'SANTA ROSA', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70908, 'RAFAEL URDANETA', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(70909, 'NEGRO PRIMERO', 709, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(71001, 'MIRANDA', 710, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(71101, 'LOS GUAYOS', 711, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(71201, 'NAGUANAGUA', 712, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(71301, 'SAN DIEGO', 713, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(71401, 'TOCUYITO', 714, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(71402, 'INDEPENDENCIA', 714, 7, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80101, 'COJEDES', 801, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80102, 'JUAN DE MATA SUAREZ', 801, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80201, 'TINAQUILLO', 802, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80301, 'EL BAUL', 803, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80302, 'SUCRE', 803, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80401, 'EL PAO', 804, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80501, 'LIBERTAD DE COJEDES', 805, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80502, 'EL AMPARO', 805, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80601, 'SAN CARLOS DE AUSTRIA', 806, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80602, 'JUAN ANGEL BRAVO', 806, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80603, 'MANUEL MANRIQUE', 806, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80701, 'GENERAL EN JEFE JOSE LAURENCIO SILVA', 807, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80801, 'MACAPO', 808, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80802, 'LA AGUADITA', 808, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(80901, 'ROMULO GALLEGOS', 809, 8, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90101, 'SAN JUAN DE LOS CAYOS', 901, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90102, 'CAPADARE', 901, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90103, 'LA PASTORA', 901, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90104, 'LIBERTADOR', 901, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90201, 'SAN LUIS', 902, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90202, 'ARACUA', 902, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90203, 'LA PEÑA', 902, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90301, 'CAPATARIDA', 903, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90302, 'BOROJO', 903, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90303, 'SEQUE', 903, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90304, 'ZAZARIDA', 903, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90305, 'BARIRO', 903, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90306, 'GUAJIRO', 903, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90401, 'NORTE', 904, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90402, 'CARIRUBANA', 904, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90403, 'PUNTA CARDON', 904, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90404, 'SANTA ANA', 904, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90501, 'LA VELA DE CORO', 905, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90502, 'ACURIGUA', 905, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90503, 'GUAIBACOA', 905, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90504, 'MACORUCA', 905, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90505, 'LAS CALDERAS', 905, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90601, 'PEDREGAL', 906, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90602, 'AGUA CLARA', 906, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90603, 'AVARIA', 906, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90604, 'PIEDRA GRANDE', 906, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90605, 'PURURECHE', 906, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90701, 'PUEBLO NUEVO', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90702, 'ADICORA', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90703, 'BARAIVED', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90704, 'BUENA VISTA', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90705, 'JADACAQUIVA', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90706, 'MORUY', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90707, 'EL VINCULO', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90708, 'EL HATO', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90709, 'ADAURE', 907, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90801, 'CHURUGUARA', 908, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90802, 'AGUA LARGA', 908, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90803, 'INDEPENDENCIA', 908, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90804, 'MAPARARI', 908, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90805, 'EL PAUJI', 908, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90901, 'MENE DE MAUROA', 909, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90902, 'CASIGUA', 909, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(90903, 'SAN FELIX', 909, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91001, 'SAN ANTONIO', 910, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91002, 'SAN GABRIEL', 910, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91003, 'SANTA ANA', 910, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91004, 'GUZMAN GUILLERMO', 910, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91005, 'MITARE', 910, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91006, 'SABANETA', 910, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91007, 'RIO SECO', 910, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91101, 'CABURE', 911, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91102, 'CURIMAGUA', 911, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91103, 'COLINA', 911, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91201, 'TUCACAS', 912, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91202, 'BOCA DE AROA', 912, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91301, 'PUERTO CUMAREBO', 913, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91302, 'LA CIENAGA', 913, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91303, 'LA SOLEDAD', 913, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91304, 'PUEBLO CUMAREBO', 913, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91305, 'ZAZARIDA', 913, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91401, 'DABAJURO', 914, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91501, 'CHICHIRIVICHE', 915, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91502, 'BOCA DE TOCUYO', 915, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91503, 'TOCUYO DE LA COSTA', 915, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91601, 'LOS TAQUES', 916, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91602, 'JUDIBANA', 916, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91701, 'PIRITU', 917, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91702, 'SAN JOSE DE LA COSTA', 917, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91801, 'SANTA CRUZ DE BUCARAL', 918, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91802, 'EL CHARAL', 918, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91803, 'LAS VEGAS DEL TUY', 918, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(91901, 'MIRIMIRE', 919, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92001, 'JACURA', 920, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92002, 'AGUA LINDA', 920, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92003, 'ARAURIMA', 920, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92101, 'YARACAL', 921, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92201, 'PALMA SOLA', 922, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92301, 'SUCRE', 923, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92302, 'PECAYA', 923, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92401, 'URUMACO', 924, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92402, 'BRUZUAL', 924, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(92501, 'TOCOPERO', 925, 9, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100101, 'VALLE DE LA PASCUA', 1001, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100102, 'ESPINO', 1001, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100201, 'EL SOMBRERO', 1002, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100202, 'SOSA', 1002, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100301, 'CALABOZO', 1003, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100302, 'EL CALVARIO', 1003, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100303, 'EL RASTRO', 1003, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100304, 'GUARDATINAJAS', 1003, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100401, 'ALTAGRACIA DE ORITUCO', 1004, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100402, 'LEZAMA', 1004, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100403, 'LIBERTAD DE ORITUCO', 1004, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100404, 'SAN FCO DE MACAIRA', 1004, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100405, 'SAN RAFAEL DE ORITUCO', 1004, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100406, 'SOUBLETTE', 1004, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100407, 'PASO REAL DE MACAIRA', 1004, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100501, 'TUCUPIDO', 1005, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100502, 'SAN RAFAEL DE LAYA', 1005, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100601, 'SAN JUAN DE LOS MORROS', 1006, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100602, 'PARAPARA', 1006, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100603, 'CANTAGALLO', 1006, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100701, 'ZARAZA', 1007, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100702, 'SAN JOSE DE UNARE', 1007, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100801, 'CAMAGUAN', 1008, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100802, 'PUERTO MIRANDA', 1008, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100803, 'UVERITO', 1008, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(100901, 'SAN JOSE DE GUARIBE', 1009, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101001, 'LAS MERCEDES', 1010, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101002, 'SANTA RITA DE MANAPIRE', 1010, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101003, 'CABRUTA', 1010, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101101, 'EL SOCORRO', 1011, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101201, 'ORTIZ', 1012, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101202, 'SAN FRANCISCO DE TIZNADOS', 1012, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101203, 'SAN JOSE DE TIZNADOS', 1012, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101204, 'S LORENZO DE TIZNADOS', 1012, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101301, 'SANTA MARIA DE IPIRE', 1013, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101302, 'ALTAMIRA', 1013, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101401, 'CHAGUARAMAS', 1014, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101501, 'GUAYABAL', 1015, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(101502, 'CAZORLA', 1015, 10, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110101, 'FREITEZ', 1101, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110102, 'JOSE MARIA BLANCO', 1101, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110201, 'CATEDRAL', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110202, 'LA CONCEPCION', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110203, 'SANTA ROSA', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110204, 'UNION', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110205, 'EL CUJI', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110206, 'TAMACA', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110207, 'JUAN DE VILLEGAS', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110208, 'AGUEDO FELIPE ALVARADO', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110209, 'BUENA VISTA', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110210, 'JUAREZ', 1102, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110301, 'JUAN BAUTISTA RODRIGUEZ', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110302, 'DIEGO DE LOZADA', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110303, 'SAN MIGUEL', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110304, 'CUARA', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110305, 'PARAISO DE SAN JOSE', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110306, 'TINTORERO', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110307, 'JOSE BERNARDO DORANTE', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110308, 'CRNEL. MARIANO PERAZA', 1103, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110401, 'BOLIVAR', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110402, 'ANZOATEGUI', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110403, 'GUARICO', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110404, 'HUMOCARO ALTO', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110405, 'HUMOCARO BAJO', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110406, 'MORAN', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110407, 'HILARIO LUNA Y LUNA', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110408, 'LA CANDELARIA', 1104, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110501, 'CABUDARE', 1105, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110502, 'JOSE GREGORIO BASTIDAS', 1105, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110503, 'AGUA VIVA', 1105, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110601, 'TRINIDAD SAMUEL', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110602, 'ANTONIO DIAZ', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110603, 'CAMACARO', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110604, 'CASTAÑEDA', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110605, 'CHIQUINQUIRA', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110606, 'ESPINOZA DE LOS MONTEROS', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110607, 'LARA', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110608, 'MANUEL MORILLO', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110609, 'MONTES DE OCA', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110610, 'TORRES', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110611, 'EL BLANCO', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110612, 'MONTAÑA VERDE', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110613, 'HERIBERTO ARROYO', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110614, 'LAS MERCEDES', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110615, 'CECILIO ZUBILLAGA', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110616, 'REYES DE VARGAS', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110617, 'ALTAGRACIA', 1106, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110701, 'SIQUISIQUE', 1107, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110702, 'SAN MIGUEL', 1107, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110703, 'XAGUAS', 1107, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110704, 'MOROTURO', 1107, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110801, 'PIO TAMAYO', 1108, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110802, 'YACAMBU', 1108, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110803, 'QUEBRADA HONDA DE GUACHE', 1108, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110901, 'SARARE', 1109, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110902, 'GUSTAVO VEGAS LEON', 1109, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(110903, 'BURIA', 1109, 11, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120101, 'GABRIEL PICON GONZALEZ', 1201, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120102, 'HECTOR AMABLE MORA', 1201, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120103, 'JOSE NUCETE SARDI', 1201, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120104, 'PULIDO MENDEZ', 1201, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120105, 'PRESIDENTE ROMULO GALLEGOS', 1201, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120106, 'PRESIDENTE BETANCOURT', 1201, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120107, 'PRESIDENTE PAEZ', 1201, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120201, 'LA AZULITA', 1202, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120301, 'CANAGUA', 1203, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120302, 'CAPURI', 1203, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120303, 'CHACANTA', 1203, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120304, 'EL MOLINO', 1203, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120305, 'GUAIMARAL', 1203, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120306, 'MUCUTUY', 1203, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120307, 'MUCUCHACHI', 1203, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120401, 'ACEQUIAS', 1204, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120402, 'JAJI', 1204, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120403, 'LA MESA', 1204, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120404, 'SAN JOSE', 1204, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120405, 'MONTALBAN', 1204, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120406, 'MATRIZ', 1204, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120407, 'FERNANDEZ PEÑA', 1204, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120501, 'GUARAQUE', 1205, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120502, 'MESA DE QUINTERO', 1205, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120503, 'RIO NEGRO', 1205, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120601, 'ARAPUEY', 1206, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120602, 'PALMIRA', 1206, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120701, 'TORONDOY', 1207, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120702, 'SAN CRISTOBAL DE T', 1207, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120801, 'ARIAS', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120802, 'SAGRARIO', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120803, 'MILLA', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120804, 'EL LLANO', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120805, 'JUAN RODRIGUEZ SUAREZ', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120806, 'JACINTO PLAZA', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120807, 'DOMINGO PEÑA', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120808, 'GONZALO PICON FEBRES', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120809, 'OSUNA RODRIGUEZ', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120810, 'LASSO DE LA VEGA', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120811, 'CARACCIOLO PARRA PEREZ', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120812, 'MARIANO PICON SALAS', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120813, 'ANTONIO SPINETTI DINI', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120814, 'EL MORRO', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120815, 'LOS NEVADOS', 1208, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(120901, 'TABAY', 1209, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121001, 'TIMOTES', 1210, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121002, 'ANDRES ELOY BLANCO', 1210, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121003, 'PIÑANGO', 1210, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121004, 'LA VENTA', 1210, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121101, 'SANTA CRUZ DE MORA', 1211, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121102, 'MESA BOLIVAR', 1211, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121103, 'MESA DE LAS PALMAS', 1211, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121201, 'SANTA ELENA DE ARENALES', 1212, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121202, 'ELOY PAREDES', 1212, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121203, 'SAN RAFAEL DE ALZAZAR', 1212, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121301, 'TUCANI', 1213, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121302, 'FLORENCIO RAMIREZ', 1213, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121401, 'SANTO DOMINGO', 1214, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121402, 'LAS PIEDRAS', 1214, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121501, 'PUEBLO LLANO', 1215, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121601, 'MUCUCHIES', 1216, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121602, 'MUCURUBA', 1216, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121603, 'SAN RAFAEL', 1216, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121604, 'CACUTE', 1216, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121605, 'LA TOMA', 1216, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121701, 'BAILADORES', 1217, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121702, 'GERONIMO MALDONADO', 1217, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121801, 'LAGUNILLAS', 1218, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121802, 'CHIGUARA', 1218, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121803, 'ESTANQUES', 1218, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121804, 'SAN JUAN', 1218, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121805, 'PUEBLO NUEVO DEL SUR', 1218, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121806, 'LA TRAMPA', 1218, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121901, 'EL LLANO', 1219, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121902, 'TOVAR', 1219, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121903, 'EL AMPARO', 1219, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(121904, 'SAN FRANCISCO', 1219, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122001, 'NUEVA BOLIVIA', 1220, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122002, 'INDEPENDENCIA', 1220, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122003, 'MARIA C PALACIOS', 1220, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122004, 'SANTA APOLONIA', 1220, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122101, 'SANTA MARIA DE CAPARO', 1221, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122201, 'ARICAGUA', 1222, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122202, 'SAN ANTONIO', 1222, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122301, 'ZEA', 1223, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(122302, 'CAÑO EL TIGRE', 1223, 12, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130101, 'CAUCAGUA', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130102, 'ARAGUITA', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130103, 'AREVALO GONZALEZ', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130104, 'CAPAYA', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130105, 'PANAQUIRE', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130106, 'RIBAS', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130107, 'EL CAFE', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130108, 'MARIZAPA', 1301, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130201, 'HIGUEROTE', 1302, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130202, 'CURIEPE', 1302, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130203, 'TACARIGUA', 1302, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130301, 'LOS TEQUES', 1303, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130302, 'CECILIO ACOSTA', 1303, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130303, 'PARACOTOS', 1303, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130304, 'SAN PEDRO', 1303, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130305, 'TACATA', 1303, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130306, 'EL JARILLO', 1303, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130307, 'ALTAGRACIA DE LA MONTAÑA', 1303, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130401, 'SANTA TERESA DEL TUY', 1304, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130402, 'EL CARTANAL', 1304, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130501, 'OCUMARE DEL TUY', 1305, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130502, 'LA DEMOCRACIA', 1305, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130503, 'SANTA BARBARA', 1305, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130601, 'RIO CHICO', 1306, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130602, 'EL GUAPO', 1306, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130603, 'TACARIGUA DE LA LAGUNA', 1306, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130604, 'PAPARO', 1306, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130605, 'SN FERNANDO DEL GUAPO', 1306, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130701, 'SANTA LUCIA DEL TUY', 1307, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130801, 'GUARENAS', 1308, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130901, 'PETARE', 1309, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130902, 'LEONCIO MARTINEZ', 1309, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130903, 'CAUCAGUITA', 1309, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130904, 'FILAS DE MARICHES', 1309, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(130905, 'LA DOLORITA', 1309, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131001, 'CUA', 1310, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131002, 'NUEVA CUA', 1310, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131101, 'GUATIRE', 1311, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131102, 'BOLIVAR', 1311, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131201, 'CHARALLAVE', 1312, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131202, 'LAS BRISAS', 1312, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131301, 'SAN ANTONIO LOS ALTOS', 1313, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131401, 'SAN JOSE DE BARLOVENTO', 1314, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131402, 'CUMBO', 1314, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131501, 'SAN FRANCISCO DE YARE', 1315, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131502, 'SAN ANTONIO DE YARE', 1315, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131601, 'NUESTRA SEÑORA DEL ROSARIO', 1316, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131602, 'EL CAFETAL', 1316, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131603, 'LAS MINAS', 1316, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131701, 'CARRIZAL', 1317, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131801, 'CHACAO', 1318, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(131901, 'EL HATILLO', 1319, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(132001, 'MAMPORAL', 1320, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(132101, 'CUPIRA', 1321, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(132102, 'MACHURUCUTO', 1321, 13, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140101, 'SAN ANTONIO DE MATURIN', 1401, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140102, 'SAN FRANCISCO DE MATURIN', 1401, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140201, 'CARIPITO', 1402, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140301, 'CARIPE', 1403, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140302, 'TERESEN', 1403, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140303, 'EL GUACHARO', 1403, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140304, 'SAN AGUSTIN', 1403, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140305, 'LA GUANOTA', 1403, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140306, 'SABANA DE PIEDRA', 1403, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140401, 'CAICARA', 1404, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140402, 'AREO', 1404, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140403, 'SAN FELIX', 1404, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140404, 'VIENTO FRESCO', 1404, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140501, 'PUNTA DE MATA', 1405, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140502, 'EL TEJERO', 1405, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55');
INSERT INTO `parroquias` (`id`, `descripcion`, `municipio_id`, `estado_id`, `created_at`, `updated_at`) VALUES
(140601, 'TEMBLADOR', 1406, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140602, 'TABASCA', 1406, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140603, 'LAS ALHUACAS', 1406, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140604, 'CHAGUARAMAS', 1406, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140701, 'EL FURRIAL', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140702, 'JUSEPIN', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140703, 'EL COROZO', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140704, 'SAN VICENTE', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140705, 'LA PICA', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140706, 'ALTO DE LOS GODOS', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140707, 'BOQUERON', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140708, 'LAS COCUIZAS', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140709, 'SANTA CRUZ', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140710, 'SAN SIMON', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140711, 'C.M. MATURIN', 1407, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140801, 'ARAGUA', 1408, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140802, 'CHAGUARAMAL', 1408, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140803, 'GUANAGUANA', 1408, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140804, 'APARICIO', 1408, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140805, 'TAGUAYA', 1408, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140806, 'EL PINTO', 1408, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140807, 'LA TOSCANA', 1408, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140901, 'QUIRIQUIRE', 1409, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(140902, 'CACHIPO', 1409, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(141001, 'BARRANCAS', 1410, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(141002, 'LOS BARRANCOS DE FAJARDO', 1410, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(141101, 'AGUASAY', 1411, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(141201, 'SANTA BARBARA', 1412, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(141301, 'URACOA', 1413, 14, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150101, 'LA ASUNCION', 1501, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150201, 'SAN JUAN BAUTISTA', 1502, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150202, 'ZABALA', 1502, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150301, 'SANTA ANA', 1503, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150302, 'GUEVARA', 1503, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150303, 'MATASIETE', 1503, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150304, 'BOLIVAR', 1503, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150305, 'SUCRE', 1503, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150401, 'PAMPATAR', 1504, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150402, 'AGUIRRE', 1504, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150501, 'JUAN GRIEGO', 1505, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150502, 'ADRIAN', 1505, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150601, 'PORLAMAR', 1506, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150701, 'BOCA DEL RIO', 1507, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150702, 'SAN FRANCISCO', 1507, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150801, 'SAN PEDRO DE COCHE', 1508, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150802, 'VICENTE FUENTES', 1508, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150901, 'PUNTA DE PIEDRAS', 1509, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(150902, 'LOS BARALES', 1509, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(151001, 'LA PLAZA DE PARAGUACHI', 1510, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(151101, 'VALLE ESP SANTO', 1511, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(151102, 'FRANCISCO FAJARDO', 1511, 15, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160101, 'ARAURE', 1601, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160102, 'RIO ACARIGUA', 1601, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160201, 'PIRITU', 1602, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160202, 'UVERAL', 1602, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160301, 'GUANARE', 1603, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160302, 'CORDOBA', 1603, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160303, 'SAN JUAN GUANAGUANARE', 1603, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160304, 'VIRGEN DE LA COROMOTO', 1603, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160305, 'SAN JOSE DE LA MONTAÑA', 1603, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160401, 'GUANARITO', 1604, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160402, 'TRINIDAD DE LA CAPILLA', 1604, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160403, 'DIVINA PASTORA', 1604, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160501, 'OSPINO', 1605, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160502, 'APARICION', 1605, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160503, 'LA ESTACION', 1605, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160601, 'ACARIGUA', 1606, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160602, 'PAYARA', 1606, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160603, 'PIMPINELA', 1606, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160604, 'RAMON PERAZA', 1606, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160701, 'BISCUCUY', 1607, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160702, 'CONCEPCION', 1607, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160703, 'SAN RAFAEL PALO ALZADO', 1607, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160704, 'UVENCIO A VELASQUEZ', 1607, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160705, 'SAN JOSE DE SAGUAZ', 1607, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160706, 'VILLA ROSA', 1607, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160801, 'VILLA BRUZUAL', 1608, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160802, 'CANELONES', 1608, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160803, 'SANTA CRUZ', 1608, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160804, 'SAN ISIDRO LABRADOR', 1608, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160901, 'CHABASQUEN', 1609, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(160902, 'PEÑA BLANCA', 1609, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161001, 'AGUA BLANCA', 1610, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161101, 'PAPELON', 1611, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161102, 'CAÑO DELGADITO', 1611, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161201, 'BOCONOITO', 1612, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161202, 'ANTOLIN TOVAR AQUINO', 1612, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161301, 'SAN RAFAEL DE ONOTO', 1613, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161302, 'SANTA FE', 1613, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161303, 'THERMO MORALES', 1613, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161401, 'EL PLAYON', 1614, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(161402, 'FLORIDA', 1614, 16, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170101, 'RIO CARIBE', 1701, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170102, 'SAN JUAN GALDONAS', 1701, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170103, 'PUERTO SANTO', 1701, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170104, 'EL MORRO DE PUERTO SANTO', 1701, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170105, 'ANTONIO JOSE DE SUCRE', 1701, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170201, 'EL PILAR', 1702, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170202, 'EL RINCON', 1702, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170203, 'GUARAUNOS', 1702, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170204, 'TUNAPUICITO', 1702, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170205, 'UNION', 1702, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170206, 'GENERAL FRANCISCO ANTONIO VAZQUEZ', 1702, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170301, 'SANTA CATALINA', 1703, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170302, 'SANTA ROSA', 1703, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170303, 'SANTA TERESA', 1703, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170304, 'BOLIVAR', 1703, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170305, 'MACARAPANA', 1703, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170401, 'YAGUARAPARO', 1704, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170402, 'LIBERTAD', 1704, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170403, 'PAUJIL', 1704, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170501, 'IRAPA', 1705, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170502, 'CAMPO CLARO', 1705, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170503, 'SORO', 1705, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170504, 'SAN ANTONIO DE IRAPA', 1705, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170505, 'MARABAL', 1705, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170601, 'SAN ANT DEL GOLFO', 1706, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170701, 'CUMANACOA', 1707, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170702, 'ARENAS', 1707, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170703, 'ARICAGUA', 1707, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170704, 'COCOLLAR', 1707, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170705, 'SAN FERNANDO', 1707, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170706, 'SAN LORENZO', 1707, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170801, 'CARIACO', 1708, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170802, 'CATUARO', 1708, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170803, 'RENDON', 1708, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170804, 'SANTA CRUZ', 1708, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170805, 'SANTA MARIA', 1708, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170901, 'ALTAGRACIA', 1709, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170902, 'AYACUCHO', 1709, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170903, 'SANTA INES', 1709, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170904, 'VALENTIN VALIENTE', 1709, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170905, 'SAN JUAN', 1709, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170906, 'GRAN MARISCAL', 1709, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(170907, 'RAUL LEONI', 1709, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171001, 'GUIRIA', 1710, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171002, 'CRISTOBAL COLON', 1710, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171003, 'PUNTA DE PIEDRAS', 1710, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171004, 'BIDEAU', 1710, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171101, 'MARIÑO', 1711, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171102, 'ROMULO GALLEGOS', 1711, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171201, 'TUNAPUY', 1712, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171202, 'CAMPO ELIAS', 1712, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171301, 'SAN JOSE DE AREOCUAR', 1713, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171302, 'TAVERA ACOSTA', 1713, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171401, 'MARIGUITAR', 1714, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171501, 'ARAYA', 1715, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171502, 'MANICUARE', 1715, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(171503, 'CHACOPATA', 1715, 17, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180101, 'COLON', 1801, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180102, 'RIVAS BERTI', 1801, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180103, 'SAN PEDRO DEL RIO', 1801, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180201, 'SAN ANTONIO DEL TACHIRA', 1802, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180202, 'PALOTAL', 1802, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180203, 'JUAN VICENTE GOMEZ', 1802, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180204, 'ISAIAS MEDINA ANGARITA', 1802, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180301, 'CAPACHO NUEVO', 1803, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180302, 'JUAN GERMAN ROSCIO', 1803, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180303, 'ROMAN CARDENAS', 1803, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180401, 'TARIBA', 1804, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180402, 'LA FLORIDA', 1804, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180403, 'AMENODORO RANGEL LAMUS', 1804, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180501, 'LA GRITA', 1805, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180502, 'EMILIO CONSTANTINO GUERRERO', 1805, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180503, 'MONSEÑOR MIGUEL ANTONIO SALAS', 1805, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180601, 'RUBIO', 1806, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180602, 'BRAMON', 1806, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180603, 'LA PETROLEA', 1806, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180604, 'QUINIMARI', 1806, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180701, 'LOBATERA', 1807, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180702, 'CONSTITUCION', 1807, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180801, 'LA CONCORDIA', 1808, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180802, 'PEDRO MARIA MORANTES', 1808, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180803, 'SN JUAN BAUTISTA', 1808, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180804, 'SAN SEBASTIAN', 1808, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180805, 'DR. FCO. ROMERO LOBO', 1808, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180901, 'PREGONERO', 1809, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180902, 'CARDENAS', 1809, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180903, 'POTOSI', 1809, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(180904, 'JUAN PABLO PEÑALOZA', 1809, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181001, 'SANTA ANA  DEL TACHIRA', 1810, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181101, 'LA FRIA', 1811, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181102, 'BOCA DE GRITA', 1811, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181103, 'JOSE ANTONIO PAEZ', 1811, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181201, 'PALMIRA', 1812, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181301, 'MICHELENA', 1813, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181401, 'ABEJALES', 1814, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181402, 'SAN JOAQUIN DE NAVAY', 1814, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181403, 'DORADAS', 1814, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181404, 'EMETERIO OCHOA', 1814, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181501, 'COLONCITO', 1815, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181502, 'LA PALMITA', 1815, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181601, 'UREÑA', 1816, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181602, 'NUEVA ARCADIA', 1816, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181701, 'QUENIQUEA', 1817, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181702, 'SAN PABLO', 1817, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181703, 'ELEAZAR LOPEZ CONTRERAS', 1817, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181801, 'CORDERO', 1818, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181901, 'SAN RAFAEL DEL PINAL', 1819, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181902, 'SANTO DOMINGO', 1819, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(181903, 'ALBERTO ADRIANI', 1819, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182001, 'CAPACHO VIEJO', 1820, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182002, 'CIPRIANO CASTRO', 1820, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182003, 'MANUEL FELIPE RUGELES', 1820, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182101, 'LA TENDIDA', 1821, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182102, 'BOCONO', 1821, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182103, 'HERNANDEZ', 1821, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182201, 'SEBORUCO', 1822, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182301, 'LAS MESAS', 1823, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182401, 'SAN JOSE DE BOLIVAR', 1824, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182501, 'EL COBRE', 1825, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182601, 'DELICIAS', 1826, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182701, 'SAN SIMON', 1827, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182801, 'SAN JOSECITO', 1828, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(182901, 'UMUQUENA', 1829, 18, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190101, 'BETIJOQUE', 1901, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190102, 'JOSE G HERNANDEZ', 1901, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190103, 'LA PUEBLITA', 1901, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190104, 'EL CEDRO', 1901, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190201, 'BOCONO', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190202, 'EL CARMEN', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190203, 'MOSQUEY', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190204, 'AYACUCHO', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190205, 'BURBUSAY', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190206, 'GENERAL RIVAS', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190207, 'MONSEÑOR JAUREGUI', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190208, 'RAFAEL RANGEL', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190209, 'SAN JOSE', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190210, 'SAN MIGUEL', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190211, 'GUARAMACAL', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190212, 'LA VEGA DE GUARAMACAL', 1902, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190301, 'CARACHE', 1903, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190302, 'LA CONCEPCION', 1903, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190303, 'CUICAS', 1903, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190304, 'PANAMERICANA', 1903, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190305, 'SANTA CRUZ', 1903, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190401, 'ESCUQUE', 1904, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190402, 'SABANA LIBRE', 1904, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190403, 'LA UNION', 1904, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190404, 'SANTA RITA', 1904, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190501, 'CRISTOBAL MENDOZA', 1905, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190502, 'CHIQUINQUIRA', 1905, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190503, 'MATRIZ', 1905, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190504, 'MONSEÑOR CARRILLO', 1905, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190505, 'CRUZ CARRILLO', 1905, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190506, 'ANDRES LINARES', 1905, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190507, 'TRES ESQUINAS', 1905, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190601, 'LA QUEBRADA', 1906, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190602, 'JAJO', 1906, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190603, 'LA MESA', 1906, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190604, 'SANTIAGO', 1906, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190605, 'CABIMBU', 1906, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190606, 'TUÑAME', 1906, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190701, 'MERCEDES DIAZ', 1907, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190702, 'JUAN IGNACIO MONTILLA', 1907, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190703, 'LA BEATRIZ', 1907, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190704, 'MENDOZA', 1907, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190705, 'LA PUERTA', 1907, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190706, 'SAN LUIS', 1907, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190801, 'CHEJENDE', 1908, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190802, 'CARRILLO', 1908, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190803, 'CEGARRA', 1908, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190804, 'BOLIVIA', 1908, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190805, 'MANUEL SALVADOR ULLOA', 1908, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190806, 'SAN JOSE', 1908, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190807, 'ARNOLDO GABALDON', 1908, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190901, 'EL DIVIDIVE', 1909, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190902, 'AGUA CALIENTE', 1909, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190903, 'EL CENIZO', 1909, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190904, 'AGUA SANTA', 1909, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(190905, 'VALERITA', 1909, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191001, 'MONTE CARMELO', 1910, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191002, 'BUENA VISTA', 1910, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191003, 'STA MARIA DEL HORCON', 1910, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191101, 'MOTATAN', 1911, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191102, 'EL BAÑO', 1911, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191103, 'EL JALISCO', 1911, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191201, 'PAMPAN', 1912, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191202, 'SANTA ANA', 1912, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191203, 'LA PAZ', 1912, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191204, 'FLOR DE PATRIA', 1912, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191301, 'CARVAJAL', 1913, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191302, 'ANTONIO N BRICEÑO', 1913, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191303, 'CAMPO ALEGRE', 1913, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191304, 'JOSE LEONARDO SUAREZ', 1913, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191401, 'SABANA DE MENDOZA', 1914, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191402, 'JUNIN', 1914, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191403, 'VALMORE RODRIGUEZ', 1914, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191404, 'EL PARAISO', 1914, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191501, 'SANTA ISABEL', 1915, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191502, 'ARAGUANEY', 1915, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191503, 'EL JAGUITO', 1915, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191504, 'LA ESPERANZA', 1915, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191601, 'SABANA GRANDE', 1916, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191602, 'CHEREGUE', 1916, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191603, 'GRANADOS', 1916, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191701, 'EL SOCORRO', 1917, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191702, 'LOS CAPRICHOS', 1917, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191703, 'ANTONIO JOSE DE SUCRE', 1917, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191801, 'CAMPO ELIAS', 1918, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191802, 'ARNOLDO GABALDON', 1918, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191901, 'SANTA APOLONIA', 1919, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191902, 'LA CEIBA', 1919, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191903, 'EL PROGRESO', 1919, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(191904, 'TRES DE FEBRERO', 1919, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(192001, 'PAMPANITO', 1920, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(192002, 'PAMPANITO II', 1920, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(192003, 'LA CONCEPCION', 1920, 19, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200101, 'AROA', 2001, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200201, 'CHIVACOA', 2002, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200202, 'CAMPO ELIAS', 2002, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200301, 'NIRGUA', 2003, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200302, 'SALOM', 2003, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200303, 'TEMERLA', 2003, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200401, 'SAN FELIPE', 2004, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200402, 'ALBARICO', 2004, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200403, 'SAN JAVIER', 2004, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200501, 'GUAMA', 2005, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200601, 'URACHICHE', 2006, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200701, 'YARITAGUA', 2007, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200702, 'SAN ANDRES', 2007, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200801, 'SABANA DE PARRA', 2008, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(200901, 'BORAURE', 2009, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(201001, 'COCOROTE', 2010, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(201101, 'INDEPENDENCIA', 2011, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(201201, 'SAN PABLO', 2012, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(201301, 'YUMARE', 2013, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(201401, 'FARRIAR', 2014, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(201402, 'EL GUAYABO', 2014, 20, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210101, 'GENERAL URDANETA', 2101, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210102, 'LIBERTADOR', 2101, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210103, 'MANUEL GUANIPA MATOS', 2101, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210104, 'MARCELINO BRICEÑO', 2101, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210105, 'SAN TIMOTEO', 2101, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210106, 'PUEBLO NUEVO', 2101, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210201, 'PEDRO LUCAS URRIBARRI', 2102, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210202, 'SANTA RITA', 2102, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210203, 'JOSE CENOVIO URRIBARRI', 2102, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210204, 'EL MENE', 2102, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210301, 'SANTA CRUZ DEL ZULIA', 2103, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210302, 'URRIBARRI', 2103, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210303, 'MORALITO', 2103, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210304, 'SAN CARLOS DEL ZULIA', 2103, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210305, 'SANTA BARBARA', 2103, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210401, 'LUIS DE VICENTE', 2104, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210402, 'RICAURTE', 2104, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210403, 'MONS.MARCOS SERGIO G', 2104, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210404, 'SAN RAFAEL', 2104, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210405, 'LAS PARCELAS', 2104, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210406, 'TAMARE', 2104, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210407, 'LA SIERRITA', 2104, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210501, 'BOLIVAR', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210502, 'COQUIVACOA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210503, 'CRISTO DE ARANZA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210504, 'CHIQUINQUIRA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210505, 'SANTA LUCIA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210506, 'OLEGARIO VILLALOBOS', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210507, 'JUANA DE AVILA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210508, 'CARACCIOLO PARRA PEREZ', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210509, 'IDELFONZO VASQUEZ', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210510, 'CACIQUE MARA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210511, 'CECILIO ACOSTA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210512, 'RAUL LEONI', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210513, 'FRANCISCO EUGENIO BUSTAMANTE', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210514, 'MANUEL DAGNINO', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210515, 'LUIS HURTADO HIGUERA', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210516, 'VENANCIO PULGAR', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210517, 'ANTONIO BORJAS ROMERO', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210518, 'SAN ISIDRO', 2105, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210601, 'FARIA', 2106, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210602, 'SAN ANTONIO', 2106, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210603, 'ANA MARIA CAMPOS', 2106, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210604, 'SAN JOSE', 2106, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210605, 'ALTAGRACIA', 2106, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210701, 'GOAJIRA', 2107, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210702, 'ELIAS SANCHEZ RUBIO', 2107, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210703, 'SINAMAICA', 2107, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210704, 'ALTA GUAJIRA', 2107, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210801, 'SAN JOSE DE PERIJA', 2108, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210802, 'BARTOLOME DE LAS CASAS', 2108, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210803, 'LIBERTAD', 2108, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210804, 'RIO NEGRO', 2108, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210901, 'GIBRALTAR', 2109, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210902, 'HERAS', 2109, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210903, 'M.ARTURO CELESTINO A', 2109, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210904, 'ROMULO GALLEGOS', 2109, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210905, 'BOBURES', 2109, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(210906, 'EL BATEY', 2109, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211001, 'ANDRES BELLO (KM 48)', 2110, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211002, 'POTRERITOS', 2110, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211003, 'EL CARMELO', 2110, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211004, 'CHIQUINQUIRA', 2110, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211005, 'CONCEPCION', 2110, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211101, 'ELEAZAR LOPEZ CONTRERAS', 2111, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211102, 'ALONSO DE OJEDA', 2111, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211103, 'VENEZUELA', 2111, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211104, 'CAMPO LARA', 2111, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211105, 'LIBERTAD', 2111, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211106, 'EL DANTO', 2111, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211201, 'UDON PEREZ', 2112, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211202, 'ENCONTRADOS', 2112, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211301, 'DONALDO GARCIA', 2113, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211302, 'SIXTO ZAMBRANO', 2113, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211303, 'EL ROSARIO', 2113, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211401, 'AMBROSIO', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211402, 'GERMAN RIOS LINARES', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211403, 'JORGE HERNANDEZ', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211404, 'LA ROSA', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211405, 'PUNTA GORDA', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211406, 'CARMEN HERRERA', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211407, 'SAN BENITO', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211408, 'ROMULO BETANCOURT', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211409, 'ARISTIDES CALVANI', 2114, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211501, 'RAUL CUENCA', 2115, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211502, 'LA VICTORIA', 2115, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211503, 'RAFAEL URDANETA', 2115, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211601, 'JOSE RAMON YEPEZ', 2116, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211602, 'LA CONCEPCION', 2116, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211603, 'SAN JOSE', 2116, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211604, 'MARIANO PARRA LEON', 2116, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211701, 'MONAGAS', 2117, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211702, 'ISLA DE TOAS', 2117, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211801, 'MARCIAL HERNANDEZ', 2118, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211802, 'FRANCISCO OCHOA', 2118, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211803, 'SAN FRANCISCO', 2118, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211804, 'EL BAJO', 2118, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211805, 'DOMITILA FLORES', 2118, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211806, 'LOS CORTIJOS', 2118, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211807, 'JOSE DOMINGO RUS', 2118, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211901, 'BARI', 2119, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(211902, 'JESUS M SEMPRUN', 2119, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212001, 'SIMON RODRIGUEZ', 2120, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212002, 'CARLOS QUEVEDO', 2120, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212003, 'FRANCISCO J PULGAR', 2120, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212004, 'AGUSTIN CODAZZI', 2120, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212101, 'RAFAEL MARIA BARALT', 2121, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212102, 'MANUEL MANRIQUE', 2121, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(212103, 'RAFAEL URDANETA', 2121, 21, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220101, 'FERNANDO GIRON TOVAR', 2201, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220102, 'LUIS ALBERTO GOMEZ', 2201, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220103, 'PARHUEÑA', 2201, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220104, 'PLATANILLAL', 2201, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220201, 'SAN FERNANDO DE ATABAPO', 2202, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220202, 'UCATA', 2202, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220203, 'YAPACANA', 2202, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220204, 'CANAME', 2202, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220301, 'MAROA', 2203, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220302, 'VICTORINO', 2203, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220303, 'COMUNIDAD', 2203, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220401, 'SAN CARLOS DE RIO NEGRO', 2204, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220402, 'SOLANO', 2204, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220403, 'CASIQUIARE', 2204, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220404, 'COCUY', 2204, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220501, 'ISLA DE RATON', 2205, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220502, 'SAMARIAPO', 2205, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220503, 'SIPAPO', 2205, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220504, 'MUNDUAPO', 2205, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220505, 'GUAYAPO', 2205, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220601, 'SAN JUAN DE MANAPIARE', 2206, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220602, 'ALTO VENTUARI', 2206, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220603, 'MEDIO VENTUARI', 2206, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220604, 'BAJO VENTUARI', 2206, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220701, 'LA ESMERALDA', 2207, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220702, 'HUACHAMACARE', 2207, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220703, 'MARAWAKA', 2207, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220704, 'MAVACA', 2207, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(220705, 'SIERRA PARIMA', 2207, 22, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230101, 'SAN JOSE', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230102, 'VIRGEN DEL VALLE', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230103, 'SAN RAFAEL', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230104, 'JOSE VIDAL MARCANO', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230105, 'LEONARDO RUIZ PINEDA', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230106, 'MONS. ARGIMIRO GARCIA', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230107, 'MCL. ANTONIO J DE SUCRE', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230108, 'JUAN MILLAN', 2301, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230201, 'PEDERNALES', 2302, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230202, 'LUIS B PRIETO FIGUERO', 2302, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230301, 'CURIAPO', 2303, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230302, 'SANTOS DE ABELGAS', 2303, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230303, 'MANUEL RENAUD', 2303, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230304, 'PADRE BARRAL', 2303, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230305, 'ANICETO LUGO', 2303, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230306, 'ALMIRANTE LUIS BRION', 2303, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230401, 'IMATACA', 2304, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230402, 'ROMULO GALLEGOS', 2304, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230403, 'JUAN BAUTISTA ARISMEN', 2304, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(230404, 'MANUEL PIAR', 2304, 23, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240101, 'CARABALLEDA', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240102, 'CARAYACA', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240103, 'CARUAO', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240104, 'CATIA LA MAR', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240105, 'LA GUAIRA', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240106, 'MACUTO', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240107, 'MAIQUETIA', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240108, 'NAIGUATA', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240109, 'EL JUNKO', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240110, 'URIMARE', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55'),
(240111, 'CARLOS SOUBLETTE', 2401, 24, '2020-04-20 05:55:55', '2020-04-20 05:55:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_orders`
--

CREATE TABLE `payment_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_client` bigint(20) UNSIGNED DEFAULT NULL,
  `id_provider` bigint(20) UNSIGNED DEFAULT NULL,
  `id_branch` bigint(20) UNSIGNED DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `reference` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(64,2) NOT NULL,
  `rate` decimal(64,2) NOT NULL,
  `coin` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_types`
--

CREATE TABLE `payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_days` int(11) NOT NULL,
  `pide_ref` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_box` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nature` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `positions`
--

INSERT INTO `positions` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ingeniero', 'Se encarga del sistema', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(2, 'Contador', 'Se encarga de las finanzas', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `segment_id` bigint(20) UNSIGNED NOT NULL,
  `subsegment_id` bigint(20) UNSIGNED NOT NULL,
  `twosubsegment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `threesubsegment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_of_measure_id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `code_comercial` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(64,2) NOT NULL,
  `price_buy` decimal(64,2) NOT NULL,
  `cost_average` decimal(64,2) NOT NULL,
  `photo_product` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exento` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `islr` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_impuesto` decimal(64,2) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `segment_id`, `subsegment_id`, `twosubsegment_id`, `threesubsegment_id`, `unit_of_measure_id`, `id_user`, `code_comercial`, `type`, `description`, `price`, `price_buy`, `cost_average`, `photo_product`, `money`, `exento`, `islr`, `special_impuesto`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL, 1, 1, '1001', 'MERCANCIA', 'Producto 1', '10.00', '5.00', '4.00', NULL, 'D', '0', '0', '0.00', '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41'),
(2, 2, 2, NULL, NULL, 1, 1, '1002', 'MERCANCIA', 'Producto 2 Bs', '1000000.00', '500000.00', '400000.00', NULL, 'Bs', '0', '0', '0.00', '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `professions`
--

CREATE TABLE `professions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `professions`
--

INSERT INTO `professions` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'Supervisa el area administrativa', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(2, 'Secretaria', 'Se encarga de la parte administrativa', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code_provider` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_credit` tinyint(1) NOT NULL,
  `days_credit` int(11) NOT NULL,
  `amount_max_credit` double(12,2) NOT NULL,
  `porc_retencion_iva` double(5,2) NOT NULL,
  `retiene_islr` tinyint(1) NOT NULL,
  `balance` double(16,2) NOT NULL,
  `select_balance` int(11) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `code_provider`, `razon_social`, `direction`, `city`, `country`, `phone1`, `phone2`, `has_credit`, `days_credit`, `amount_max_credit`, `porc_retencion_iva`, `retiene_islr`, `balance`, `select_balance`, `status`, `created_at`, `updated_at`) VALUES
(1, '1000', 'Proveedor Prueba', 'Chacaito', 'Caracas', 'Venezuela', '0414 216-5165', '0212 651-5162', 1, 1, 9999999999.99, 0.00, 0, 0.00, 0, '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_client` bigint(20) UNSIGNED NOT NULL,
  `id_vendor` bigint(20) UNSIGNED NOT NULL,
  `id_transport` bigint(20) UNSIGNED DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `serie` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_quotation` date NOT NULL,
  `date_billing` date DEFAULT NULL,
  `date_delivery_note` date DEFAULT NULL,
  `anticipo` decimal(64,2) DEFAULT NULL,
  `iva_percentage` int(11) DEFAULT NULL,
  `observation` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `coin` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcv` decimal(64,2) DEFAULT NULL COMMENT 'Tasa de cambio a bolivares del banco central de venezuela',
  `retencion_iva` decimal(64,2) DEFAULT NULL,
  `retencion_islr` decimal(64,2) DEFAULT NULL,
  `base_imponible` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_iva` decimal(64,2) DEFAULT NULL,
  `amount_with_iva` decimal(64,2) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_payments`
--

CREATE TABLE `quotation_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_quotation` bigint(20) UNSIGNED NOT NULL,
  `id_account` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `amount` decimal(64,2) NOT NULL,
  `rate` decimal(64,2) NOT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_products`
--

CREATE TABLE `quotation_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_quotation` bigint(20) UNSIGNED NOT NULL,
  `id_inventory` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `discount` decimal(64,2) NOT NULL,
  `price` decimal(64,2) NOT NULL,
  `rate` decimal(64,2) NOT NULL,
  `retiene_iva` tinyint(1) NOT NULL,
  `retiene_islr` tinyint(1) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rate_types`
--

CREATE TABLE `rate_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rate_types`
--

INSERT INTO `rate_types` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AUTOMATICA', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(2, 'FIJA', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receipt_vacations`
--

CREATE TABLE `receipt_vacations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `days_vacations` int(11) NOT NULL,
  `bono_vacations` int(11) NOT NULL,
  `days_feriados` int(11) NOT NULL,
  `lph` decimal(64,2) NOT NULL,
  `sso` decimal(64,2) NOT NULL,
  `seguro_paro_forzoso` decimal(64,2) NOT NULL,
  `ultimo_sueldo` decimal(64,2) NOT NULL,
  `total_pagar` decimal(64,2) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(2, 'Usuario', '1', '2021-08-11 20:12:30', '2021-08-11 20:12:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salary_types`
--

CREATE TABLE `salary_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salary_types`
--

INSERT INTO `salary_types` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Alto', '600 a 800', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40'),
(2, 'Medio', '400 a 600', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segments`
--

CREATE TABLE `segments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `segments`
--

INSERT INTO `segments` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bebidas', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40'),
(2, 'Alimentos', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subsegments`
--

CREATE TABLE `subsegments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `segment_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subsegments`
--

INSERT INTO `subsegments` (`id`, `segment_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Refrescos', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40'),
(2, 2, 'Lata', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasas`
--

CREATE TABLE `tasas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `amount` decimal(64,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `three_subsegments`
--

CREATE TABLE `three_subsegments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `twosubsegment_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transports`
--

CREATE TABLE `transports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modelo_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placa` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_transport` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transports`
--

INSERT INTO `transports` (`id`, `modelo_id`, `color_id`, `user_id`, `type`, `placa`, `photo_transport`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Carro', 'ABF22N', NULL, '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `two_subsegments`
--

CREATE TABLE `two_subsegments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subsegment_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_of_measures`
--

CREATE TABLE `unit_of_measures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unit_of_measures`
--

INSERT INTO `unit_of_measures` (`id`, `code`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kgs', 'Kilogramos', '1', '2021-08-11 20:12:39', '2021-08-11 20:12:39'),
(2, 'Lts', 'Litros', '1', '2021-08-11 20:12:40', '2021-08-11 20:12:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Carlos', 'cefreitas.16@gmail.com', NULL, '$2y$10$EVKRKN1Ar38WBfI3HaoGZ.3cRi7VhZOOpTyiHtuLULT/Hw.DtNhDi', '1', NULL, '2021-08-11 20:12:30', '2021-08-11 20:12:30'),
(2, 1, 'Demo', 'demo@gmail.com', NULL, '$2y$10$m7l.9QWBVY/1LTpTb2mWR.1bzCHkiCW7dqID9jY/H3ehXY/c3rzum', '1', NULL, '2021-08-11 20:12:30', '2021-08-11 20:12:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parroquia_id` bigint(20) UNSIGNED NOT NULL,
  `comision_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_rif` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comision` decimal(64,2) NOT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `especification` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observation` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vendors`
--

INSERT INTO `vendors` (`id`, `parroquia_id`, `comision_id`, `employee_id`, `user_id`, `code`, `cedula_rif`, `name`, `surname`, `email`, `phone`, `phone2`, `comision`, `instagram`, `facebook`, `twitter`, `especification`, `observation`, `status`, `created_at`, `updated_at`) VALUES
(1, 10113, 1, 1, 1, '0001', '27.615.651', 'Primer Vendedor', 'Prueba', 'Eduardoperez17@gmail.com', '0414 255-1545', '0412 255-1545', '0.00', NULL, NULL, NULL, NULL, NULL, '1', '2021-08-11 20:12:41', '2021-08-11 20:12:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academiclevels`
--
ALTER TABLE `academiclevels`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `account_historials`
--
ALTER TABLE `account_historials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_historials_id_account_foreign` (`id_account`);

--
-- Indices de la tabla `anticipos`
--
ALTER TABLE `anticipos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anticipos_id_client_foreign` (`id_client`),
  ADD KEY `anticipos_id_provider_foreign` (`id_provider`),
  ADD KEY `anticipos_id_account_foreign` (`id_account`),
  ADD KEY `anticipos_id_user_foreign` (`id_user`),
  ADD KEY `anticipos_id_quotation_foreign` (`id_quotation`);

--
-- Indices de la tabla `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_company_id_foreign` (`company_id`),
  ADD KEY `branches_parroquia_id_foreign` (`parroquia_id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_id_vendor_foreign` (`id_vendor`),
  ADD KEY `clients_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comision_types`
--
ALTER TABLE `comision_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_login_unique` (`login`),
  ADD UNIQUE KEY `companies_email_unique` (`email`),
  ADD UNIQUE KEY `companies_razon_social_unique` (`razon_social`),
  ADD KEY `companies_tipoinv_id_foreign` (`tipoinv_id`),
  ADD KEY `companies_tiporate_id_foreign` (`tiporate_id`);

--
-- Indices de la tabla `detail_vouchers`
--
ALTER TABLE `detail_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_vouchers_id_account_foreign` (`id_account`),
  ADD KEY `detail_vouchers_id_header_voucher_foreign` (`id_header_voucher`),
  ADD KEY `detail_vouchers_id_invoice_foreign` (`id_invoice`),
  ADD KEY `detail_vouchers_id_expense_foreign` (`id_expense`),
  ADD KEY `detail_vouchers_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_parroquia_id_foreign` (`parroquia_id`),
  ADD KEY `employees_municipio_id_foreign` (`municipio_id`),
  ADD KEY `employees_estado_id_foreign` (`estado_id`),
  ADD KEY `employees_profession_id_foreign` (`profession_id`),
  ADD KEY `employees_salary_types_id_foreign` (`salary_types_id`),
  ADD KEY `employees_position_id_foreign` (`position_id`),
  ADD KEY `employees_branch_id_foreign` (`branch_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estados_descripcion_unique` (`descripcion`);

--
-- Indices de la tabla `expenses_and_purchases`
--
ALTER TABLE `expenses_and_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_and_purchases_id_provider_foreign` (`id_provider`),
  ADD KEY `expenses_and_purchases_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `expenses_details`
--
ALTER TABLE `expenses_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_details_id_expense_foreign` (`id_expense`),
  ADD KEY `expenses_details_id_inventory_foreign` (`id_inventory`),
  ADD KEY `expenses_details_id_account_foreign` (`id_account`),
  ADD KEY `expenses_details_id_user_foreign` (`id_user`),
  ADD KEY `expenses_details_id_branch_foreign` (`id_branch`);

--
-- Indices de la tabla `expense_payments`
--
ALTER TABLE `expense_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_payments_id_expense_foreign` (`id_expense`),
  ADD KEY `expense_payments_id_account_foreign` (`id_account`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `general_nomina`
--
ALTER TABLE `general_nomina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `header_vouchers`
--
ALTER TABLE `header_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `header_vouchers_id_anticipo_foreign` (`id_anticipo`);

--
-- Indices de la tabla `historic_transports`
--
ALTER TABLE `historic_transports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historic_transports_employee_id_foreign` (`employee_id`),
  ADD KEY `historic_transports_transport_id_foreign` (`transport_id`),
  ADD KEY `historic_transports_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `index_bcvs`
--
ALTER TABLE `index_bcvs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventary_types`
--
ALTER TABLE `inventary_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventary_types_description_unique` (`description`);

--
-- Indices de la tabla `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_product_id_foreign` (`product_id`),
  ADD KEY `inventories_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipios_estado_id_foreign` (`estado_id`);

--
-- Indices de la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nominas_id_profession_foreign` (`id_profession`);

--
-- Indices de la tabla `nomina_calculations`
--
ALTER TABLE `nomina_calculations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomina_calculations_id_nomina_foreign` (`id_nomina`),
  ADD KEY `nomina_calculations_id_nomina_concept_foreign` (`id_nomina_concept`),
  ADD KEY `nomina_calculations_id_employee_foreign` (`id_employee`);

--
-- Indices de la tabla `nomina_concepts`
--
ALTER TABLE `nomina_concepts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomina_concepts_id_formula_q_foreign` (`id_formula_q`),
  ADD KEY `nomina_concepts_id_formula_m_foreign` (`id_formula_m`),
  ADD KEY `nomina_concepts_id_formula_s_foreign` (`id_formula_s`),
  ADD KEY `nomina_concepts_id_account_debe_foreign` (`id_account_debe`),
  ADD KEY `nomina_concepts_id_account_haber_foreign` (`id_account_haber`);

--
-- Indices de la tabla `nomina_formulas`
--
ALTER TABLE `nomina_formulas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nomina_types`
--
ALTER TABLE `nomina_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parroquias_estado_id_foreign` (`estado_id`),
  ADD KEY `parroquias_municipio_id_foreign` (`municipio_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payment_orders`
--
ALTER TABLE `payment_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_orders_id_client_foreign` (`id_client`),
  ADD KEY `payment_orders_id_provider_foreign` (`id_provider`),
  ADD KEY `payment_orders_id_branch_foreign` (`id_branch`),
  ADD KEY `payment_orders_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_segment_id_foreign` (`segment_id`),
  ADD KEY `products_subsegment_id_foreign` (`subsegment_id`),
  ADD KEY `products_twosubsegment_id_foreign` (`twosubsegment_id`),
  ADD KEY `products_threesubsegment_id_foreign` (`threesubsegment_id`),
  ADD KEY `products_unit_of_measure_id_foreign` (`unit_of_measure_id`),
  ADD KEY `products_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_id_client_foreign` (`id_client`),
  ADD KEY `quotations_id_vendor_foreign` (`id_vendor`),
  ADD KEY `quotations_id_transport_foreign` (`id_transport`),
  ADD KEY `quotations_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `quotation_payments`
--
ALTER TABLE `quotation_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_payments_id_quotation_foreign` (`id_quotation`),
  ADD KEY `quotation_payments_id_account_foreign` (`id_account`);

--
-- Indices de la tabla `quotation_products`
--
ALTER TABLE `quotation_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_products_id_quotation_foreign` (`id_quotation`),
  ADD KEY `quotation_products_id_inventory_foreign` (`id_inventory`);

--
-- Indices de la tabla `rate_types`
--
ALTER TABLE `rate_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rate_types_description_unique` (`description`);

--
-- Indices de la tabla `receipt_vacations`
--
ALTER TABLE `receipt_vacations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_vacations_employee_id_foreign` (`employee_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salary_types`
--
ALTER TABLE `salary_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subsegments`
--
ALTER TABLE `subsegments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subsegments_segment_id_foreign` (`segment_id`);

--
-- Indices de la tabla `tasas`
--
ALTER TABLE `tasas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasas_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `three_subsegments`
--
ALTER TABLE `three_subsegments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `three_subsegments_twosubsegment_id_foreign` (`twosubsegment_id`);

--
-- Indices de la tabla `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transports_modelo_id_foreign` (`modelo_id`),
  ADD KEY `transports_color_id_foreign` (`color_id`),
  ADD KEY `transports_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `two_subsegments`
--
ALTER TABLE `two_subsegments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `two_subsegments_subsegment_id_foreign` (`subsegment_id`);

--
-- Indices de la tabla `unit_of_measures`
--
ALTER TABLE `unit_of_measures`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendors_parroquia_id_foreign` (`parroquia_id`),
  ADD KEY `vendors_comision_id_foreign` (`comision_id`),
  ADD KEY `vendors_employee_id_foreign` (`employee_id`),
  ADD KEY `vendors_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academiclevels`
--
ALTER TABLE `academiclevels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `account_historials`
--
ALTER TABLE `account_historials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `anticipos`
--
ALTER TABLE `anticipos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comision_types`
--
ALTER TABLE `comision_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detail_vouchers`
--
ALTER TABLE `detail_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `expenses_and_purchases`
--
ALTER TABLE `expenses_and_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expenses_details`
--
ALTER TABLE `expenses_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expense_payments`
--
ALTER TABLE `expense_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `general_nomina`
--
ALTER TABLE `general_nomina`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `header_vouchers`
--
ALTER TABLE `header_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historic_transports`
--
ALTER TABLE `historic_transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `index_bcvs`
--
ALTER TABLE `index_bcvs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventary_types`
--
ALTER TABLE `inventary_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2402;

--
-- AUTO_INCREMENT de la tabla `nominas`
--
ALTER TABLE `nominas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nomina_calculations`
--
ALTER TABLE `nomina_calculations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nomina_concepts`
--
ALTER TABLE `nomina_concepts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `nomina_formulas`
--
ALTER TABLE `nomina_formulas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `nomina_types`
--
ALTER TABLE `nomina_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240112;

--
-- AUTO_INCREMENT de la tabla `payment_orders`
--
ALTER TABLE `payment_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quotation_payments`
--
ALTER TABLE `quotation_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quotation_products`
--
ALTER TABLE `quotation_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rate_types`
--
ALTER TABLE `rate_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `receipt_vacations`
--
ALTER TABLE `receipt_vacations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salary_types`
--
ALTER TABLE `salary_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `segments`
--
ALTER TABLE `segments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `subsegments`
--
ALTER TABLE `subsegments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tasas`
--
ALTER TABLE `tasas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `three_subsegments`
--
ALTER TABLE `three_subsegments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transports`
--
ALTER TABLE `transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `two_subsegments`
--
ALTER TABLE `two_subsegments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unit_of_measures`
--
ALTER TABLE `unit_of_measures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `account_historials`
--
ALTER TABLE `account_historials`
  ADD CONSTRAINT `account_historials_id_account_foreign` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`);

--
-- Filtros para la tabla `anticipos`
--
ALTER TABLE `anticipos`
  ADD CONSTRAINT `anticipos_id_account_foreign` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `anticipos_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `anticipos_id_provider_foreign` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `anticipos_id_quotation_foreign` FOREIGN KEY (`id_quotation`) REFERENCES `quotations` (`id`),
  ADD CONSTRAINT `anticipos_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `branches_parroquia_id_foreign` FOREIGN KEY (`parroquia_id`) REFERENCES `parroquias` (`id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_id_vendor_foreign` FOREIGN KEY (`id_vendor`) REFERENCES `vendors` (`id`);

--
-- Filtros para la tabla `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_tipoinv_id_foreign` FOREIGN KEY (`tipoinv_id`) REFERENCES `inventary_types` (`id`),
  ADD CONSTRAINT `companies_tiporate_id_foreign` FOREIGN KEY (`tiporate_id`) REFERENCES `rate_types` (`id`);

--
-- Filtros para la tabla `detail_vouchers`
--
ALTER TABLE `detail_vouchers`
  ADD CONSTRAINT `detail_vouchers_id_account_foreign` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `detail_vouchers_id_expense_foreign` FOREIGN KEY (`id_expense`) REFERENCES `expenses_and_purchases` (`id`),
  ADD CONSTRAINT `detail_vouchers_id_header_voucher_foreign` FOREIGN KEY (`id_header_voucher`) REFERENCES `header_vouchers` (`id`),
  ADD CONSTRAINT `detail_vouchers_id_invoice_foreign` FOREIGN KEY (`id_invoice`) REFERENCES `quotations` (`id`),
  ADD CONSTRAINT `detail_vouchers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `employees_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `employees_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`),
  ADD CONSTRAINT `employees_parroquia_id_foreign` FOREIGN KEY (`parroquia_id`) REFERENCES `parroquias` (`id`),
  ADD CONSTRAINT `employees_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  ADD CONSTRAINT `employees_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`),
  ADD CONSTRAINT `employees_salary_types_id_foreign` FOREIGN KEY (`salary_types_id`) REFERENCES `salary_types` (`id`);

--
-- Filtros para la tabla `expenses_and_purchases`
--
ALTER TABLE `expenses_and_purchases`
  ADD CONSTRAINT `expenses_and_purchases_id_provider_foreign` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `expenses_and_purchases_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `expenses_details`
--
ALTER TABLE `expenses_details`
  ADD CONSTRAINT `expenses_details_id_account_foreign` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `expenses_details_id_branch_foreign` FOREIGN KEY (`id_branch`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `expenses_details_id_expense_foreign` FOREIGN KEY (`id_expense`) REFERENCES `expenses_and_purchases` (`id`),
  ADD CONSTRAINT `expenses_details_id_inventory_foreign` FOREIGN KEY (`id_inventory`) REFERENCES `inventories` (`id`),
  ADD CONSTRAINT `expenses_details_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `expense_payments`
--
ALTER TABLE `expense_payments`
  ADD CONSTRAINT `expense_payments_id_account_foreign` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `expense_payments_id_expense_foreign` FOREIGN KEY (`id_expense`) REFERENCES `expenses_and_purchases` (`id`);

--
-- Filtros para la tabla `header_vouchers`
--
ALTER TABLE `header_vouchers`
  ADD CONSTRAINT `header_vouchers_id_anticipo_foreign` FOREIGN KEY (`id_anticipo`) REFERENCES `anticipos` (`id`);

--
-- Filtros para la tabla `historic_transports`
--
ALTER TABLE `historic_transports`
  ADD CONSTRAINT `historic_transports_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `historic_transports_transport_id_foreign` FOREIGN KEY (`transport_id`) REFERENCES `transports` (`id`),
  ADD CONSTRAINT `historic_transports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD CONSTRAINT `nominas_id_profession_foreign` FOREIGN KEY (`id_profession`) REFERENCES `professions` (`id`);

--
-- Filtros para la tabla `nomina_calculations`
--
ALTER TABLE `nomina_calculations`
  ADD CONSTRAINT `nomina_calculations_id_employee_foreign` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `nomina_calculations_id_nomina_concept_foreign` FOREIGN KEY (`id_nomina_concept`) REFERENCES `nomina_concepts` (`id`),
  ADD CONSTRAINT `nomina_calculations_id_nomina_foreign` FOREIGN KEY (`id_nomina`) REFERENCES `nominas` (`id`);

--
-- Filtros para la tabla `nomina_concepts`
--
ALTER TABLE `nomina_concepts`
  ADD CONSTRAINT `nomina_concepts_id_account_debe_foreign` FOREIGN KEY (`id_account_debe`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `nomina_concepts_id_account_haber_foreign` FOREIGN KEY (`id_account_haber`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `nomina_concepts_id_formula_m_foreign` FOREIGN KEY (`id_formula_m`) REFERENCES `nomina_formulas` (`id`),
  ADD CONSTRAINT `nomina_concepts_id_formula_q_foreign` FOREIGN KEY (`id_formula_q`) REFERENCES `nomina_formulas` (`id`),
  ADD CONSTRAINT `nomina_concepts_id_formula_s_foreign` FOREIGN KEY (`id_formula_s`) REFERENCES `nomina_formulas` (`id`);

--
-- Filtros para la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD CONSTRAINT `parroquias_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parroquias_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `payment_orders`
--
ALTER TABLE `payment_orders`
  ADD CONSTRAINT `payment_orders_id_branch_foreign` FOREIGN KEY (`id_branch`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `payment_orders_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `payment_orders_id_provider_foreign` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `payment_orders_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_segment_id_foreign` FOREIGN KEY (`segment_id`) REFERENCES `segments` (`id`),
  ADD CONSTRAINT `products_subsegment_id_foreign` FOREIGN KEY (`subsegment_id`) REFERENCES `subsegments` (`id`),
  ADD CONSTRAINT `products_threesubsegment_id_foreign` FOREIGN KEY (`threesubsegment_id`) REFERENCES `three_subsegments` (`id`),
  ADD CONSTRAINT `products_twosubsegment_id_foreign` FOREIGN KEY (`twosubsegment_id`) REFERENCES `two_subsegments` (`id`),
  ADD CONSTRAINT `products_unit_of_measure_id_foreign` FOREIGN KEY (`unit_of_measure_id`) REFERENCES `unit_of_measures` (`id`);

--
-- Filtros para la tabla `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `quotations_id_transport_foreign` FOREIGN KEY (`id_transport`) REFERENCES `transports` (`id`),
  ADD CONSTRAINT `quotations_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quotations_id_vendor_foreign` FOREIGN KEY (`id_vendor`) REFERENCES `vendors` (`id`);

--
-- Filtros para la tabla `quotation_payments`
--
ALTER TABLE `quotation_payments`
  ADD CONSTRAINT `quotation_payments_id_account_foreign` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `quotation_payments_id_quotation_foreign` FOREIGN KEY (`id_quotation`) REFERENCES `quotations` (`id`);

--
-- Filtros para la tabla `quotation_products`
--
ALTER TABLE `quotation_products`
  ADD CONSTRAINT `quotation_products_id_inventory_foreign` FOREIGN KEY (`id_inventory`) REFERENCES `inventories` (`id`),
  ADD CONSTRAINT `quotation_products_id_quotation_foreign` FOREIGN KEY (`id_quotation`) REFERENCES `quotations` (`id`);

--
-- Filtros para la tabla `receipt_vacations`
--
ALTER TABLE `receipt_vacations`
  ADD CONSTRAINT `receipt_vacations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `subsegments`
--
ALTER TABLE `subsegments`
  ADD CONSTRAINT `subsegments_segment_id_foreign` FOREIGN KEY (`segment_id`) REFERENCES `segments` (`id`);

--
-- Filtros para la tabla `tasas`
--
ALTER TABLE `tasas`
  ADD CONSTRAINT `tasas_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `three_subsegments`
--
ALTER TABLE `three_subsegments`
  ADD CONSTRAINT `three_subsegments_twosubsegment_id_foreign` FOREIGN KEY (`twosubsegment_id`) REFERENCES `two_subsegments` (`id`);

--
-- Filtros para la tabla `transports`
--
ALTER TABLE `transports`
  ADD CONSTRAINT `transports_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `transports_modelo_id_foreign` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`),
  ADD CONSTRAINT `transports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `two_subsegments`
--
ALTER TABLE `two_subsegments`
  ADD CONSTRAINT `two_subsegments_subsegment_id_foreign` FOREIGN KEY (`subsegment_id`) REFERENCES `subsegments` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_comision_id_foreign` FOREIGN KEY (`comision_id`) REFERENCES `comision_types` (`id`),
  ADD CONSTRAINT `vendors_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `vendors_parroquia_id_foreign` FOREIGN KEY (`parroquia_id`) REFERENCES `parroquias` (`id`),
  ADD CONSTRAINT `vendors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

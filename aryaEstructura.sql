-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2021 a las 15:37:13
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
  `id_expense` bigint(20) UNSIGNED DEFAULT NULL,
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
-- Estructura de tabla para la tabla `anticipo_quotations`
--

CREATE TABLE `anticipo_quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_quotation` bigint(20) UNSIGNED NOT NULL,
  `id_anticipo` bigint(20) UNSIGNED NOT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charge_orders`
--

CREATE TABLE `charge_orders` (
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
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `franqueo_postal` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_1` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax_2` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax_3` decimal(15,2) NOT NULL DEFAULT 0.00,
  `retention_islr` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tipoinv_id` bigint(20) UNSIGNED NOT NULL,
  `tiporate_id` bigint(20) UNSIGNED NOT NULL,
  `rate` decimal(64,2) NOT NULL,
  `rate_petro` decimal(64,2) NOT NULL,
  `foto_company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pie_pagina` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses_and_purchases`
--

CREATE TABLE `expenses_and_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_provider` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_islr_concept` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serie` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observation` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `date_delivery_note` date DEFAULT NULL,
  `date_payment` date DEFAULT NULL,
  `retencion_iva` decimal(64,2) DEFAULT NULL,
  `retencion_islr` decimal(64,2) DEFAULT NULL,
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
  `amount` decimal(64,2) NOT NULL,
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
  `id_expense` bigint(20) UNSIGNED DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `islr_concepts`
--

CREATE TABLE `islr_concepts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multipayments`
--

CREATE TABLE `multipayments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_quotation` bigint(20) UNSIGNED NOT NULL,
  `id_header` bigint(20) UNSIGNED NOT NULL,
  `id_payment` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multipayment_expenses`
--

CREATE TABLE `multipayment_expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_expense` bigint(20) UNSIGNED NOT NULL,
  `id_header` bigint(20) UNSIGNED NOT NULL,
  `id_payment` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `segment_id` bigint(20) UNSIGNED NOT NULL,
  `subsegment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `twosubsegment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `threesubsegment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_of_measure_id` bigint(20) UNSIGNED DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code_provider` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_credit` tinyint(1) NOT NULL,
  `days_credit` int(11) NOT NULL,
  `amount_max_credit` double(64,2) NOT NULL,
  `porc_retencion_iva` double(5,2) NOT NULL,
  `porc_retencion_islr` double(5,2) NOT NULL,
  `balance` double(64,2) NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number_invoice` bigint(20) DEFAULT NULL,
  `number_delivery_note` bigint(20) DEFAULT NULL,
  `number_order` bigint(20) DEFAULT NULL,
  `id_client` bigint(20) UNSIGNED NOT NULL,
  `id_vendor` bigint(20) UNSIGNED DEFAULT NULL,
  `id_transport` bigint(20) UNSIGNED DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `serie` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_quotation` date NOT NULL,
  `date_billing` date DEFAULT NULL,
  `date_delivery_note` date DEFAULT NULL,
  `date_order` date DEFAULT NULL,
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
  `id_quotation` bigint(20) UNSIGNED DEFAULT NULL,
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
  ADD KEY `anticipos_id_quotation_foreign` (`id_quotation`),
  ADD KEY `anticipos_id_expense_foreign` (`id_expense`);

--
-- Indices de la tabla `anticipo_quotations`
--
ALTER TABLE `anticipo_quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anticipo_quotations_id_anticipo_foreign` (`id_anticipo`),
  ADD KEY `anticipo_quotations_id_quotation_foreign` (`id_quotation`);

--
-- Indices de la tabla `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_company_id_foreign` (`company_id`),
  ADD KEY `branches_parroquia_id_foreign` (`parroquia_id`);

--
-- Indices de la tabla `charge_orders`
--
ALTER TABLE `charge_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charge_orders_id_client_foreign` (`id_client`),
  ADD KEY `charge_orders_id_provider_foreign` (`id_provider`),
  ADD KEY `charge_orders_id_branch_foreign` (`id_branch`),
  ADD KEY `charge_orders_id_user_foreign` (`id_user`);

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
  ADD KEY `expenses_and_purchases_id_user_foreign` (`id_user`),
  ADD KEY `expenses_and_purchases_id_islr_concept_foreign` (`id_islr_concept`);

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
-- Indices de la tabla `islr_concepts`
--
ALTER TABLE `islr_concepts`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `multipayments`
--
ALTER TABLE `multipayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `multipayments_id_user_foreign` (`id_user`),
  ADD KEY `multipayments_id_payment_foreign` (`id_payment`),
  ADD KEY `multipayments_id_header_foreign` (`id_header`),
  ADD KEY `multipayments_id_quotation_foreign` (`id_quotation`);

--
-- Indices de la tabla `multipayment_expenses`
--
ALTER TABLE `multipayment_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `multipayment_expenses_id_user_foreign` (`id_user`),
  ADD KEY `multipayment_expenses_id_payment_foreign` (`id_payment`),
  ADD KEY `multipayment_expenses_id_header_foreign` (`id_header`),
  ADD KEY `multipayment_expenses_id_expense_foreign` (`id_expense`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `anticipo_quotations`
--
ALTER TABLE `anticipo_quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `charge_orders`
--
ALTER TABLE `charge_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comision_types`
--
ALTER TABLE `comision_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detail_vouchers`
--
ALTER TABLE `detail_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `islr_concepts`
--
ALTER TABLE `islr_concepts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multipayments`
--
ALTER TABLE `multipayments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multipayment_expenses`
--
ALTER TABLE `multipayment_expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nomina_formulas`
--
ALTER TABLE `nomina_formulas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nomina_types`
--
ALTER TABLE `nomina_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `receipt_vacations`
--
ALTER TABLE `receipt_vacations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salary_types`
--
ALTER TABLE `salary_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `segments`
--
ALTER TABLE `segments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subsegments`
--
ALTER TABLE `subsegments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `two_subsegments`
--
ALTER TABLE `two_subsegments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unit_of_measures`
--
ALTER TABLE `unit_of_measures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `anticipos_id_expense_foreign` FOREIGN KEY (`id_expense`) REFERENCES `expenses_and_purchases` (`id`),
  ADD CONSTRAINT `anticipos_id_provider_foreign` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `anticipos_id_quotation_foreign` FOREIGN KEY (`id_quotation`) REFERENCES `quotations` (`id`),
  ADD CONSTRAINT `anticipos_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `anticipo_quotations`
--
ALTER TABLE `anticipo_quotations`
  ADD CONSTRAINT `anticipo_quotations_id_anticipo_foreign` FOREIGN KEY (`id_anticipo`) REFERENCES `anticipos` (`id`),
  ADD CONSTRAINT `anticipo_quotations_id_quotation_foreign` FOREIGN KEY (`id_quotation`) REFERENCES `quotations` (`id`);

--
-- Filtros para la tabla `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `branches_parroquia_id_foreign` FOREIGN KEY (`parroquia_id`) REFERENCES `parroquias` (`id`);

--
-- Filtros para la tabla `charge_orders`
--
ALTER TABLE `charge_orders`
  ADD CONSTRAINT `charge_orders_id_branch_foreign` FOREIGN KEY (`id_branch`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `charge_orders_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `charge_orders_id_provider_foreign` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `charge_orders_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

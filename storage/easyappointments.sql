-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Sep 17, 2024 at 09:24 AM
-- Server version: 8.0.39
-- PHP Version: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyappointments`
--

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

CREATE TABLE `ea_appointments` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT '#7cbae8',
  `status` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_unavailability` tinyint NOT NULL DEFAULT '0',
  `id_users_provider` int DEFAULT NULL,
  `id_users_customer` int DEFAULT NULL,
  `id_services` int DEFAULT NULL,
  `id_google_calendar` text COLLATE utf8mb4_unicode_ci,
  `id_caldav_calendar` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_blocked_periods`
--

CREATE TABLE `ea_blocked_periods` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

CREATE TABLE `ea_consents` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `first_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

CREATE TABLE `ea_roles` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint DEFAULT NULL,
  `appointments` int DEFAULT NULL,
  `customers` int DEFAULT NULL,
  `services` int DEFAULT NULL,
  `users` int DEFAULT NULL,
  `system_settings` int DEFAULT NULL,
  `user_settings` int DEFAULT NULL,
  `webhooks` int DEFAULT NULL,
  `blocked_periods` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `create_datetime`, `update_datetime`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`, `webhooks`, `blocked_periods`) VALUES
(1, NULL, NULL, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15, 15, 15),
(2, NULL, NULL, 'Provider', 'provider', 0, 15, 15, 0, 0, 0, 15, 0, 0),
(3, NULL, NULL, 'Customer', 'customer', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, NULL, NULL, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int NOT NULL,
  `id_users_provider` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ea_secretaries_providers`
--

INSERT INTO `ea_secretaries_providers` (`id_users_secretary`, `id_users_provider`) VALUES
(15, 12),
(16, 12),
(15, 13),
(16, 13),
(15, 14),
(16, 14);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

CREATE TABLE `ea_services` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT '#7cbae8',
  `location` text COLLATE utf8mb4_unicode_ci,
  `availabilities_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'flexible',
  `attendants_number` int DEFAULT '1',
  `is_private` tinyint DEFAULT '0',
  `id_service_categories` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `create_datetime`, `update_datetime`, `name`, `duration`, `price`, `currency`, `description`, `color`, `location`, `availabilities_type`, `attendants_number`, `is_private`, `id_service_categories`) VALUES
(2, '2024-09-11 10:40:38', '2024-09-11 19:23:05', 'Consultation', 15, 0.00, '', '', '#f3bc7d', '', 'flexible', 1, 0, NULL),
(3, '2024-09-17 08:27:07', '2024-09-17 08:27:07', 'Medical', 30, NULL, NULL, '', '#7cbae8', NULL, 'flexible', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

CREATE TABLE `ea_services_providers` (
  `id_users` int NOT NULL,
  `id_services` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`) VALUES
(12, 2),
(14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

CREATE TABLE `ea_service_categories` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

CREATE TABLE `ea_settings` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `create_datetime`, `update_datetime`, `name`, `value`) VALUES
(1, NULL, '2024-09-11 18:58:58', 'company_working_plan', '{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":null}'),
(2, NULL, '2024-09-11 18:58:58', 'book_advance_timeout', '20'),
(3, NULL, NULL, 'google_analytics_code', ''),
(4, NULL, '2024-09-11 18:43:48', 'customer_notifications', '0'),
(5, NULL, '2024-09-11 19:10:56', 'date_format', 'DMY'),
(6, NULL, '2024-09-11 18:43:48', 'require_captcha', '0'),
(7, NULL, '2024-09-11 19:10:56', 'time_format', 'regular'),
(8, NULL, NULL, 'display_cookie_notice', '0'),
(9, NULL, NULL, 'cookie_notice_content', 'Cookie notice content.'),
(10, NULL, NULL, 'display_terms_and_conditions', '0'),
(11, NULL, NULL, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, NULL, NULL, 'display_privacy_policy', '0'),
(13, NULL, NULL, 'privacy_policy_content', 'Privacy policy content.'),
(14, NULL, '2024-09-11 19:10:56', 'first_weekday', 'monday'),
(16, NULL, NULL, 'api_token', ''),
(17, NULL, '2024-09-11 18:43:48', 'display_any_provider', '1'),
(18, NULL, '2024-09-11 18:43:48', 'display_first_name', '1'),
(19, NULL, '2024-09-11 18:43:48', 'require_first_name', '1'),
(20, NULL, '2024-09-11 18:43:48', 'display_last_name', '1'),
(21, NULL, '2024-09-11 18:43:48', 'require_last_name', '1'),
(22, NULL, '2024-09-11 18:43:48', 'display_email', '0'),
(23, NULL, '2024-09-11 18:43:48', 'require_email', '0'),
(24, NULL, '2024-09-11 18:43:48', 'display_phone_number', '1'),
(25, NULL, '2024-09-11 18:43:48', 'require_phone_number', '1'),
(26, NULL, '2024-09-11 18:43:48', 'display_address', '1'),
(27, NULL, '2024-09-11 18:43:48', 'require_address', '0'),
(28, NULL, '2024-09-11 18:43:48', 'display_city', '0'),
(29, NULL, '2024-09-11 18:43:48', 'require_city', '0'),
(30, NULL, '2024-09-11 18:43:48', 'display_zip_code', '0'),
(31, NULL, '2024-09-11 18:43:48', 'require_zip_code', '0'),
(32, NULL, '2024-09-11 18:43:48', 'display_notes', '1'),
(33, NULL, '2024-09-11 18:43:48', 'require_notes', '0'),
(34, NULL, NULL, 'matomo_analytics_url', ''),
(35, NULL, '2024-09-11 18:43:48', 'display_delete_personal_information', '0'),
(36, NULL, '2024-09-11 18:43:48', 'disable_booking', '0'),
(37, NULL, '2024-09-11 18:43:48', 'disable_booking_message', '<p style=\"text-align: center;\">Thanks for stopping by!</p><p style=\"text-align: center;\">We are not accepting new appointments at the moment, please check back again later.</p>'),
(38, NULL, '2024-09-11 19:10:56', 'company_logo', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARAAAAC6CAMAAABRJOIbAAAA21BMVEX////uAAAAAADsAADo6OhkZGT39/fwAADZ2dnLy8t0dHTAwMDf39/w8PD7+/v09PSrq6uDg4OcnJyNjY2mpqbHx8dubm65ubnr6+vU1NTPz8+Tk5NRUVF/f38tLS1CQkIQEBBZWVkjIyM7OzuysrIpKSlAQEBXV1dxcXEYGBj1zs765eb68PBJSUk0NDQXFxf1xMTrTk3sPj/ub3DxeXnvi4zxra/yubr44OHqMjTsFxfymZn1wMHsWVvtRUfsJib0p6fwlJbtXV/rZmbrLC3wgYHqcXTvJyn01NPcfPEIAAAR+UlEQVR4nO1cCVviPBBOG6Ac5b4vD0RdAV1FRQVdcRXX//+Lvswk6ZUWqt8i4vbdZ7VNk5qZzEwmk0kJiRAhQoQIESJEiBAhQoQIESJEiBAhQoQIG8NwtOkefCmcX2h0HLFEYnRBNU0z6HDTHfkiOAd2aBo1fm26J18DE2ogRwxq3G+6L18BQj4Qj5vuzBdAjtoMoXSw6e5sHjPNicWmu7N5TA2bHQYdb7o7G8fQoTGaob1suj8bx8SpMNS43HR/No4Lw8WR6033Z9MYaW78847IiLoZkth0hzYNj4QsNSGjwf3l5Xdf7jAJsWSELlvd3c5hAWjQh0/s3EZwaTgc1bl/ncT9wubad48RDG1+GL6jP5xcMNmxK337idl23S/Uh29Pd55pSPv2IYKcFBHqfTJYUC83oNpkE738TLxNwWfXfrtL7y81LDa8TKE+gvTNMHx6uqYXObsgd//M5h6FFcGa9Q1hsyN380wNw58XiNkGu/n5OL/UAgRDKIxGrzbdx8/D24JieFVlCZQaEFF7nrxtupefhdHscYlgGIxLD/PbTXfy83B/QWmQsoBo/Jp5o63feRk4vA6SDAN05XFx7qX+djYO8vO3H0w4gmZYZjt+T5QF3+CaMnEyjG8ZoR89BfACQq0v1yrN56/gonDhyfm8cLvxBpOsr39uaD6ikbu/5LONqPPd9ixuxlT1zZHi6dW5Unt082AgGxxh+u8ULUrMpgFWY/qkuhqjyYWf8/p9fLThwhZ9h5oYdDxTfY3hfEzBEVFY8m2syNtvn2mF6cLdXNWB4ewu0Jenxs0Gev/XcX6hSgYb/8cnH9l4ulMEydX0t8/7twz36oCDV/Gq2o3hXImWqTqzAQr+KiZ//Kj6NVFsQWJyodb0wXbPM5OpYkg1bfqkEnX/W7WgvtjqiPNkqi7s6aXqi75dwZSyNCoiGl9v85bEzdQQPrcQDXbrpyrzFx5KXcELTfuz1cHm+xfvAo7Sax/9f13FCdn6QnVltwiDscurAt48+G/zv72sUBWMp9HLrY4U3brnC7ZKnS5R/qfV4rHVpoOMXqkhtQWNpfFreQ7IfWDkDBJZtUfV7og/dH69BavfnCvcAWpztVLaZ4EMYcz0NR2jwewZ23z5HYp774p25pX2W5+54safIQb97RNxv725ekFmQaPpWqj4e1g4TCnr8ItC/ODCNzF14scPqshWbjB7cDlwVPvSUcXcwpmBqqnSfn7HbIqvDpwrDpy2cMsWsxhjNE3UXWtNtPwVXFM+fGgkx8rYTf7gA/+27tQz6p5YEueLO034bm7OGV87zfWWUzN70H6p7ND4Hl1QzOvWQSmdOXZ+357GEGUM8t++9owMuTBT5o8q7Jhbwh643TTgHDGoY/9lNOGTSfBC54sfHjjXHn1MRG5GDWkLn4Mbv2GO3XQu7wfXd3SlY298bY9+8KwKQIJ5JrhTi1gWAnxj7BDz0ujmmeJycNUa2N9Gf2HkPJuWS1V+Psdfw3m4WBFKyHblBoyuPZGO1ZnttzNwu8KFiyjDNm2BIzvcFKwKAL49hogTSeGAf1sUQRtdUSVTavVpoefw/KDjayVJ4OtitPCT8BC7KlerRQTSR6ZXN1/bA3FjdOVjBAz6J0zb8Sp+UPrgs7/1lYHK4jfQoRbrw2UiwibmxfmWbWcmFgEzRNiD7T7KJl9w57MR/MWRuPZNKkSoK1Nfv3to+6dWEjhsi/+ab5PVEHhaloKr+FAj6jtrzvg5ePhHJVvGW2Y2OOZLtN/vVMOM+nJk9Px6tVgsnmazOWIyudlGbuBGXTCoNvc2yMH+1JLV3nbjfnkeA+OI4kSdo7l53URv1463u5WrD3UZwz0O35O7CQbnRUJCXjrqOe6zppllv3KJRM79DviVbzQ+a8K+fdCCM0+lgChTxEDwkKpTaVpnqLOLIlw0SFsX6JIUv9jbN9njjCzvsJtE+xCfEMJ+VojJmxJoXCEk2YH79LpZAYCdqcCzLgKGz6GXsTQuqrXtCYY04PcOIaeS8Dopy0s9RkhXXrcJqVu8abKfJqlIpu7CXd1m3LoRvM3klA9j7m03sJ96lzgx7HxGENwlOfbz8ODs7KzXIAd4CeU/UBT2eicnJ3qS9KHotJjWS6TErgjZ521JAu4SKB7FXmnt7Dh/NELFLlQv9dJ+6N1uqguGZMVvUJMsf5TnogEsO8OfLV4OUnEQg6scYcoRR2ZBHWhcQ90CHVv76vgqXDKDpikHUp1Rds0TB6zpOhvlKhOQowNgRRn1BpHB0SckDkV9ccOwY1cBeeqTJNeRPJiQAjaLrYkHTozUfWqq+YqMYjgv7UAapZ4vETFFqLKxZ9LACOmhFTgrdrvpGFrZOFRhCnEMtrcH5SmUoaZo3UTiS8hUJl5oQkBl4mtnh/plAw4fA6t8e2nk5ppLodj8UCswAtv6LiOuyA2AzqVhB8ab4RAMaU+Um8CaA9m8hExkemPuQyWcdwh7n75+A0KITzru45NPiFjxNV7dz12BAdb5AqOKMSPVhjGu2nNrVtgCtB4Nm1E9YJzAKRgN0BtgzWkT7giqIbZcMy4cKoOZ+ovbtwvVZVWckIH7ueGSINb3GKOlw0ziEVgBZkIOG7EY+FzM3J5AlTT8BhMSY2igBW2L1tyEMD7sgx3ZSwuRImc4L60bM8fi1qCvA3J74bf8V3Zgvcm8rknoJxtcdMWqjLgjJEUOf5f7VnUkumb7FQ4XIyVNSEXMNMKalrjurBm3nHgwCA/Mmxj+xjuFIXNPs3tFhBw6Y4L9K+OcyYgro5pUTIYkNx2xJjw8RXK7MXiQQ2vSzudimRawcg/1xhS+iE4yFTOXPAQzvH7ccQmZQmLM8DJoo827hlCOYzoXvRUQ8iLOEGWYfC3//FA4JsLBMK0bwt1SHaeaIxQiboKxOM1XAjr3W9eNCbDgAfwICCwHeCXeoIeSH0OdOez7MLhd9CuYsuRs/7xsued6OudgAsynkmb03OogWlCa5GyQjT6BH0xEHjFranS9ZGPa44Tk1BrUwZB0mvW8X6ulmPuVZsaj+CONqCVJoQYX7QK6rRVZXoW7ZrfTiXfrxKyla1lSr/FSVp/dZYqdo1PmrXweYH/ff0mDTPLUnruTY5gjR6fzLQulL8cseHnHnLSF10udemoY061O2lYwCVruYprgTBn6J48A3X2vT5ndvwQJB+OHX8puznDWoHbylVkqt+ucffkMA1412UUSLjIZfJZpl0tJ2SJfz3DECP9dlY8a/Xa5wh1TM5VK4VUrVSWxlIRJqpmMSfJVWUBy4hLcFkcxc48L5XIhG44dg3FQqIwV+yeoX9lzs0Gf7a2JuLVeEf5DHq4OuMuBEy5ftzmmz76cZ5LWcucAuGZ2xPQDN7viDRgX+WFN1XUeOyjI+46MxeFs5CiW4bowRm74EHysg8qU3cSlaz/mzSEdVw7/VATFcN3BZ9esoAKZVIdgj/Q85EI+bjkiFjHgp1vzMXpi8g1VeLn1RM/3kciavK/YcUo26zuKS/ziLAQ/ZkGhIUrvbuxK7o8YWHvZ7tNALfY3u6bZBhFlDnuP+ZVJTgV2EJyROnRzrx9rdWWjPbY8KTBgYPG0XgcPtoRyc1DPIFuSglVNAlX6pFIosEbxfqEA3Dy2X1FpgEfXrddrKDgwNH0shqVRpxXrV0Lxw09bWKGdkY2J/dSRCHbOz3u4Mi8BPOzHwfqU6oCPSkQElXXmBALGOjhnNkzdWsAe8CUcK0hldeGCFVBe+LiX0MlD66DzNxMsNXXOeD4M8Dbw5XKO4qYeepXsnwhmOBTh7UJKzPXkhjOAZyOr82zG7kIKhi7OLQWjYgecziw47mBaDhxtChYTE7zXIGbAzh4W4hoIVHEHVr5ZUQzqmBfcbKJ2EevPwmUbKttvRgaGDKS8qqt8xg6HIiykt4antOng9ukSPBaHPjmwJ+mAqyysZUpI0w5QwE0IEuwQEWlCGjxC2AQyqsCbjEVKHwQB9A6qoNx0BVM5K+QrWiiMBy0IwLD3yeI+4YuCcCIyV6KHBp05ori3HmZN8fA6ffF3O0A047LHlUoHl/xABdDV6HIq01LeEbpl7iCwCJcnKUsCOPtiEGIGZYgVxeTUEzyN25FotK6gdTgH7cbsYtz1YgP0M5Qf7cpsAXti59wizr3cgp/jQC+swIltWra+hoT2gYT6mQi7MwX4KRuAtneOjzvcPtT3OUOLlqRBxBXGvQBxR3gD7FpBlC0luMk3szr7+8ddLk/mHlePpCjmUVioVCRh4Ex+MtSzIJ6oGLBj6dkqTlHPYsiuMIRptAI8ph6T9BDi0H+wFg3BibiIqSEdFRj3GDDpwGFCEoJm02lCMJx/xvXKUUzU22A4wzw+ijD0skM9ICGBihYHBwr63qpWW6ABMGo/pVdSxE/BgYWQbtm+FUjPQL0+F/Efwjo3esCCPLKHR1Rwtk4jo4m9mSVj8RjOT3Nu2sWoKv2wDCG/JK0XvqQ6F3EGVQ9I2CietQvgAJSSuthOKAtD2BX7mUyb9FqptKNzyQfoMloKZucHmoyq8F5L6JIw2cig5uXxDWhq90Tw9ViakE6RIZ3g4fwSN0A67AEydBNVvVgR8bkw4JtN9CEgvfrSdtyWSAfgQGhJ/lBGgsHa54UhxD3shHRTa6JN0rb+J2BqQG+AVlvnTGGExPuBkdZeH+qTZa/2RDi/ikxNWm+wdpKr3h4HgPld2nNgHtwAJ134ZM5ydqBPxHAW+6HLKaIibBxQASGzHblwscJebUuQYygMhJsdkhULGZxLetwbK+oiwiwdjBbSbznrNdRLLoxlZ7F4Vz8kP9hMogQ7nPjFlWW8+sRCMlOqswFtJpNinZJNJpN59l9es+JEq1+p2ovOWDIpBETUM0V1EquX+mIbL5lsOt5gN8piXXbHkSUN/iAJv0y7mMSqlX4rNDtWAWPyAX7Hv4mB4fFN/nlsYWZphAgRIkSIECFChAgRIkSIECFChAgRIrwPhU/K+d0WtEqksbrWP4SCftgLt/3/SWiurhKM3KqM7qx3W07NF+qXk5tOtK47dstq+//nTadL86FaJJ3KuIv6SjJIIks+M0/eFwd6R6YxxeAM0YdRdKXpKdhNubLWAD91/TTpKat/xgHGpcCcBn5pigSYjyG9/DDmrsou2A/3HADP6f9LSP8GcM+dn6JLhksiDkA5bGqHhYauJNlVZJZWqPaBJ/v+z9y9gxzBZNmkdar7IygpKrESJ7p3u78fNoMIUOApSoiM8/C0+X/oIIWfushtaYU7kx2QaVy3k/TC4lj3Tmup9zBk1zr9md9xyVotzBG3bPfoKICUSjaNklrRlRHzgSnTqzhyLUFU9f0K15b5QpW4MGOx95yTh1QfPintuq1RKYS/K1KHgvLI05C6sxvq8GDHdQa1bHWlKVOSAlH1/vU+ZqPlMI9oj+fbvOsMdPaEKw1PebI5aYY4JlsqFzFpaa/iP4w7+2DQ3IMf8CbdIej4Tiu/ezktpjIcKT1J8tZnSkRGmnciXoYst3pHeRAt1nfZ/ZBszfOjGN2Uz6cs6icZXe8vdyUEdmzCinolnxF/PLEqYa6oPE/iMepyhp8LQb4ehtFaGwWoXtf7WbMH6aRyzo6HTZoXmW0+qW2QTteOhVprVqy/xnhQtoYitypjrqswxGQSi95r4lAm+R2HlZDyPkO8A+8UZ5CKjMFxjp5+Eg+BfSmc6udwGviVkJi+F+I1pxbhPKtyZ7eDInOo7yxrVuvpuqfoTNeP0zV28eNIJkV2VxkiiSNb0fDQdZ0Nk3XY+FgPh7O+2Sy0ax3v38Rs5p284zj3ckgbktjl93tol3ZXtNpf/pjrYTusYyabAS2pdLpCGGusg3CQT7saZxn/V1eRElhn5cK8RndOr1km6yeHnEGd5Y3OlnNsj7+wEPbTIzEOK3zS1e3CPMnHVsM/8hJDI39a4q6daZrvelNjbz9jiVt2eau81d+gx9iDDy4e2np3daUQMAv9TOrjXz+Jv2eOXCfin/INl5V435eoQlrLDwCM6aZisZUPB9X21zGGuVSmUITF2HtX2n8L1fDHFTyAcwXr+LZZq3jKDHaIo61rwo+PGq9cXN94dHAt+HgcetPR4wgRIkSIECFChAgRIkSIECFChAgRIkT4N/Af39NBOWf+yOsAAAAASUVORK5CYII='),
(39, NULL, '2024-09-11 18:09:12', 'company_color', '#ed0000'),
(40, NULL, '2024-09-11 18:43:48', 'display_login_button', '1'),
(41, NULL, '2024-09-11 18:09:12', 'theme', 'default'),
(42, '2024-09-11 09:12:12', '2024-09-11 18:43:48', 'limit_customer_access', '0'),
(43, NULL, '2024-09-11 18:58:58', 'future_booking_limit', '90'),
(44, NULL, '2024-09-11 18:58:58', 'appointment_status_options', '[\"Booked\",\"Ongoing\",\"Follow Up\",\"Completed\",\"Cancelled\"]'),
(45, NULL, '2024-09-11 18:43:48', 'display_custom_field_1', '1'),
(46, NULL, '2024-09-11 18:43:48', 'require_custom_field_1', '1'),
(47, NULL, '2024-09-11 18:43:48', 'label_custom_field_1', 'Age'),
(48, NULL, '2024-09-11 18:43:48', 'display_custom_field_2', '1'),
(49, NULL, '2024-09-11 18:43:48', 'require_custom_field_2', '1'),
(50, NULL, '2024-09-11 18:43:48', 'label_custom_field_2', 'File Number'),
(51, NULL, '2024-09-11 18:43:48', 'display_custom_field_3', '1'),
(52, NULL, '2024-09-11 18:43:48', 'require_custom_field_3', '1'),
(53, NULL, '2024-09-11 18:43:48', 'label_custom_field_3', 'Nationality'),
(54, NULL, '2024-09-11 18:43:48', 'display_custom_field_4', '0'),
(55, NULL, '2024-09-11 18:43:48', 'require_custom_field_4', '0'),
(56, NULL, '2024-09-11 18:43:48', 'label_custom_field_4', ''),
(57, NULL, '2024-09-11 18:43:48', 'display_custom_field_5', '0'),
(58, NULL, '2024-09-11 18:43:48', 'require_custom_field_5', '0'),
(59, NULL, '2024-09-11 18:43:48', 'label_custom_field_5', ''),
(60, NULL, NULL, 'matomo_analytics_site_id', '1'),
(61, NULL, '2024-09-11 19:10:56', 'default_language', 'english'),
(62, NULL, '2024-09-11 19:10:56', 'default_timezone', 'Asia/Beirut'),
(63, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_is_active', '0'),
(64, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_host', ''),
(65, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_port', ''),
(66, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_user_dn', ''),
(67, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_password', ''),
(68, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_base_dn', ''),
(69, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_filter', '(&(objectClass=*)(|(cn={{KEYWORD}})(sn={{KEYWORD}})(mail={{KEYWORD}})(givenName={{KEYWORD}})(uid={{KEYWORD}})))'),
(70, '2024-09-11 09:12:13', '2024-09-11 09:12:13', 'ldap_field_mapping', '{\n    \"first_name\": \"givenname\",\n    \"last_name\": \"sn\",\n    \"email\": \"mail\",\n    \"phone_number\": \"telephonenumber\",\n    \"username\": \"cn\"\n}'),
(71, '2024-09-11 09:12:14', '2024-09-11 19:08:27', 'company_name', 'Doctors Without Borders'),
(72, '2024-09-11 09:12:14', '2024-09-11 19:08:27', 'company_email', 'maythamghaly@gmail.com'),
(73, '2024-09-11 09:12:14', '2024-09-11 19:08:27', 'company_link', 'maythamghaly.com');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

CREATE TABLE `ea_users` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `first_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `timezone` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Asia/Beirut',
  `language` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT 'english',
  `custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `custom_field_5` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint DEFAULT '0',
  `ldap_dn` text COLLATE utf8mb4_unicode_ci,
  `id_roles` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `create_datetime`, `update_datetime`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `timezone`, `language`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `is_private`, `ldap_dn`, `id_roles`) VALUES
(1, '2024-09-11 09:12:14', '2024-09-13 09:05:26', 'maytham', 'ghaly', '', NULL, '71505680', '', '', '', '', '', 'Asia/Beirut', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1),
(12, '2024-09-13 08:28:49', '2024-09-13 09:58:57', 'dr', 'dr', '', NULL, '123456789', '', '', '', '', '', 'Asia/Beirut', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2),
(13, '2024-09-13 08:31:11', '2024-09-13 08:31:11', 'dr', '2', '', NULL, '123456', '', '', '', '', '', 'Asia/Beirut', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2),
(14, '2024-09-13 08:37:25', '2024-09-13 08:37:25', 'dr', '3', '', NULL, '123456789', '', '', '', '', '', 'Asia/Beirut', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 2),
(15, '2024-09-13 08:44:17', '2024-09-13 08:44:17', 'user', '1', '', NULL, '123456789', '', '', '', '', '', 'Asia/Beirut', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 4),
(16, '2024-09-13 08:54:13', '2024-09-13 08:54:13', 'user', '2', '', NULL, '1231123', '', '', '', '', '', 'Asia/Beirut', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 4),
(17, '2024-09-13 09:00:51', '2024-09-17 08:34:43', 'admin', 'admin', '', NULL, '123456', '', '', '', '', '', 'Asia/Beirut', 'english', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

CREATE TABLE `ea_user_settings` (
  `id_users` int NOT NULL,
  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_plan` text COLLATE utf8mb4_unicode_ci,
  `working_plan_exceptions` text COLLATE utf8mb4_unicode_ci,
  `notifications` tinyint DEFAULT NULL,
  `google_sync` tinyint DEFAULT NULL,
  `google_token` text COLLATE utf8mb4_unicode_ci,
  `google_calendar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caldav_sync` tinyint DEFAULT '0',
  `caldav_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caldav_username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caldav_password` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sync_past_days` int DEFAULT '30',
  `sync_future_days` int DEFAULT '90',
  `calendar_view` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `working_plan_exceptions`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `caldav_sync`, `caldav_url`, `caldav_username`, `caldav_password`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'maythamghaly', 'c4f3d2f6ff237416975820343057585f1896edf4a60a565cf60066167a144f10', '2f91c389569f28b1d9dbac3e7bb3a1944e63c3493b078e6f29c7461f639ddb12', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(12, 'drdr', '1d81138755e215d2733ab61c78f6e2d299fdf9ce7d7614606b9031047f66ca89', 'aa26f2318e0eb5ccf7af5ec33baaab8901aecfba4e12aec2e6bf019eeac69c8e', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":null,\"sunday\":null}', '{}', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(13, 'dr2', 'ccdc4c1e323b62b258acc690374bd691205b246ba116682a65e295dd3c4ca4bf', 'b46c74904126220b0336af5039f0f16e2d303be0e44caea989ac935cf8b29ba3', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":null,\"sunday\":null}', '{}', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(14, 'dr3', '44f37f604d0bd3d5a1730d459ec73eb328147fc6fadd029c4e6c60c0ee9c2db1', 'de50e53bb85507037632807e39b3cfd5c5488d5f1b331e49ce6f41ea98cb32fc', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":null,\"sunday\":null}', '{}', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(15, 'user1', 'fc81bbfe3aeaeb3209b5a7d4fff9f1d42cec9a2bceb271e7d107ee2525274d2d', '2d1c689865a1564e9a414b504f956eafd973c4bb554f24adabee488b2e45337a', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(16, 'user2', '2cf0f79cd6c095accf5f80d723dd1c3e61e659a0f785a1090486d63423fc5420', 'b6a301c5a69447181615a31863747bf898d05c3326321b1916784fd6eeb678d6', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(17, 'admin', '426825886493ad609734d0d1c6ab18a36e08fd22cf8921298f45dd6290ce4a23', '19274a1f6fc9a2f7bdcaafa97ddac034c9193884fdf8986127f78b42623abbde', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `ea_webhooks`
--

CREATE TABLE `ea_webhooks` (
  `id` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `actions` text COLLATE utf8mb4_unicode_ci,
  `secret_token` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ssl_verified` tinyint NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_provider` (`id_users_provider`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_blocked_periods`
--
ALTER TABLE `ea_blocked_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  ADD KEY `secretaries_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);

--
-- Indexes for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id_users`,`id_services`),
  ADD KEY `services_providers_services` (`id_services`);

--
-- Indexes for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indexes for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `ea_webhooks`
--
ALTER TABLE `ea_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ea_blocked_periods`
--
ALTER TABLE `ea_blocked_periods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `ea_users`
--
ALTER TABLE `ea_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ea_webhooks`
--
ALTER TABLE `ea_webhooks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

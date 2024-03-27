-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2024 at 08:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing_vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT '2024-02-11 11:44:49',
  `status` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `client_id`, `title`, `description`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(3, 3, 'Meeting', 'Discuss project details', '2024-03-02 17:17:03', '2024-02-12 12:06:18', 1, '2024-02-12 10:06:18', '2024-03-02 11:17:03'),
(4, 1, 'Meeting 1', 'Discuss project details', '2024-02-12 10:10:14', '2024-02-12 12:10:14', 1, '2024-02-12 10:10:14', '2024-02-12 10:10:14'),
(5, 1, 'Meeting 1', 'Discuss project details', '2024-02-12 10:10:41', '2024-02-12 12:10:41', 1, '2024-02-12 10:10:41', '2024-02-12 10:10:41'),
(6, 1, 'Meeting 1', 'Discuss project details', '2024-02-12 10:12:06', '2024-02-12 12:12:06', 1, '2024-02-12 10:12:06', '2024-02-12 10:12:06'),
(7, 1, 'Meeting 1', 'Discuss project details', '2024-02-12 10:12:24', '2024-02-12 12:12:24', 1, '2024-02-12 10:12:24', '2024-02-12 10:12:24'),
(8, 1, 'Meeting 1', 'Discuss project details', '2024-02-12 10:13:20', '2024-02-12 12:13:20', 1, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(10, 26, 'Non exercitationem magnam nostrum itaque excepturi ea voluptas.', 'Eveniet qui eum et quos assumenda repudiandae. Ut quibusdam rerum totam eaque et praesentium explicabo dolor. Id libero voluptas atque.', '2024-08-23 12:45:27', '2024-08-23 14:45:27', 1, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(11, 27, 'Ab cupiditate aut et vitae.', 'Qui harum nemo non explicabo esse maiores dicta corporis. Impedit placeat placeat itaque. Aliquam est sint maxime natus dolores. Voluptate praesentium facilis dolorem natus qui non.', '2023-02-24 07:54:17', '2023-02-24 09:54:17', 2, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(13, 29, 'Excepturi ea non quisquam.', 'Provident debitis possimus tempore rerum soluta est itaque. Excepturi debitis et autem ullam ipsum enim provident. Rerum laborum vero sapiente reprehenderit eum quidem et accusamus.', '2023-04-30 13:36:54', '2023-04-30 15:36:54', 3, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(14, 30, 'Qui quo id harum laboriosam ab iusto.', 'Nesciunt ea sit aliquam laudantium. Dolores non labore architecto aut numquam esse. Corrupti optio corrupti sint architecto ipsam.', '2023-11-04 13:38:29', '2023-11-04 15:38:29', 1, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(15, 31, 'Enim voluptas minima consequatur doloribus praesentium molestiae.', 'Modi sed ut est tempora debitis. Velit libero nihil sit earum explicabo nihil.', '2023-12-23 05:43:27', '2023-12-23 07:43:27', 3, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(16, 32, 'Et ex sed corrupti rerum.', 'Pariatur doloribus nesciunt asperiores ut nesciunt. Et adipisci voluptatem porro eligendi sunt. Cumque earum at inventore voluptatibus rem iusto molestiae facilis. Totam laboriosam animi temporibus vero. Aut tempora recusandae aliquam quam et rerum.', '2023-12-02 07:31:15', '2023-12-02 09:31:15', 1, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(17, 33, 'Nostrum eos autem consequatur eveniet nesciunt.', 'Eaque quae quia suscipit omnis est hic. Enim odit mollitia optio autem praesentium quo. Minima aut perspiciatis accusantium culpa ipsum sequi beatae. Eum quidem et rerum possimus sunt et vitae.', '2024-11-25 16:32:37', '2024-11-25 18:32:37', 3, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(18, 34, 'Rem similique et eveniet numquam.', 'Explicabo sed molestias fuga odio nihil dolor temporibus. Minus quae nihil quam non iure minus. Ipsam odio voluptates possimus possimus ea maxime nostrum. Qui minus accusamus a et ut dolore.', '2023-07-18 16:47:06', '2023-07-18 18:47:06', 3, '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(19, 1, 'Dicta architecto sol', 'Ullam aut maxime et', '2024-02-17 11:01:58', '2024-02-17 11:01:58', 1, '2024-02-17 11:01:58', '2024-02-17 11:01:58'),
(20, 1, 'sabir', 'Ullam aut maxime et', '2024-02-17 11:02:28', '2024-02-17 11:02:28', 1, '2024-02-17 11:02:28', '2024-02-17 11:02:28'),
(21, 1, 'Velit cupidatat debi', 'Consequatur archite', '2024-02-17 11:09:20', '2024-02-17 11:09:20', 1, '2024-02-17 11:09:20', '2024-02-17 11:09:20'),
(26, 3, 'Adipisicing aute sed', 'Illo consequatur aut', '2024-03-02 17:25:15', '2024-02-26 06:00:00', 1, '2024-02-18 10:54:58', '2024-03-02 11:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `first_name`, `last_name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Kamal', 'Hasan', 'kalam@gmail.com', NULL, NULL),
(2, 'John', 'Doe', 'john.doe@example.com', '2024-02-12 09:45:00', '2024-02-12 09:45:00'),
(3, 'Thad', 'Ondricka', 'iheathcote@example.org', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(4, 'Britney', 'Hermiston', 'barrett.hegmann@example.net', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(5, 'Vladimir', 'Hermann', 'lambert41@example.net', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(6, 'Aniya', 'Cummings', 'natalia.schimmel@example.org', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(7, 'Willie', 'Mayer', 'margarita.leffler@example.org', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(8, 'Miles', 'Flatley', 'evert80@example.net', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(9, 'Zola', 'Lang', 'barton.marisol@example.com', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(10, 'Susan', 'Jacobi', 'bechtelar.chanel@example.org', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(11, 'Kory', 'Quigley', 'ernestine69@example.com', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(12, 'Ned', 'Erdman', 'xrogahn@example.org', '2024-02-12 09:45:01', '2024-02-12 09:45:01'),
(13, 'John', 'Doe', 'john.doe@example.com', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(14, 'Kiel', 'Terry', 'stefanie56@example.com', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(15, 'Dannie', 'Christiansen', 'stanley.zulauf@example.org', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(16, 'Arno', 'Jacobi', 'alvina66@example.net', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(17, 'Bettie', 'Bauch', 'maeve.berge@example.org', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(18, 'Tanner', 'Erdman', 'blanda.itzel@example.org', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(19, 'Omari', 'Beier', 'kub.itzel@example.com', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(20, 'Flossie', 'Toy', 'candida.raynor@example.org', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(21, 'Pinkie', 'Orn', 'grodriguez@example.net', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(22, 'Anthony', 'Barrows', 'horacio.langosh@example.com', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(23, 'Sam', 'Ratke', 'chandler.bins@example.com', '2024-02-12 09:45:28', '2024-02-12 09:45:28'),
(24, 'Fernando', 'Will', 'mtrantow@example.org', '2024-02-12 09:58:19', '2024-02-12 09:58:19'),
(25, 'Kaleigh', 'Zemlak', 'quentin46@example.org', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(26, 'Pasquale', 'Hane', 'libby.green@example.org', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(27, 'Chaz', 'Kuvalis', 'johnson.amira@example.com', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(28, 'Kailey', 'Dickinson', 'luther.pacocha@example.org', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(29, 'Angelica', 'Murazik', 'farrell.rickie@example.org', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(30, 'Richie', 'Von', 'jarrod.kihn@example.com', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(31, 'Heloise', 'Thiel', 'joelle01@example.net', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(32, 'Anna', 'Bradtke', 'emmy05@example.org', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(33, 'Simeon', 'Muller', 'senger.reyna@example.com', '2024-02-12 10:13:20', '2024-02-12 10:13:20'),
(34, 'Reba', 'Ledner', 'domenic.hickle@example.net', '2024-02-12 10:13:20', '2024-02-12 10:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_30_172838_add_role_field_to_users_table', 1),
(6, '2024_02_11_172533_create_clients_table', 2),
(7, '2024_02_11_172619_create_appointments_table', 3),
(8, '2014_10_12_200000_add_two_factor_columns_to_users_table', 4),
(9, '2024_03_15_105622_create_settings_table', 5),
(10, '2024_03_25_125604_add_avatar_field_to_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(4, 'app_name', 'Himel Portfolio', '2024-03-18 07:16:38', '2024-03-18 07:16:38'),
(5, 'date_format', 'm/d/Y', '2024-03-18 07:16:38', '2024-03-18 07:17:08'),
(6, 'pagination_limit', '5', '2024-03-18 07:16:38', '2024-03-18 07:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 2,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`, `role`, `avatar`) VALUES
(34, 'Emmy Raynor', 'antonette.rosenbaum@example.com', '2024-02-09 13:46:22', '$2y$12$1RFfCwq7zEITHqgcHywnDubqQq2oKRrPOU.IaQd4Cx3xRgTLmD8.G', NULL, NULL, NULL, 'vv3UC4i2RC', '2024-02-09 13:46:22', '2024-02-09 13:46:22', 2, NULL),
(35, 'Enola Monahan', 'adolfo95@example.com', '2024-02-09 13:46:22', '$2y$12$1RFfCwq7zEITHqgcHywnDubqQq2oKRrPOU.IaQd4Cx3xRgTLmD8.G', NULL, NULL, NULL, 'NivzcssTfd', '2024-02-09 13:46:22', '2024-02-09 13:46:22', 2, NULL),
(37, 'Richard Labadie', 'nova.bartell@example.org', '2024-02-09 13:46:22', '$2y$12$1RFfCwq7zEITHqgcHywnDubqQq2oKRrPOU.IaQd4Cx3xRgTLmD8.G', NULL, NULL, NULL, 'IAWmb7SHNc', '2024-02-09 13:46:22', '2024-02-09 13:46:22', 2, NULL),
(39, 'Bannah', 'bannah@gmail.com', NULL, '$2y$12$ameKBtyPsennJlSc6lH7yusVu2.z.zKuzBh9.jkhaJR9WY9mK1Om.', NULL, NULL, NULL, NULL, '2024-02-09 13:46:45', '2024-02-17 08:58:17', 2, NULL),
(43, 'Rongila', 'rongila@gmail.com', NULL, '$2y$12$UxWbMxEftVO//GAMguWnRu3d3qmbUE.j722LbhLHTWI9L91q.44P6', NULL, NULL, NULL, NULL, '2024-02-17 08:45:37', '2024-02-17 08:45:37', 2, NULL),
(44, 'Romesh', 'romesh@gmail.com', NULL, '$2y$12$BV2bDwYbGfKzP8aIEMl8yOj2tjxau9inTV3ZQ5HvKMmzKcMc29rWG', NULL, NULL, NULL, NULL, '2024-03-15 04:15:28', '2024-03-27 06:52:32', 2, 'photos/e61zKpPsVSxxUunqRqcSPkuuwVGeXz765mA3TksF.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_client_id_foreign` (`client_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

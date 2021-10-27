-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 27, 2021 at 05:07 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twision-reports`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_07_122845_create_oauth_providers_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_09_30_114354_create_tasks_table', 1),
(6, '2021_09_30_115948_create_reports_table', 1),
(7, '2021_10_03_072214_create_projects_table', 1),
(8, '2021_10_20_115356_add_foreig_key_to_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_providers`
--

CREATE TABLE `oauth_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Project One', '2021-10-05 14:12:04', '2021-10-05 14:12:04'),
(2, 'Project Three', '2021-10-01 14:12:04', '2021-10-01 14:12:04'),
(3, 'Project Four', '2021-10-15 14:12:04', '2021-10-20 14:12:04'),
(3000, 'Project five', '2021-10-15 14:12:04', '2021-10-20 14:12:04'),
(3001, 'Other', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Monday Report ( 25 / 10 / 2021 )', '1', '2021-10-25 12:14:19', '2021-10-25 12:14:19');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hours` int(11) NOT NULL,
  `minutes` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `who_is_assign` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `description`, `hours`, `minutes`, `created_at`, `updated_at`, `project_id`, `who_is_assign`, `user_id`, `report_id`) VALUES
(1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 3, 3, 4, 1),
(2, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 2, 15, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 3000, 4, 3, 1),
(3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 3, 4, 1),
(4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 45, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 3001, 3, 3, 1),
(5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adip pudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 22, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 3001, 4, 3, 1),
(6, 'L adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 30, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 1, 3, 4, 1),
(7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam.', 11, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 4, 4, 1),
(8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci  . Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 15, 0, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 3001, 3, 3, 1),
(9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 2, 15, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 3001, 4, 3, 1),
(10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 45, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 1, 3, 3, 1),
(11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adip pudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 22, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 1, 4, 3, 1),
(12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci  . Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 15, 0, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 1, 3, 3, 1),
(13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 3, 3, 4, 1),
(14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 3, 4, 1),
(15, 'L adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 30, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 1, 3, 4, 1),
(16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam.', 11, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 4, 4, 1),
(17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 2, 15, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 1, 4, 3, 1),
(18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 45, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 1, 3, 3, 1),
(19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adip pudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 22, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 2, 4, 3, 1),
(20, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci  . Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 15, 0, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 2, 3, 3, 1),
(21, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 2, 15, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 3, 4, 3, 1),
(22, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 2, 15, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 3, 4, 3, 1),
(23, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 45, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 3, 3, 3, 1),
(24, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adip pudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 22, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 3, 4, 3, 1),
(25, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci  . Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 15, 0, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 2, 3, 3, 1),
(26, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 2, 15, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 2, 4, 3, 1),
(27, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci  . Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 15, 0, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 3001, 3, 3, 1),
(28, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 3, 3, 4, 1),
(29, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 3, 4, 1),
(30, 'L adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 30, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 1, 3, 4, 1),
(31, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam.', 11, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 4, 4, 1),
(32, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci  . Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 15, 0, '2021-10-15 14:14:32', '2021-10-15 14:14:32', 3001, 3, 3, 1),
(33, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-01 14:14:32', '2021-10-01 14:14:32', 3, 3, 4, 1),
(34, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 1, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 3, 4, 1),
(35, 'L adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam. Repudiandae vel, perspiciatis quisquam facere iste exercitationem!', 5, 30, '2021-10-14 14:14:32', '2021-10-14 14:14:32', 1, 3, 4, 1),
(36, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis dolor perferendis sit adipisci itaque porro delectus rem voluptatem. Beatae fugiat sint ea aperiam.', 11, 30, '2021-10-10 14:14:32', '2021-10-10 14:14:32', 2, 4, 4, 1),
(37, 'This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam This is from Islam to Islam', 1, 0, '2021-10-27 11:09:58', '2021-10-27 11:09:58', 1, 4, 3, 1),
(38, 'This is from Admin to Admin This is from Admin to Admin This is from Admin to Admin This is from Admin to Admin This is from Admin to Admin This is from Admin to Admin This is from Admin to Admin This is from Admin to Admin This is from Admin to Admin', 2, 2, '2021-10-27 11:11:27', '2021-10-27 11:11:27', 3001, 3, 4, 1),
(39, 'This is from Admin to Admin This is from Admin to Admin', 1, 1, '2021-10-27 11:12:06', '2021-10-27 11:12:06', 1, 3, 4, 1),
(40, 'Last test from islaaaaam Last test from islaaaaam Last test from islaaaaam Last test from islaaaaam Last test from islaaaaam Last test from islaaaaam', 0, 1, '2021-10-27 12:11:53', '2021-10-27 12:11:53', 3001, 3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Admin', 'admin@admin.com', '', 'admin', NULL, '$2y$10$iaJtgbnplpH6dE.Z.BabOu4IfD7c7b8luA04jjPwCV1pywaJvKelS', NULL, '2021-10-24 14:05:55', '2021-10-24 14:05:55'),
(4, 'Islam', 'islam@gmail.com', '', 'user', NULL, '$2y$10$iaJtgbnplpH6dE.Z.BabOu4IfD7c7b8luA04jjPwCV1pywaJvKelS', NULL, '2021-10-20 14:05:55', '2021-10-20 14:05:55');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_providers_user_id_foreign` (`user_id`),
  ADD KEY `oauth_providers_provider_user_id_index` (`provider_user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_who_is_assign_foreign` (`who_is_assign`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_report_id_foreign` (`report_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3003;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `tasks_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`),
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_who_is_assign_foreign` FOREIGN KEY (`who_is_assign`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

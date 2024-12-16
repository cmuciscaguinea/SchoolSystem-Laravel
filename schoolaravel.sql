/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432
 Source Host           : localhost:3306
 Source Schema         : schoolaravel

 Target Server Type    : MySQL
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 16/12/2024 23:46:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendances
-- ----------------------------
DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `attendence_date` date NOT NULL,
  `attendence_status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendances
-- ----------------------------
INSERT INTO `attendances` VALUES (1, 2, 2, 1, '2024-12-15', 1, '2024-12-15 18:22:22', '2024-12-15 18:22:22');
INSERT INTO `attendances` VALUES (2, 2, 2, 2, '2024-12-15', 0, '2024-12-15 18:22:22', '2024-12-15 18:22:22');
INSERT INTO `attendances` VALUES (3, 2, 1, 2, '2024-12-16', 1, '2024-12-16 06:40:17', '2024-12-16 06:40:17');
INSERT INTO `attendances` VALUES (4, 1, 2, 1, '2024-12-16', 0, '2024-12-16 06:40:37', '2024-12-16 06:40:37');

-- ----------------------------
-- Table structure for grade_subject
-- ----------------------------
DROP TABLE IF EXISTS `grade_subject`;
CREATE TABLE `grade_subject`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `grade_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade_subject
-- ----------------------------
INSERT INTO `grade_subject` VALUES (1, 2, 12, NULL, NULL);
INSERT INTO `grade_subject` VALUES (2, 2, 11, NULL, NULL);
INSERT INTO `grade_subject` VALUES (3, 2, 9, NULL, NULL);
INSERT INTO `grade_subject` VALUES (4, 2, 7, NULL, NULL);
INSERT INTO `grade_subject` VALUES (5, 2, 5, NULL, NULL);
INSERT INTO `grade_subject` VALUES (6, 2, 2, NULL, NULL);
INSERT INTO `grade_subject` VALUES (7, 2, 1, NULL, NULL);
INSERT INTO `grade_subject` VALUES (8, 1, 10, NULL, NULL);
INSERT INTO `grade_subject` VALUES (9, 1, 8, NULL, NULL);
INSERT INTO `grade_subject` VALUES (10, 1, 6, NULL, NULL);
INSERT INTO `grade_subject` VALUES (11, 1, 4, NULL, NULL);
INSERT INTO `grade_subject` VALUES (12, 1, 3, NULL, NULL);

-- ----------------------------
-- Table structure for grades
-- ----------------------------
DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `class_numeric` bigint UNSIGNED NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grades
-- ----------------------------
INSERT INTO `grades` VALUES (1, 2, 1, 'One', 'class one', NULL, '2024-12-16 06:04:47');
INSERT INTO `grades` VALUES (2, 1, 2, 'BSIT 4A', 'BSIT SD', '2024-12-15 18:17:42', '2024-12-16 06:04:40');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_05_14_114748_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_05_15_180937_create_students_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_05_15_181154_create_parents_table', 1);
INSERT INTO `migrations` VALUES (6, '2019_05_15_181254_create_teachers_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_05_15_181552_create_grades_table', 1);
INSERT INTO `migrations` VALUES (8, '2019_05_16_174745_create_subjects_table', 1);
INSERT INTO `migrations` VALUES (9, '2019_05_16_175620_create_grade_subject_table', 1);
INSERT INTO `migrations` VALUES (10, '2019_05_17_133226_create_attendances_table', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\User', 1);
INSERT INTO `model_has_roles` VALUES (1, 'App\\User', 9);
INSERT INTO `model_has_roles` VALUES (2, 'App\\User', 2);
INSERT INTO `model_has_roles` VALUES (2, 'App\\User', 5);
INSERT INTO `model_has_roles` VALUES (2, 'App\\User', 8);
INSERT INTO `model_has_roles` VALUES (3, 'App\\User', 3);
INSERT INTO `model_has_roles` VALUES (3, 'App\\User', 7);
INSERT INTO `model_has_roles` VALUES (4, 'App\\User', 4);
INSERT INTO `model_has_roles` VALUES (4, 'App\\User', 6);

-- ----------------------------
-- Table structure for parents
-- ----------------------------
DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `gender` enum('male','female') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `current_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parents
-- ----------------------------
INSERT INTO `parents` VALUES (1, 3, 'male', '0147854545', '46 Custer Street', '46 Custer Street', '2024-12-15 13:43:12', NULL);
INSERT INTO `parents` VALUES (2, 7, 'female', '09123456789', 'North Poblacion', 'maramag', '2024-12-16 06:06:50', '2024-12-16 06:06:50');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'Teacher', 'web', '2024-12-15 18:12:02', '2024-12-15 18:12:02');
INSERT INTO `permissions` VALUES (2, 'School Registrar', 'web', '2024-12-16 08:28:59', '2024-12-16 08:28:59');
INSERT INTO `permissions` VALUES (3, 'Staff', 'web', '2024-12-16 08:30:43', '2024-12-16 08:30:43');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (2, 5);
INSERT INTO `role_has_permissions` VALUES (3, 5);
INSERT INTO `role_has_permissions` VALUES (3, 6);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', 'web', '2024-12-15 13:43:12', '2024-12-15 13:43:12');
INSERT INTO `roles` VALUES (2, 'Teacher', 'web', '2024-12-15 13:43:12', '2024-12-15 13:43:12');
INSERT INTO `roles` VALUES (3, 'Parent', 'web', '2024-12-15 13:43:12', '2024-12-15 13:43:12');
INSERT INTO `roles` VALUES (4, 'Student', 'web', '2024-12-15 13:43:12', '2024-12-15 13:43:12');
INSERT INTO `roles` VALUES (5, 'School Registrar', 'web', '2024-12-16 08:28:39', '2024-12-16 08:28:39');
INSERT INTO `roles` VALUES (6, 'STaff', 'web', '2024-12-16 08:30:28', '2024-12-16 08:30:28');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `roll_number` bigint UNSIGNED NOT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `current_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 4, 1, 1, 1, 'male', '7801256654', '2007-04-11', '103 Pine Tree Lane', '103 Pine Tree Lane', '2024-12-15 13:43:12', '2024-12-16 06:04:00');
INSERT INTO `students` VALUES (2, 6, 2, 2, 4, 'male', '09123456789', '2023-09-04', 'musuan', 'maramag', '2024-12-15 18:19:34', '2024-12-16 06:07:03');

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject_code` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES (1, 'ITSD 85', 'itsd-85', 85, 1, 'Special Topics in SD', '2024-12-15 18:20:57', '2024-12-16 05:38:01');
INSERT INTO `subjects` VALUES (2, 'IT 69', 'it-69', 69, 1, 'Systems Administration and Maintenance', '2024-12-15 18:24:24', '2024-12-16 05:37:56');
INSERT INTO `subjects` VALUES (3, 'ITSD 85A', 'itsd-85a', 2, 2, 'Special Topics in SD, Lab', '2024-12-15 18:24:54', '2024-12-16 05:37:50');
INSERT INTO `subjects` VALUES (4, 'IT 69A', 'it-69a', 3, 2, 'Systems Administration and Maintenance, LAB', '2024-12-15 18:25:17', '2024-12-16 05:38:09');
INSERT INTO `subjects` VALUES (5, 'IT65', 'it65', 5, 1, 'Information Assurance and Security 2', '2024-12-16 05:36:32', '2024-12-16 05:36:32');
INSERT INTO `subjects` VALUES (6, 'IT65A', 'it65a', 6, 2, 'Information Assurance and Security 2, Lab', '2024-12-16 05:36:58', '2024-12-16 05:36:58');
INSERT INTO `subjects` VALUES (7, 'IT67', 'it67', 7, 1, 'Integrative Programming and Technologies', '2024-12-16 05:39:57', '2024-12-16 05:39:57');
INSERT INTO `subjects` VALUES (8, 'IT67A', 'it67a', 8, 2, 'Integrative Programming and Technologies, Lab', '2024-12-16 05:40:36', '2024-12-16 05:40:36');
INSERT INTO `subjects` VALUES (9, 'IT 71', 'it-71', 9, 1, 'Systems Integration and Architecture', '2024-12-16 05:41:11', '2024-12-16 05:41:11');
INSERT INTO `subjects` VALUES (10, 'IT 71A', 'it-71a', 10, 2, 'Systems Integration and Architecture, Lab', '2024-12-16 05:41:25', '2024-12-16 05:41:25');
INSERT INTO `subjects` VALUES (11, 'IT 73', 'it-73', 11, 1, 'Social and Professional Issues in IT', '2024-12-16 05:41:47', '2024-12-16 05:41:47');
INSERT INTO `subjects` VALUES (12, 'IT 100.2', 'it-1002', 12, 3, 'IT Capstone Project and Research 2', '2024-12-16 05:42:11', '2024-12-16 08:27:08');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `current_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES (1, 2, 'male', '6969540014', '1990-04-11', '63 Walnut Hill Drive', '385 Emma Street', '2024-12-15 13:43:12', '2024-12-16 05:37:40');
INSERT INTO `teachers` VALUES (2, 5, 'female', '09123456789', '2023-09-04', 'musuan', 'maramag', '2024-12-15 18:15:05', '2024-12-16 05:37:27');
INSERT INTO `teachers` VALUES (3, 8, 'male', '09123456789', '2024-09-04', 'North Poblacion', 'maramag', '2024-12-16 08:26:36', '2024-12-16 08:26:36');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `profile_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@mail.com', NULL, '$2y$10$POT.XB./XgWRbkBvdZ0lI.tNis5jYAmS7o1zxfpDsVmIeHhRL7Drm', 'admin-1.png', NULL, '2024-12-15 13:43:12', '2024-12-16 06:12:35');
INSERT INTO `users` VALUES (2, 'Lecture Teacher', 'teacher@mail.com', NULL, '$2y$10$EiMeSdfOisoL/fRvdgMfz.vRfvh5Wr7ndxsItoGKujuaevMA8V6KC', 'avatar.png', NULL, '2024-12-15 13:43:12', '2024-12-16 05:37:40');
INSERT INTO `users` VALUES (3, 'Parent', 'parent@mail.com', NULL, '$2y$10$dgEU19VBCCNqXizH5UiVeekwYcpy1kUL.qJbG93vH0t9Z0wPId.9K', 'avatar.png', NULL, '2024-12-15 13:43:12', '2024-12-15 13:43:12');
INSERT INTO `users` VALUES (4, 'Student', 'student@mail.com', NULL, '$2y$10$TQoTidyF5wk0VCdVzWTw4eJcm2d1nRdA3jRmyuvFKlpS7IFh5naVi', 'avatar.png', NULL, '2024-12-15 13:43:12', '2024-12-16 06:04:00');
INSERT INTO `users` VALUES (5, 'Lab Teacher', 'teacher1@mail.com', NULL, '$2y$10$RX8DvB9empadqK0UozIUuOGo0DShuyqb1M0.jT5f47VALBpEJvqne', 'teacher-1-5.jpg', NULL, '2024-12-15 18:15:05', '2024-12-16 05:37:27');
INSERT INTO `users` VALUES (6, 'Joemar Aguinea', 'jma@mail.com', NULL, '$2y$10$A0evNsePeYUeLw02l.cSfeY94tErSI2Nnycsgb1e7iAG8SVCvQUoy', 'joemar-aguinea-6.jpg', NULL, '2024-12-15 18:19:34', '2024-12-16 06:13:12');
INSERT INTO `users` VALUES (7, 'Margie Aguinea', 'margie@mail.com', NULL, '$2y$10$R2hiExS2JZXvC3EmGZlpPetcwi3O19TmPkymqUphwsqUebsV4fpTm', 'avatar.png', NULL, '2024-12-16 06:06:50', '2024-12-16 06:06:50');
INSERT INTO `users` VALUES (8, 'Mindel Rey Aguirre', 'mindel@mail.com', NULL, '$2y$10$RUC6Z8o0lO0M7O1G4aiNwedf8uFVxEXJQdFm1uM39vJLVeXTinkxK', 'mindel-rey-aguirre-8.jpg', NULL, '2024-12-16 08:26:36', '2024-12-16 08:26:36');
INSERT INTO `users` VALUES (9, 'School Registrar', 'registrar@mail.com', NULL, '$2y$10$upuEAbTA3xFxr1r7Eb2lu.anSG1bAIdM/V61CsF.S7GzNuxhHQwzy', 'avatar.png', NULL, '2024-12-16 08:28:20', '2024-12-16 08:28:20');

SET FOREIGN_KEY_CHECKS = 1;

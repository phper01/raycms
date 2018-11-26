/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.23-0ubuntu0.18.04.1 : Database - occms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`occms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `occms`;

/*Table structure for table `backend_access_log` */

DROP TABLE IF EXISTS `backend_access_log`;

CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_access_log` */

insert  into `backend_access_log`(`id`,`user_id`,`ip_address`,`created_at`,`updated_at`) values (1,1,'192.168.10.1','2018-11-12 09:06:11','2018-11-12 09:06:11'),(2,1,'192.168.10.1','2018-11-15 06:42:16','2018-11-15 06:42:16');

/*Table structure for table `backend_user_groups` */

DROP TABLE IF EXISTS `backend_user_groups`;

CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_groups` */

insert  into `backend_user_groups`(`id`,`name`,`created_at`,`updated_at`,`code`,`description`,`is_new_user_default`) values (1,'Owners','2018-11-12 09:05:44','2018-11-12 09:05:44','owners','Default group for website owners.',0);

/*Table structure for table `backend_user_preferences` */

DROP TABLE IF EXISTS `backend_user_preferences`;

CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_preferences` */

insert  into `backend_user_preferences`(`id`,`user_id`,`namespace`,`group`,`item`,`value`) values (1,1,'backend','backend','preferences','{\"locale\":\"zh-cn\",\"fallback_locale\":\"en\",\"timezone\":\"Asia\\/Shanghai\",\"editor_font_size\":\"12\",\"editor_word_wrap\":\"fluid\",\"editor_code_folding\":\"manual\",\"editor_tab_size\":\"4\",\"editor_theme\":\"twilight\",\"editor_show_invisibles\":\"0\",\"editor_highlight_active_line\":\"1\",\"editor_use_hard_tabs\":\"0\",\"editor_show_gutter\":\"1\",\"editor_auto_closing\":\"0\",\"editor_autocompletion\":\"manual\",\"editor_enable_snippets\":\"0\",\"editor_display_indent_guides\":\"0\",\"editor_show_print_margin\":\"0\",\"user_id\":\"1\"}'),(2,1,'backend','reportwidgets','dashboard','{\"welcome\":{\"class\":\"Backend\\\\ReportWidgets\\\\Welcome\",\"sortOrder\":50,\"configuration\":{\"ocWidgetWidth\":6}},\"systemStatus\":{\"class\":\"System\\\\ReportWidgets\\\\Status\",\"sortOrder\":60,\"configuration\":{\"title\":\"\\u7cfb\\u7edf\\u72b6\\u6001\",\"ocWidgetWidth\":6,\"ocWidgetNewRow\":null}},\"activeTheme\":{\"class\":\"Cms\\\\ReportWidgets\\\\ActiveTheme\",\"sortOrder\":70,\"configuration\":{\"ocWidgetWidth\":4}}}');

/*Table structure for table `backend_user_roles` */

DROP TABLE IF EXISTS `backend_user_roles`;

CREATE TABLE `backend_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_roles` */

insert  into `backend_user_roles`(`id`,`name`,`code`,`description`,`permissions`,`is_system`,`created_at`,`updated_at`) values (1,'Publisher','publisher','Site editor with access to publishing tools.','',1,'2018-11-12 09:05:44','2018-11-12 09:05:44'),(2,'Developer','developer','Site administrator with access to developer tools.','',1,'2018-11-12 09:05:44','2018-11-12 09:05:44');

/*Table structure for table `backend_user_throttle` */

DROP TABLE IF EXISTS `backend_user_throttle`;

CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_throttle` */

insert  into `backend_user_throttle`(`id`,`user_id`,`ip_address`,`attempts`,`last_attempt_at`,`is_suspended`,`suspended_at`,`is_banned`,`banned_at`) values (1,1,'192.168.10.1',0,NULL,0,NULL,0,NULL);

/*Table structure for table `backend_users` */

DROP TABLE IF EXISTS `backend_users`;

CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_users` */

insert  into `backend_users`(`id`,`first_name`,`last_name`,`login`,`email`,`password`,`activation_code`,`persist_code`,`reset_password_code`,`permissions`,`is_activated`,`role_id`,`activated_at`,`last_login`,`created_at`,`updated_at`,`is_superuser`) values (1,'Admin','Person','admin','admin@domain.tld','$2y$10$MHc.o5bqUf6mn/eFhPtXyu0XFzRI6ncC6yLKhTOK7Z2suRpyc5C8u',NULL,'$2y$10$HSRl/hj0Ri8FX8y6LOMf0unROrWzUyfaMFN7gz5qL7p6GvIuM2Ybu',NULL,'',1,2,NULL,'2018-11-15 06:42:14','2018-11-12 09:05:44','2018-11-15 06:42:14',1);

/*Table structure for table `backend_users_groups` */

DROP TABLE IF EXISTS `backend_users_groups`;

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_users_groups` */

insert  into `backend_users_groups`(`user_id`,`user_group_id`) values (1,1);

/*Table structure for table `benfreke_menumanager_menus` */

DROP TABLE IF EXISTS `benfreke_menumanager_menus`;

CREATE TABLE `benfreke_menumanager_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_external` tinyint(1) NOT NULL DEFAULT '0',
  `link_target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `enabled` int(11) NOT NULL DEFAULT '1',
  `parameters` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query_string` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benfreke_menumanager_menus_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `benfreke_menumanager_menus` */

insert  into `benfreke_menumanager_menus`(`id`,`parent_id`,`title`,`description`,`url`,`nest_left`,`nest_right`,`nest_depth`,`created_at`,`updated_at`,`is_external`,`link_target`,`enabled`,`parameters`,`query_string`) values (1,6,'首页','','home',2,3,1,'2018-11-13 08:10:44','2018-11-13 09:27:00',0,'_self',1,'',''),(2,6,'产品信息','','product',4,5,1,'2018-11-13 08:53:36','2018-11-14 06:53:04',0,'_self',1,'{\"slug\":\"product\"}',''),(3,6,'关于我们','','about',6,7,1,'2018-11-13 08:55:04','2018-11-26 07:50:48',0,'_self',1,'',''),(4,6,'联系我们','','lianxi',8,9,1,'2018-11-13 08:55:15','2018-11-26 08:04:19',0,'_self',1,'',''),(5,6,'新闻中心','','news',10,11,1,'2018-11-13 08:55:32','2018-11-14 06:51:28',0,'_self',1,'{\"slug\":\"news\"}',''),(6,NULL,'header','',NULL,1,12,0,'2018-11-13 09:26:44','2018-11-13 09:27:00',0,'_self',1,'','');

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

/*Table structure for table `cms_theme_data` */

DROP TABLE IF EXISTS `cms_theme_data`;

CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_theme_data` */

/*Table structure for table `cms_theme_logs` */

DROP TABLE IF EXISTS `cms_theme_logs`;

CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_theme_logs` */

/*Table structure for table `deferred_bindings` */

DROP TABLE IF EXISTS `deferred_bindings`;

CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `deferred_bindings` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `flosch_slideshow_slides` */

DROP TABLE IF EXISTS `flosch_slideshow_slides`;

CREATE TABLE `flosch_slideshow_slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slideshow_id` int(10) unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `unpublished_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flosch_slideshow_slides_slideshow_id_foreign` (`slideshow_id`),
  CONSTRAINT `flosch_slideshow_slides_slideshow_id_foreign` FOREIGN KEY (`slideshow_id`) REFERENCES `flosch_slideshow_slideshows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `flosch_slideshow_slides` */

insert  into `flosch_slideshow_slides`(`id`,`name`,`description`,`link`,`sort_order`,`created_at`,`updated_at`,`slideshow_id`,`is_published`,`published_at`,`unpublished_at`) values (4,'2','','',4,'2018-11-13 08:33:17','2018-11-13 08:33:50',2,1,'2018-11-13 08:33:05',NULL),(5,'1','','',5,'2018-11-13 08:33:34','2018-11-13 08:33:58',2,1,NULL,NULL),(6,'3','','',6,'2018-11-13 08:34:12','2018-11-13 08:34:12',2,1,NULL,NULL);

/*Table structure for table `flosch_slideshow_slideshows` */

DROP TABLE IF EXISTS `flosch_slideshow_slideshows`;

CREATE TABLE `flosch_slideshow_slideshows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `flosch_slideshow_slideshows` */

insert  into `flosch_slideshow_slideshows`(`id`,`name`,`created_at`,`updated_at`) values (2,'首页轮播','2018-11-13 08:32:37','2018-11-13 08:32:37');

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2013_10_01_000001_Db_Deferred_Bindings',1),(2,'2013_10_01_000002_Db_System_Files',1),(3,'2013_10_01_000003_Db_System_Plugin_Versions',1),(4,'2013_10_01_000004_Db_System_Plugin_History',1),(5,'2013_10_01_000005_Db_System_Settings',1),(6,'2013_10_01_000006_Db_System_Parameters',1),(7,'2013_10_01_000007_Db_System_Add_Disabled_Flag',1),(8,'2013_10_01_000008_Db_System_Mail_Templates',1),(9,'2013_10_01_000009_Db_System_Mail_Layouts',1),(10,'2014_10_01_000010_Db_Jobs',1),(11,'2014_10_01_000011_Db_System_Event_Logs',1),(12,'2014_10_01_000012_Db_System_Request_Logs',1),(13,'2014_10_01_000013_Db_System_Sessions',1),(14,'2015_10_01_000014_Db_System_Mail_Layout_Rename',1),(15,'2015_10_01_000015_Db_System_Add_Frozen_Flag',1),(16,'2015_10_01_000016_Db_Cache',1),(17,'2015_10_01_000017_Db_System_Revisions',1),(18,'2015_10_01_000018_Db_FailedJobs',1),(19,'2016_10_01_000019_Db_System_Plugin_History_Detail_Text',1),(20,'2016_10_01_000020_Db_System_Timestamp_Fix',1),(21,'2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session',1),(22,'2017_10_01_000021_Db_System_Sessions_Update',1),(23,'2017_10_01_000022_Db_Jobs_FailedJobs_Update',1),(24,'2017_10_01_000023_Db_System_Mail_Partials',1),(25,'2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field',1),(26,'2013_10_01_000001_Db_Backend_Users',2),(27,'2013_10_01_000002_Db_Backend_User_Groups',2),(28,'2013_10_01_000003_Db_Backend_Users_Groups',2),(29,'2013_10_01_000004_Db_Backend_User_Throttle',2),(30,'2014_01_04_000005_Db_Backend_User_Preferences',2),(31,'2014_10_01_000006_Db_Backend_Access_Log',2),(32,'2014_10_01_000007_Db_Backend_Add_Description_Field',2),(33,'2015_10_01_000008_Db_Backend_Add_Superuser_Flag',2),(34,'2016_10_01_000009_Db_Backend_Timestamp_Fix',2),(35,'2017_10_01_000010_Db_Backend_User_Roles',2),(36,'2014_10_01_000001_Db_Cms_Theme_Data',3),(37,'2016_10_01_000002_Db_Cms_Timestamp_Fix',3),(38,'2017_10_01_000003_Db_Cms_Theme_Logs',3);

/*Table structure for table `rainlab_blog_categories` */

DROP TABLE IF EXISTS `rainlab_blog_categories`;

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rainlab_blog_categories` */

insert  into `rainlab_blog_categories`(`id`,`name`,`slug`,`code`,`description`,`parent_id`,`nest_left`,`nest_right`,`nest_depth`,`created_at`,`updated_at`) values (2,'企业新闻','companynews',NULL,'',4,2,3,1,'2018-11-13 06:53:05','2018-11-13 06:56:15'),(3,'行业新闻','industrynews',NULL,'',4,4,5,1,'2018-11-13 06:53:55','2018-11-13 06:56:15'),(4,'新闻','news',NULL,'',NULL,1,6,0,'2018-11-13 06:54:22','2018-11-13 06:56:15'),(5,'产品','product',NULL,'',NULL,7,12,0,'2018-11-13 06:54:38','2018-11-13 06:56:15'),(6,'产品分类1','product-1',NULL,'',5,8,9,1,'2018-11-13 06:55:00','2018-11-13 06:56:15'),(7,'产品分类2','product-2',NULL,'',5,10,11,1,'2018-11-13 06:55:17','2018-11-13 06:56:15');

/*Table structure for table `rainlab_blog_posts` */

DROP TABLE IF EXISTS `rainlab_blog_posts`;

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rainlab_blog_posts` */

insert  into `rainlab_blog_posts`(`id`,`user_id`,`title`,`slug`,`excerpt`,`content`,`content_html`,`published_at`,`published`,`created_at`,`updated_at`) values (1,1,'First blog post','first-blog-post','The first ever blog post is here. It might be a good idea to update this post with some more relevant content.','This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\r\n\r\nYou can edit this content by selecting **Blog** from the administration back-end menu.\r\n\r\n*Enjoy the good times!*','<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>','2018-11-13 06:49:31',1,'2018-11-13 06:49:31','2018-11-13 07:04:21'),(2,1,'卡里斯-勒韦尔遭遇严重腿伤','c1','虎扑11月13日讯 在今天已经结束的常规赛中，明尼苏达森林狼队主场以120-113的比分战胜布鲁克林篮网队。','在今日的比赛里，卡里斯-勒韦尔遭遇严重腿伤，德里克-罗斯赛后称他目睹过三起这样的可怕腿伤，保罗-乔治、戈登-海沃德和勒韦尔受伤的时候，罗斯均在场。\r\n\r\n“你想送出祈祷，在某种程度上来说，这会有点让你思想混乱。”罗斯说道。\r\n\r\n罗斯称他今晚会为勒韦尔祈祷，他说：“看到像这样的事情总是很糟糕。”\r\n\r\n本场比赛，罗斯出场38分钟，18投8中，三分5投3中，得到23分2篮板6助攻1抢断1盖帽。\r\n\r\n罗斯最近31次三分出手命中了19个，罗斯本赛季给自己定了三分命中率的目标了么？\r\n\r\n“没，对手给我投三分的机会，各种机会，我不会停止出手，唯一的区别是很多球队不让我出手三分，他们让我远离三分线，但是这只会发生在比赛最后时刻，在比赛初期，他们要看看我是否可以命中，我不断让他们付出代价。”罗斯说道。\r\n\r\n罗斯接着说：“这是很长时间以来我感觉最好的时候，我已经不再想这个了，我的努力和投入，我在训练馆待了无数的小时，我的训练师一直跟我在一起，他干得很棒，让我保持专注。”','<p>在今日的比赛里，卡里斯-勒韦尔遭遇严重腿伤，德里克-罗斯赛后称他目睹过三起这样的可怕腿伤，保罗-乔治、戈登-海沃德和勒韦尔受伤的时候，罗斯均在场。</p>\n<p>“你想送出祈祷，在某种程度上来说，这会有点让你思想混乱。”罗斯说道。</p>\n<p>罗斯称他今晚会为勒韦尔祈祷，他说：“看到像这样的事情总是很糟糕。”</p>\n<p>本场比赛，罗斯出场38分钟，18投8中，三分5投3中，得到23分2篮板6助攻1抢断1盖帽。</p>\n<p>罗斯最近31次三分出手命中了19个，罗斯本赛季给自己定了三分命中率的目标了么？</p>\n<p>“没，对手给我投三分的机会，各种机会，我不会停止出手，唯一的区别是很多球队不让我出手三分，他们让我远离三分线，但是这只会发生在比赛最后时刻，在比赛初期，他们要看看我是否可以命中，我不断让他们付出代价。”罗斯说道。</p>\n<p>罗斯接着说：“这是很长时间以来我感觉最好的时候，我已经不再想这个了，我的努力和投入，我在训练馆待了无数的小时，我的训练师一直跟我在一起，他干得很棒，让我保持专注。”</p>','2018-11-13 07:01:20',1,'2018-11-13 07:03:48','2018-11-13 07:03:48'),(3,1,'我们犯了很多错','p1','“防守端，我们犯了很多错误','“防守端，我们犯了很多错误，他们犯的错误比我们少一些，他们的投篮比我们好，我认为裁判表现得棒极了，他们做得很好，但总体而言，如果他们的三分球命中率有50%，我们只有28%，那我们就不好过了。防守端，我们犯了太多错误。”波波维奇说道。','<p>“防守端，我们犯了很多错误，他们犯的错误比我们少一些，他们的投篮比我们好，我认为裁判表现得棒极了，他们做得很好，但总体而言，如果他们的三分球命中率有50%，我们只有28%，那我们就不好过了。防守端，我们犯了太多错误。”波波维奇说道。</p>','2018-11-13 07:05:55',1,'2018-11-13 07:07:06','2018-11-13 07:07:06'),(4,1,'福克斯上场','p2','本场比赛福克斯上场30分钟，贡献19分3个篮板7次助攻2个抢断1个盖帽','虎扑11月13日讯 今天国王在主场以104-99的比分战胜马刺，赛后国王队后卫达龙-福克斯接受了记者的访问。\r\n\r\n谈到本场胜利的意义时，福克斯说：“我不会说这是一场必须赢的比赛，但是我们觉得不能让自己有主场1-3的战绩。”本场比赛后，国王本赛季主场战绩为2胜2负。\r\n\r\n本场比赛福克斯上场30分钟，贡献19分3个篮板7次助攻2个抢断1个盖帽','<p>虎扑11月13日讯 今天国王在主场以104-99的比分战胜马刺，赛后国王队后卫达龙-福克斯接受了记者的访问。</p>\n<p>谈到本场胜利的意义时，福克斯说：“我不会说这是一场必须赢的比赛，但是我们觉得不能让自己有主场1-3的战绩。”本场比赛后，国王本赛季主场战绩为2胜2负。</p>\n<p>本场比赛福克斯上场30分钟，贡献19分3个篮板7次助攻2个抢断1个盖帽</p>','2018-11-13 07:07:32',1,'2018-11-13 07:08:22','2018-11-13 07:08:22');

/*Table structure for table `rainlab_blog_posts_categories` */

DROP TABLE IF EXISTS `rainlab_blog_posts_categories`;

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rainlab_blog_posts_categories` */

insert  into `rainlab_blog_posts_categories`(`post_id`,`category_id`) values (1,3),(1,4),(2,2),(2,4),(3,6),(4,5),(4,7);

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

/*Table structure for table `system_event_logs` */

DROP TABLE IF EXISTS `system_event_logs`;

CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_event_logs` */

insert  into `system_event_logs`(`id`,`level`,`message`,`details`,`created_at`,`updated_at`) values (1,'error','ReflectionException: Class GrofGraf\\GoogleMaps\\Components\\BaiduMap does not exist in /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php:752\nStack trace:\n#0 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(752): ReflectionClass->__construct(\'GrofGraf\\\\Google...\')\n#1 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(\'GrofGraf\\\\Google...\')\n#2 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(586): Illuminate\\Container\\Container->resolve(\'GrofGraf\\\\Google...\', Array)\n#3 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(732): Illuminate\\Container\\Container->make(\'GrofGraf\\\\Google...\', Array)\n#4 /code/occms/october/vendor/october/rain/src/Foundation/Application.php(162): Illuminate\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#5 /code/occms/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#6 /code/occms/october/modules/cms/Widgets/ComponentList.php(91): Illuminate\\Support\\Facades\\Facade::__callStatic(\'make\', Array)\n#7 /code/occms/october/modules/cms/Widgets/ComponentList.php(40): Cms\\Widgets\\ComponentList->getData()\n#8 /code/occms/october/modules/cms/controllers/index/_sidepanel.htm(69): Cms\\Widgets\\ComponentList->render()\n#9 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#10 /code/occms/october/modules/system/Traits/ViewMaker.php(97): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\', Array)\n#11 /code/occms/october/modules/cms/controllers/index/index.htm(3): Backend\\Classes\\Controller->makePartial(\'_sidepanel.htm\')\n#12 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#13 /code/occms/october/modules/system/Traits/ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\')\n#14 /code/occms/october/modules/backend/Classes/Controller.php(364): Backend\\Classes\\Controller->makeView(\'index\')\n#15 /code/occms/october/modules/backend/Classes/Controller.php(246): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#16 /code/occms/october/modules/backend/Classes/BackendController.php(95): Backend\\Classes\\Controller->run(\'index\', Array)\n#17 [internal function]: Backend\\Classes\\BackendController->run(\'cms\')\n#18 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#19 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#21 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#22 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#23 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /code/occms/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /code/occms/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#42 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#43 /code/occms/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#44 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#45 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 /code/occms/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}',NULL,'2018-11-14 08:14:34','2018-11-14 08:14:34'),(2,'error','ReflectionException: Class GrofGraf\\GoogleMaps\\Components\\BaiduMap does not exist in /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php:752\nStack trace:\n#0 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(752): ReflectionClass->__construct(\'GrofGraf\\\\Google...\')\n#1 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(\'GrofGraf\\\\Google...\')\n#2 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(586): Illuminate\\Container\\Container->resolve(\'GrofGraf\\\\Google...\', Array)\n#3 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(732): Illuminate\\Container\\Container->make(\'GrofGraf\\\\Google...\', Array)\n#4 /code/occms/october/vendor/october/rain/src/Foundation/Application.php(162): Illuminate\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#5 /code/occms/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#6 /code/occms/october/modules/cms/Widgets/ComponentList.php(91): Illuminate\\Support\\Facades\\Facade::__callStatic(\'make\', Array)\n#7 /code/occms/october/modules/cms/Widgets/ComponentList.php(40): Cms\\Widgets\\ComponentList->getData()\n#8 /code/occms/october/modules/cms/controllers/index/_sidepanel.htm(69): Cms\\Widgets\\ComponentList->render()\n#9 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#10 /code/occms/october/modules/system/Traits/ViewMaker.php(97): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\', Array)\n#11 /code/occms/october/modules/cms/controllers/index/index.htm(3): Backend\\Classes\\Controller->makePartial(\'_sidepanel.htm\')\n#12 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#13 /code/occms/october/modules/system/Traits/ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\')\n#14 /code/occms/october/modules/backend/Classes/Controller.php(364): Backend\\Classes\\Controller->makeView(\'index\')\n#15 /code/occms/october/modules/backend/Classes/Controller.php(246): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#16 /code/occms/october/modules/backend/Classes/BackendController.php(95): Backend\\Classes\\Controller->run(\'index\', Array)\n#17 [internal function]: Backend\\Classes\\BackendController->run(\'cms\')\n#18 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#19 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#21 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#22 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#23 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /code/occms/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /code/occms/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#42 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#43 /code/occms/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#44 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#45 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 /code/occms/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}',NULL,'2018-11-14 08:56:36','2018-11-14 08:56:36'),(3,'error','ReflectionException: Class GrofGraf\\GoogleMaps\\Components\\BaiduMap does not exist in /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php:752\nStack trace:\n#0 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(752): ReflectionClass->__construct(\'GrofGraf\\\\Google...\')\n#1 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(\'GrofGraf\\\\Google...\')\n#2 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(586): Illuminate\\Container\\Container->resolve(\'GrofGraf\\\\Google...\', Array)\n#3 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(732): Illuminate\\Container\\Container->make(\'GrofGraf\\\\Google...\', Array)\n#4 /code/occms/october/vendor/october/rain/src/Foundation/Application.php(162): Illuminate\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#5 /code/occms/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#6 /code/occms/october/modules/cms/Widgets/ComponentList.php(91): Illuminate\\Support\\Facades\\Facade::__callStatic(\'make\', Array)\n#7 /code/occms/october/modules/cms/Widgets/ComponentList.php(40): Cms\\Widgets\\ComponentList->getData()\n#8 /code/occms/october/modules/cms/controllers/index/_sidepanel.htm(69): Cms\\Widgets\\ComponentList->render()\n#9 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#10 /code/occms/october/modules/system/Traits/ViewMaker.php(97): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\', Array)\n#11 /code/occms/october/modules/cms/controllers/index/index.htm(3): Backend\\Classes\\Controller->makePartial(\'_sidepanel.htm\')\n#12 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#13 /code/occms/october/modules/system/Traits/ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\')\n#14 /code/occms/october/modules/backend/Classes/Controller.php(364): Backend\\Classes\\Controller->makeView(\'index\')\n#15 /code/occms/october/modules/backend/Classes/Controller.php(246): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#16 /code/occms/october/modules/backend/Classes/BackendController.php(95): Backend\\Classes\\Controller->run(\'index\', Array)\n#17 [internal function]: Backend\\Classes\\BackendController->run(\'cms\')\n#18 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#19 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#21 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#22 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#23 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /code/occms/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /code/occms/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#42 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#43 /code/occms/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#44 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#45 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 /code/occms/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}',NULL,'2018-11-14 09:04:04','2018-11-14 09:04:04'),(4,'error','ReflectionException: Class GrofGraf\\GoogleMaps\\Components\\BaiduMap does not exist in /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php:752\nStack trace:\n#0 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(752): ReflectionClass->__construct(\'GrofGraf\\\\Google...\')\n#1 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(631): Illuminate\\Container\\Container->build(\'GrofGraf\\\\Google...\')\n#2 /code/occms/october/vendor/laravel/framework/src/Illuminate/Container/Container.php(586): Illuminate\\Container\\Container->resolve(\'GrofGraf\\\\Google...\', Array)\n#3 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(732): Illuminate\\Container\\Container->make(\'GrofGraf\\\\Google...\', Array)\n#4 /code/occms/october/vendor/october/rain/src/Foundation/Application.php(162): Illuminate\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#5 /code/occms/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Foundation\\Application->make(\'GrofGraf\\\\Google...\')\n#6 /code/occms/october/modules/cms/Widgets/ComponentList.php(91): Illuminate\\Support\\Facades\\Facade::__callStatic(\'make\', Array)\n#7 /code/occms/october/modules/cms/Widgets/ComponentList.php(40): Cms\\Widgets\\ComponentList->getData()\n#8 /code/occms/october/modules/cms/controllers/index/_sidepanel.htm(69): Cms\\Widgets\\ComponentList->render()\n#9 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#10 /code/occms/october/modules/system/Traits/ViewMaker.php(97): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\', Array)\n#11 /code/occms/october/modules/cms/controllers/index/index.htm(3): Backend\\Classes\\Controller->makePartial(\'_sidepanel.htm\')\n#12 /code/occms/october/modules/system/Traits/ViewMaker.php(247): include(\'/code/occms/oct...\')\n#13 /code/occms/october/modules/system/Traits/ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'/code/occms/oct...\')\n#14 /code/occms/october/modules/backend/Classes/Controller.php(364): Backend\\Classes\\Controller->makeView(\'index\')\n#15 /code/occms/october/modules/backend/Classes/Controller.php(246): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#16 /code/occms/october/modules/backend/Classes/BackendController.php(95): Backend\\Classes\\Controller->run(\'index\', Array)\n#17 [internal function]: Backend\\Classes\\BackendController->run(\'cms\')\n#18 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#19 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#20 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#21 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#22 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#23 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /code/occms/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /code/occms/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#42 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#43 /code/occms/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#44 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#45 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 /code/occms/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}',NULL,'2018-11-14 09:07:42','2018-11-14 09:07:42'),(5,'error','Twig_Error_Syntax: Unknown \"compoent\" tag. Did you mean \"component\" in \"/code/occms/october/themes/qiye/pages/lianxi.htm\" at line 4? in /code/occms/october/vendor/twig/twig/lib/Twig/Parser.php:158\nStack trace:\n#0 /code/occms/october/vendor/twig/twig/lib/Twig/Parser.php(81): Twig_Parser->subparse(NULL, false)\n#1 /code/occms/october/vendor/twig/twig/lib/Twig/Environment.php(533): Twig_Parser->parse(Object(Twig_TokenStream))\n#2 /code/occms/october/vendor/twig/twig/lib/Twig/Environment.php(565): Twig_Environment->parse(Object(Twig_TokenStream))\n#3 /code/occms/october/vendor/twig/twig/lib/Twig/Environment.php(368): Twig_Environment->compileSource(Object(Twig_Source))\n#4 /code/occms/october/modules/cms/Classes/Controller.php(359): Twig_Environment->loadTemplate(\'/code/occms/oct...\')\n#5 /code/occms/october/modules/cms/Classes/Controller.php(206): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 /code/occms/october/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'lianxi\')\n#7 [internal function]: Cms\\Classes\\CmsController->run(\'lianxi\')\n#8 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#9 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#10 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#11 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#12 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#13 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#16 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 /code/occms/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#19 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /code/occms/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /code/occms/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#32 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#33 /code/occms/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#34 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#35 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /code/occms/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /code/occms/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#41 /code/occms/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#42 /code/occms/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#43 {main}',NULL,'2018-11-14 09:15:38','2018-11-14 09:15:38');

/*Table structure for table `system_files` */

DROP TABLE IF EXISTS `system_files`;

CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_files` */

insert  into `system_files`(`id`,`disk_name`,`file_name`,`file_size`,`content_type`,`title`,`description`,`field`,`attachment_id`,`attachment_type`,`is_public`,`sort_order`,`created_at`,`updated_at`) values (1,'5bea77185fad4889722738.jpg','0cb1a15d46ee5a8b4fb496be11b67d6ff5554c62.jpg',26172,'image/jpeg',NULL,NULL,'featured_images','2','RainLab\\Blog\\Models\\Post',1,1,'2018-11-13 07:02:48','2018-11-13 07:03:48'),(2,'5bea77734b2ef409372162.jpg','da.jpg',16209,'image/jpeg',NULL,NULL,'featured_images','1','RainLab\\Blog\\Models\\Post',1,2,'2018-11-13 07:04:19','2018-11-13 07:04:21'),(3,'5bea7806f3b07164754519.png','6b091412ac4b1206d9b20be3387a7d96e8695539.png',229895,'image/png',NULL,NULL,'featured_images','3','RainLab\\Blog\\Models\\Post',1,3,'2018-11-13 07:06:47','2018-11-13 07:07:06'),(4,'5bea78597454c954454143.jpg','u=919273208,135219559&fm=26&gp=0.jpg',20199,'image/jpeg',NULL,NULL,'featured_images','4','RainLab\\Blog\\Models\\Post',1,4,'2018-11-13 07:08:09','2018-11-13 07:08:22'),(5,'5bea8c37c750f671384499.jpg','timg (1).jpg',47725,'image/jpeg',NULL,NULL,'image','4','Flosch\\Slideshow\\Models\\Slide',1,5,'2018-11-13 08:32:55','2018-11-13 08:33:17'),(6,'5bea8c59b9726110361655.jpg','timg (2).jpg',55367,'image/jpeg',NULL,NULL,'image','5','Flosch\\Slideshow\\Models\\Slide',1,6,'2018-11-13 08:33:29','2018-11-13 08:33:34'),(7,'5bea8c81e1774441318544.jpg','timg (3).jpg',87262,'image/jpeg',NULL,NULL,'image','6','Flosch\\Slideshow\\Models\\Slide',1,7,'2018-11-13 08:34:09','2018-11-13 08:34:12');

/*Table structure for table `system_mail_layouts` */

DROP TABLE IF EXISTS `system_mail_layouts`;

CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_mail_layouts` */

insert  into `system_mail_layouts`(`id`,`name`,`code`,`content_html`,`content_text`,`content_css`,`is_locked`,`options`,`created_at`,`updated_at`) values (1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2018-11-12 09:05:44','2018-11-12 09:05:44'),(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2018-11-12 09:05:44','2018-11-12 09:05:44');

/*Table structure for table `system_mail_partials` */

DROP TABLE IF EXISTS `system_mail_partials`;

CREATE TABLE `system_mail_partials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_mail_partials` */

insert  into `system_mail_partials`(`id`,`name`,`code`,`content_html`,`content_text`,`is_custom`,`created_at`,`updated_at`) values (1,'Header','header','<tr>\n    <td class=\"header\">\n        {% if url %}\n            <a href=\"{{ url }}\">\n                {{ body }}\n            </a>\n        {% else %}\n            <span>\n                {{ body }}\n            </span>\n        {% endif %}\n    </td>\n</tr>','*** {{ body|trim }} <{{ url }}>',0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(2,'Footer','footer','<tr>\n    <td>\n        <table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n            <tr>\n                <td class=\"content-cell\" align=\"center\">\n                    {{ body|md_safe }}\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>','-------------------\n{{ body|trim }}',0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(3,'Button','button','<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td align=\"center\">\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                            <tr>\n                                <td>\n                                    <a href=\"{{ url }}\" class=\"button button-{{ type ?: \'primary\' }}\" target=\"_blank\">\n                                        {{ body }}\n                                    </a>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>','{{ body|trim }} <{{ url }}>',0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(4,'Panel','panel','<table class=\"panel\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td class=\"panel-content\">\n            <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td class=\"panel-item\">\n                        {{ body|md_safe }}\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>','{{ body|trim }}',0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(5,'Table','table','<div class=\"table\">\n    {{ body|md_safe }}\n</div>','{{ body|trim }}',0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(6,'Subcopy','subcopy','<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            {{ body|md_safe }}\n        </td>\n    </tr>\n</table>','-----\n{{ body|trim }}',0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(7,'Promotion','promotion','<table class=\"promotion\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            {{ body|md_safe }}\n        </td>\n    </tr>\n</table>','{{ body|trim }}',0,'2018-11-26 08:08:21','2018-11-26 08:08:21');

/*Table structure for table `system_mail_templates` */

DROP TABLE IF EXISTS `system_mail_templates`;

CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_mail_templates` */

insert  into `system_mail_templates`(`id`,`code`,`subject`,`description`,`content_html`,`content_text`,`layout_id`,`is_custom`,`created_at`,`updated_at`) values (1,'grofgraf.contactme::emails.message',NULL,NULL,NULL,NULL,1,0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(2,'grofgraf.contactme::emails.auto-reply',NULL,NULL,NULL,NULL,1,0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(3,'backend::mail.invite',NULL,'Invite new admin to the site',NULL,NULL,2,0,'2018-11-26 08:08:21','2018-11-26 08:08:21'),(4,'backend::mail.restore',NULL,'Reset an admin password',NULL,NULL,2,0,'2018-11-26 08:08:21','2018-11-26 08:08:21');

/*Table structure for table `system_parameters` */

DROP TABLE IF EXISTS `system_parameters`;

CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_parameters` */

insert  into `system_parameters`(`id`,`namespace`,`group`,`item`,`value`) values (1,'system','update','count','0'),(2,'system','update','retry','1543300930'),(3,'system','core','build','\"443\"'),(4,'system','core','hash','\"8dccb2043759b385e46cc3cf6a36c4b4\"'),(5,'cms','theme','active','\"qiye\"');

/*Table structure for table `system_plugin_history` */

DROP TABLE IF EXISTS `system_plugin_history`;

CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_plugin_history` */

insert  into `system_plugin_history`(`id`,`code`,`type`,`version`,`detail`,`created_at`) values (82,'Flosch.Slideshow','script','1.0.1','create_slideshows_table.php','2018-11-13 08:32:00'),(83,'Flosch.Slideshow','script','1.0.1','create_slides_table.php','2018-11-13 08:32:00'),(84,'Flosch.Slideshow','script','1.0.1','seeder.php','2018-11-13 08:32:00'),(85,'Flosch.Slideshow','comment','1.0.1','First version of Slideshow','2018-11-13 08:32:00'),(86,'Flosch.Slideshow','script','1.0.2','table_update_flosch_slideshow_slides.php','2018-11-13 08:32:00'),(87,'Flosch.Slideshow','comment','1.0.2','Added is_published state and publication dates','2018-11-13 08:32:00'),(88,'Flosch.Slideshow','comment','1.0.3','Update documentation for Twitter Bootstrap sources','2018-11-13 08:32:00'),(89,'Flosch.Slideshow','comment','1.0.4','Update slides published query-scope (correct dates comparison)','2018-11-13 08:32:00'),(90,'Flosch.Slideshow','comment','1.0.5','Fix permission settings','2018-11-13 08:32:00'),(91,'Flosch.Slideshow','script','1.0.6','Add french translation','2018-11-13 08:32:00'),(92,'Flosch.Slideshow','comment','1.0.6','Add persian translation (thanks to @cracki)','2018-11-13 08:32:00'),(93,'Flosch.Slideshow','comment','1.0.7','Add german translation (thanks to @danielbruni)','2018-11-13 08:32:00'),(94,'Flosch.Slideshow','comment','1.0.8','Correct columns definition (thanks to @Jeime)','2018-11-13 08:32:00'),(95,'Ray.BaiduMaps','comment','1.0.1','First version of GoogleMaps','2018-11-15 06:42:15'),(96,'Ray.BaiduMaps','script','1.0.2','Settigns devided into categories','2018-11-15 06:42:15'),(97,'Ray.BaiduMaps','script','1.0.2','Added default values','2018-11-15 06:42:15'),(98,'Ray.BaiduMaps','comment','1.0.2','Added backend form validation','2018-11-15 06:42:15'),(99,'Ray.BaiduMaps','comment','1.0.3','Component namespace error fixed','2018-11-15 06:42:15'),(100,'Ray.BaiduMaps','comment','1.0.4','Registered permission','2018-11-15 06:42:15'),(101,'Ray.BaiduMaps','comment','1.0.5','Fixed permissions','2018-11-15 06:42:15'),(102,'GrofGraf.ContactMe','comment','1.0.1','First version of ContactMe','2018-11-26 08:05:15'),(103,'GrofGraf.ContactMe','comment','1.0.2','Captcha credentials can be empty if captcha not enabled','2018-11-26 08:05:15'),(104,'GrofGraf.ContactMe','comment','1.0.3','Component namespace error fixed','2018-11-26 08:05:15'),(105,'GrofGraf.ContactMe','script','1.0.4','Added maillist title field','2018-11-26 08:05:15'),(106,'GrofGraf.ContactMe','comment','1.0.4','Auto subscribe error fixed','2018-11-26 08:05:15'),(107,'GrofGraf.ContactMe','comment','1.0.5','Customer name is posted to maillist','2018-11-26 08:05:15'),(108,'GrofGraf.ContactMe','comment','1.0.6','Synchronized with latest MailgunSubscribe update','2018-11-26 08:05:15'),(109,'GrofGraf.ContactMe','comment','1.0.7','Added post() information to message and auto reply','2018-11-26 08:05:15'),(110,'GrofGraf.ContactMe','comment','1.0.8','Added variables to automatic reply email template','2018-11-26 08:05:15'),(111,'GrofGraf.ContactMe','comment','1.0.9','Registered permissions','2018-11-26 08:05:15'),(112,'GrofGraf.ContactMe','comment','1.1.0','Fixed permission','2018-11-26 08:05:15'),(113,'GrofGraf.ContactMe','comment','1.1.1.','Optional maillist subscribe consent field','2018-11-26 08:05:15'),(114,'VojtaSvoboda.TwigExtensions','comment','1.0.1','First version of TwigExtensions','2018-11-26 08:26:33'),(115,'VojtaSvoboda.TwigExtensions','comment','1.0.2','Add template_from_string function','2018-11-26 08:26:33'),(116,'VojtaSvoboda.TwigExtensions','comment','1.0.3','Fix uppercase, lowercase and ucfirst for UTF-8 characters','2018-11-26 08:26:33'),(117,'VojtaSvoboda.TwigExtensions','comment','1.0.4','Add leftpad, rightpad and strpad filters. Cover by unit tests.','2018-11-26 08:26:33'),(118,'VojtaSvoboda.TwigExtensions','comment','1.0.5','Add config function (thanks to Sebastian Hilger)','2018-11-26 08:26:33'),(119,'VojtaSvoboda.TwigExtensions','comment','1.0.6','Fix localizednumber and localizedcurrency filters (thanks to Vita Zoubek)','2018-11-26 08:26:33'),(120,'VojtaSvoboda.TwigExtensions','comment','1.0.7','Add the session() and trans() helper functions (thanks to Sebastian Hilger)','2018-11-26 08:26:33'),(121,'VojtaSvoboda.TwigExtensions','comment','1.0.8','Plugin can be installed over Composer.','2018-11-26 08:26:33'),(122,'VojtaSvoboda.TwigExtensions','comment','1.0.9','Add var_dump filter and function.','2018-11-26 08:26:33'),(123,'VojtaSvoboda.TwigExtensions','comment','1.0.10','Remove pre tag from var_dump','2018-11-26 08:26:33'),(124,'VojtaSvoboda.TwigExtensions','comment','1.0.11','Add mailto filter for rendering encrypted email addresses.','2018-11-26 08:26:33'),(125,'VojtaSvoboda.TwigExtensions','comment','1.0.12','Add mailto text parameter and rtl filter.','2018-11-26 08:26:33'),(126,'VojtaSvoboda.TwigExtensions','comment','1.0.13','Make time_diff translatable.','2018-11-26 08:26:33'),(127,'VojtaSvoboda.TwigExtensions','comment','1.0.14','Add pt-br locale for time_diff translation (thanks to Ronaldo Ribeiro de Sousa)','2018-11-26 08:26:33'),(128,'VojtaSvoboda.TwigExtensions','comment','1.0.15','Add DE and HU locale (thanks to Szabó Gergő and Sebastian Hilger)','2018-11-26 08:26:33'),(129,'VojtaSvoboda.TwigExtensions','comment','1.1.0','Make changes for Laravel 5.5.','2018-11-26 08:26:33'),(130,'VojtaSvoboda.TwigExtensions','comment','1.1.1','Add revision filter','2018-11-26 08:26:33'),(131,'VojtaSvoboda.TwigExtensions','comment','1.1.2','Add strip_tags filter','2018-11-26 08:26:33'),(132,'VojtaSvoboda.TwigExtensions','comment','1.1.3','Add sortbyfield filter to sorting arrays/fields by key.','2018-11-26 08:26:33'),(133,'VojtaSvoboda.TwigExtensions','comment','1.2.0','Require PHP 7.0 as minimum version.','2018-11-26 08:26:33'),(134,'VojtaSvoboda.TwigExtensions','comment','1.2.1','Add linter and code sniffer for better automatization.','2018-11-26 08:26:33'),(135,'VojtaSvoboda.TwigExtensions','comment','1.2.2','Add str_replace filter (thanks to Szabó Gergő)','2018-11-26 08:26:33'),(136,'VojtaSvoboda.TwigExtensions','comment','1.2.3','Added an optional css class parameter to mailto function','2018-11-26 08:26:33'),(137,'PolloZen.NextPrevPost','comment','1.0.1','First version of NextPrevPost','2018-11-26 08:26:33');

/*Table structure for table `system_plugin_versions` */

DROP TABLE IF EXISTS `system_plugin_versions`;

CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_plugin_versions` */

insert  into `system_plugin_versions`(`id`,`code`,`version`,`created_at`,`is_disabled`,`is_frozen`) values (1,'October.Demo','1.0.1','2018-11-12 09:05:42',0,0),(2,'RainLab.Blog','1.2.19','2018-11-13 06:49:32',0,0),(3,'BenFreke.MenuManager','1.5.3','2018-11-13 08:08:59',0,0),(4,'Flosch.Slideshow','1.0.8','2018-11-13 08:32:00',0,0),(5,'Ray.BaiduMaps','1.0.5','2018-11-15 06:42:15',0,0),(6,'GrofGraf.ContactMe','1.1.1.','2018-11-26 08:05:15',0,0),(7,'VojtaSvoboda.TwigExtensions','1.2.3','2018-11-26 08:26:33',0,0),(8,'PolloZen.NextPrevPost','1.0.1','2018-11-26 08:26:33',0,0);

/*Table structure for table `system_request_logs` */

DROP TABLE IF EXISTS `system_request_logs`;

CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_request_logs` */

/*Table structure for table `system_revisions` */

DROP TABLE IF EXISTS `system_revisions`;

CREATE TABLE `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_revisions` */

/*Table structure for table `system_settings` */

DROP TABLE IF EXISTS `system_settings`;

CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_settings` */

insert  into `system_settings`(`id`,`item`,`value`) values (1,'baidu_maps_settings','{\"api_key\":\"F8GGZGTAevRPL7BwLtTjQvEzdAlpzqTt\",\"latitude\":\"116.404\",\"longtitude\":\"39.915\",\"height\":\"300px\",\"width\":\"95%\",\"zoom\":\"11\",\"map_type\":\"roadmap\",\"show_marker\":\"0\",\"directions_button_text\":\"Get Directions\"}');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 19, 2019 at 06:14 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `djapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add userregister', 7, 'add_userregister'),
(26, 'Can change userregister', 7, 'change_userregister'),
(27, 'Can delete userregister', 7, 'delete_userregister'),
(28, 'Can view userregister', 7, 'view_userregister'),
(29, 'Can add addcategory', 8, 'add_addcategory'),
(30, 'Can change addcategory', 8, 'change_addcategory'),
(31, 'Can delete addcategory', 8, 'delete_addcategory'),
(32, 'Can view addcategory', 8, 'view_addcategory'),
(33, 'Can add addsubcategory', 9, 'add_addsubcategory'),
(34, 'Can change addsubcategory', 9, 'change_addsubcategory'),
(35, 'Can delete addsubcategory', 9, 'delete_addsubcategory'),
(36, 'Can view addsubcategory', 9, 'view_addsubcategory'),
(37, 'Can add menu', 10, 'add_menu'),
(38, 'Can change menu', 10, 'change_menu'),
(39, 'Can delete menu', 10, 'delete_menu'),
(40, 'Can view menu', 10, 'view_menu'),
(41, 'Can add package', 11, 'add_package'),
(42, 'Can change package', 11, 'change_package'),
(43, 'Can delete package', 11, 'delete_package'),
(44, 'Can view package', 11, 'view_package');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'djapp', 'userregister'),
(8, 'myadmin', 'addcategory'),
(9, 'myadmin', 'addsubcategory'),
(10, 'myadmin', 'menu'),
(11, 'myadmin', 'package'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-04-04 18:30:03.327982'),
(2, 'auth', '0001_initial', '2019-04-04 18:30:11.777973'),
(3, 'admin', '0001_initial', '2019-04-04 18:30:13.617394'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-04-04 18:30:13.702773'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-04 18:30:13.780596'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-04-04 18:30:14.764245'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-04-04 18:30:14.880688'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-04-04 18:30:15.021589'),
(9, 'auth', '0004_alter_user_username_opts', '2019-04-04 18:30:15.079542'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-04-04 18:30:15.642788'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-04-04 18:30:15.675582'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-04 18:30:15.720213'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-04-04 18:30:15.833826'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-04 18:30:15.949924'),
(15, 'djapp', '0001_initial', '2019-04-04 18:30:16.264167'),
(16, 'djapp', '0002_auto_20190404_1802', '2019-04-04 18:30:16.879869'),
(17, 'sessions', '0001_initial', '2019-04-04 18:30:17.418926'),
(18, 'djapp', '0003_auto_20190404_1831', '2019-04-04 18:31:32.171837'),
(19, 'myadmin', '0001_initial', '2019-04-09 07:44:11.080929'),
(20, 'myadmin', '0002_addsubcategory', '2019-04-10 12:36:22.208102'),
(21, 'myadmin', '0003_menu_package', '2019-04-18 12:21:25.937294');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ds4cxtqlqkgu1ojzautjrxti050fnwh6', 'MmUxZDJiMTVhOWRhM2MwNWI4MGNjNWYwMjM1ZjM4MmYzZThhMzhjMDp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==', '2019-05-03 12:10:06.321953');

-- --------------------------------------------------------

--
-- Table structure for table `djapp_userregister`
--

CREATE TABLE `djapp_userregister` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(20) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(10) NOT NULL,
  `user_contact` varchar(20) NOT NULL,
  `user_dob` varchar(20) NOT NULL,
  `city_id` varchar(10) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `user_address` varchar(1000) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `djapp_userregister`
--

INSERT INTO `djapp_userregister` (`user_id`, `user_fullname`, `user_email`, `user_password`, `user_contact`, `user_dob`, `city_id`, `gender`, `user_address`, `role`, `status`) VALUES
(5, 'hitesh', 'hiteshgour0@gmail.com', '105463', '9584673606', '12/08/1996', 'bhopal', 'male', '43 bhel nagar ayodhya bypass road bhopal', 'admin', 1),
(7, 'shiv', 'shiv@gmail.com', '180', '9789127689', '2019-04-02', 'required', 'male', '34 rajat nagar \r\nbhipal', 'user', 1),
(10, 'rohan', 'rohan12@gmail.com', '1212', '1223221341', '1992-05-18', 'Bhopal', 'male', '12 roshanpura \r\n', 'user', 1),
(15, 'swati ', 'swatisahu1395@gmail.com', '098098', '6756764423', '1995-08-13', 'Bhopal', 'female', 'indrepuri\r\n', 'user', 0),
(16, 'ashish', 'sharmaashish8804@gmail.com', '3434', '7687899867', '2019-04-07', 'Indore', 'male', '43 ghyjhc', 'user', 0),
(18, 'amulya', 'amulyapatel45@gmail.com', '4545', '6574532345', '1996-10-10', 'Bhopal', 'female', '34 3fddf', 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_addcategory`
--

CREATE TABLE `myadmin_addcategory` (
  `catid` int(11) NOT NULL,
  `catnm` varchar(50) NOT NULL,
  `caticon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_addcategory`
--

INSERT INTO `myadmin_addcategory` (`catid`, `catnm`, `caticon`) VALUES
(16, 'indian', '2.jpeg'),
(19, 'thai food', '5.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_addsubcategory`
--

CREATE TABLE `myadmin_addsubcategory` (
  `subcatid` int(11) NOT NULL,
  `catnm` varchar(50) NOT NULL,
  `subcatnm` varchar(50) NOT NULL,
  `subcaticon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_addsubcategory`
--

INSERT INTO `myadmin_addsubcategory` (`subcatid`, `catnm`, `subcatnm`, `subcaticon`) VALUES
(2, 'indian', 'punjabi', '1.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_menu`
--

CREATE TABLE `myadmin_menu` (
  `menuid` int(11) NOT NULL,
  `menunm` varchar(50) NOT NULL,
  `menuprice` int(11) NOT NULL,
  `menudiscription` varchar(50) NOT NULL,
  `menuimg` varchar(100) NOT NULL,
  `menucat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_menu`
--

INSERT INTO `myadmin_menu` (`menuid`, `menunm`, `menuprice`, `menudiscription`, `menuimg`, `menucat`) VALUES
(2, 'dal roti', 20, 'Roti dal salid papad', '3_KOEiToo.jpeg', 'lunch'),
(3, 'adfa', 445, 'fsdfsdfsdfsf', '5_gSjk3KW.jpeg', 'break');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_package`
--

CREATE TABLE `myadmin_package` (
  `packid` int(11) NOT NULL,
  `packnm` varchar(50) NOT NULL,
  `packprice` int(11) NOT NULL,
  `packdiscription` varchar(50) NOT NULL,
  `packimg` varchar(100) NOT NULL,
  `packduration` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_package`
--

INSERT INTO `myadmin_package` (`packid`, `packnm`, `packprice`, `packdiscription`, `packimg`, `packduration`) VALUES
(2, 'special thali', 45, 'roti chaval paneer dal paratha', '6.jpeg', '6 month');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `djapp_userregister`
--
ALTER TABLE `djapp_userregister`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `myadmin_addcategory`
--
ALTER TABLE `myadmin_addcategory`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `myadmin_addsubcategory`
--
ALTER TABLE `myadmin_addsubcategory`
  ADD PRIMARY KEY (`subcatid`);

--
-- Indexes for table `myadmin_menu`
--
ALTER TABLE `myadmin_menu`
  ADD PRIMARY KEY (`menuid`);

--
-- Indexes for table `myadmin_package`
--
ALTER TABLE `myadmin_package`
  ADD PRIMARY KEY (`packid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `djapp_userregister`
--
ALTER TABLE `djapp_userregister`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `myadmin_addcategory`
--
ALTER TABLE `myadmin_addcategory`
  MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `myadmin_addsubcategory`
--
ALTER TABLE `myadmin_addsubcategory`
  MODIFY `subcatid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `myadmin_menu`
--
ALTER TABLE `myadmin_menu`
  MODIFY `menuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `myadmin_package`
--
ALTER TABLE `myadmin_package`
  MODIFY `packid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 04 2026 г., 06:36
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mysitedb`
--
CREATE DATABASE IF NOT EXISTS `mysitedb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mysitedb`;

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id` int(6) NOT NULL,
  `login` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `rights` enum('u','a') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `login`, `password`, `rights`) VALUES
(1, 'admin', 'admin', 'a'),
(2, 'user1', 'pass1', 'u'),
(3, 'user2', 'pass2', 'u'),
(4, 'editor', 'edit123', 'u'),
(5, 'guest', 'guest', 'u');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(6) NOT NULL,
  `created` date NOT NULL,
  `author_id` int(6) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `art_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `created`, `author_id`, `comment`, `art_id`) VALUES
(1, '2024-10-02', 2, 'Очень интересный рассказ о Риме!', 1),
(2, '2024-10-06', 3, 'Париж прекрасен в любое время года.', 2),
(3, '2024-10-11', 4, 'Берлин впечатляет своей историей.', 3),
(4, '2024-10-16', 5, 'Прага выглядит просто сказочно.', 4),
(5, '2024-10-21', 2, 'Барселона — отличный выбор для отдыха.', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `id` int(6) NOT NULL,
  `created` date NOT NULL,
  `title` varchar(20) NOT NULL,
  `article` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`id`, `created`, `title`, `article`) VALUES
(1, '2024-10-01', 'Поездка в Рим', 'Описание путешествия в Рим и посещение Колизея.'),
(2, '2024-10-05', 'Париж', 'Эйфелева башня, Лувр и прогулки по Сене.'),
(3, '2024-10-10', 'Берлин', 'Исторические места и современная архитектура.'),
(4, '2024-10-15', 'Прага', 'Старый город и Карлов мост.');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `art_id` (`art_id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);
--
-- База данных: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Структура таблицы `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Дамп данных таблицы `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Дамп данных таблицы `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"sellular_shop\",\"table\":\"employees\"},{\"db\":\"mysql\",\"table\":\"user\"},{\"db\":\"sellular_shop\",\"table\":\"vw_sales_by_employee\"},{\"db\":\"sellular_shop\",\"table\":\"vw_service_revenue\"},{\"db\":\"sellular_shop\",\"table\":\"vw_report\"},{\"db\":\"sellular_shop\",\"table\":\"vw_product_revenue\"},{\"db\":\"sellular_shop\",\"table\":\"vw_products_in_stock\"},{\"db\":\"sellular_shop\",\"table\":\"vw_daily_sales\"},{\"db\":\"sellular_shop\",\"table\":\"vw_active_employees\"},{\"db\":\"sellular_shop\",\"table\":\"vw_active_services\"}]');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Дамп данных таблицы `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('mysitedb', 'comments', 'comment'),
('sellular_shop', 'products', 'name');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Дамп данных таблицы `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-02-04 05:36:48', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"ru\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Структура таблицы `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Индексы таблицы `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Индексы таблицы `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Индексы таблицы `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Индексы таблицы `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Индексы таблицы `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Индексы таблицы `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Индексы таблицы `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Индексы таблицы `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Индексы таблицы `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Индексы таблицы `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Индексы таблицы `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Индексы таблицы `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Индексы таблицы `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- База данных: `sellular_shop`
--
CREATE DATABASE IF NOT EXISTS `sellular_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sellular_shop`;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Смартфоны'),
(2, 'Аксессуары'),
(3, 'Планшеты'),
(4, 'Смарт-часы'),
(5, 'SIM-карты');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `client_id` bigint(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `patronymic` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registration_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`client_id`, `last_name`, `first_name`, `patronymic`, `birth_date`, `phone`, `email`, `registration_date`) VALUES
(1, 'Смирнов', 'Алексей', 'Игоревич', '1995-04-10', '79990000001', 's1@mail.ru', '2024-01-10 00:00:00'),
(2, 'Орлов', 'Максим', 'Андреевич', '1990-08-20', '79990000002', 's2@mail.ru', '2024-01-15 00:00:00'),
(3, 'Козлова', 'Мария', 'Сергеевна', '1998-03-05', '79990000003', 's3@mail.ru', '2024-02-01 00:00:00'),
(4, 'Волков', 'Илья', 'Петрович', '1988-11-30', '79990000004', 's4@mail.ru', '2024-02-12 00:00:00'),
(5, 'Фёдорова', 'Екатерина', 'Олеговна', '1997-06-18', '79990000005', 's5@mail.ru', '2024-03-01 00:00:00'),
(6, 'Зайцев', 'Роман', 'Викторович', '1992-09-09', '79990000006', 's6@mail.ru', '2024-03-05 00:00:00'),
(7, 'Никитина', 'Дарья', 'Игоревна', '2000-01-14', '79990000007', 's7@mail.ru', '2024-03-10 00:00:00'),
(8, 'Комаров', 'Павел', 'Юрьевич', '1985-12-22', '79990000008', 's8@mail.ru', '2024-03-18 00:00:00'),
(9, 'Беляева', 'Юлия', 'Романовна', '1996-07-07', '79990000009', 's9@mail.ru', '2024-03-20 00:00:00'),
(10, 'Тарасов', 'Евгений', 'Михайлович', '1991-05-01', '79990000010', 's10@mail.ru', '2024-03-25 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `contracts`
--

CREATE TABLE `contracts` (
  `contract_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `contract_date` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `contracts`
--

INSERT INTO `contracts` (`contract_id`, `client_id`, `service_id`, `phone_number`, `contract_date`, `status`) VALUES
(1, 1, 1, '79991111111', '2024-04-01', 'active'),
(2, 2, 2, '79992222222', '2024-04-01', 'active'),
(3, 3, 1, '79993333333', '2024-04-02', 'active'),
(4, 4, 5, '79994444444', '2024-04-03', 'closed'),
(5, 5, 2, '79995555555', '2024-04-03', 'active');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `employee_id` bigint(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `position` enum('Менеджер','Старший менеджер','Администратор') NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `hire_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`employee_id`, `last_name`, `first_name`, `position`, `phone`, `email`, `login`, `password_hash`, `hire_date`, `is_active`) VALUES
(1, 'Гладовский', 'Илья', 'Администратор', '79001000001', 'gladovskij@sale.ru', 'admin', 'AdminHash', '2020-01-09', 1),
(2, 'Петров', 'Антон', 'Менеджер', '79001000002', 'petrov@sale.ru', 'petrov', '$2y$10$5sOY299nraApbe9DA1aT8u9Ti3i5xO2CLPZ54uBMIDuZcf9/Nfbma', '2023-03-12', 1),
(3, 'Сидорова', 'Ольга', 'Менеджер', '79001000003', 'sidorova@sale.ru', 'sidorova', 'hash3', '2022-11-01', 1),
(4, 'Кузнецов', 'Дмитрий', 'Менеджер', '79001000004', 'kuznetsov@sale.ru', 'kuzn', 'hash4', '2024-02-01', 1),
(5, 'Морозова', 'Анна', 'Менеджер', '79001000005', 'morozova@sale.ru', 'moroz', 'hash5', '2023-07-15', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_category` bigint(20) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `name`, `id_category`, `brand`, `price`, `quantity`, `imei`, `is_active`) VALUES
(1, 'iPhone 13', 1, 'Apple', 69990.00, 5, '111111111111111', 1),
(2, 'Galaxy S22', 1, 'Samsung', 64990.00, 4, '222222222222222', 1),
(3, 'Redmi Note 12', 1, 'Xiaomi', 24990.00, 6, '333333333333333', 1),
(4, 'iPad 10', 3, 'Apple', 45990.00, 3, '444444444444444', 1),
(5, 'Galaxy Tab A8', 3, 'Samsung', 32990.00, 3, '555555555555555', 1),
(6, 'Apple Watch SE', 4, 'Apple', 27990.00, 4, '666666666666666', 1),
(7, 'Mi Band 7', 4, 'Xiaomi', 3990.00, 10, '777777777777777', 1),
(8, 'Чехол силиконовый', 2, 'NoName', 990.00, 20, NULL, 1),
(9, 'Зарядка USB-C', 2, 'Baseus', 1990.00, 15, NULL, 1),
(10, 'SIM-карта', 5, 'Оператор', 300.00, 50, NULL, 1);

--
-- Триггеры `products`
--
DELIMITER $$
CREATE TRIGGER `trg_products_no_negative_quantity` BEFORE UPDATE ON `products` FOR EACH ROW IF NEW.quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Остаток товара не может быть отрицательным';
    END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `sale_id` bigint(20) NOT NULL,
  `sale_date` datetime DEFAULT current_timestamp(),
  `employee_id` bigint(20) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_date`, `employee_id`, `client_id`, `total_amount`, `payment_type`) VALUES
(1, '2024-04-01 00:00:00', 1, 1, 70290.00, 'card'),
(2, '2024-04-01 00:00:00', 2, 2, 24990.00, 'cash'),
(3, '2024-04-02 00:00:00', 3, 3, 45990.00, 'card'),
(4, '2024-04-02 00:00:00', 1, 4, 64990.00, 'card'),
(5, '2024-04-03 00:00:00', 4, 5, 27990.00, 'cash'),
(6, '2024-04-03 00:00:00', 5, 6, 9990.00, 'card'),
(7, '2024-04-04 00:00:00', 2, 7, 32990.00, 'card'),
(8, '2024-04-04 00:00:00', 3, 8, 3990.00, 'cash'),
(9, '2024-04-05 00:00:00', 1, 9, 69990.00, 'card'),
(10, '2024-04-05 00:00:00', 4, 10, 1990.00, 'cash');

--
-- Триггеры `sales`
--
DELIMITER $$
CREATE TRIGGER `trg_sales_check_employee` BEFORE INSERT ON `sales` FOR EACH ROW IF NOT EXISTS (
        SELECT 1
        FROM employees
        WHERE employee_id = NEW.employee_id
          AND is_active = 1
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Продажу не может оформить неактивный сотрудник';
    END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `sale_items`
--

CREATE TABLE `sale_items` (
  `sale_item_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  `item_type` enum('PRODUCT','SERVICE') NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ;

--
-- Дамп данных таблицы `sale_items`
--

INSERT INTO `sale_items` (`sale_item_id`, `sale_id`, `item_type`, `product_id`, `service_id`, `quantity`, `price`) VALUES
(1, 1, 'PRODUCT', 1, NULL, 1, 69990.00),
(2, 1, 'SERVICE', NULL, 4, 1, 300.00),
(3, 2, 'PRODUCT', 3, NULL, 1, 24990.00),
(4, 3, 'PRODUCT', 4, NULL, 1, 45990.00),
(5, 4, 'PRODUCT', 2, NULL, 1, 64990.00),
(6, 5, 'PRODUCT', 6, NULL, 1, 27990.00),
(7, 6, 'SERVICE', NULL, 3, 1, 9990.00),
(8, 7, 'PRODUCT', 5, NULL, 1, 32990.00),
(9, 8, 'PRODUCT', 7, NULL, 1, 3990.00),
(10, 9, 'PRODUCT', 1, NULL, 1, 69990.00);

--
-- Триггеры `sale_items`
--
DELIMITER $$
CREATE TRIGGER `trg_sale_items_check_service` BEFORE INSERT ON `sale_items` FOR EACH ROW IF NEW.item_type = 'SERVICE' THEN
        IF NOT EXISTS (
            SELECT 1
            FROM services
            WHERE service_id = NEW.service_id
              AND is_active = 1
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Нельзя добавить неактивную услугу';
        END IF;
    END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_sale_total_after_delete` AFTER DELETE ON `sale_items` FOR EACH ROW UPDATE sales
    SET total_amount = IFNULL((
        SELECT SUM(quantity * price)
        FROM sale_items
        WHERE sale_id = OLD.sale_id
    ), 0)
    WHERE sale_id = OLD.sale_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_sale_total_after_insert` AFTER INSERT ON `sale_items` FOR EACH ROW UPDATE sales
SET total_amount =
    (SELECT IFNULL(SUM(price * quantity),0)
     FROM sale_items
     WHERE sale_id = NEW.sale_id)
WHERE sale_id = NEW.sale_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `service_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `monthly_fee` decimal(10,2) NOT NULL,
  `connection_fee` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`service_id`, `name`, `description`, `monthly_fee`, `connection_fee`, `is_active`) VALUES
(1, 'Тариф Базовый', 'Связь и интернет', 500.00, 300.00, 1),
(2, 'Тариф Безлимит', 'Безлимитный интернет', 900.00, 300.00, 1),
(3, 'Подключение eSIM', 'Активация eSIM', 0.00, 500.00, 1),
(4, 'Настройка смартфона', 'Перенос данных', 0.00, 1000.00, 1),
(5, 'Страховка устройства', 'Годовая защита', 300.00, 0.00, 1);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_active_employees`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_active_employees` (
`employee_id` bigint(20)
,`last_name` varchar(50)
,`first_name` varchar(50)
,`position` enum('Менеджер','Старший менеджер','Администратор')
,`phone` varchar(20)
,`email` varchar(100)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_active_services`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_active_services` (
`service_id` bigint(20)
,`name` varchar(100)
,`monthly_fee` decimal(10,2)
,`connection_fee` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_average_receipt_monthly`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_average_receipt_monthly` (
`sale_month` varchar(7)
,`average_receipt` decimal(13,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_daily_sales`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_daily_sales` (
`sale_day` date
,`sales_count` bigint(21)
,`total_amount` decimal(34,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_products_in_stock`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_products_in_stock` (
`product_id` bigint(20)
,`name` varchar(100)
,`brand` varchar(50)
,`price` decimal(10,2)
,`quantity` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_product_revenue`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_product_revenue` (
`product_id` bigint(20)
,`name` varchar(100)
,`revenue` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_report`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_report` (
`sale_id` bigint(20)
,`sale_date` datetime
,`employee_name` varchar(101)
,`client_name` varchar(101)
,`item_type` enum('PRODUCT','SERVICE')
,`item_name` varchar(100)
,`quantity` int(11)
,`price` decimal(10,2)
,`item_total` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_sales_by_employee`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_sales_by_employee` (
`employee_id` bigint(20)
,`last_name` varchar(50)
,`first_name` varchar(50)
,`sales_count` bigint(21)
,`sales_amount` decimal(34,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_sales_products`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_sales_products` (
`sale_id` bigint(20)
,`sale_date` datetime
,`sale_day` date
,`sale_month` varchar(7)
,`product_id` bigint(20)
,`product_name` varchar(100)
,`brand` varchar(50)
,`quantity_sold` int(11)
,`price` decimal(10,2)
,`total_amount` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_sales_services`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_sales_services` (
`sale_id` bigint(20)
,`sale_date` datetime
,`sale_day` date
,`sale_month` varchar(7)
,`service_id` bigint(20)
,`service_name` varchar(100)
,`quantity_sold` int(1)
,`price` decimal(10,2)
,`total_amount` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_service_revenue`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_service_revenue` (
`service_id` bigint(20)
,`name` varchar(100)
,`revenue` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Структура для представления `vw_active_employees`
--
DROP TABLE IF EXISTS `vw_active_employees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_active_employees`  AS SELECT `employees`.`employee_id` AS `employee_id`, `employees`.`last_name` AS `last_name`, `employees`.`first_name` AS `first_name`, `employees`.`position` AS `position`, `employees`.`phone` AS `phone`, `employees`.`email` AS `email` FROM `employees` WHERE `employees`.`is_active` = 1 ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_active_services`
--
DROP TABLE IF EXISTS `vw_active_services`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_active_services`  AS SELECT `services`.`service_id` AS `service_id`, `services`.`name` AS `name`, `services`.`monthly_fee` AS `monthly_fee`, `services`.`connection_fee` AS `connection_fee` FROM `services` WHERE `services`.`is_active` = 1 ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_average_receipt_monthly`
--
DROP TABLE IF EXISTS `vw_average_receipt_monthly`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_average_receipt_monthly`  AS SELECT date_format(`sales`.`sale_date`,'%Y-%m') AS `sale_month`, round(avg(`sales`.`total_amount`),2) AS `average_receipt` FROM `sales` GROUP BY date_format(`sales`.`sale_date`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_daily_sales`
--
DROP TABLE IF EXISTS `vw_daily_sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_daily_sales`  AS SELECT cast(`sales`.`sale_date` as date) AS `sale_day`, count(0) AS `sales_count`, sum(`sales`.`total_amount`) AS `total_amount` FROM `sales` GROUP BY cast(`sales`.`sale_date` as date) ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_products_in_stock`
--
DROP TABLE IF EXISTS `vw_products_in_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_products_in_stock`  AS SELECT `products`.`product_id` AS `product_id`, `products`.`name` AS `name`, `products`.`brand` AS `brand`, `products`.`price` AS `price`, `products`.`quantity` AS `quantity` FROM `products` WHERE `products`.`is_active` = 1 AND `products`.`quantity` > 0 ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_product_revenue`
--
DROP TABLE IF EXISTS `vw_product_revenue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_product_revenue`  AS SELECT `p`.`product_id` AS `product_id`, `p`.`name` AS `name`, sum(`si`.`price` * `si`.`quantity`) AS `revenue` FROM (`sale_items` `si` join `products` `p` on(`p`.`product_id` = `si`.`product_id`)) WHERE `si`.`item_type` = 'PRODUCT' GROUP BY `p`.`product_id`, `p`.`name` ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_report`
--
DROP TABLE IF EXISTS `vw_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_report`  AS SELECT `s`.`sale_id` AS `sale_id`, `s`.`sale_date` AS `sale_date`, concat(`e`.`last_name`,' ',`e`.`first_name`) AS `employee_name`, concat(`c`.`last_name`,' ',`c`.`first_name`) AS `client_name`, `si`.`item_type` AS `item_type`, coalesce(`p`.`name`,`sv`.`name`) AS `item_name`, `si`.`quantity` AS `quantity`, `si`.`price` AS `price`, `si`.`quantity`* `si`.`price` AS `item_total` FROM (((((`sales` `s` join `sale_items` `si` on(`si`.`sale_id` = `s`.`sale_id`)) join `employees` `e` on(`e`.`employee_id` = `s`.`employee_id`)) left join `clients` `c` on(`c`.`client_id` = `s`.`client_id`)) left join `products` `p` on(`p`.`product_id` = `si`.`product_id`)) left join `services` `sv` on(`sv`.`service_id` = `si`.`service_id`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_sales_by_employee`
--
DROP TABLE IF EXISTS `vw_sales_by_employee`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sales_by_employee`  AS SELECT `e`.`employee_id` AS `employee_id`, `e`.`last_name` AS `last_name`, `e`.`first_name` AS `first_name`, count(`s`.`sale_id`) AS `sales_count`, sum(`s`.`total_amount`) AS `sales_amount` FROM (`employees` `e` left join `sales` `s` on(`s`.`employee_id` = `e`.`employee_id`)) GROUP BY `e`.`employee_id`, `e`.`last_name`, `e`.`first_name` ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_sales_products`
--
DROP TABLE IF EXISTS `vw_sales_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sales_products`  AS SELECT `si`.`sale_id` AS `sale_id`, `s`.`sale_date` AS `sale_date`, cast(`s`.`sale_date` as date) AS `sale_day`, date_format(`s`.`sale_date`,'%Y-%m') AS `sale_month`, `p`.`product_id` AS `product_id`, `p`.`name` AS `product_name`, `p`.`brand` AS `brand`, `si`.`quantity` AS `quantity_sold`, `si`.`price` AS `price`, `si`.`quantity`* `si`.`price` AS `total_amount` FROM ((`sale_items` `si` join `sales` `s` on(`s`.`sale_id` = `si`.`sale_id`)) join `products` `p` on(`p`.`product_id` = `si`.`product_id`)) WHERE `si`.`item_type` = 'product' ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_sales_services`
--
DROP TABLE IF EXISTS `vw_sales_services`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sales_services`  AS SELECT `si`.`sale_id` AS `sale_id`, `s`.`sale_date` AS `sale_date`, cast(`s`.`sale_date` as date) AS `sale_day`, date_format(`s`.`sale_date`,'%Y-%m') AS `sale_month`, `sv`.`service_id` AS `service_id`, `sv`.`name` AS `service_name`, 1 AS `quantity_sold`, `si`.`price` AS `price`, `si`.`price` AS `total_amount` FROM ((`sale_items` `si` join `sales` `s` on(`s`.`sale_id` = `si`.`sale_id`)) join `services` `sv` on(`sv`.`service_id` = `si`.`service_id`)) WHERE `si`.`item_type` = 'service' ;

-- --------------------------------------------------------

--
-- Структура для представления `vw_service_revenue`
--
DROP TABLE IF EXISTS `vw_service_revenue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_service_revenue`  AS SELECT `sv`.`service_id` AS `service_id`, `sv`.`name` AS `name`, sum(`si`.`price` * `si`.`quantity`) AS `revenue` FROM (`sale_items` `si` join `services` `sv` on(`sv`.`service_id` = `si`.`service_id`)) WHERE `si`.`item_type` = 'SERVICE' GROUP BY `sv`.`service_id`, `sv`.`name` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Индексы таблицы `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`sale_item_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `contracts`
--
ALTER TABLE `contracts`
  MODIFY `contract_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `service_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);

--
-- Ограничения внешнего ключа таблицы `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `sale_items_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);
--
-- База данных: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 17 2018 г., 20:31
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dnd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `stuff`
--
-- Создание: Дек 17 2018 г., 10:04
-- Последнее обновление: Дек 17 2018 г., 17:31
--

DROP TABLE IF EXISTS `stuff`;
CREATE TABLE `stuff` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL DEFAULT '1',
  `icon` varchar(100) NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stuff`
--

INSERT INTO `stuff` (`id`, `category_id`, `name`, `class_id`, `icon`) VALUES
(1, 1, 'Перчатки легкие', 2, 'ra-hand'),
(2, 1, 'Перчатки средние', 3, 'ra-hand'),
(3, 1, 'Перчатки тяжелые', 4, 'ra-hand'),
(4, 1, 'Перчатки небоевые', 10, 'ra-hand'),
(5, 2, 'Обувь легкая', 2, 'ra-boot-stomp'),
(6, 2, 'Обувь средняя', 3, 'ra-boot-stomp'),
(7, 2, 'Обувь тяжелая', 4, 'ra-boot-stomp'),
(8, 3, 'Пояс', 1, 'ra-capricorn'),
(9, 4, 'Головняк легкий', 2, 'ra-fedora'),
(10, 4, 'Головняк средний', 3, 'ra-helmet'),
(11, 4, 'Головняк тяжелый', 4, 'ra-knight-helmet'),
(12, 4, 'Головняк небоевой', 10, 'ra-crown'),
(13, 5, 'Торс легкий', 2, 'ra-vest'),
(14, 5, 'Торс средний', 3, 'ra-vest'),
(15, 5, 'Торс тяжелый', 4, 'ra-vest'),
(16, 33, 'Мантия', 1, 'ra-forward'),
(17, 33, 'Плащ', 1, 'ra-forward'),
(18, 33, 'Роба', 1, 'ra-forward'),
(19, 5, 'Торс небоевой', 10, 'ra-vest'),
(20, 7, 'Штаны легкие', 2, 'ra-alligator-clip'),
(21, 7, 'Штаны средние', 3, 'ra-alligator-clip'),
(22, 7, 'Штаны тяжелые', 4, 'ra-alligator-clip'),
(23, 7, 'Штаны небоевые', 10, 'ra-alligator-clip'),
(24, 8, 'Кольцо', 1, 'ra-fire-ring'),
(25, 8, 'Ожерелье', 1, 'ra-crown-of-thorns'),
(27, 8, 'Медальон', 1, 'ra-gem-pendant'),
(28, 8, 'Браслет', 1, 'ra-fluffy-swirl'),
(29, 8, 'Необычный (корона, подсвечник и т.д.)', 1, 'ra-uncertainty'),
(30, 9, 'Ограненный камень', 1, 'ra-sapphire'),
(31, 9, 'Неограненный камень', 1, 'ra-gem'),
(32, 9, 'Слиток', 1, 'ra-gold-bar'),
(34, 9, 'Руда', 1, 'ra-mining-diamonds'),
(35, 2, 'Обувь небоевая', 10, 'ra-boot-stomp'),
(36, 10, 'Полезный механизм маленький', 8, 'ra-clockwork'),
(38, 10, 'Полезный механизм среднего размера', 9, 'ra-cog'),
(39, 11, 'Зелье лечения мал', 8, 'ra-heart-bottle'),
(40, 11, 'Зелье лечения среднее', 9, 'ra-heart-bottle'),
(41, 11, 'Зелье лечения большое', 7, 'ra-heart-bottle'),
(42, 11, 'Зелье маны мал', 8, 'ra-bottled-bolt'),
(43, 11, 'Зелье маны среднее', 9, 'ra-bottled-bolt'),
(44, 11, 'Зелье маны большое', 7, 'ra-bottled-bolt'),
(45, 11, 'Зелье усталости', 8, 'ra-corked-tube'),
(46, 12, 'Противоядие', 1, 'ra-vial'),
(47, 11, 'Зелье необычное', 8, 'ra-round-bottom-flask'),
(48, 12, 'Снадобье', 1, 'ra-bubbling-potion'),
(49, 13, 'Алкоголь легкий', 2, 'ra-brandy-bottle'),
(50, 13, 'Алкоголь средний', 3, 'ra-brandy-bottle'),
(51, 13, 'Алкоголь крепкий', 4, 'ra-brandy-bottle'),
(52, 12, 'Травы', 1, 'ra-leaf'),
(53, 14, 'Деньги', 1, 'ra-spawn-node'),
(54, 16, 'Рубящее оружие одноручное', 5, 'ra-battered-axe'),
(55, 16, 'Рубящее оружие двуручное', 6, 'ra-axe'),
(56, 17, 'Молот одноручный', 5, 'ra-hammer'),
(57, 17, 'Молот двуручный', 6, 'ra-large-hammer'),
(87, 17, 'Булава', 1, 'ra-spiked-mace'),
(58, 17, 'Посох короткий', 5, 'ra-fairy-wand'),
(59, 17, 'Кастет', 5, 'ra-bullets'),
(60, 17, 'Посох средний двуручный', 6, 'ra-crystal-wand'),
(61, 17, 'Посох длинный двуручный', 6, 'ra-crystal-wand'),
(62, 18, 'Колющее одноручное', 5, 'ra-spear-head'),
(63, 18, 'Колющее двуручное', 6, 'ra-spear-head'),
(64, 18, 'Кинжал', 5, 'ra-plain-dagger'),
(65, 19, 'Режущее одноручное', 5, 'ra-sword'),
(66, 19, 'Режущее двуручное', 6, 'ra-relic-blade'),
(67, 19, 'Коса', 1, 'ra-scythe'),
(68, 20, 'Лук короткий', 11, 'ra-archer'),
(69, 20, 'Лук средний', 12, 'ra-archer'),
(70, 20, 'Лук длинный', 13, 'ra-archer'),
(71, 20, 'Арбалет', 1, 'ra-crossbow'),
(72, 21, 'Стрелы', 1, 'ra-arrow-cluster'),
(73, 21, 'Болты', 1, 'ra-broadhead-arrow'),
(74, 21, 'Улучшения для оружия', 1, 'ra-level-three-advanced'),
(75, 24, 'Щит одноручный', 5, 'ra-round-shield'),
(76, 24, 'Щит двуручный', 5, 'ra-shield'),
(77, 25, 'Инструмент одноручный', 5, 'ra-hand-saw'),
(78, 25, 'Инструмент двуручный', 5, 'ra-hand-saw'),
(79, 26, 'Книга немагическая', 1, 'ra-book'),
(80, 26, 'Книга магическая', 1, 'ra-book'),
(81, 27, 'Свиток опознания', 1, 'ra-scroll-unfurled'),
(82, 27, 'Свиток боевого заклинания', 1, 'ra-scroll-unfurled'),
(83, 27, 'Свиток небоевого заклинания', 1, 'ra-scroll-unfurled'),
(84, 30, 'Письмо или записка', 1, 'ra-uncertainty'),
(85, 31, 'Факелы', 1, 'ra-torch'),
(86, 32, 'Компоненты ', 1, 'ra-triforce');

-- --------------------------------------------------------

--
-- Структура таблицы `stuff_category`
--
-- Создание: Дек 17 2018 г., 10:04
-- Последнее обновление: Дек 17 2018 г., 10:04
--

DROP TABLE IF EXISTS `stuff_category`;
CREATE TABLE `stuff_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stuff_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stuff_category`
--

INSERT INTO `stuff_category` (`id`, `name`, `stuff_type_id`) VALUES
(1, 'Перчатки', 1),
(2, 'Обувь', 1),
(3, 'Пояс', 1),
(4, 'Головняк', 1),
(5, 'Торс', 1),
(7, 'Штаны', 1),
(8, 'Украшение', 5),
(9, 'Драгоценный камень / металл', 5),
(10, 'Полезный механизм', 5),
(11, 'Зелье', 3),
(12, 'Снадобье', 3),
(13, 'Алкоголь', 3),
(14, 'Деньги', 6),
(16, 'Рубящее', 2),
(17, 'Дробящее', 2),
(18, 'Колющее', 2),
(19, 'Режущее', 2),
(20, 'Дальнего боя', 2),
(21, 'Расходные материалы', 2),
(24, 'Щиты', 2),
(25, 'Инструмент', 2),
(26, 'Книга', 4),
(27, 'Свиток', 4),
(30, 'Письмо или записка', 4),
(31, 'Факелы', 6),
(32, 'Компоненты', 6),
(33, 'Торс маг', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `stuff_class`
--
-- Создание: Дек 17 2018 г., 09:58
-- Последнее обновление: Дек 17 2018 г., 10:01
--

DROP TABLE IF EXISTS `stuff_class`;
CREATE TABLE `stuff_class` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stuff_class`
--

INSERT INTO `stuff_class` (`id`, `name`) VALUES
(1, 'обычный'),
(2, 'легкий'),
(3, 'средний'),
(4, 'тяжелый'),
(5, 'одноручный'),
(6, 'двуручный'),
(7, 'большой'),
(8, 'маленький'),
(9, 'средний'),
(10, 'небоевой'),
(11, 'короткий'),
(12, 'средний по длине'),
(13, 'длинный');

-- --------------------------------------------------------

--
-- Структура таблицы `stuff_origin`
--
-- Создание: Дек 17 2018 г., 09:58
--

DROP TABLE IF EXISTS `stuff_origin`;
CREATE TABLE `stuff_origin` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stuff_rarity`
--
-- Создание: Дек 17 2018 г., 09:58
-- Последнее обновление: Дек 17 2018 г., 10:01
--

DROP TABLE IF EXISTS `stuff_rarity`;
CREATE TABLE `stuff_rarity` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stuff_rarity`
--

INSERT INTO `stuff_rarity` (`id`, `name`, `code`) VALUES
(1, 'Обычный', 'common'),
(2, 'Редкий', 'rare'),
(3, 'Эпический', 'epic'),
(4, 'Легендарный', 'legendary');

-- --------------------------------------------------------

--
-- Структура таблицы `stuff_type`
--
-- Создание: Дек 17 2018 г., 09:58
-- Последнее обновление: Дек 17 2018 г., 10:01
--

DROP TABLE IF EXISTS `stuff_type`;
CREATE TABLE `stuff_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stuff_type`
--

INSERT INTO `stuff_type` (`id`, `name`) VALUES
(1, 'Одежка'),
(2, 'Оружие'),
(3, 'Зелья и снадобья'),
(4, 'Книги и свитки'),
(5, 'Аксессуары'),
(6, 'Разное');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `stuff`
--
ALTER TABLE `stuff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Индексы таблицы `stuff_category`
--
ALTER TABLE `stuff_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stuff_type_id` (`stuff_type_id`);

--
-- Индексы таблицы `stuff_class`
--
ALTER TABLE `stuff_class`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stuff_origin`
--
ALTER TABLE `stuff_origin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stuff_rarity`
--
ALTER TABLE `stuff_rarity`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stuff_type`
--
ALTER TABLE `stuff_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `stuff`
--
ALTER TABLE `stuff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `stuff_category`
--
ALTER TABLE `stuff_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `stuff_class`
--
ALTER TABLE `stuff_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `stuff_origin`
--
ALTER TABLE `stuff_origin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `stuff_rarity`
--
ALTER TABLE `stuff_rarity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `stuff_type`
--
ALTER TABLE `stuff_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `stuff`
--
ALTER TABLE `stuff`
  ADD CONSTRAINT `stuff_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `stuff_category` (`id`),
  ADD CONSTRAINT `stuff_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `stuff_class` (`id`);

--
-- Ограничения внешнего ключа таблицы `stuff_category`
--
ALTER TABLE `stuff_category`
  ADD CONSTRAINT `stuff_category_ibfk_1` FOREIGN KEY (`stuff_type_id`) REFERENCES `stuff_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

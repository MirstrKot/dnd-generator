-- ----------------------------
-- Sequence structure for stuff_category_autoincrement
-- ----------------------------
DROP SEQUENCE IF EXISTS "stuff_category_autoincrement";
CREATE SEQUENCE "stuff_category_autoincrement" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for stuff_class_autoincrement
-- ----------------------------
DROP SEQUENCE IF EXISTS "stuff_class_autoincrement";
CREATE SEQUENCE "stuff_class_autoincrement" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for stuff_id_autoincrement
-- ----------------------------
DROP SEQUENCE IF EXISTS "stuff_id_autoincrement";
CREATE SEQUENCE "stuff_id_autoincrement" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for stuff_origin_autoincrement
-- ----------------------------
DROP SEQUENCE IF EXISTS "stuff_origin_autoincrement";
CREATE SEQUENCE "stuff_origin_autoincrement" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for stuff_rarity_autoincrement
-- ----------------------------
DROP SEQUENCE IF EXISTS "stuff_rarity_autoincrement";
CREATE SEQUENCE "stuff_rarity_autoincrement" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for stuff_type_autoincrement
-- ----------------------------
DROP SEQUENCE IF EXISTS "stuff_type_autoincrement";
CREATE SEQUENCE "stuff_type_autoincrement" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for stuff
-- ----------------------------
DROP TABLE IF EXISTS "stuff";
CREATE TABLE "stuff" (
  "id" int4 NOT NULL DEFAULT nextval('stuff_id_autoincrement'::regclass),
  "category_id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "class_id" int4 NOT NULL DEFAULT 1
)
;

-- ----------------------------
-- Records of stuff
-- ----------------------------
BEGIN;
INSERT INTO "stuff" VALUES (1, 1, 'Перчатки легкие', 2);
INSERT INTO "stuff" VALUES (3, 1, 'Перчатки тяжелые', 4);
INSERT INTO "stuff" VALUES (2, 1, 'Перчатки средние', 3);
INSERT INTO "stuff" VALUES (4, 1, 'Перчатки небоевые', 10);
INSERT INTO "stuff" VALUES (5, 2, 'Обувь легкая', 2);
INSERT INTO "stuff" VALUES (8, 3, 'Пояс', 1);
INSERT INTO "stuff" VALUES (67, 19, 'Коса', 1);
INSERT INTO "stuff" VALUES (6, 2, 'Обувь средняя', 3);
INSERT INTO "stuff" VALUES (7, 2, 'Обувь тяжелая', 4);
INSERT INTO "stuff" VALUES (10, 4, 'Головняк средний', 3);
INSERT INTO "stuff" VALUES (9, 4, 'Головняк легкий', 2);
INSERT INTO "stuff" VALUES (11, 4, 'Головняк тяжелый', 4);
INSERT INTO "stuff" VALUES (12, 4, 'Головняк небоевой', 10);
INSERT INTO "stuff" VALUES (13, 5, 'Торс легкий', 2);
INSERT INTO "stuff" VALUES (16, 33, 'Мантия', 1);
INSERT INTO "stuff" VALUES (14, 5, 'Торс средний', 3);
INSERT INTO "stuff" VALUES (15, 5, 'Торс тяжелый', 4);
INSERT INTO "stuff" VALUES (17, 33, 'Плащ', 1);
INSERT INTO "stuff" VALUES (18, 33, 'Роба', 1);
INSERT INTO "stuff" VALUES (19, 5, 'Торс небоевой', 10);
INSERT INTO "stuff" VALUES (20, 7, 'Штаны легкие', 2);
INSERT INTO "stuff" VALUES (21, 7, 'Штаны средние', 3);
INSERT INTO "stuff" VALUES (22, 7, 'Штаны тяжелые', 4);
INSERT INTO "stuff" VALUES (23, 7, 'Штаны небоевые', 10);
INSERT INTO "stuff" VALUES (24, 8, 'Кольцо', 1);
INSERT INTO "stuff" VALUES (25, 8, 'Ожерелье', 1);
INSERT INTO "stuff" VALUES (27, 8, 'Медальон', 1);
INSERT INTO "stuff" VALUES (28, 8, 'Браслет', 1);
INSERT INTO "stuff" VALUES (29, 8, 'Необычный (корона, подсвечник и т.д.)', 1);
INSERT INTO "stuff" VALUES (68, 20, 'Лук короткий', 11);
INSERT INTO "stuff" VALUES (32, 9, 'Слиток', 1);
INSERT INTO "stuff" VALUES (69, 20, 'Лук средний', 12);
INSERT INTO "stuff" VALUES (34, 9, 'Руда', 1);
INSERT INTO "stuff" VALUES (30, 9, 'Ограненный камень', 1);
INSERT INTO "stuff" VALUES (31, 9, 'Неограненный камень', 1);
INSERT INTO "stuff" VALUES (35, 2, 'Обувь небоевая', 10);
INSERT INTO "stuff" VALUES (36, 10, 'Полезный механизм маленький', 8);
INSERT INTO "stuff" VALUES (39, 11, 'Зелье лечения мал', 8);
INSERT INTO "stuff" VALUES (38, 10, 'Полезный механизм среднего размера', 9);
INSERT INTO "stuff" VALUES (40, 11, 'Зелье лечения среднее', 9);
INSERT INTO "stuff" VALUES (42, 11, 'Зелье маны мал', 8);
INSERT INTO "stuff" VALUES (41, 11, 'Зелье лечения большое', 7);
INSERT INTO "stuff" VALUES (43, 11, 'Зелье маны среднее', 9);
INSERT INTO "stuff" VALUES (44, 11, 'Зелье маны большое', 7);
INSERT INTO "stuff" VALUES (70, 20, 'Лук длинный', 13);
INSERT INTO "stuff" VALUES (48, 12, 'Снадобье', 1);
INSERT INTO "stuff" VALUES (45, 11, 'Зелье усталости', 8);
INSERT INTO "stuff" VALUES (47, 11, 'Зелье необычное', 8);
INSERT INTO "stuff" VALUES (46, 12, 'Противоядие', 1);
INSERT INTO "stuff" VALUES (49, 13, 'Алкоголь легкий', 2);
INSERT INTO "stuff" VALUES (52, 12, 'Травы', 1);
INSERT INTO "stuff" VALUES (50, 13, 'Алкоголь средний', 3);
INSERT INTO "stuff" VALUES (51, 13, 'Алкоголь тяжелый', 4);
INSERT INTO "stuff" VALUES (53, 14, 'Деньги', 1);
INSERT INTO "stuff" VALUES (71, 20, 'Арбалет', 1);
INSERT INTO "stuff" VALUES (54, 16, 'Рубящее оружие одноручное', 5);
INSERT INTO "stuff" VALUES (55, 16, 'Рубящее оружие двуручное', 6);
INSERT INTO "stuff" VALUES (56, 17, 'Молот одноручный', 5);
INSERT INTO "stuff" VALUES (59, 17, 'Кастет', 5);
INSERT INTO "stuff" VALUES (58, 17, 'Посох короткий', 5);
INSERT INTO "stuff" VALUES (72, 21, 'Стрелы', 1);
INSERT INTO "stuff" VALUES (57, 17, 'Молот двуручный', 6);
INSERT INTO "stuff" VALUES (73, 21, 'Болты', 1);
INSERT INTO "stuff" VALUES (74, 21, 'Улучшения для оружия', 1);
INSERT INTO "stuff" VALUES (60, 17, 'Посох средний двуручный', 6);
INSERT INTO "stuff" VALUES (61, 17, 'Посох длинный двуручный', 6);
INSERT INTO "stuff" VALUES (62, 18, 'Колющее одноручное', 5);
INSERT INTO "stuff" VALUES (64, 18, 'Кинжал', 5);
INSERT INTO "stuff" VALUES (63, 18, 'Колющее двуручное', 6);
INSERT INTO "stuff" VALUES (65, 19, 'Режущее одноручное', 5);
INSERT INTO "stuff" VALUES (66, 19, 'Режущее двуручное', 6);
INSERT INTO "stuff" VALUES (75, 24, 'Щит одноручный', 5);
INSERT INTO "stuff" VALUES (76, 24, 'Щит двуручный', 5);
INSERT INTO "stuff" VALUES (77, 25, 'Инструмент одноручный', 5);
INSERT INTO "stuff" VALUES (78, 25, 'Инструмент двуручный', 5);
INSERT INTO "stuff" VALUES (79, 26, 'Книга немагическая', 1);
INSERT INTO "stuff" VALUES (80, 26, 'Книга магическая', 1);
INSERT INTO "stuff" VALUES (81, 27, 'Свиток опознания', 1);
INSERT INTO "stuff" VALUES (84, 30, 'Письмо или записка', 1);
INSERT INTO "stuff" VALUES (85, 31, 'Факелы', 1);
INSERT INTO "stuff" VALUES (86, 32, 'Компоненты ', 1);
INSERT INTO "stuff" VALUES (82, 27, 'Свиток боевого заклинания', 1);
INSERT INTO "stuff" VALUES (83, 27, 'Свиток небоевого заклинания', 1);
COMMIT;

-- ----------------------------
-- Table structure for stuff_category
-- ----------------------------
DROP TABLE IF EXISTS "stuff_category";
CREATE TABLE "stuff_category" (
  "id" int4 NOT NULL DEFAULT nextval('stuff_category_autoincrement'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "stuff_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of stuff_category
-- ----------------------------
BEGIN;
INSERT INTO "stuff_category" VALUES (1, 'Перчатки', 1);
INSERT INTO "stuff_category" VALUES (2, 'Обувь', 1);
INSERT INTO "stuff_category" VALUES (3, 'Пояс', 1);
INSERT INTO "stuff_category" VALUES (4, 'Головняк', 1);
INSERT INTO "stuff_category" VALUES (7, 'Штаны', 1);
INSERT INTO "stuff_category" VALUES (8, 'Украшение', 5);
INSERT INTO "stuff_category" VALUES (14, 'Деньги', 6);
INSERT INTO "stuff_category" VALUES (16, 'Рубящее', 2);
INSERT INTO "stuff_category" VALUES (17, 'Дробящее', 2);
INSERT INTO "stuff_category" VALUES (18, 'Колющее', 2);
INSERT INTO "stuff_category" VALUES (19, 'Режущее', 2);
INSERT INTO "stuff_category" VALUES (20, 'Дальнего боя', 2);
INSERT INTO "stuff_category" VALUES (21, 'Расходные материалы', 2);
INSERT INTO "stuff_category" VALUES (24, 'Щиты', 2);
INSERT INTO "stuff_category" VALUES (25, 'Инструмент', 2);
INSERT INTO "stuff_category" VALUES (10, 'Полезный механизм', 5);
INSERT INTO "stuff_category" VALUES (26, 'Книга', 4);
INSERT INTO "stuff_category" VALUES (27, 'Свиток', 4);
INSERT INTO "stuff_category" VALUES (30, 'Письмо или записка', 4);
INSERT INTO "stuff_category" VALUES (31, 'Факелы', 6);
INSERT INTO "stuff_category" VALUES (32, 'Компоненты', 6);
INSERT INTO "stuff_category" VALUES (5, 'Торс', 1);
INSERT INTO "stuff_category" VALUES (33, 'Торс маг', 1);
INSERT INTO "stuff_category" VALUES (9, 'Драгоценный камень / металл', 5);
INSERT INTO "stuff_category" VALUES (11, 'Зелье', 3);
INSERT INTO "stuff_category" VALUES (12, 'Снадобье', 3);
INSERT INTO "stuff_category" VALUES (13, 'Алкоголь', 3);
COMMIT;

-- ----------------------------
-- Table structure for stuff_class
-- ----------------------------
DROP TABLE IF EXISTS "stuff_class";
CREATE TABLE "stuff_class" (
  "id" int4 NOT NULL DEFAULT nextval('stuff_class_autoincrement'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of stuff_class
-- ----------------------------
BEGIN;
INSERT INTO "stuff_class" VALUES (1, 'обычный');
INSERT INTO "stuff_class" VALUES (2, 'легкий');
INSERT INTO "stuff_class" VALUES (3, 'средний');
INSERT INTO "stuff_class" VALUES (4, 'тяжелый');
INSERT INTO "stuff_class" VALUES (5, 'одноручный');
INSERT INTO "stuff_class" VALUES (6, 'двуручный');
INSERT INTO "stuff_class" VALUES (10, 'небоевой');
INSERT INTO "stuff_class" VALUES (8, 'маленький');
INSERT INTO "stuff_class" VALUES (9, 'средний');
INSERT INTO "stuff_class" VALUES (7, 'большой');
INSERT INTO "stuff_class" VALUES (11, 'короткий');
INSERT INTO "stuff_class" VALUES (12, 'средний по длине');
INSERT INTO "stuff_class" VALUES (13, 'длинный');
COMMIT;

-- ----------------------------
-- Table structure for stuff_origin
-- ----------------------------
DROP TABLE IF EXISTS "stuff_origin";
CREATE TABLE "stuff_origin" (
  "id" int4 NOT NULL DEFAULT nextval('stuff_origin_autoincrement'::regclass)
)
;

-- ----------------------------
-- Table structure for stuff_rarity
-- ----------------------------
DROP TABLE IF EXISTS "stuff_rarity";
CREATE TABLE "stuff_rarity" (
  "id" int4 NOT NULL DEFAULT nextval('stuff_rarity_autoincrement'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of stuff_rarity
-- ----------------------------
BEGIN;
INSERT INTO "stuff_rarity" VALUES (1, 'Обычный', 'common');
INSERT INTO "stuff_rarity" VALUES (3, 'Эпический', 'epic');
INSERT INTO "stuff_rarity" VALUES (2, 'Редкий', 'rare');
INSERT INTO "stuff_rarity" VALUES (4, 'Легендарный', 'legendary');
COMMIT;

-- ----------------------------
-- Table structure for stuff_type
-- ----------------------------
DROP TABLE IF EXISTS "stuff_type";
CREATE TABLE "stuff_type" (
  "id" int4 NOT NULL DEFAULT nextval('stuff_type_autoincrement'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of stuff_type
-- ----------------------------
BEGIN;
INSERT INTO "stuff_type" VALUES (1, 'Одежка');
INSERT INTO "stuff_type" VALUES (2, 'Оружие');
INSERT INTO "stuff_type" VALUES (5, 'Аксессуары');
INSERT INTO "stuff_type" VALUES (4, 'Книги и свитки');
INSERT INTO "stuff_type" VALUES (3, 'Зелья и снадобья');
INSERT INTO "stuff_type" VALUES (6, 'Разное');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "stuff_category_autoincrement"
OWNED BY "stuff_category"."id";
SELECT setval('"stuff_category_autoincrement"', 34, true);
ALTER SEQUENCE "stuff_class_autoincrement"
OWNED BY "stuff_class"."id";
SELECT setval('"stuff_class_autoincrement"', 11, true);
ALTER SEQUENCE "stuff_id_autoincrement"
OWNED BY "stuff"."id";
SELECT setval('"stuff_id_autoincrement"', 87, true);
ALTER SEQUENCE "stuff_origin_autoincrement"
OWNED BY "stuff_origin"."id";
SELECT setval('"stuff_origin_autoincrement"', 2, false);
ALTER SEQUENCE "stuff_rarity_autoincrement"
OWNED BY "stuff_rarity"."id";
SELECT setval('"stuff_rarity_autoincrement"', 4, true);
ALTER SEQUENCE "stuff_type_autoincrement"
OWNED BY "stuff_type"."id";
SELECT setval('"stuff_type_autoincrement"', 7, true);

-- ----------------------------
-- Primary Key structure for table stuff
-- ----------------------------
ALTER TABLE "stuff" ADD CONSTRAINT "items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table stuff_category
-- ----------------------------
ALTER TABLE "stuff_category" ADD CONSTRAINT "stuff_category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table stuff_class
-- ----------------------------
ALTER TABLE "stuff_class" ADD CONSTRAINT "stuff_class_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table stuff_origin
-- ----------------------------
ALTER TABLE "stuff_origin" ADD CONSTRAINT "stuff_origin_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table stuff_rarity
-- ----------------------------
ALTER TABLE "stuff_rarity" ADD CONSTRAINT "stuff_rarity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table stuff_type
-- ----------------------------
ALTER TABLE "stuff_type" ADD CONSTRAINT "stuff_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table stuff
-- ----------------------------
ALTER TABLE "stuff" ADD CONSTRAINT "stuff_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "stuff_category" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE "stuff" ADD CONSTRAINT "stuff_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "stuff_class" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------
-- Foreign Keys structure for table stuff_category
-- ----------------------------
ALTER TABLE "stuff_category" ADD CONSTRAINT "stuff_category_stuff_type_id_fkey" FOREIGN KEY ("stuff_type_id") REFERENCES "stuff_type" ("id") ON DELETE RESTRICT ON UPDATE RESTRICT;

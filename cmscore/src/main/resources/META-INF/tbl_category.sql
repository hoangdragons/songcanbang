-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------


-- Dumping structure for table dolphin.tbl_category
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `CATEGORY_ID` bigint(11) unsigned NOT NULL,
  `CATEGORY_NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table dolphin.tbl_category: ~0 rows (approximately)
INSERT INTO `tbl_category` (`CATEGORY_ID`, `CATEGORY_NAME`, `DESCRIPTION`) VALUES
	(1, 'Giao tiếp\r\n', 'Giao tiếp, thuyết trình, thương lượng'),
	(2, 'Khám phá bản thân', 'Tư duy sáng tạo, MBTI, tâm lý học..'),
	(3, ' Kinh doanh - Khởi nghiệp', 'Bán hàng, kinh doanh, marketing..'),
	(4, 'Nuôi dạy con', 'Cách dạy con ngoan, con khỏe..'),
	(5, 'Công nghệ', 'Lập trình, photoshop, word, excel..'),
	(6, 'Nghệ thuật và Ngoại ngữ', 'Guitar, trang điểm, tiếng Anh..'),
	(7, 'Miễn phí', 'Nghệ thuật quyến rũ, tư duy lạc quan..');



--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_category CASCADE;
DROP SEQUENCE IF EXISTS category_id_seq CASCADE;

CREATE SEQUENCE category_id_seq START 1;
ALTER TABLE public.category_id_seq OWNER TO dolphin;

CREATE TABLE tbl_category (
		category_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('category_id_seq'),
		category_name VARCHAR(255),
		description VARCHAR(255)
	);

ALTER TABLE tbl_category OWNER TO "dolphin";

alter table tbl_category add column display_order integer;

--Data
INSERT INTO tbl_category (CATEGORY_NAME, DESCRIPTION) VALUES
	('Giao tiếp\r\n', 'Giao tiếp, thuyết trình, thương lượng'),
	('Khám phá bản thân', 'Tư duy sáng tạo, MBTI, tâm lý học..'),
	(' Kinh doanh - Khởi nghiệp', 'Bán hàng, kinh doanh, marketing..'),
	('Nuôi dạy con', 'Cách dạy con ngoan, con khỏe..'),
	('Công nghệ', 'Lập trình, photoshop, word, excel..'),
	('Nghệ thuật và Ngoại ngữ', 'Guitar, trang điểm, tiếng Anh..'),
	('Miễn phí', 'Nghệ thuật quyến rũ, tư duy lạc quan..');
alter table tbl_category alter column category_id type integer;
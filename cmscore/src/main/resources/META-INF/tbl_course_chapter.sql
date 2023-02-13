-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_course_chapter
DROP TABLE IF EXISTS `tbl_course_chapter`;
CREATE TABLE IF NOT EXISTS `tbl_course_chapter` (
  `COURSE_CHAPTER_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `COURSE_ID` bigint(20) unsigned NOT NULL,
  `CHAPTER_NAME` varchar(150) NOT NULL,
  `ORDER` int(10) unsigned NOT NULL,
  PRIMARY KEY (`COURSE_CHAPTER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `tbl_course_chapter` (`COURSE_CHAPTER_ID`, `COURSE_ID`, `CHAPTER_NAME`, `ORDER`) VALUES
	(1, 1, 'PHẦN 1: NỘI DUNG KHÓA HỌC', 1),
	(2, 1, 'PHẦN 2: BÀI TẬP CUỐI KHÓA', 2);


	
--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_course_chapter CASCADE;
DROP SEQUENCE IF EXISTS course_chapter_id_seq CASCADE;

CREATE SEQUENCE course_chapter_id_seq START 1;
ALTER TABLE public.course_chapter_id_seq OWNER TO dolphin;

CREATE TABLE tbl_course_chapter (
		course_chapter_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('course_chapter_id_seq'),
		chapter_name VARCHAR(255),
		course_id NUMERIC(19 , 2),
		"ORDER" INT4
	);

ALTER TABLE tbl_course_chapter OWNER TO "dolphin";

--Data
INSERT INTO tbl_course_chapter (COURSE_ID, CHAPTER_NAME, "ORDER") VALUES
	(1, 'PHẦN 1: NỘI DUNG KHÓA HỌC', 1),
	(1, 'PHẦN 2: BÀI TẬP CUỐI KHÓA', 2);
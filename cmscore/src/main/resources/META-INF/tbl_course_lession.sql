-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_course_lession
DROP TABLE IF EXISTS `tbl_course_lession`;
CREATE TABLE IF NOT EXISTS `tbl_course_lession` (
  `COURSE_LESSION_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `COURSE_CHAPTER_ID` bigint(20) unsigned NOT NULL,
  `LESSION_NAME` varchar(150) NOT NULL,
  `ORDER` int(11) NOT NULL,
  `VIDEO_URL` varchar(150) NOT NULL,
  PRIMARY KEY (`COURSE_LESSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table dolphin.tbl_course_lession: ~4 rows (approximately)
INSERT INTO `tbl_course_lession` (`COURSE_LESSION_ID`, `COURSE_CHAPTER_ID`, `LESSION_NAME`, `ORDER`, `VIDEO_URL`) VALUES
	(1, 1, 'Bài 1: Dẫn nhập', 1, 'https://www.youtube.com/watch?v=ENalJuNrq0o'),
	(2, 1, 'Bài 2: Thấu hiểu nhu cầu và khả năng học đọc của trẻ', 2, 'https://www.youtube.com/watch?v=NHoXVdPF3Yo'),
	(3, 2, 'Bài 3: Chuẩn bị học liệu cho trẻ', 1, 'https://www.youtube.com/watch?v=NHoXVdPF3Yo'),
	(4, 2, 'Bài 4: Các nguyên tắc khi dạy trẻ đọc', 2, 'https://www.youtube.com/watch?v=NHoXVdPF3Yo');

	
	
--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_course_lesson CASCADE;
DROP SEQUENCE IF EXISTS course_lesson_id_seq CASCADE;

CREATE SEQUENCE course_lesson_id_seq START 1;
ALTER TABLE public.course_lesson_id_seq OWNER TO dolphin;

CREATE TABLE tbl_course_lesson (
		course_lesson_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('course_lesson_id_seq'),
		lession_name VARCHAR(255),
		"ORDER" INT4,
		video_url VARCHAR(255),
		course_chapter_id NUMERIC(19 , 2)
	);

ALTER TABLE tbl_course_lesson OWNER TO "dolphin";

----Data
INSERT INTO tbl_course_lesson (COURSE_CHAPTER_ID, LESSION_NAME, "ORDER", VIDEO_URL) VALUES
	(1, 'Bài 1: Dẫn nhập', 1, 'https://www.youtube.com/watch?v=ENalJuNrq0o'),
	(1, 'Bài 2: Thấu hiểu nhu cầu và khả năng học đọc của trẻ', 2, 'https://www.youtube.com/watch?v=NHoXVdPF3Yo'),
	(2, 'Bài 3: Chuẩn bị học liệu cho trẻ', 1, 'https://www.youtube.com/watch?v=NHoXVdPF3Yo'),
	(2, 'Bài 4: Các nguyên tắc khi dạy trẻ đọc', 2, 'https://www.youtube.com/watch?v=NHoXVdPF3Yo');
	
	
alter table tbl_course_lesson add column lesson_desc character varying;
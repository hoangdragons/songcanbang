-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_bought_course
DROP TABLE IF EXISTS `tbl_bought_course`;

CREATE TABLE IF NOT EXISTS `tbl_bought_course` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) unsigned NOT NULL,
  `COURSE_ID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table dolphin.tbl_bought_course: ~0 rows (approximately)
INSERT INTO `tbl_bought_course` (`ID`, `USER_ID`, `COURSE_ID`) VALUES
	(1, 4, 1),
	(2, 4, 2),
	(3, 4, 3),
	(4, 4, 4),
	(5, 4, 5),
	(6, 4, 6);

	
	
--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_bought_course CASCADE;
DROP SEQUENCE IF EXISTS bought_course_id_seq CASCADE;

CREATE SEQUENCE bought_course_id_seq START 1;
ALTER TABLE public.bought_course_id_seq OWNER TO dolphin;

CREATE TABLE tbl_bought_course (
		id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('bought_course_id_seq'),
		user_id NUMERIC(19 , 2),
		course_id NUMERIC(19 , 2)
	);


ALTER TABLE tbl_bought_course OWNER TO "dolphin";

---Data
INSERT INTO tbl_bought_course (USER_ID, COURSE_ID) VALUES
	(4, 1),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6);
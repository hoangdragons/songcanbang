-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_course_comment
DROP TABLE IF EXISTS `tbl_course_comment`;
CREATE TABLE IF NOT EXISTS `tbl_course_comment` (
  `COMMENT_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_FULL_NAME` varchar(255) DEFAULT NULL,
  `AVATAR_URL` varchar(512) DEFAULT NULL,
  `COMMENT` text,
  `COMMENT_DATE` datetime DEFAULT NULL,
  `COURSE_ID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_course_comment CASCADE;
DROP SEQUENCE IF EXISTS comment_id_seq CASCADE;

CREATE SEQUENCE comment_id_seq START 1;
ALTER TABLE public.comment_id_seq OWNER TO dolphin;

CREATE TABLE tbl_course_comment (
		comment_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('comment_id_seq'),
		avatar_url VARCHAR(255),
		COMMENT TEXT,
		comment_date TIMESTAMP,
		course_id NUMERIC(19 , 2),
		user_full_name VARCHAR(255)
	);

ALTER TABLE tbl_course_comment OWNER TO "dolphin";
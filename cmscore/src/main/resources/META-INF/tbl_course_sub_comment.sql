-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_course_sub_comment
DROP TABLE IF EXISTS `tbl_course_sub_comment`;
CREATE TABLE IF NOT EXISTS `tbl_course_sub_comment` (
  `SUB_COMMENT_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `COMMENT_ID` bigint(20) unsigned NOT NULL,
  `USER_FULL_NAME` varchar(255) DEFAULT NULL,
  `AVATAR_URL` varchar(512) DEFAULT NULL,
  `COMMENT` text,
  `COMMENT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`SUB_COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_course_sub_comment CASCADE;
DROP SEQUENCE IF EXISTS sub_comment_id_seq CASCADE;

CREATE SEQUENCE sub_comment_id_seq START 1;
ALTER TABLE public.sub_comment_id_seq OWNER TO dolphin;

CREATE TABLE tbl_course_sub_comment (
		sub_comment_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('sub_comment_id_seq'),
		avatar_url VARCHAR(255),
		COMMENT TEXT,
		comment_date TIMESTAMP,
		user_full_name VARCHAR(255),
		comment_id NUMERIC(19 , 2)
	);
ALTER TABLE tbl_course_sub_comment OWNER TO "dolphin";
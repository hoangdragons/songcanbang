-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

-- Dumping structure for table dolphin.tbl_course_question
CREATE TABLE IF NOT EXISTS `tbl_course_question` (
  `QUESTION_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `COURSE_ID` bigint(20) unsigned NOT NULL,
  `USER_ID` bigint(20) unsigned NOT NULL,
  `QUESTION` text,
  `ANSWER` text,
  `QUESTION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_course_question CASCADE;
DROP SEQUENCE IF EXISTS question_id_seq CASCADE;

CREATE SEQUENCE question_id_seq START 1;
ALTER TABLE public.question_id_seq OWNER TO dolphin;

CREATE TABLE tbl_course_question (
		question_id NUMERIC(19 , 2) NOT NULL PRIMARY KEY DEFAULT nextval('question_id_seq'),
		answer TEXT,
		course_id NUMERIC(19 , 2),
		question TEXT,
		question_date TIMESTAMP,
		user_id NUMERIC(19 , 2)
	);
ALTER TABLE tbl_course_question OWNER TO "dolphin";

ALTER TABLE tbl_course_question add column description text;

ALTER TABLE TBL_COURSE_QUESTION ADD COLUMN ANSWER_USER_ID INTEGER;
ALTER TABLE TBL_COURSE_QUESTION ADD COLUMN ANSWER_USER_AVATA_URL CHARACTER VARYING(512);
ALTER TABLE TBL_COURSE_QUESTION ADD COLUMN ANSWER_USER_NAME CHARACTER VARYING(255);


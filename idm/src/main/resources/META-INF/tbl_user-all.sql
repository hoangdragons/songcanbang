/*
Navicat MySQL Data Transfer

Source Server         : Mriadb
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : dolphin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-07 20:25:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `USER_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(50) NOT NULL,
  `LOGIN_NAME` varchar(15) NOT NULL,
  `GROUP_ID` bigint(11) DEFAULT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `LANG_ID` varchar(2) DEFAULT NULL,
  `MAIN_ADDRESS` varchar(2048) DEFAULT NULL,
  `FACEBOOK_ID` varchar(512) DEFAULT NULL,
  `GOOGLE_ID` varchar(512) DEFAULT NULL,
  `TWITTER_ID` varchar(512) DEFAULT NULL,
  `CMTND` int(9) DEFAULT NULL,
  `CCCD` int(12) DEFAULT NULL,
  `MOBILE` int(10) DEFAULT NULL,
  `ADD_USER` bigint(11) DEFAULT NULL,
  `UPD_USER` bigint(11) DEFAULT NULL,
  `ADD_TIME` datetime DEFAULT NULL,
  `UPD_TIME` datetime DEFAULT NULL,
  `AVATA` blob,
  `SEX` tinyint(1) DEFAULT NULL,
  `OCCUPATION` varchar(512) DEFAULT NULL,
  `AVATA_URL` varchar(512) DEFAULT NULL,
  `ACTIVATE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'nghianv', '1', 'Nguyen Van Nghia', 'nghia.n.v2007@gmail.com', '090934547', '1975-12-22', 'vi', '111222333', null, null, null, '222', '111222', null, null, null, null, null, null, '1', '33332222', 'http://localhost:8080/images/Penguins.jpg', null);
INSERT INTO `tbl_user` VALUES ('2', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'trongnp', '1', 'Nguyen Phu Trong', 'nguyenphutrong@gmail.com', '9999999', '1975-12-22', 'vi', '66666', null, null, null, '666666', '6666', null, null, null, null, null, null, '0', '66666', 'http://localhost:8080/images/Koala.jpg', null);
INSERT INTO `tbl_user` VALUES ('3', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'trongnp2', '1', 'Nguyen Phu Trong', 'nguyenphutrong2@gmail.com', '9999999', '2016-10-26', 'vi', '55555', null, null, null, '5555', '55555', null, null, null, null, null, null, '1', '55555', 'http://localhost:8080/images/Hydrangeas.jpg', null);
INSERT INTO `tbl_user` VALUES ('4', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'admin', null, 'abc', 'abc@gmail.com', 'abc', '2016-11-06', null, '4343', null, null, null, '12344343', '43434', null, null, null, null, null, null, null, '4343', 'http://localhost:8080/images/Chrysanthemum.jpg', null);
INSERT INTO `tbl_user` VALUES ('5', 'admin', 'acb', null, 'cba', 'cba@gmail.com', 'cba', '2016-11-06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);



--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS tbl_user;
DROP SEQUENCE IF EXISTS user_id_seq CASCADE;

CREATE SEQUENCE user_id_seq START 1;
ALTER TABLE public.user_id_seq OWNER TO dolphin;

CREATE TABLE tbl_user (
		user_id INT8 NOT NULL PRIMARY KEY DEFAULT nextval('user_id_seq'),
		password VARCHAR(50) NOT NULL,
		login_name VARCHAR(15) NOT NULL,
		group_id NUMERIC(19 , 2),
		full_name VARCHAR(255) NOT NULL,
		email VARCHAR(255) NOT NULL,
		telephone VARCHAR(15),
		birthday DATE,
		lang_id VARCHAR(2),
		main_address VARCHAR(2048),
		facebook_id VARCHAR(512),
		google_id VARCHAR(512),
		twitter_id VARCHAR(512),
		cmtnd INT4,
		cccd INT4,
		mobile INT4,
		add_user INT8,
		upd_user INT8,
		add_time TIMESTAMP,
		upd_time TIMESTAMP,
		avata BYTEA,
		sex INT4,
		occupation VARCHAR(512),
		avata_url VARCHAR(512)
	);

ALTER TABLE tbl_user OWNER TO "dolphin";

---Data
INSERT INTO tbl_user(user_id, password, login_name, group_id, full_name, email, telephone, birthday, lang_id, main_address, facebook_id, google_id, twitter_id, cmtnd, cccd, mobile, add_user, upd_user, add_time, upd_time, avata, sex, occupation, avata_url) VALUES ('1', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'nghianv', '1', 'Nguyen Van Nghia', 'nghia.n.v2007@gmail.com', '090934547', '1975-12-22', 'vi', '111222333', null, null, null, '222', '111222', null, null, null, null, null, null, '1', '33332222', 'http://localhost:8080/images/Penguins.jpg');
INSERT INTO tbl_user(user_id, password, login_name, group_id, full_name, email, telephone, birthday, lang_id, main_address, facebook_id, google_id, twitter_id, cmtnd, cccd, mobile, add_user, upd_user, add_time, upd_time, avata, sex, occupation, avata_url) VALUES ('2', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'trongnp', '1', 'Nguyen Phu Trong', 'nguyenphutrong@gmail.com', '9999999', '1975-12-22', 'vi', '66666', null, null, null, '666666', '6666', null, null, null, null, null, null, '0', '66666', 'http://localhost:8080/images/Koala.jpg');
INSERT INTO tbl_user(user_id, password, login_name, group_id, full_name, email, telephone, birthday, lang_id, main_address, facebook_id, google_id, twitter_id, cmtnd, cccd, mobile, add_user, upd_user, add_time, upd_time, avata, sex, occupation, avata_url) VALUES ('3', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'trongnp2', '1', 'Nguyen Phu Trong', 'nguyenphutrong2@gmail.com', '9999999', '2016-10-26', 'vi', '55555', null, null, null, '5555', '55555', null, null, null, null, null, null, '1', '55555', 'http://localhost:8080/images/Hydrangeas.jpg');
INSERT INTO tbl_user(user_id, password, login_name, group_id, full_name, email, telephone, birthday, lang_id, main_address, facebook_id, google_id, twitter_id, cmtnd, cccd, mobile, add_user, upd_user, add_time, upd_time, avata, sex, occupation, avata_url) VALUES ('4', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'admin', null, 'abc', 'abc@gmail.com', 'abc', '2016-11-06', null, '4343', null, null, null, '12344343', '43434', null, null, null, null, null, null, null, '4343', 'http://localhost:8080/images/Chrysanthemum.jpg');

-- 2017/03
alter table tbl_user alter column login_name type character varying(50);
alter table tbl_user add column cover character varying(512);
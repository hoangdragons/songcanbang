/*
Navicat MySQL Data Transfer

Source Server         : Mriadb
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : dolphin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-07 20:24:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `FUNC_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `FUNC_NAME` varchar(512) NOT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`FUNC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('1', 'LIST_CATEGORY', 'List content category');
INSERT INTO `function` VALUES ('2', 'ADD_CATEGORY', 'Add content category');
INSERT INTO `function` VALUES ('3', 'EDIT_CATEGORY', 'Edit content category');
INSERT INTO `function` VALUES ('4', 'DELETE_CATEGORY', 'Delete content category');
INSERT INTO `function` VALUES ('5', 'LIST_COURSE', 'List training course');
INSERT INTO `function` VALUES ('6', 'ADD_COURSE', 'Add training course');
INSERT INTO `function` VALUES ('7', 'EDIT_COURSE', 'Edit training course');
INSERT INTO `function` VALUES ('8', 'DELETE_COURSE', 'Delete training course');


--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS function;
DROP SEQUENCE IF EXISTS func_id_seq CASCADE;

CREATE SEQUENCE func_id_seq START 1;
ALTER TABLE public.func_id_seq OWNER TO dolphin;

CREATE TABLE function (
		func_id INT8 NOT NULL PRIMARY KEY DEFAULT nextval('func_id_seq'),
		func_name VARCHAR(512),
		description VARCHAR(512)
	);

ALTER TABLE function OWNER TO "dolphin";

---Data
INSERT INTO function(func_name, description) VALUES ('LIST_CATEGORY', 'List content category');
INSERT INTO function(func_name, description) VALUES ('ADD_CATEGORY', 'Add content category');
INSERT INTO function(func_name, description) VALUES ('EDIT_CATEGORY', 'Edit content category');
INSERT INTO function(func_name, description) VALUES ('DELETE_CATEGORY', 'Delete content category');
INSERT INTO function(func_name, description) VALUES ('LIST_COURSE', 'List training course');
INSERT INTO function(func_name, description) VALUES ('ADD_COURSE', 'Add training course');
INSERT INTO function(func_name, description) VALUES ('EDIT_COURSE', 'Edit training course');
INSERT INTO function(func_name, description) VALUES ('DELETE_COURSE', 'Delete training course');
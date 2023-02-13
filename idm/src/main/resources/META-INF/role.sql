/*
Navicat MySQL Data Transfer

Source Server         : Mriadb
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : dolphin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-07 20:24:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ROLE_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(512) NOT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN', 'System Admin Role');
INSERT INTO `role` VALUES ('2', 'MOD', 'System Moderator Role');
INSERT INTO `role` VALUES ('3', 'GUESS', null);
INSERT INTO `role` VALUES ('4', 'OPERATOR', null);
INSERT INTO `role` VALUES ('5', 'EDITOR', null);
INSERT INTO `role` VALUES ('6', 'CONTENT_APPROVER', null);
INSERT INTO `role` VALUES ('7', 'QA_MGMT', null);
INSERT INTO `role` VALUES ('8', 'FRONT_SLIDE_MNG', null);
INSERT INTO `role` VALUES ('9', 'KKKK', 'AAAAAAA');
INSERT INTO `role` VALUES ('10', 'KKKK', 'AAAAAAA');
INSERT INTO `role` VALUES ('11', 'Aaa', 'aaaaa');


--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS role;
DROP SEQUENCE IF EXISTS role_id_seq CASCADE;

CREATE SEQUENCE role_id_seq START 1;
ALTER TABLE public.role_id_seq OWNER TO dolphin;

CREATE TABLE role (
		role_id INT8 NOT NULL PRIMARY KEY DEFAULT nextval('role_id_seq'),
		role_name VARCHAR(512),
		description VARCHAR(512)
	);

ALTER TABLE role OWNER TO "dolphin";

-----Data
INSERT INTO role(role_name, description) VALUES ('ADMIN', 'System Admin Role');
INSERT INTO role(role_name, description) VALUES ('MOD', 'System Moderator Role');
INSERT INTO role(role_name, description) VALUES ('GUESS', null);
INSERT INTO role(role_name, description) VALUES ('OPERATOR', null);
INSERT INTO role(role_name, description) VALUES ('EDITOR', null);
INSERT INTO role(role_name, description) VALUES ('CONTENT_APPROVER', null);
INSERT INTO role(role_name, description) VALUES ('QA_MGMT', null);
INSERT INTO role(role_name, description) VALUES ('FRONT_SLIDE_MNG', null);
INSERT INTO role(role_name, description) VALUES ('KKKK', 'AAAAAAA');
INSERT INTO role(role_name, description) VALUES ('KKKK', 'AAAAAAA');
INSERT INTO role(role_name, description) VALUES ('Aaa', 'aaaaa');
/*
Navicat MySQL Data Transfer

Source Server         : Mriadb
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : dolphin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-07 20:24:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for role_function
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function` (
  `RF_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(11) NOT NULL,
  `FUNCTION_ID` bigint(11) NOT NULL,
  PRIMARY KEY (`RF_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_function
-- ----------------------------
INSERT INTO `role_function` VALUES ('28', '1', '2');
INSERT INTO `role_function` VALUES ('29', '1', '8');
INSERT INTO `role_function` VALUES ('30', '1', '4');
INSERT INTO `role_function` VALUES ('31', '2', '1');
INSERT INTO `role_function` VALUES ('32', '2', '2');
INSERT INTO `role_function` VALUES ('33', '2', '3');
INSERT INTO `role_function` VALUES ('34', '2', '4');
INSERT INTO `role_function` VALUES ('35', '2', '5');
INSERT INTO `role_function` VALUES ('36', '11', '3');
INSERT INTO `role_function` VALUES ('37', '11', '4');
INSERT INTO `role_function` VALUES ('38', '11', '5');
INSERT INTO `role_function` VALUES ('39', '11', '6');
INSERT INTO `role_function` VALUES ('40', '11', '7');


--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS role_function;
DROP SEQUENCE IF EXISTS rf_id_seq CASCADE;

CREATE SEQUENCE rf_id_seq START 1;
ALTER TABLE public.rf_id_seq OWNER TO dolphin;

CREATE TABLE role_function (
		rf_id INT8 NOT NULL PRIMARY KEY DEFAULT nextval('rf_id_seq'),
		role_id INT8,
		function_id INT8
	);

ALTER TABLE role_function OWNER TO "dolphin";

----Data
INSERT INTO role_function(role_id, function_id) VALUES ('1', '2');
INSERT INTO role_function(role_id, function_id) VALUES ('1', '8');
INSERT INTO role_function(role_id, function_id) VALUES ('1', '4');
INSERT INTO role_function(role_id, function_id) VALUES ('2', '1');
INSERT INTO role_function(role_id, function_id) VALUES ('2', '2');
INSERT INTO role_function(role_id, function_id) VALUES ('2', '3');
INSERT INTO role_function(role_id, function_id) VALUES ('2', '4');
INSERT INTO role_function(role_id, function_id) VALUES ('2', '5');
INSERT INTO role_function(role_id, function_id) VALUES ('11', '3');
INSERT INTO role_function(role_id, function_id) VALUES ('11', '4');
INSERT INTO role_function(role_id, function_id) VALUES ('11', '5');
INSERT INTO role_function(role_id, function_id) VALUES ('11', '6');
INSERT INTO role_function(role_id, function_id) VALUES ('11', '7');
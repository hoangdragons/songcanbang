/*
Navicat MySQL Data Transfer

Source Server         : Mriadb
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : dolphin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-11-07 20:25:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `UR_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(11) NOT NULL,
  `USER_ID` bigint(11) NOT NULL,
  PRIMARY KEY (`UR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('2', '2', '1');
INSERT INTO `user_role` VALUES ('3', '3', '1');
INSERT INTO `user_role` VALUES ('4', '1', '1');
INSERT INTO `user_role` VALUES ('5', '4', '1');
INSERT INTO `user_role` VALUES ('6', '5', '1');
INSERT INTO `user_role` VALUES ('7', '6', '1');
INSERT INTO `user_role` VALUES ('13', '1', '2');
INSERT INTO `user_role` VALUES ('14', '6', '2');
INSERT INTO `user_role` VALUES ('15', '7', '2');
INSERT INTO `user_role` VALUES ('16', '6', '3');
INSERT INTO `user_role` VALUES ('17', '3', '4');
INSERT INTO `user_role` VALUES ('18', '4', '4');
INSERT INTO `user_role` VALUES ('19', '5', '4');
INSERT INTO `user_role` VALUES ('20', '6', '4');
INSERT INTO `user_role` VALUES ('21', '7', '4');
INSERT INTO `user_role` VALUES ('22', '8', '4');



--------------------------------------------------------------------------------------------------------------------------

--Postgresql
DROP TABLE IF EXISTS user_role;
DROP SEQUENCE IF EXISTS ur_id_seq CASCADE;

CREATE SEQUENCE ur_id_seq START 1;
ALTER TABLE public.ur_id_seq OWNER TO dolphin;

CREATE TABLE user_role (
		ur_id INT8 NOT NULL PRIMARY KEY DEFAULT nextval('ur_id_seq'),
		role_id INT8,
		user_id INT8
	);

ALTER TABLE user_role OWNER TO "dolphin";

---Data
INSERT INTO user_role(role_id, user_id) VALUES ('2', '1');
INSERT INTO user_role(role_id, user_id) VALUES ('3', '1');
INSERT INTO user_role(role_id, user_id) VALUES ('1', '1');
INSERT INTO user_role(role_id, user_id) VALUES ('4', '1');
INSERT INTO user_role(role_id, user_id) VALUES ('5', '1');
INSERT INTO user_role(role_id, user_id) VALUES ('6', '1');
INSERT INTO user_role(role_id, user_id) VALUES ('1', '2');
INSERT INTO user_role(role_id, user_id) VALUES ('6', '2');
INSERT INTO user_role(role_id, user_id) VALUES ('7', '2');
INSERT INTO user_role(role_id, user_id) VALUES ('6', '3');
INSERT INTO user_role(role_id, user_id) VALUES ('3', '4');
INSERT INTO user_role(role_id, user_id) VALUES ('4', '4');
INSERT INTO user_role(role_id, user_id) VALUES ('5', '4');
INSERT INTO user_role(role_id, user_id) VALUES ('6', '4');
INSERT INTO user_role(role_id, user_id) VALUES ('7', '4');
INSERT INTO user_role(role_id, user_id) VALUES ('8', '4');
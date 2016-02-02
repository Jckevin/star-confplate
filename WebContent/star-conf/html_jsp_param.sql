/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.11
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : freepbx

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-02-02 18:01:13
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `html_jsp_param`
-- ----------------------------
DROP TABLE IF EXISTS `html_jsp_param`;
CREATE TABLE `html_jsp_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node` varchar(48) NOT NULL,
  `name` varchar(48) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` varchar(48) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of html_jsp_param
-- ----------------------------
INSERT INTO `html_jsp_param` VALUES ('1', 'addExten', 'terNum', 'text', null, '0');
INSERT INTO `html_jsp_param` VALUES ('2', 'addExten', 'terPass', 'radio', '0:sameTerNum|1:staticStr', '0');
INSERT INTO `html_jsp_param` VALUES ('3', 'addExten', 'terName', 'text', null, '0');
INSERT INTO `html_jsp_param` VALUES ('6', 'addExten', 'terPri', 'select', null, '0');
INSERT INTO `html_jsp_param` VALUES ('7', 'addExten', 'terRecord', 'radio', null, '0');
INSERT INTO `html_jsp_param` VALUES ('5', 'addExten', 'terDept', 'select', null, '0');
INSERT INTO `html_jsp_param` VALUES ('4', 'addExten', 'terType', 'select', null, '0');

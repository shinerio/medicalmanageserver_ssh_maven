/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : medicalmanage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2016-11-29 21:09:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `DOCTORS`;
CREATE TABLE `DOCTORS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE ,
  `realname` varchar(50) NOT NULL  ,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

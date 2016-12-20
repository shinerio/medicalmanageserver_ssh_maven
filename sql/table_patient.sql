/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : medicalmanage

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2016-11-29 21:35:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `PATIENTS`;
CREATE TABLE `PATIENTS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE ,
  `realname` varchar(50) NOT NULL  ,
  `password` varchar(50) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `petient_ref_doctor` (`doctor_id`),
  CONSTRAINT `petient_ref_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `DOCTORS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

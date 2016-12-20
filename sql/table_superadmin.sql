SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `SUPERADMIN`;
CREATE TABLE `SUPERADMIN` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `username` varchar(50) NOT NULL UNIQUE ,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

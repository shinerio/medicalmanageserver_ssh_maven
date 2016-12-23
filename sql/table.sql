CREATE TABLE `administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `medical_manage`.`department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `medical_manage`.`doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(45) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `telenum` bigint(20) DEFAULT NULL,
  `houseaddress` varchar(100) DEFAULT NULL,
  `workingtime` int(11) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `officeaddress` varchar(100) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `workexperience` varchar(200) DEFAULT NULL,
  `emailaddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `doctot_ref_department_idx` (`department_id`),
  CONSTRAINT `doctot_ref_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



CREATE TABLE `medical_manage`.`patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `disease` varchar(100) DEFAULT NULL,
  `telenum` BIGINT(11) DEFAULT NULL,
  `ward` varchar(50) DEFAULT NULL,
  `houseaddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `patient_ref_doctor_idx` (`doctor_id`),
  CONSTRAINT `patient_ref_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `medical_manage`.`evaluation_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `patient_id` INT NULL,
  `start_time` BIGINT NULL,
  `end_time` BIGINT NULL,
  `success_ratio` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `evaluation_info_ref_patient_idx` (`patient_id` ASC),
  CONSTRAINT `evaluation_info_ref_patient`
  FOREIGN KEY (`patient_id`)
  REFERENCES `medical_manage`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `medical_manage`.`rawdata` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `evaluation_id` INT NULL,
  `time_stamp` BIGINT NULL,
  `json_string` TEXT NULL,
  `score` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `rawdata_ref_evaluation_info_idx` (`evaluation_id` ASC),
  CONSTRAINT `rawdata_ref_evaluation_info`
  FOREIGN KEY (`evaluation_id`)
  REFERENCES `medical_manage`.`evaluation_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

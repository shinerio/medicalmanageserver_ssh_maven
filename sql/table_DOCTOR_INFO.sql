DROP TABLE IF EXISTS `DOCTORS`;
CREATE TABLE DOCTOR_INFO(
  id INT PRIMARY  KEY AUTO_INCREMENT,
 doctor_id  int not NULL ,
  age int not NULL ,
  major VARCHAR(100) not null,
   workinghours int,
   emailAddress varchar(50),
   phonenum BIGINT(11),
   address VARCHAR(100),
   department varchar(100),
   workexperience VARCHAR(200),
   CONSTRAINT kf_doctor FOREIGN KEY (doctor_id)
  REFERENCES DOCTORS(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `medical_manage`.`administrator`(`id`,`name`,`password`)VALUES('admin','admin');
INSERT INTO `medical_manage`.`department`(`id`,`name`)VALUES(1,'神经内科');
INSERT INTO `medical_manage`.`doctor`
(`id`,
`username`,
`password`,
`realname`,
`department_id`,
`age`,
`telenum`,
`houseaddress`,
`workingtime`,
`major`,
`officeaddress`,
`gender`,
`workexperience`)
VALUES
(1,
'1001',
'admin',
'华佗',
1,
53,
15601171755,
'北京邮电大学',
3,
'脑神经',
'神经内科101室',
1,
'中国康复医院工作三年');
INSERT INTO `medical_manage`.`patient`
(`id`,
`username`,
`password`,
`realname`,
`doctor_id`,
`age`,
`gender`,
`disease`,
`telenum`,
`ward`,
`houseaddress`,
)
VALUES
(1,
'1001',
'admin',
'jack',
1,
48,
2,
'中风',
'15601181856',
'康复130室',
'北京海淀');

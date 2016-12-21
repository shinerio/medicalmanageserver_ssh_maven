create table if not exists EVALUATION_INFO(
	`id` int unsigned not null auto_increment primary key,
	`uid` int unsigned not null comment 'user id',
	`start_time` bigint not null comment 'start time of evaluation',
	`end_time` bigint not null comment 'end time of evaluation',
	`success_ratio` int
)engine=InnoDB default charset=utf8 auto_increment=1;

create table if not exists RAWDATA(
	`id` int unsigned not null auto_increment primary key,
	`evaluation_id` int not null comment 'evaluation id foreign key',
	`time_stamp` bigint not null comment 'time stamp',
	`json_string` text not null comment 'json string of raw data'
)engine=InnoDB default charset=utf8 auto_increment=1;

alter table RAWDATA add constraint RAWDATA_EVALUATION foreign key (`evaluation_id`) references EVALUATION_INFO(`id`) on delete cascade on update no action;
alter table EVALUATION_INFO add constraint EVALUATION_INFO_REF_PATIENTS foreign key (`uid`) references PATIENTS(`id`) on delete cascade on update no action;

insert into EVALUATION_INFO(uid, start_time, end_time) values (123, 12345, 12346);
insert into EVALUATION_INFO(uid, start_time, end_time) values (123, 12347, 12348);

insert into RAWDATA(evaluation_id, time_stamp, json_string) values (1, 12345, "{}");
insert into RAWDATA(evaluation_id, time_stamp, json_string) values (1, 12346, "{}");

select id from EVALUATION_INFO where uid=123 and start_time=12347;
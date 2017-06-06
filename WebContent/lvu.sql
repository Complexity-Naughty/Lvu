/*
修改mysql的my.ini文件中的字符集键值，
如 default-character-set = utf8 
character_set_server = utf8
修改完后，重启mysql的服务，service mysql restart
cmd输入net start mysql 回车即可启动;
cmd输入net stop mysql 回车即可关闭；
使用 mysql> SHOW VARIABLES LIKE 'character%'; 查看
*/

/* C:\Program Files\MySQL\MySQL Server 5.1\my.ini  */

create database lvu
character set 'utf8'
collate 'utf8_general_ci';


use lvu

create table `users`(
	`id` int(8) unsigned zerofill auto_increment not null,
	`name` varchar(36) not null,
	`password` varchar(36) not null,
	`permit` bool not null default false,
	primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

insert into users(name, password, permit) values('admin', 'admin', 1);
insert into users(name, password, permit) values('java', 'java', 1);
insert into users(name, password, permit) values('小明', 'java', 0);
insert into users(name, password, permit) values('小红', 'java', 0);

create table `works`(
		`id` int(10) unsigned zerofill auto_increment not null,
		`authorId` int(8) references users(id),
		`authorName` varchar(36) not null,
		`title` varchar(100) not null,
		`type` varchar(20) null,
		`summary` varchar(255) not null,
		`time` varchar(36) not null,
		primary key(id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

create table `content`(
	`id` int(10) unsigned zerofill auto_increment not null,
	`worksId` int(10) references works(id),
	`text` text null,
	`pic` varchar(200) null,
	primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;users
select * from works
select * from users
select * from users left join works on works.authorId=users.id left join content on works.id=content.worksId;
select * from users join works on users.id=works.authorId
select * from users left join works on works.authorId=users.id left join content on works.id=content.worksId where authoId=4;
select * from works where authorName like '%ja%' or title like '%76%' limit 2,3;
select * from users left join works on works.authorId=users.id left join content on works.id=content.worksId where authorName LIKE '%ad%' or title like'%fa%' or summary like '%q%' limit 1,30;
select * from users where password='java' and (permit=0 or name like '%小%');

select * from users left join ((select id as worksId, authorId, authorName, title, type, summary, time from works) as works) on works.authorId=users.id;
select * from ((select id as worksId, authorId, authorName, title, type, summary, time from works) as works) left join users on works.authorId=users.id;
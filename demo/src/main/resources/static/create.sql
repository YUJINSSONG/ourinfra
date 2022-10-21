

CREATE TABLE `elctmst1` (
	`elct_id` int auto_increment,
	`elct_nm` varchar(30) NOT NULL,
	`elct_pwr` int(11) DEFAULT NULL,
  PRIMARY KEY (`elct_id`, `elct_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



create table `elctuse1` (
	`use_month` varchar(2) not null ,
	`elct_nm`  varchar(30) not null ,
	`elct_pwr` int,
	`use_days` int,
	`use_hours` int,
	`use_pwr` int,
	primary key (`use_month`, `elct_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

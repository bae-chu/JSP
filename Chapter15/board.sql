create table board(
	board_num int primary key,
	board_name varchar(20) not null,
	board_pass varchar(15) not null,
	board_subject varchar(50) not null,
	board_content varchar(2000) not null,
	board_file varchar(50) not null,
	board_re_ref int not null,
	board_re_lev int not null,
	board_re_seq int not null,
	board_readcount int default 0,
	board_date date
);
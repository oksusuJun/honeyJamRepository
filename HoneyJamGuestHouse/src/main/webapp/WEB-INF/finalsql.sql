drop sequence reservation_id_seq;
drop sequence board_seq;

create sequence reservation_id_seq;
create sequence board_seq;

drop table Member cascade constraint;

create table Member (
	email varchar2(50) primary key,
	password varchar2(20) not null,
	nickname varchar2(30) not null,
	phone_num varchar2(13),
	admin number(1)	not null
);




drop table Reservation cascade constraint;

create table Reservation (
	reservation_id	number(10) primary key,
	email	varchar2(50),
	check_in	date,
	check_out	date,
	number_of_guests number(2)	not null,
	room_id	number(3)	not null,
	gender		varchar2(10)	not null,
	payment_status number(1) not null,
	constraint email_fk foreign key (email) references member(email) on delete CASCADE,
	constraint room_id_fk foreign key (room_id) references room(room_id) on delete CASCADE
);


drop table board cascade constraint;
create table Board (
	item_num number(10) primary key,
	content varchar2(300) not null,
	title varchar2(100) not null,
	write_date date not null,
	email varchar2(50),
	constraint emailfk foreign key (email) references member(email) on delete CASCADE
);


drop table Room cascade constraint;
create table Room (
	room_id	number(3) primary key,
	room_name varchar2(10) not null,
	gender	varchar2(20) not null,
	max_bed number(2) not null,
	available_bed number(2) not null,
	price number(10) not null
);

insert into room values (201, '2인실', '여성남성', 2, 2, 30000);
insert into room values (202, '2인실', '여성남성', 2, 2, 30000);
insert into room values (401, '4인실', '남성', 4, 4, 25000);
insert into room values (402, '4인실', '여성', 4, 4, 25000);
insert into room values (601, '6인실', '남성', 6, 6, 22000);
insert into room values (602, '6인실', '여성', 6, 6, 22000);
insert into room values (801, '8인실', '남성', 8, 8, 20000);
insert into room values (802, '8인실', '여성', 8, 8, 20000);



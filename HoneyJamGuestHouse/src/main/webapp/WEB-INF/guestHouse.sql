drop table Member cascade constraint;
/*
 * 	#### Member Table ####
 *  admin - 0 : 관리자 || 1 : 회원
 */
create table Member (
	email varchar2(50) primary key,
	password varchar2(20) not null,
	nickname varchar2(30) not null,
	phone_num varchar2(13),
	admin number(1)	not null
);

select * from Member

/* ############### Dummy Data ################### */

insert into MEMBER values('mem1@hj.com', '1111', '회원1', '010-1111-1111', 1);
insert into MEMBER values('mem2@hj.com', '2222', '회원2', '010-2222-2222', 1);
insert into MEMBER values('mem3@hj.com', '3333', '회원3', '010-3333-3333', 1);



drop table Reservation cascade constraint;
/* 
 * #### Reservation Table ####
 * payment_state - 0 : 
 */
create table Reservation (
	reservation_id	number(10) primary key,
	member_id	varchar2(50),
	check_in	date,
	check_out	date,
	number_of_guest	number(2)	not null,
	room_no	number(3)	not null,
	gender		varchar2(10)	not null,
	payment_status number(1) not null,
	constraint email_fk foreign key (member_id) references member(email),
	constraint room_id_fk foreign key (room_no) references room(room_id)
	
);

select * from Reservation

/* ############### Dummy Data ################### */
insert into reservation values ('170001', 'mem1@hj.com', '20171102', '20171103', 1, 401, '남성', 0);

/*
drop table Reserved_Room;
/* Reserved_Room */
create table Reserved_Room (
	room_id	number(3) primary key,
	number_of_rooms	number(3) not null,
	status	varchar2(20)	not null,
	reservation_id	number(10)
);

select * from reserved_room
*/

drop table Room cascade constraint;
/*
 * #### Room Table####
 */
create table Room (
	room_id	number(3) primary key,
	room_name varchar2(10) not null,
	gender	varchar2(10) not null,
	status varchar2(20) not null,
	max_bed number(2) not null,
	available_bed number(2) not null,
	price number(10) not null
	
);

select * from room

/* ############### Dummy Data ################### */
insert into room values (201, '2인실', '혼숙', '가능', 2, 2, 50000);
insert into room values (202, '2인실', '혼숙', '불가능', 2, 0, 50000);
insert into room values (401, '4인실', '남성', '가능', 4, 4,15000);
insert into room values (402, '4인실', '여성', '가능', 4, 4, 15000);
insert into room values (403, '4인실', '혼숙', '가능', 4, 4, 15000);
insert into room values (601, '6인실', '남성', '불가능', 6, 0, 12000);
insert into room values (602, '6인실', '여성', '가능', 6, 4, 12000);
insert into room values (603, '6인실', '혼숙', '가능', 6, 6, 12000);



drop table board cascade constraint;
/* Board */
create table Board (
	item_num number(10) primary key,
	content varchar2(300) not null,
	title varchar2(100) not null,
	write_date date not null,
	author varchar2(50),
	constraint author_fk foreign key (author) references member(email)
);

select * from board;


/* ############### Join 조회 Test################### */

select 	r.reservation_id,
		r.check_in,
		r.check_out,
		r.number_of_guest,
		r.room_no,
		r.gender,
		m.email
		FROM reservation r, member m
		WHERE r.member_id = m.email
		AND m.email = 'mem1@hj.com';








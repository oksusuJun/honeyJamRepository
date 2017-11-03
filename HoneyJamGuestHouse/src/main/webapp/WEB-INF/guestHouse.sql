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

insert into MEMBER values('yyy', '1111', '회원1', '010-1111-1111', 1);
insert into MEMBER values('mem2@hj.com', '2222', '회원2', '010-2222-2222', 1);
insert into MEMBER values('mem3@hj.com', '3333', '회원3', '010-3333-3333', 1);
insert into MEMBER values('bbb', '3434', '회원4', '010-3434-3434', 1);
insert into MEMBER values('777', '4545', '회원5', '010-4545-4545', 1);
insert into MEMBER values('aaa', '2323', '회원7', '010-2323-2323', 1);
insert into MEMBER values('aba@com', '4543', 'aba', '010-3344-3928', 1);




drop table Reservation cascade constraint;
/* 
 * #### Reservation Table ####
 * payment_state - 0 : 입급완료 || 1 : 입금대기
 */
create table Reservation (
	reservation_id	number(10) primary key,
	email	varchar2(50),
	check_in	date,
	check_out	date,
	number_of_guests	number(2)	not null,
	room_id	number(3)	not null,
	gender		varchar2(10)	not null,
	payment_status number(1) not null,
	constraint email_fk foreign key (email) references member(email),
	constraint room_id_fk foreign key (room_id) references room(room_id)
);

create sequence reservation_id_seq;

select * from Reservation where email='yyy'

select * from reservation
/* ############### Dummy Data ################### */
insert into reservation values (2, 'yyy', '20171102', '20171103', 1, 401, '남성', 0);
insert into reservation values(0,'bbb','2017-10-09','2017-10-14',2,202,'남성',0);
insert into reservation values(1,'bbb','2017-10-12','2017-10-16', 2, 201,'남성',0);
insert into reservation values(9,'777','2017-10-13','2017-10-17', 2, 202,'남성',0);
insert into reservation values(3,'yyy','2017-10-14','2017-10-18', 2, 202,'남성',0);
insert into reservation values(4,'bbb','2017-10-15','2017-10-19', 2, 201,'남성',0);
insert into reservation values(5,'777','2017-10-16','2017-10-20', 2, 401,'남성',0);
insert into reservation values(6,'yyy','2017-10-17','2017-10-21', 2, 401,'남성',0);
insert into reservation values(7,'bbb','2017-10-18','2017-10-22', 2, 601,'남성',0);
insert into reservation values(8,'777','2017-10-19','2017-10-23', 2, 601,'남성',0);

delete from reservation where reservation_id = 49


drop table Reserved_Room;
/* Reserved_Room */
create table Reserved_Room (
	room_id	number(3) not null,
	number_of_beds	number(3) not null,
	check_in date,
	check_out date,
	status	varchar2(20)	not null,
	reservation_id	number(10) primary key,
	gender varchar2(10) not null,
	constraint roomid_fk foreign key (room_id) references room(room_id)
);

select * from reservation

select * from reserved_room

/* dummy */
insert into reserved_room values (401, 1, '20171230', '20180101', '가능','170001', '남성');
insert into reserved_room values (601, 2, '20171227', '20180101', '가능','170002', '남성');
insert into reserved_room values (601, 2, '20171225', '20171228', '가능','170003', '남성');
insert into reserved_room values (601, 2, '20171220', '20171225', '가능','170004', '남성');
insert into reserved_room values (601, 1, '20171216', '20171219', '가능','170005', '남성');
insert into reserved_room values (402, 2, '20171216', '20171219', '가능','170006', '여성');
insert into reserved_room values (402, 1, '20171216', '20171219', '가능','170007', '여성');
insert into reserved_room values (402, 2, '20171220', '20171221', '가능','170008', '여성');
insert into reserved_room values (401, 2, '20171216', '20171217', '가능','170009', '남성');
insert into reserved_room values (201, 2, '20171219', '20171220', '가능','170010', '남성');
insert into reserved_room values (202, 2, '20171228', '20171230', '가능','170011', '남성');


/* test */
/* 날짜 중복 조회 쿼리 */


	SELECT 	a.room_id, 
			a.available_bed, 
			b.number_of_beds
	FROM 	room a, 
			reserved_room b
	WHERE 	a.room_id = b.room_id
	AND 	b.gender LIKE '%'||#{gender}||'%'
	AND 	a.available_bed >= #{numberOfGuests}
	AND 	b.check_in <= to_date('20171229', yyyymmdd)
	AND 	b.check_out >= to_date('20171216', yyyymmdd)


/* 이게 맞습니다~ 이거 쓸거에요~~ 혼동하지마세요!!!!!! */
select * from reserved_room
where check_in <= to_date('20171229', 'YYYYMMDD') and check_out >= to_date('20171216', 'YYYYMMDD') and gender = '여성';


/* test - 성별 조회 쿼리 */
select * from reserved_room where gender = '남성';
select * from reserved_room where gender = '여성';

-- ############# 최종최종 제발제발 ###############
select a.room_id, a.available_bed
from room a, reserved_room b
where a.room_id = b.room_id
and b.gender like '%성%'
and a.available_bed >= 1
and not b.check_in <= to_date('20171216', 'YYYYMMDD') and not b.check_out >= to_date('20171214', 'YYYYMMDD')
-- ##########################################


select room_id, check_in, check_out
from reserved_room
where check_in <= '20171221'
and check_out >= '20171214'
and gender like '%남성%'



drop table Room cascade constraint;
/*
 * #### Room Table####
 */
create table Room (
	room_id	number(3) primary key,
	room_name varchar2(10) not null,
	gender	varchar2(20) not null,
	max_bed number(2) not null,
	available_bed number(2) not null,
	price number(10) not null
);

select * from room
delete from room where room_id=202



/* ############### Dummy Data ################### */
insert into room values (201, '2인실', '남성', 2, 2, 30000);
insert into room values (202, '2인실', '여성', 2, 2, 30000);
insert into room values (401, '4인실', '남성', 4, 4,25000);
insert into room values (402, '4인실', '여성', 4, 4, 25000);
insert into room values (403, '4인실', '혼숙', 4, 4, 25000);
insert into room values (601, '6인실', '남성', 6, 6, 22000);
insert into room values (602, '6인실', '여성', 6, 6, 22000);
insert into room values (603, '6인실', '혼숙', 6, 6, 22000);
insert into room values (801, '8인실', '남성', 8, 8, 20000);
insert into room values (802, '8인실', '여성', 8, 8, 20000);
insert into room values (803, '8인실', '혼숙', 8, 8, 20000);

delete from room where room_id=202


select available_bed from Room where room_id ='602';


drop table board cascade constraint;
/* Board */
create table Board (
	item_num number(10) primary key,
	content varchar2(300) not null,
	title varchar2(100) not null,
	write_date date not null,
	email varchar2(50),
	constraint emailfk foreign key (email) references member(email)
);

/*board start*/
delete from board
insert into board values (1,'내용입니다.','제목','20171102','yyy')
insert into board values (2,'내용입니다.2','제목2','20171101','yyy')
insert into board values (3,'내용입니다.3','제목3','20171002','aaa');
insert into board values (4,'내용입니다.4','제목4','20171014','aaa');
insert into board values (5,'내용입니다.5','제목5','20171012','yyy');

/* SEQUENCE 삭제*/
		drop sequence  seq_item_num;
/* SEQUENCE 생성*/
		create sequence seq_item_num;

	/* board 조회*/
		select * from board;
	
	/*Board Dummy*/
		insert into board values (seq_item_num.nextVal,'글내용글내용글내용','제목제목제목','20171013','aba@com');

/*board end*/
	
create sequence seq_item_num
create sequence board_seq
	



		
		
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








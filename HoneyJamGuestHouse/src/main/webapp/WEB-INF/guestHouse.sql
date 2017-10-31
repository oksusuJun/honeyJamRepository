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
 * payment_state - 0 : 입급완료 || 1 : 입금대기
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

select * from reserved_room
where check_in >= to_date('20171225', 'YYYYMMDD') and check_out <= to_date('20171229', 'YYYYMMDD')+1;


/* 이게 맞습니다~ 이거 쓸거에요~~ 혼동하지마세요!!!!!! */
select * from reserved_room
where check_in <= to_date('20171229', 'YYYYMMDD') and check_out >= to_date('20171216', 'YYYYMMDD') and gender = '여성';


/* test - 성별 조회 쿼리 */
select * from reserved_room where gender = '남성';
select * from reserved_room where gender = '여성';

-- ############# 최종최종 제발제발 ###############
select a.room_id, a.available_bed, b.number_of_beds
from room a, reserved_room b
where a.room_id = b.room_id
and b.gender like '%남성%'
and a.available_bed >= 1
and b.check_in <= to_date('20171220', 'YYYYMMDD') and b.check_out >= to_date('20171219', 'YYYYMMDD')
-- ##########################################

/* 10.31 01:56 
 * 검색 조건 
 * <ROOM>
 * 	- gender : %남성%
 * 	- available_bed >= 1
 * --------------------------
 * <RESERVED_ROOM>
 * 	- check_in ~ check_out : 2017.12.16 ~ 2017.12.29
 * --------------------------
 * room 에서 남성이 들어갈 수 있는 1자리 이상의 침대가 남아있는 방,
 * reserved_room 에서 해당 날짜에 예약되어있는 방을 select
 *  -> room.room_id = d.room_id : room select 에서 나온 결과 중 예약건의 room_id 와 같은 것으로 제약
 *  --> 검색조건에 맞는 방 중 예약이 되어있는 방이 나오게 된다.
 */
/* 
 * ####################################
select * 
from (select room_id, available_bed
		from room
		where gender like '%남성%'
		and available_bed >= 1) r, 
	(select room_id, number_of_beds, reservation_id, check_in, check_out
		from RESERVED_ROOM
		where check_in <= to_date('20171220', 'YYYYMMDD') and check_out >= to_date('20171219', 'YYYYMMDD')) d
where r.room_id = d.room_id
-- and r.available_bed - d.number_of_beds >= 2;
#######################################
* --> 위의 쿼리와 같은 결과를 도출
* 		But, subQuery 중첩보다 join으로 하는게 성능상 좋기때문에
* 		위의 쿼리 사용예정
*/


select *
from 


select room_id from room
where gender like '%남성%'
and available_bed >= 2

select * 
FROM reserved_room
WHERE exists (select * 
				from ROOM r
				where RESERVED_ROOM.room_id = r.room_id);
and check_in <= to_date('20171229', 'YYYYMMDD') and check_out >= to_date('20171216', 'YYYYMMDD')




/* 
 * --> room_id  -> number 
 * 		--> Dao -> int roomId  --> #{value}
 * 

select reservation_id from reserved_room
where check_in <= to_date('20171229', 'YYYYMMDD') and check_out >= to_date('20171216', 'YYYYMMDD')
and room_id = #{value}
*/



drop table Room cascade constraint;
/*
 * #### Room Table####
 */
create table Room (
	room_id	number(3) primary key,
	room_name varchar2(10) not null,
	gender	varchar2(20) not null,
	--status varchar2(20) not null,
	max_bed number(2) not null,
	available_bed number(2) not null,
	price number(10) not null
	
);

select * from room

/* ############### Dummy Data ################### */
insert into room values (201, '2인실', '남성여성', 2, 2, 50000);
insert into room values (202, '2인실', '남성여성', 2, 2, 50000);
insert into room values (401, '4인실', '남성', 4, 4,15000);
insert into room values (402, '4인실', '여성', 4, 4, 15000);
insert into room values (403, '4인실', '남성여성', 4, 4, 15000);
insert into room values (601, '6인실', '남성', 6, 6, 12000);
insert into room values (602, '6인실', '여성', 6, 6, 12000);
insert into room values (603, '6인실', '남성여성', 6, 6, 12000);

select available_bed from Room where room_id ='602';



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








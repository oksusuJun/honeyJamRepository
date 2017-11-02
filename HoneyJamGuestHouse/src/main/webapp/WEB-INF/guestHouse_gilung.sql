/*
 *   꿀잠 프로젝트 기본 DB
 *   
 *   작 성 자 : 
 *   작성일자 : 2017-11-02
 * 	
 *   DB : Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
 *   ID : honey
 *   PW : jamjam
 * 
 * 	 테이블 요약
 *   MEMBER      - 회원정보 테이블, 회원 가입시 INSERT 됨
 * 	 ROOM        - 방 정보 테이블, 데이터 고정되어 있음
 *   RESERVATION - 예약정보 테이블, 결제 완료시 INSERT 됨
 *    └ MEMBER 테이블, MEMBER 테이블을 참조하므로 MEMBER 테이블과 TABLE 테이블 먼저 생성
 *
 * 	 # 오라클 기본 명령어
 *     - 현재 DATABASE의 전체 TABLE 출력하기
 *   
 *     SELECT * FROM TAB;
 */


/* ############################################# */
/* ########## Member(회원정보) 테이블 ########## */
/* ############################################# */

-- MEMBER(회원정보) 테이블 DROP
drop table Member cascade constraint;

-- MEMBER(회원정보) 테이블 CREATE
	-- admin - 0 : 관리자 || 1 : 회원
create table Member (
	email varchar2(50) primary key,
	password varchar2(20) not null,
	nickname varchar2(30) not null,
	phone_num varchar2(13),
	admin number(1)	not null
);

-- MEMBER(회원정보) 테이블 Dummy Data INSERT
insert into MEMBER values('test@test.com', 'test', 'test', '010-0000-0000', 1);
insert into MEMBER values('apple@test.com', 'apple', '애플', '010-1111-1111', 1);
insert into MEMBER values('banana@test.com', 'banana', '바나나', '010-2222-2222', 1);
insert into MEMBER values('orange@test.com', 'orange', '오렌지', '010-3333-3333', 1);
insert into MEMBER values('cherry@test.com', 'cherry', '체리', '010-4444-4444', 1);
insert into MEMBER values('mango@test.com', 'mango', '망고', '010-5555-5555', 1);
insert into MEMBER values('melon@test.com', 'melon', '멜론', '010-6666-6666', 1);
insert into MEMBER values('pear@test.com', 'pear', '배', '010-7777-7777', 1);
insert into MEMBER values('lemon@test.com', 'lemon', '레몬', '010-8888-8888', 1);
insert into MEMBER values('kiwi@test.com', 'kiwi', '키위', '010-9999-9999', 1);

-- MEMBER(회원정보) 테이블 Dummy Data DELETE
delete from MEMBER where email = 'test@test.com';
delete from MEMBER where email = 'apple@test.com';
delete from MEMBER where email = 'banana@test.com';
delete from MEMBER where email = 'orange@test.com';
delete from MEMBER where email = 'cherry@test.com';
delete from MEMBER where email = 'mango@test.com';
delete from MEMBER where email = 'melon@test.com';
delete from MEMBER where email = 'pear@test.com';
delete from MEMBER where email = 'lemon@test.com';
delete from MEMBER where email = 'kiwi@test.com';

-- MEMBER(회원정보) 테이블 SELECT
select * from Member;
select * from Member where email = 'test@test.com';

-- MEMBER(회원정보) 테이블 UPDATE
update MEMBER set admin = 0 WHERE email = 'test@test.com';
update MEMBER set admin = 1 WHERE email = 'test@test.com';


/* ################################################### */
/* ############## Room (방 정보) 테이블 ############## */
/* ################################################### */

-- ROOM(방 정보) 테이블 DROP
drop table ROOM cascade constraint;

-- ROOM(방 정보) 테이블 CREATE
create table ROOM (
	room_id	number(3) primary key,
	room_name varchar2(10) not null,
	gender varchar2(20) not null,
	max_bed number(2) not null,
	available_bed number(2) not null,
	price number(10) not null
);	-- 제거 status varchar2(20) not null,

-- ROOM(방 정보) 테이블 Dummy Data INSERT
insert into room values (201, '2인실', '남성여성', 2, 2, 50000);
insert into room values (202, '2인실', '남성여성', 2, 2, 50000);
insert into room values (401, '4인실', '남성', 4, 4,15000);
insert into room values (402, '4인실', '여성', 4, 4, 15000);
insert into room values (403, '4인실', '남성여성', 4, 4, 15000);
insert into room values (601, '6인실', '남성', 6, 6, 12000);
insert into room values (602, '6인실', '여성', 6, 6, 12000);
insert into room values (603, '6인실', '남성여성', 6, 6, 12000);
insert into room values (801, '6인실', '여성', 8, 6, 12000);
insert into room values (802, '6인실', '남성여성', 8, 6, 12000);

-- ROOM(방 정보) 테이블 Dummy Data DELETE
delete from ROOM where room_id = 201;
delete from ROOM where room_id = 202;
delete from ROOM where room_id = 401;
delete from ROOM where room_id = 402;
delete from ROOM where room_id = 403;
delete from ROOM where room_id = 601;
delete from ROOM where room_id = 602;
delete from ROOM where room_id = 603;
delete from ROOM where room_id = 801;
delete from ROOM where room_id = 802;

-- ROOM(방 정보) 테이블 SELETE
select * from room
select available_bed from Room where room_id ='602';
select available_bed from Room where room_id ='201';

-- ROOM(방 정보) 테이블 UPDATE
update ROOM set available_bed = 0 WHERE room_id = '201';
update ROOM set available_bed = 2 WHERE room_id = '201';


/* ################################################### */
/* ########## Reservation (예약정보) 테이블 ########## */
/* ################################################### */

-- Reservation(예약정보) 테이블 DROP
drop table Reservation cascade constraint;

-- Reservation(예약정보) 테이블 CREATE
   -- payment_state - 0 : 입급완료 || 1 : 입금대기
   -- Room 테이블, Member 테이블을 참조하므로 Room 테이블과 Member테이블 먼저 생성
create table Reservation (
	reservation_id	number(10) primary key,
	email	varchar2(50),
	check_in	date,
	check_out	date,
	number_of_guests	number(2)	not null,
	room_id	number(3)	not null,
	gender varchar2(10)	not null,
	payment_status number(1) not null,
	constraint email_fk foreign key (email) references member(email),
	constraint room_id_fk foreign key (room_id) references room(room_id)
);

-- Reservation(예약정보) 테이블 Dummy Data INSERT
insert into reservation values(1,'test@test.com','2017-11-02','2017-11-03',1,401,'남성',0);
insert into reservation values(2,'apple@test.com','2017-10-09','2017-10-14',2,202,'남성',0);
insert into reservation values(3,'banana@test.com','2017-10-12','2017-10-16', 2, 201,'남성',0);
insert into reservation values(4,'orange@test.com','2017-10-13','2017-10-17', 2, 202,'남성',0);
insert into reservation values(5,'cherry@test.com','2017-10-14','2017-10-18', 2, 202,'남성',0);
insert into reservation values(6,'mango@test.com','2017-10-15','2017-10-19', 2, 201,'남성',0);
insert into reservation values(7,'melon@test.com','2017-10-16','2017-10-20', 2, 401,'남성',0);
insert into reservation values(8,'pear@test.com','2017-10-17','2017-10-21', 2, 401,'남성',0);
insert into reservation values(9,'lemon@test.com','2017-10-18','2017-10-22', 2, 601,'남성',0);
insert into reservation values(10,'kiwi@test.com','2017-10-19','2017-10-23', 2, 601,'남성',0);

--  Reservation(예약정보) 테이블 Dummy Data DELETE
delete from reservation where reservation_id = 0001;
delete from reservation where reservation_id = 0002;
delete from reservation where reservation_id = 0003;
delete from reservation where reservation_id = 0004;
delete from reservation where reservation_id = 0005;
delete from reservation where reservation_id = 0006;
delete from reservation where reservation_id = 0007;
delete from reservation where reservation_id = 0008;
delete from reservation where reservation_id = 0009;
delete from reservation where reservation_id = 0010;

--  Reservation(예약정보) 테이블 SELECT
select * from reservation
select * from Reservation where reservation_id = 0001;

-- Reservation(예약정보) 테이블 UPDATE
update reservation set payment_status = 0 WHERE reservation_id = 0001;
update reservation set payment_status = 1 WHERE reservation_id = 0001;


/* ################################################### */
/* ############## Board (게시판) 테이블 ############## */
/* ################################################### */

-- Board (게시판) 테이블 DROP
drop table board cascade constraint;

-- Board (게시판) 테이블 CREATE
create table Board (
	item_num number(10) primary key,
	content varchar2(300) not null,
	title varchar2(100) not null,
	write_date date not null,
	email varchar2(50),
	constraint emailfk foreign key (email) references member(email)
);

-- Board (게시판) 테이블 Dummy Data INSERT
insert into Board values(1,'내용1','제목1','2017-10-01','test@test.com');
insert into Board values(2,'내용2','제목2','2017-10-02','apple@test.com');
insert into Board values(3,'내용3','제목3','2017-10-03','banana@test.com');
insert into Board values(4,'내용4','제목4','2017-10-04','orange@test.com');
insert into Board values(5,'내용5','제목5','2017-10-05','cherry@test.com');
insert into Board values(6,'내용6','제목6','2017-10-06','mango@test.com');
insert into Board values(7,'내용7','제목7','2017-10-07','melon@test.com');
insert into Board values(8,'내용8','제목8','2017-10-08','pear@test.com');
insert into Board values(9,'내용9','제목9','2017-10-09','lemon@test.com');
insert into Board values(10,'내용10','제목10','2017-10-10','kiwi@test.com');

-- Board (게시판) 테이블 Dummy Data DELETE
delete from Board where item_num = 1;
delete from Board where item_num = 2;
delete from Board where item_num = 3;
delete from Board where item_num = 4;
delete from Board where item_num = 5;
delete from Board where item_num = 6;
delete from Board where item_num = 7;
delete from Board where item_num = 8;
delete from Board where item_num = 9;
delete from Board where item_num = 10;

-- Board (게시판) 테이블 SELECT
select * from board;

-- ROOM(방 정보) 테이블 UPDATE
update Board set content = '내용 수정1' WHERE item_num = 1;
update Board set content = '내용1' WHERE item_num = 1;

/***********************************************************************/
/* 이하 X */
/***********************************************************************/



/* ################################################### */
/* ######### Reserved_Room (예약정보) 테이블 ######### */
/* ################################################### */
/* 사용하지 않는 테이블*/

/* drop */
drop table Reserved_Room;

/* create */
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

/* select */
select * from reserved_room

/* insert dummy */
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



/* ################################################### */


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








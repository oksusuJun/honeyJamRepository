


drop table member cascade constraint;
create table member (

email varchar2(50) constraint member_pk_email primary key,
password varchar2(20) not null,
nickname varchar2(30) not null,
phone_num varchar2(13) not null,
admin number(1) not null


);

select * from MEMBER
UPDATE member
SET password = 'testtest',
	nickname = 'test-1',
	phone_num = '01012645456',
	admin = 1
WHERE email = 'test@test.com'


drop table room cascade constraint;
create table room(

room_id number(3) constraint room_pk_id primary key,
gender varchar2(10) not null,
status varchar2(20) not null,
max_bed number(2) not null,
bed_available number(2) not null

);



drop table reservation cascade constraint;
create table reservation(

reservation_id number(10) constraint reservation_pk_id primary key,
email varchar2(50) not null,
check_in date not null,
check_out date not null,
number_of_guests number(2) not null,
room_id number(3) not null,
gender varchar2(10) not null,

constraint fk_reservation_member foreign key (email) references member,
constraint fk_reservation_room foreign key (room_id) references room 
 
);

insert into reservation values(33,'yyy','2017-10-20','2017-10-25',3,101,'male');

select * from reservation

/* Reserved_Room */
drop table reserved;
create table reserved (
   room_id   number(3) primary key,
   number_of_rooms   number(3) not null,
   status   varchar2(20)   not null,
   reservation_id   number(10),
   
constraint fk_reservation_to_reserved foreign key (reservation_id) references reservation
);



drop table board cascade constraint;
create table board(

item_num number(10) constraint board_pk_num primary key,
content varchar2(300) not null,
title varchar2(100) not null,
email varchar2(50) not null,
write_date date not null,

constraint fk_board_member foreign key (email) references member
);


--예약id, 게시글id sequence 만들기
create sequence resv_seq;
create sequence board_seq;


--dummy data
insert into member values ('aaa@com','0000','bbb','010',1);
insert into member values ('b@com','0000','ccc','011',1);
insert into room values(101,'female','ok',6,4);
insert into reservation values(1,'aaa@com','2017-10-19','2017-10-24',2,101,'female');
insert into board values(1,'내용내용','제목','aaa@com','2017-09-28');
insert into reserved values(101, 1 ,'예약완료',1);




--join 제대로 됐는지 확인 
select r.reservation_id, r.check_in, m.email, m.nickname, r1.room_id, r1.status
from reservation r, member m, room r1
where r.email=m.email 
and r.room_id=r1.room_id 
and r.reservation_id=1

select r.reservation_id, r.check_in, re.room_id, re.status
from reservation r, reserved re
where r.reservation_id=re.reservation_id

select b.content, b.title, m.nickname, m.phone_num 
from board b, member m
where b.email=m.email 

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
	constraint email_fk foreign key (email) references member(email),
	constraint room_id_fk foreign key (room_id) references room(room_id)
);


insert into reservation values(0,'bbb','2017-10-09','2017-10-12', 2, 201,'남성',0);
insert into reservation values(1,'bbb','2017-10-12','2017-10-16', 2, 202,'남성',0);
insert into reservation values(2,'777','2017-10-10','2017-10-17', 2, 402,'남성',0);
insert into reservation values(3,'yyy','2017-10-12','2017-10-18', 1, 402,'남성',0);
insert into reservation values(5,'777','2017-10-11','2017-10-20', 2, 401,'남성',0);
insert into reservation values(7,'bbb','2017-10-09','2017-10-12', 5, 602,'남성',0);
insert into reservation values(8,'777','2017-10-08','2017-10-11', 6, 601,'남성',0);




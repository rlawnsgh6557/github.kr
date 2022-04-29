use company;
create table member(name varchar(20) not null, id varchar(20) primary key, pw varchar(20) not null,
phone varchar(13),address varchar(50));
desc member;
insert into member values('관리자', 'admin', '1234','010-1234-4321','행신동 528');
insert into member values('김동협', 'dong', '4321','010-1234-4321','식사동 123');
insert into member values('길정훈', 'gill', '3344','010-2848-1004','성사동 145');
insert into member values('김준호', 'joon', '3333','010-3456-1248','원흥동 37');
insert into member values('김성민', 'seong', '1111','010-4242-7942','주교동 475');
insert into member values('김태균', 'tae', '4444','010-6495-1248','대장동 335');
insert into member values('김예은', 'ye', '2222','010-5882-0907','내곡동 12');
select * from member;
commit;
use class_6 ;


create table un_1 (id int , DOB int, Education varchar(20)) ;

create table un_2 (id int , DOB int, Education varchar(20)) ;

create table un_3 (id int , DOB Date, Education varchar(20)) ;


insert into un_3 values(31, "2000-01-03", "10th"),
(23, "2000-05-01", "10th"),
(33, "2000-07-02", "10th"),
(4, 2000, "10th"),
(5, 2000, "10th"),
(3, 2000, "10th"),
(2, 2000, "10th"),
(5, 2000, "10th") ;



select * from un_1 ;

select * from un_2 ;


select * from un_1
union 
select * from un_2 ;

select * from un_1
union all
select * from un_2 ;


select id, Education from un_1
union 
select * from un_2 ;


select id, Education from un_1
union 
select DOB, Education from un_2 ;

select id, Education from un_1
union all
select DOB, Education from un_2 ;

select id, Education from un_1
union all
select Education, id from un_2 ;

select id, Education from un_1
union 
select DOB, Education from un_2
union
select ID, DOB from UN_3 ;


select id, Education from un_1
union 
select DOB from un_2
union
select ID, DOB from UN_3 ;

select id, Education from un_1 where id < 3
union all
select Id, Education from un_2 where id > 3 ;

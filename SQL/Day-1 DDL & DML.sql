show databases ;

create database if not exists Class_6 ; 

use class_6 ;

show tables ;

create table if not exists employees(
ID int,
`Name` varchar(20)
) ;

describe employees;

select * from employees ;

insert into employees values 
(2, "kaushik"),
(3, "swanand"),
(4, "priyanshu"),
(5, "sanket"),
(6, "sharwari");

insert into employees values 
(null, "rahul") ;


insert into employees (`Name`) values 
("mayuri") ;


alter table employees
add column Department varchar(20) ;

alter table employees 
add column DOB date first ;

alter table employees
add column address varchar(30) after `Name` ;

alter table employees
add column contanct Int after department, add column salary float after address ;

insert into employees (contanct) values 
(8989987789) ;

alter table employees
modify contanct bigint ;

alter table employees 
rename column contanct to contact ;

update employees 
set address = "nagpur" where id = null ;

update employees 
set address = "nagpur" where id is null ;

set sql_safe_updates = 0 ;

delete from employees 
where`name` is null ;

alter table employees
drop column DOB ;

rename table employees to employee ;

truncate table employee ;

drop table employee ;

drop database class_6 ;

select * from employees ;

SHOW DATABASES LIKE "%la"; 
 
SHOW DATABASES LIKE "%30"; 

alter table employees
modify column DOB decimal(10, 2) ;

describe employees ;

-- When using INSERT IGNORE, if any row inserted would cause a duplicate key violation or 
-- any other constraint violation, the row causing the error is not inserted, 
-- and the statement continues with the next row.

delete from employees
where id is null ;

alter table employees
modify column id int primary key ;

INSERT INTO employees (id, `name`, department)
VALUES (1, 'John Doe', 'Sales'),
       (2, 'Jane Smith', 'Marketing'),
       (1, 'James Brown', 'Finance'); 
       

INSERT  INTO employees (id, `name`, department)
VALUES (1, 'John Doe', 'Sales'),
       (2, 'Jane Smith', 'Marketing'),
       (9, 'James Brown', 'Finance'); 
       
       
INSERT IGNORE INTO employees (id, `name`, department)
VALUES (1, 'John Doe', 'Sales'),
       (2, 'Jane Smith', 'Marketing'),
       (9, 'James Brown', 'Finance');        
       
-- Here, the second (1, 'James Brown', 'Finance') row will be ignored due to duplicate emp_id







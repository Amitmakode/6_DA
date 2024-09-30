use practice ;

show tables ;

DELIMITER $$
create function function1(A INT)
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE B int ;
	set B = A + 10 ;
	return B ;
end $$


select age, function1(age) from bank ;

select rating, function1(rating) from dress ;


select * from 5_30.customer ;

select age, function1(age) from 5_30.customer ;


DELIMITER $$
create function function2(profit int , discount int )
returns int
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - discount ;
return final_profit;
end $$


select * from sales ;


select profit, discount, function2(profit, discount) as final_profit from sales 
where function2(profit, discount) > 0
order by final_profit desc; 


create table emp (empid int, salary int) ;

create table sale (empid int, profit int) ;


insert into emp values (1, 10000), (2 ,20000),(3, 30000), (4, 40000), (5, 50000) ;

insert into sale values (1, 5000), (2 ,1500),(6, 2500), (7, 3500), (5, 4500) ;

select e.empid as ID, e.salary as Salary, s.profit as Profit from 
emp e inner join sale s ;

select e.empid as ID, e.salary as Salary, s.profit as Profit from 
emp e inner join sale s  on e.empid = s.empid ;


select e.empid as ID, e.salary as Salary, s.profit as Profit from 
emp e left join sale s  on e.empid = s.empid ;

select e.empid as ID, e.salary as Salary, s.profit as Profit from 
emp e right join sale s  on e.empid = s.empid ;


with ctetable as (select e.empid as ID, e.salary as Salary, s.profit as Profit from 
emp e inner join sale s  on e.empid = s.empid )
select salary, profit, function2(salary, profit) as tempcol from  ctetable ;


select * from emp

select * from sale


DELIMITER &&
create function int_to_str (a int)
returns varchar(30)
DETERMINISTIC
begin
declare b varchar(30);
set b = a;
return b;
end&&


DELIMITER $$
create function final_profits_real1(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6) )
returns decimal(20,6)
Deterministic
Begin 
Declare final_profit decimal(20,6);
set final_profit = profit - sales * discount ;
return final_profit;
end $$


DELIMITER $$
create function FUN4(F VARCHAR(20), L VARCHAR(20) )
returns int
Deterministic
Begin 
Declare FN int ;
set FN = concat(F, L);
return FN;
end $$



DELIMITER &&
create function mark_sales11(a int) 
returns varchar(30)
DETERMINISTIC
begin 
declare b varchar(30); 
if a  <= 100  then 
	set b = "super affordable product" ;
elseif a > 100 and a < 300 then 
	set b = "affordable" ;
elseif a >300 and a < 600 then 
	set b = "moderate price" ;
else 
	set b = "expensive" ;
end if ;
return b;
end &&


select sales, mark_sales11(sales) from sales ;

CREATE TABLE Numbers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `value` INT
);

select * from numbers ;

DELIMITER &&

CREATE FUNCTION InsertIfGreaterThan100(newValue INT)
RETURNS int
deterministic
BEGIN
    DECLARE result int;

    IF newValue > 100 THEN
        INSERT INTO Numbers (value) VALUES (newValue);
        SET result = 'Value inserted successfully.';
    ELSE
        SET result = 'Value must be greater than 100. No insertion performed.';
    END IF;

    RETURN result;
END &&



select InsertIfGreaterThan100(100) 









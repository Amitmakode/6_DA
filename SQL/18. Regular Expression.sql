use practice ;
show tables ;

SELECT job FROM bank WHERE job REGEXP '^[abr]' ;  

SELECT job FROM bank WHERE job REGEXP '^b' ;  

SELECT job FROM bank WHERE job REGEXP 't$' ; 

SELECT job FROM bank WHERE job REGEXP '[nrt]$' ;   

SELECT job FROM bank WHERE job REGEXP '^.{6}$';

SELECT job FROM bank WHERE job REGEXP '-'; 

SELECT job FROM bank WHERE job REGEXP 'll'; 

SELECT job FROM bank WHERE job REGEXP 're'; 

SELECT balance FROM bank WHERE balance REGEXP '11'; 

SELECT balance FROM bank WHERE balance REGEXP '^11'; 

SELECT balance FROM bank WHERE balance REGEXP '11$'; 

SELECT balance FROM bank WHERE balance REGEXP 43 ; 


SELECT REGEXP_INSTR('a b c d e f', 'b', 1, 1, 0) AS start_index_; 

SELECT REGEXP_INSTR('a b c a d e f a', 'a', 3, 2, 0) AS a_index_2;  

SELECT REGEXP_INSTR('underground', 'u', 1, 1, 0) AS a_index_2; 


SELECT job, education, balance 
FROM bank   
WHERE job RLIKE 's$|t$';  


SELECT job, education, balance 
FROM bank   
WHERE job RLIKE '^u|d$'; 

SELECT job, education, balance 
FROM bank   
WHERE job RLIKE '^us|d$'; 


SELECT job, education, balance 
FROM bank   
WHERE job RLIKE '^[us]|d$'; 

SELECT   
'Javatpoint' RLIKE '^C | e$' AS 'RLIKE',  
'Javatpoint' NOT RLIKE '^C | e$' AS 'NOT RLIKE';


SELECT job, balance
FROM bank   
WHERE job RLIKE 'ad..n.'; 


SELECT job, balance
FROM bank   
WHERE job RLIKE '.et..ed'; 

SELECT   
'Javatpoint' LIKE 'Java%' AS 'Match',  
'Javatpoint' NOT LIKE 'Java%' AS 'Not-Match'; 


SELECT  job from bank where job LIKE 'ent%';

SELECT  job from bank where job LIKE '%t%';

SELECT  job from bank where job LIKE '%r';

SELECT  job from bank where job LIKE 're__red';

SELECT  job from bank where job LIKE '_e__red';

SELECT  job from bank where job LIKE '_etir__';

show tables ;

select * from employees ;

INSERT INTO employees (first_name, last_name, email) VALUES
('John', 'Doe', 'john58.doe@sapalogy.govt.org'),
('Jane', 'Smith', 'jane55.smith@exam.co.in'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.net'),
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.org'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.net'),
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.org'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.net') ;


-- Find all employees whose email addresses end with .com:


select * from employees where email regexp ".com$" ;

select * from employees where email regexp "[.org.com]$" ;

SELECT * FROM employees
WHERE email REGEXP '\\.(org|net)$'; 

-- 1. Find Employees with Emails Containing Numbers

select * from employees where email regexp "[0-9]" ;


-- 4. Find Employees with Emails Having a Domain of Exactly 4 Characters

select * from employees where email regexp "@[0-9a-zA-Z]{4}\\.[a-zA-Z]{1,}" ;

-- 6. Find Employees with Emails Where the Username is 6 to 12 Characters Long

select * from employees where email regexp "^[a-zA-z]{4}\\.[a-zA-z]{4}" ;

SELECT  balance from bank where balance LIKE '%888' ;










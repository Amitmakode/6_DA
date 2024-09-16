create database new1 ;

use new1 ;


CREATE TABLE Employees (
    EMNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    MGR INT,
    HIREDATE DATE,
    SAL DECIMAL(10,2),
    COMM DECIMAL(10,2),
    DEPTNO INT
);

INSERT INTO Employees (EMNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'Smith', 'Clerk', 7902, '1980-12-17', 800.00, 100.00, 20),
(7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'Ward', 'Salesman', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'Jones', 'Manager', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'Martin', 'Salesman', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'Blake', 'Manager', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'Clark', 'Manager', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'Scott', 'Analyst', 7566, '1982-12-09', 3000.00, NULL, 20),
(7839, 'King', 'President', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'Turner', 'Salesman', 7698, '1981-09-08', 1500.00, 0.00, 30),
(7876, 'Adams', 'Clerk', 7788, '1983-01-12', 1100.00, NULL, 20),
(7900, 'James', 'Clerk', 7698, '1981-12-03', 950.00, NULL, 30),
(7902, 'Ford', 'Analyst', 7566, '1981-12-05', 3000.00, NULL, 20),
(7934, 'Miller', 'Clerk', 7782, '1982-01-23', 1300.00, NULL, 10),
(7360, 'John', 'Developer', 7902, '1980-12-17', 850.00, 150.00, 20),
(7361, 'Anna', 'Manager', 7902, '1980-12-17', 1800.00, 200.00, 20),
(7362, 'Paul', 'Tester', 7902, '1980-12-17', 900.00, 100.00, 20),
(7363, 'Oscar', 'Designer', 7902, '1980-12-17', 1200.00, 300.00, 20),
(7364, 'Maria', 'Manager', 7902, '1980-12-17', 1900.00, 400.00, 20),
(7365, 'Eva', 'Clerk', 7902, '1980-12-17', 1000.00, 50.00, 20),
(7366, 'Mark', 'Salesman', 7902, '1980-12-17', 1400.00, 200.00, 20),
(7367, 'Lucas', 'Analyst', 7902, '1980-12-17', 2400.00, NULL, 20),
(7368, 'Bella', 'Clerk', 7902, '1980-12-17', 1100.00, 100.00, 20),
(7369, 'Sophia', 'Clerk', 7902, '1980-12-17', 800.00, 100.00, 20),
(7370, 'Lily', 'Manager', 7902, '1980-12-17', 1700.00, 300.00, 20),
(7371, 'Max', 'Salesman', 7902, '1980-12-17', 1500.00, 200.00, 20),
(7372, 'Ethan', 'Analyst', 7902, '1980-12-17', 2300.00, NULL, 20),
(7373, 'Emma', 'Clerk', 7902, '1980-12-17', 1200.00, 100.00, 20),
(7374, 'William', 'Clerk', 7902, '1980-12-17', 900.00, 50.00, 20),
(7375, 'Benjamin', 'Developer', 7902, '1980-12-17', 1300.00, 150.00, 20),
(7376, 'Ava', 'Manager', 7902, '1980-12-17', 1800.00, 200.00, 20),
(7377, 'Oliver', 'Tester', 7902, '1980-12-17', 950.00, 100.00, 20),
(7378, 'Amelia', 'Designer', 7902, '1980-12-17', 1200.00, 300.00, 20),
(7379, 'Mia', 'Manager', 7902, '1980-12-17', 1900.00, 400.00, 20),
(7380, 'Lucas', 'Clerk', 7902, '1980-12-17', 1000.00, 50.00, 20),
(7381, 'Harper', 'Salesman', 7902, '1980-12-17', 1400.00, 200.00, 20),
(7382, 'Evelyn', 'Analyst', 7902, '1980-12-17', 2400.00, NULL, 20),
(7383, 'Logan', 'Clerk', 7902, '1980-12-17', 1100.00, 100.00, 20),
(7384, 'Ella', 'Clerk', 7902, '1980-12-17', 800.00, 100.00, 20),
(7385, 'James', 'Manager', 7902, '1980-12-17', 1700.00, 300.00, 20),
(7386, 'Lucas', 'Salesman', 7902, '1980-12-17', 1500.00, 200.00, 20),
(7387, 'Henry', 'Analyst', 7902, '1980-12-17', 2300.00, NULL, 20),
(7388, 'Olivia', 'Clerk', 7902, '1980-12-17', 1200.00, 100.00, 20),
(7389, 'William', 'Clerk', 7902, '1980-12-17', 900.00, 50.00, 20),
(7390, 'Emily', 'Developer', 7902, '1980-12-17', 1300.00, 150.00, 20),
(7391, 'Lucas', 'Manager', 7902, '1980-12-17', 1800.00, 200.00, 20),
(7392, 'Liam', 'Tester', 7902, '1980-12-17', 950.00, 100.00, 20),
(7393, 'Ava', 'Designer', 7902, '1980-12-17', 1200.00, 300.00, 20),
(7394, 'Benjamin', 'Manager', 7902, '1980-12-17', 1900.00, 400.00, 20),
(7395, 'Emma', 'Clerk', 7902, '1980-12-17', 1000.00, 50.00, 20),
(7396, 'William', 'Salesman', 7902, '1980-12-17', 1400.00, 200.00, 20),
(7397, 'Olivia', 'Analyst', 7902, '1980-12-17', 2400.00, NULL, 20) ;


select * from employees ;

CREATE TABLE Departments (
    DEPTNO INT,
    DNAME VARCHAR(50),
    LOC VARCHAR(50)
);

INSERT INTO Departments (DEPTNO, DNAME, LOC) VALUES
(10, 'Accounting', 'New York'),
(20, 'Research', 'Dallas'),
(30, 'Sales', 'Chicago'),
(40, 'Operations', 'Boston'),
(50, 'Marketing', 'Los Angeles'),
(60, 'Human Resources', 'Seattle'),
(70, 'IT', 'San Francisco'),
(80, 'Legal', 'Washington DC'),
(90, 'Finance', 'Houston'),
(100, 'Engineering', 'Austin'),
(110, 'Customer Service', 'Denver'),
(120, 'Public Relations', 'Atlanta'),
(130, 'Quality Assurance', 'Miami'),
(140, 'Supply Chain', 'Philadelphia'),
(150, 'Administration', 'Phoenix'),
(160, 'Training', 'Detroit'),
(170, 'R&D', 'Minneapolis'),
(180, 'Product Management', 'San Diego'),
(190, 'Facilities', 'Portland'),
(200, 'Consulting', 'Salt Lake City'),
(210, 'Security', 'Las Vegas'),
(220, 'Creative Services', 'Orlando'),
(230, 'Logistics', 'Charlotte'),
(240, 'Education', 'Tampa'),
(250, 'Insurance', 'Pittsburgh'),
(260, 'Manufacturing', 'Cleveland'),
(270, 'Real Estate', 'Indianapolis'),
(280, 'Event Management', 'Kansas City'),
(290, 'Healthcare', 'St. Louis'),
(300, 'Telecommunications', 'San Antonio'),
(310, 'Hospitality', 'Sacramento'),
(320, 'Agriculture', 'Albuquerque'),
(330, 'Energy', 'Louisville'),
(340, 'Transportation', 'Oklahoma City'),
(350, 'Non-Profit', 'Memphis'),
(360, 'Architecture', 'Milwaukee'),
(370, 'Retail', 'Honolulu'),
(380, 'Media', 'New Orleans'),
(390, 'Fashion', 'Anchorage'),
(400, 'Entertainment', 'Boise'),
(410, 'Government', 'Hartford'),
(420, 'Music', 'Bridgeport'),
(430, 'Aerospace', 'Springfield'),
(440, 'Pharmaceuticals', 'Providence'),
(450, 'Legal Services', 'Jackson'),
(460, 'Software', 'Fargo'),
(470, 'Internet', 'Burlington'),
(480, 'Engineering Services', 'Manchester'),
(490, 'Architecture & Planning', 'Virginia Beach'),
(500, 'Biotechnology', 'Charleston');

select * from departments ;


-- Display all the information of the EMP table?

select * from employees ;

-- Display unique Jobs from EMP table?

select distinct job from employees ;


-- List the emps in the asc order of their Salaries?

select ename, sal from employees order by sal ;

select ename, sal from employees order by sal desc ;

select * from employees order by sal desc ;


-- List the details of the emps in asc order of the Dptnos and desc of Jobs?

select * from employees order by DEPTNO and job desc ;

select * from employees order by DEPTNO, job desc ;

-- Display all the unique job groups in the descending order?

select distinct job from employees order by job desc ;

-- Display all the details of all ‘Mgrs’

select mgr from employees ;

Select * from employees where emno in ( select mgr from employees ) ;


-- List the emps who joined before 1981.


select ename, hiredate from employees where year(hiredate) < "1981" ;

select * from employees where hiredate < ("1981-01-01");

select year("2002-02-01") ;

-- List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.


SELECT emno, ename, sal/30 AS monthly_sal, 12*sal AS annsal
FROM employees
ORDER BY annsal ASC;


-- Display the Empno, Ename, job, Hiredate, Exp of all Mgrs

select emno, ename ,job, hiredate, calculate_experience(hiredate) as exps
from employees where emno in (select mgr from employees);


delimiter &&
create function experience(a date, b Date)
returns int
DETERMINISTIC
begin
declare c int ;
set c = year(a) - year(b) ;
return b ;
end && 

delimiter &&
CREATE FUNCTION calculate_experience(hire_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE exp_years INT;
    SET exp_years = YEAR(CURDATE()) - YEAR(hire_date) - (RIGHT(CURDATE(), 5) < RIGHT(hire_date, 5));
    RETURN exp_years;
END &&












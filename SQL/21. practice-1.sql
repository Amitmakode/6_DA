create database practice_sql ;

use practice_sql ;

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

-- Display unique Jobs from EMP table?

select distinct job from employees ;

-- List the emps in the asc order of their Salaries?

select * from employees order by sal ;


-- List the details of the emps in asc order of the Dptnos and desc of Jobs?

select * from employees order by deptno desc, job desc ;

with empcte as
(select * from employees order by deptno desc)
select * from empcte order by job ;


-- Display all the unique job groups in the descending order?

select distinct job from employees order by job desc;


-- Display all the details of all ‘Mgrs’

select mgr from employees ;

-- List the emps who joined before 1981.

select ename, hiredate from employees where year(hiredate) > 1981 ;


-- List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.

select emno, ename, sal, sal/30 as dailysal, sal*12 as ansal from employees order by ansal desc ;


-- Display the Empno, Ename, job, Hiredate, Exp of all Mgrs

select Emno, Ename, job, mgr, year(curdate()) - year(Hiredate) as experience from employees ; 

-- List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.


select Emno, Ename, job, mgr, year(curdate()) - year(Hiredate) as experience from employees where mgr = 7839; 


-- Display all the details of the emps whose Comm. Is more than their Sal

select * from employees where comm > sal ;


-- List the emps in the asc order of Designations of those joined after the second half of 1981.

select ename, hiredate from employees where date_format(hiredate, '%y-%m') > 81-06 ;

select ename, hiredate from employees where year(hiredate) > 1980  month(hiredate) > 6 ;

select ename, hiredate from employees where hiredate > "1981-06-30" ;

-- List the emps along with their Exp and Daily Sal is more than Rs.100.

select *,  year(curdate()) - year(Hiredate) as experience from employees where sal/30 > 100 ;


-- List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order

select * from employees where job = "clerk" or job = "analyst" order by job desc ;

select * from employees where job in ("clerk","analyst") order by job desc ;


-- List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.

select * from employees where hiredate in ('1981-05-01','1981-12-3','1981-12-17','1980-1-19') order by hiredate ;


-- List the emp who are working for the Deptno 10 or20

-- List the emps who are joined in the year 81.

-- List the emps who are joined in the month of jan 1984.

select * from employees where hiredate between "1983-01-1" and "1983-01-30" ; 







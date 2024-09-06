create database views ;
use views;
show tables ;



CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    `Name` VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

insert into employees values
(1, "rahul", "ME", 22000),
(2, "rahul2", "ME2", 21000),
(3, "rahul3", "ME3", 20000),
(4, "rahul4", "ME4", 19000) ;

insert into orders values
(101, 1, "2020-12-12", 45000),
(102, 2, "2020-12-12", 45000),
(103, 3, "2020-12-12", 45000),
(104, 4, "2020-12-12", 45000) ;


select * from employees ;
select * from orders ;


-- 1. Simple View Example
-- Create a view to get employee names and their departments

CREATE VIEW EmployeeDetails AS SELECT EmployeeID, `Name`, Department FROM Employees;

select * from EmployeeDetails;


insert into EmployeeDetails values (5, "rohit", "CE") ;

update EmployeeDetails
set employeeid = 6 where employeeid = 5 ;


delete from EmployeeDetails
where employeeid = 6 ;




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



-- 2. Aggregated View Example
-- Create a view to get total sales amount per employee

CREATE VIEW EmployeeSales AS
SELECT e.`Name`, SUM(o.TotalAmount) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.`Name`;

select * from EmployeeSales ;

insert into EmployeeSales values (6, "sagar", "EE", 23777) ;

update EmployeeSales
set `name` = "shubham" where EmployeeID = 2 ;

delete from EmployeeSales
where `name` = "rahul4" ;






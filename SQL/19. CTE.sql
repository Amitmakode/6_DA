Use practice ;

show tables ;

select * from bank  ;


-- Using CTE to query the Employees table

WITH bankcte AS (
    SELECT age, COUNT(*) AS total
    FROM bank
    GROUP BY age
)
SELECT age, total
FROM bankcte  order by age ;


select * from dress ;

desc dress ;

with dresscte as 
(select style, size, price, Rating from dress where rating > 4 )
select style, rating from dresscte ;


select * from sales ;

with salesCTE as
(select sub_category, (sales * quantity) as total_sales, (sales* quantity) * 0.18 as GST,
 (sales * quantity) - shipping_cost as real_sales,  ((sales*quantity)-shipping_cost)*0.3 as profit
 from sales) 
 select sub_category, sum(total_sales) as sales, sum(gst) as GST, 
 sum(real_sales) as Real_sales, sum(profit) as profit from salesCTE 
 group by sub_category having sales > 0 order by sales desc ;


with salesCTE as
(select sub_category, (sales * quantity) as total_sales, (sales* quantity) * 0.18 as GST,
 (sales * quantity) - shipping_cost as real_sales,  ((sales*quantity)-shipping_cost)*0.3 as profit
 from sales) 
 select sub_category, total_sales, GST, 
  Real_sales,  profit from salesCTE 
having total_sales > 0 order by total_sales desc ;


-- recursive CTE

-- Recursive CTE to calculate factorial

WITH RECURSIVE FactorialCTE (n, factorial) AS (
    SELECT 1 AS n, 1 AS factorial
    UNION ALL
    SELECT n + 1, (n + 1) * factorial
    FROM FactorialCTE
    WHERE n < 10  
)
SELECT n, factorial
FROM FactorialCTE;

-- Using CTE with JOIN

WITH EmployeeDetails AS (
    SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
)
SELECT *
FROM EmployeeDetails;


show tables ;

select * from bank;

select * from cte.course ;

-- Using CTE with DELETE

WITH EmployeesToDelete AS (
    SELECT EMNO, deptno
    FROM 5_30.Employees
    WHERE deptno = 30
)
DELETE FROM EmployeesToDelete
WHERE EMNO = 7900;


WITH EmployeesToDelete AS (
    SELECT EMNO
    FROM 5_30.Employees
    WHERE deptno = 30
)
DELETE FROM 5_30.Employees
WHERE EMNO IN (SELECT EMNO FROM EmployeesToDelete)
  AND EMNO = 7499;



select * from 5_30.employees ;


select age from bank ;

select distinct age from bank ;

select distinct *  from bank ;


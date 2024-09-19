use class_6 ;

show tables ;

CREATE TABLE employees_1 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
);

INSERT INTO employees_1 (employee_id, employee_name, salary, department)
VALUES
    (1, 'John Doe', 50000, 'HR'),
    (2, 'Jane Smith', 60000, 'IT'),
    (3, 'Michael Johnson', 55000, 'Finance'),
    (4, 'Emily Davis', 52000, 'IT'),
    (5, 'Chris Lee', 58000, 'HR');
    

SELECT employee_name, salary,
    CASE
        WHEN salary < 55000 THEN 'Low'
        WHEN salary >= 55000 AND salary < 60000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM
    employees_1;
    
    
SELECT employee_name, salary,
    CASE
        WHEN salary < 55000 THEN 'Low'
        WHEN salary between 55000 AND 60000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM
    employees_1;    
    
    
SELECT
    employee_name,
    department,
    CASE department
        WHEN 'HR' THEN 'Human Resources'
        WHEN 'IT' THEN 'Information Technology'
        WHEN 'Finance' THEN 'Finance Department'
        ELSE 'Other'
    END AS department_category
FROM
    employees_1;    
    
    
UPDATE employees_1 
SET department = 
    CASE
        WHEN department = 'HR' THEN 'human Resource'
        WHEN department = "IT" THEN 'Information Technology'
        ELSE 'Finance Department'
    END;
    
select * from   employees_1 ;  

use new_practice ;

show tables ;

select * from dress ;

select style, price, rating, 
case 
	when rating > 4 then "Excellent"
	when rating between 4 and 3 then "Good"
	else "bad"
end as rating_flag
from dress ;    


select  style, price, rating, 
case 
	when rating > 4 then "Excellent"
	when rating between 4 and 3 then "Good"
	else "bad"
end as rating_flag
from dress order by rating ; 



DELETE FROM dress 
WHERE style = CASE
    WHEN style = 'sexy' THEN 'sexy'
    WHEN style = 'brief' THEN 'brief'
    ELSE NULL
END;


DELETE FROM dress 
WHERE style IN ('vintage', 'cute');


select * from dress where style in ("sexy", "vintage", "party") ;





use class_6 ;

show tables ;


CREATE TABLE empl_Clause (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_department VARCHAR(100),
    emp_salary DECIMAL(10, 2)
);


INSERT INTO empl_Clause (emp_id, emp_name, emp_department, emp_salary) VALUES
(1, 'John Doe', 'Sales', 55000.00),
(2, 'Jane Smith', 'Marketing', 60000.00),
(3, 'Michael Johnson', 'IT', 65000.00),
(4, 'Emily Davis', 'HR', 50000.00),
(5, 'David Brown', 'Finance', 70000.00),
(6, 'Jessica Wilson', 'Sales', 58000.00),
(7, 'Daniel Martinez', 'IT', 62000.00),
(8, 'Sarah Taylor', 'Marketing', 59000.00),
(9, 'Kevin Anderson', 'Finance', 68000.00),
(10, 'Rachel Garcia', 'HR', 51000.00),
(11, 'Robert Moore', 'Sales', 56000.00),
(12, 'Olivia Lee', 'Marketing', 61000.00),
(13, 'William Clark', 'IT', 64000.00),
(14, 'Sophia Hernandez', 'HR', 52000.00),
(15, 'Ethan Scott', 'Finance', 69000.00),
(16, 'Isabella Green', 'Sales', 57000.00),
(17, 'Alexander King', 'Marketing', 62000.00),
(18, 'Mia Baker', 'IT', 63000.00),
(19, 'Benjamin Young', 'HR', 53000.00),
(20, 'Amelia Evans', 'Finance', 66000.00);


SELECT * FROM empl_Clause;


-- 1. Where Clause

SELECT *
FROM empl_Clause
WHERE emp_department = 'Sales';

-- 2. GROUP BY Clause

SELECT emp_department, AVG(emp_salary) AS avg_salary
FROM empl_Clause
GROUP BY emp_department;


-- 3. HAVING Clause


SELECT emp_department, AVG(emp_salary) AS avg_salary
FROM empl_Clause
GROUP BY emp_department
HAVING AVG(emp_salary) > 60000;


-- 4. ORDER BY Clause


SELECT *
FROM empl_Clause
ORDER BY emp_salary DESC;

SELECT *
FROM empl_Clause
ORDER BY emp_salary ;


-- 5. LIMIT and OFFSET Clauses (for pagination)


SELECT *
FROM empl_Clause
LIMIT 5;


SELECT *
FROM empl_Clause
LIMIT 5 OFFSET 5;


SELECT *
FROM empl_Clause
LIMIT 3 OFFSET 17;

SELECT *
FROM empl_Clause
where emp_id = 19;

SELECT *
FROM empl_Clause
where emp_id between 13 and 19;

---------------------------------------------------------------------------------


CREATE TABLE sales_clause (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    customer_id INT
);


INSERT INTO sales_clause (sale_id, sale_date, product_id, quantity, unit_price, customer_id) VALUES
(1, '2024-06-01', 101, 2, 50.00, 1),
(2, '2024-06-02', 102, 1, 80.00, 2),
(3, '2024-06-03', 101, 3, 50.00, 3),
(4, '2024-06-04', 103, 1, 100.00, 4),
(5, '2024-06-05', 102, 2, 80.00, 5),
(6, '2024-06-06', 101, 1, 50.00, 1),
(7, '2024-06-07', 103, 2, 100.00, 2),
(8, '2024-06-08', 102, 3, 80.00, 3),
(9, '2024-06-09', 101, 2, 50.00, 4),
(10, '2024-06-10', 103, 1, 100.00, 5),
(11, '2024-06-11', 101, 3, 50.00, 1),
(12, '2024-06-12', 102, 2, 80.00, 2),
(13, '2024-06-13', 101, 1, 50.00, 3),
(14, '2024-06-14', 103, 2, 100.00, 4),
(15, '2024-06-15', 102, 3, 80.00, 5),
(16, '2024-06-16', 101, 2, 50.00, 1),
(17, '2024-06-17', 103, 1, 100.00, 2),
(18, '2024-06-18', 102, 3, 80.00, 3),
(19, '2024-06-19', 101, 2, 50.00, 4),
(20, '2024-06-20', 103, 3, 100.00, 5);


select * from sales_clause ;


SELECT *
FROM sales_clause
WHERE sale_date = '2024-06-10';


SELECT product_id, SUM(quantity * unit_price) AS total_sales_amount
FROM sales_clause
GROUP BY product_id
HAVING SUM(quantity * unit_price) > 500;



SELECT product_id, SUM(quantity * unit_price) AS total_sales_amount
FROM sales_clause
GROUP BY product_id
ORDER BY total_sales_amount DESC;


SELECT *
FROM sales_clause
WHERE EXTRACT(YEAR_MONTH FROM sale_date) = '202406'
ORDER BY sale_date;


SELECT product_id, SUM(quantity * unit_price) AS total_sales_amount
FROM sales_clause
WHERE EXTRACT(YEAR_MONTH FROM sale_date) = '202406'
GROUP BY product_id
HAVING total_sales_amount > 200
ORDER BY total_sales_amount DESC;

**********************************************************************



CREATE TABLE orders_c (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Create order_details table
CREATE TABLE order_details_c (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders_c(order_id)
);

-- Create products table
CREATE TABLE products_c (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Insert sample data into orders table
INSERT INTO orders_c (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-06-01', 250.00),
(2, 102, '2024-06-02', 180.00),
(3, 103, '2024-06-03', 350.00),
(4, 101, '2024-06-04', 420.00),
(5, 104, '2024-06-05', 300.00);

-- Insert sample data into order_details table
INSERT INTO order_details_c (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 101, 2, 50.00),
(2, 1, 102, 1, 80.00),
(3, 2, 101, 3, 50.00),
(4, 2, 103, 1, 100.00),
(5, 3, 102, 2, 80.00),
(6, 3, 101, 1, 50.00),
(7, 4, 103, 2, 100.00),
(8, 4, 101, 3, 50.00),
(9, 5, 102, 2, 80.00),
(10, 5, 101, 1, 50.00);

-- Insert sample data into products table
INSERT INTO products_c (product_id, product_name, category_id, price, stock_quantity) VALUES
(101, 'Product A', 1, 50.00, 100),
(102, 'Product B', 2, 80.00, 150),
(103, 'Product C', 1, 100.00, 80);


-- 1. Example: Retrieve Total Sales Amount per Customer, Ordered by Total Amount

SELECT o.customer_id, SUM(o.total_amount) AS total_sales_amount
FROM orders_c o
GROUP BY o.customer_id
ORDER BY total_sales_amount DESC;



-- 2. Example: List Products Ordered, Grouped by Product Category, with Total Quantity Sold and Total Revenue Generated, Sorted by Category ID

SELECT p.category_id, 
       p.product_id, 
       p.product_name, 
       SUM(od.quantity) AS total_quantity_sold,
       SUM(od.quantity * od.unit_price) AS total_revenue
FROM products_c p
JOIN order_details_c od ON p.product_id = od.product_id
GROUP BY p.category_id, p.product_id, p.product_name
ORDER BY p.category_id, total_revenue DESC;


-- 4. Example: Calculate Average Order Amount per Customer, Only Include Customers Who Have Made More 
-- Than 2 Orders, Sorted by Average Order Amount

SELECT o.customer_id, 
       COUNT(o.order_id) AS num_orders,
       AVG(o.total_amount) AS avg_order_amount
FROM orders_c o
GROUP BY o.customer_id
HAVING COUNT(o.order_id) > 2
ORDER BY avg_order_amount DESC;

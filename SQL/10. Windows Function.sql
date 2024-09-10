use class_6 ;

show tables ;

CREATE TABLE orders_agg (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

alter table orders_agg
drop primary key ;

-- Insert sample data into orders table
INSERT INTO orders_agg (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-01-01', 280.00),
(2, 102, '2024-01-02', 180.00),
(3, 103, '2024-01-03', 350.00),
(4, 101, '2024-01-04', 420.00),
(5, 104, '2024-01-05', 300.00),
(6, 102, '2024-01-06', 210.00),
(7, 101, '2024-01-07', 280.00),
(8, 103, '2024-01-08', 390.00),
(9, 105, '2024-01-09', 270.00),
(10, 101, '2024-01-10', 320.00),
(11, 104, '2024-01-11', 400.00),
(12, 102, '2024-01-12', 240.00),
(13, 103, '2024-01-13', 360.00),
(14, 105, '2024-01-14', 310.00),
(15, 101, '2024-01-15', 380.00),
(16, 102, '2024-01-16', 220.00),
(17, 104, '2024-01-17', 420.00),
(18, 103, '2024-01-18', 340.00),
(19, 105, '2024-01-19', 290.00),
(20, 101, '2024-01-20', 350.00),
(21, 102, '2024-01-21', 260.00),
(22, 104, '2024-01-22', 390.00),
(23, 103, '2024-01-23', 310.00),
(24, 105, '2024-01-24', 380.00),
(25, 101, '2024-01-25', 300.00),
(26, 102, '2024-01-26', 230.00),
(27, 104, '2024-01-27', 360.00),
(28, 103, '2024-01-28', 330.00),
(29, 105, '2024-01-29', 320.00),
(30, 101, '2024-01-30', 370.00),
(31, 102, '2024-01-31', 270.00),
(32, 104, '2024-02-01', 410.00),
(33, 103, '2024-02-02', 320.00),
(34, 105, '2024-02-03', 300.00),
(35, 101, '2024-02-04', 390.00),
(36, 102, '2024-02-05', 280.00),
(37, 104, '2024-02-06', 420.00),
(38, 103, '2024-02-07', 350.00),
(39, 105, '2024-02-08', 330.00),
(40, 101, '2024-02-09', 400.00),
(41, 102, '2024-02-10', 290.00),
(42, 104, '2024-02-11', 440.00),
(43, 103, '2024-02-12', 360.00),
(44, 105, '2024-02-13', 340.00),
(45, 101, '2024-02-14', 410.00),
(46, 102, '2024-02-15', 300.00),
(47, 104, '2024-02-16', 430.00),
(48, 103, '2024-02-17', 370.00),
(49, 105, '2024-02-18', 350.00),
(50, 101, '2024-02-19', 420.00);


-- 1. COUNT()


select count(*) from orders_agg ;

select count(customer_id) from orders_agg ;

SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders_agg
GROUP BY customer_id;

SELECT customer_id, COUNT(DISTINCT order_id) AS num_products
FROM orders_agg
GROUP BY customer_id;

SELECT order_id, COUNT(DISTINCT customer_id) AS num_products
FROM orders_agg
GROUP BY order_id;


-- 2. SUM()

SELECT SUM(total_amount) AS total_revenue
FROM orders_agg;


SELECT customer_id, SUM(total_amount) AS total_quantity_sold
FROM orders_agg
GROUP BY customer_id;


-- 3. AVG()

SELECT customer_id, AVG(total_amount) AS avg_order_amount
FROM orders_agg
GROUP BY customer_id;


-- 4. MIN()

SELECT MIN(order_date) AS earliest_order_date
FROM orders_agg ;


-- 5. Max

SELECT Max(order_date) AS earliest_order_date
FROM orders_agg ;

-- 6. SUM() ... OVER (PARTITION BY ...)

SELECT customer_id, order_id, total_amount,
SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_id) AS cumulative_total
FROM orders_agg;

SELECT customer_id, order_id, total_amount,
SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_id desc) AS cumulative_total
FROM orders_agg;


select partition_name , table_name , table_rows from 
information_schema.partitions where table_name = 'orders_agg';


-- 7.ROW_NUMBER()

SELECT order_id, customer_id, order_date,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
FROM orders_agg;


-- 8. RANK()

SELECT order_id, customer_id, order_date,
       rank() OVER (PARTITION BY customer_id ORDER BY order_date) AS rank_num
FROM orders_agg;


-- 89 Dens_RANK()

SELECT order_id, customer_id, order_date,
       dense_rank() OVER (PARTITION BY customer_id ORDER BY order_date) AS rank_num
FROM orders_agg;


SELECT customer_id, total_spent,
       DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spending_dense_rank
FROM (SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders_agg
    GROUP BY customer_id) AS customer_spending;


SELECT customer_id, total_spent,
       RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM (SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders_agg
    GROUP BY customer_id) AS customer_spending;
  
  
-------------------------------------------------------------

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 101, '2024-01-01', 250.00),
(2, 102, '2024-01-02', 180.00),
(3, 103, '2024-01-03', 350.00),
(4, 101, '2024-01-04', 420.00),
(5, 104, '2024-01-05', 300.00),
... -- Insert more data as needed
;



CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2)
);

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 101, 2, 50.00),
(2, 1, 102, 1, 100.00),
(3, 2, 103, 3, 60.00),
(4, 3, 104, 2, 75.00),
(5, 3, 105, 1, 100.00),
... -- Insert more data as needed
;




CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO products (product_id, product_name, category_id, price, stock_quantity)
VALUES
(101, 'Product A', 1, 50.00, 100),
(102, 'Product B', 2, 100.00, 50),
(103, 'Product C', 1, 60.00, 75),
(104, 'Product D', 3, 75.00, 120),
(105, 'Product E', 2, 100.00, 80),
... -- Insert more data as needed
;




1. Example: Calculate Total Revenue and Average Order Size per Product Category
sql


SELECT 
    p.category_id, 
    SUM(od.quantity * od.unit_price) AS total_revenue,
    AVG(od.quantity) AS avg_quantity_per_order
FROM 
    order_details od
JOIN 
    products p ON od.product_id = p.product_id
GROUP BY 
    p.category_id
ORDER BY 
    total_revenue DESC;
	
	
	
	
2. Example: Find Customers Who Have Ordered Products from Multiple Categories
sql

SELECT 
    o.customer_id,
    COUNT(DISTINCT p.category_id) AS num_categories_ordered,
    SUM(o.total_amount) AS total_spent
FROM 
    orders o
JOIN 
    order_details od ON o.order_id = od.order_id
JOIN 
    products p ON od.product_id = p.product_id
GROUP BY 
    o.customer_id
HAVING 
    COUNT(DISTINCT p.category_id) > 1
ORDER BY 
    total_spent DESC;
	
	
	
3. Example: Identify Products with High and Low Inventory
sql

SELECT 
    product_name,
    price,
    stock_quantity,
    MIN(price) OVER () AS min_price,
    MAX(price) OVER () AS max_price,
    AVG(price) OVER () AS avg_price,
    ROW_NUMBER() OVER (ORDER BY stock_quantity DESC) AS stock_rank
FROM 
    products
ORDER BY 
    stock_quantity DESC;
	
	
	
	
4. Example: Calculate Moving Average of Order Amounts for Each Customer
sql

SELECT 
    customer_id,
    order_date,
    total_amount,
    AVG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_amount
FROM 
    orders
ORDER BY 
    customer_id, order_date;
	
	
	
---------------------------------------------------


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2),
    transaction_type VARCHAR(50)
);

INSERT INTO transactions (transaction_id, account_id, transaction_date, amount, transaction_type)
VALUES
(1, 101, '2024-01-01', 1000.00, 'Income'),
(2, 102, '2024-01-02', -500.00, 'Expense'),
(3, 101, '2024-01-03', -300.00, 'Expense'),
(4, 103, '2024-01-04', 1500.00, 'Income'),
(5, 102, '2024-01-05', -200.00, 'Expense'),
(6, 101, '2024-01-06', -400.00, 'Expense'),
(7, 102, '2024-01-07', 800.00, 'Income'),
(8, 103, '2024-01-08', -700.00, 'Expense'),
(9, 101, '2024-01-09', -600.00, 'Expense'),
(10, 104, '2024-01-10', 1200.00, 'Income'),
(11, 102, '2024-01-11', -300.00, 'Expense'),
(12, 101, '2024-01-12', 500.00, 'Income'),
(13, 103, '2024-01-13', -1000.00, 'Expense'),
(14, 105, '2024-01-14', 1500.00, 'Income'),
(15, 101, '2024-01-15', -200.00, 'Expense'),
(16, 102, '2024-01-16', 1000.00, 'Income'),
(17, 104, '2024-01-17', -500.00, 'Expense'),
(18, 101, '2024-01-18', 700.00, 'Income'),
(19, 103, '2024-01-19', -800.00, 'Expense'),
(20, 105, '2024-01-20', 600.00, 'Income'),
(21, 101, '2024-01-21', -300.00, 'Expense'),
(22, 102, '2024-01-22', 400.00, 'Income'),
(23, 104, '2024-01-23', -200.00, 'Expense'),
(24, 101, '2024-01-24', 900.00, 'Income'),
(25, 103, '2024-01-25', -400.00, 'Expense'),
(26, 105, '2024-01-26', 300.00, 'Income'),
(27, 101, '2024-01-27', -500.00, 'Expense'),
(28, 102, '2024-01-28', 1100.00, 'Income'),
(29, 104, '2024-01-29', -600.00, 'Expense'),
(30, 101, '2024-01-30', 800.00, 'Income'),
(31, 103, '2024-01-31', -700.00, 'Expense'),
(32, 105, '2024-02-01', 1000.00, 'Income'),
(33, 101, '2024-02-02', -100.00, 'Expense'),
(34, 102, '2024-02-03', 1200.00, 'Income'),
(35, 104, '2024-02-04', -300.00, 'Expense'),
(36, 101, '2024-02-05', 600.00, 'Income'),
(37, 103, '2024-02-06', -400.00, 'Expense'),
(38, 105, '2024-02-07', 700.00, 'Income'),
(39, 101, '2024-02-08', -200.00, 'Expense'),
(40, 102, '2024-02-09', 800.00, 'Income'),
(41, 104, '2024-02-10', -500.00, 'Expense'),
(42, 101, '2024-02-11', 900.00, 'Income'),
(43, 103, '2024-02-12', -600.00, 'Expense'),
(44, 105, '2024-02-13', 1000.00, 'Income'),
(45, 101, '2024-02-14', -300.00, 'Expense'),
(46, 102, '2024-02-15', 700.00, 'Income'),
(47, 104, '2024-02-16', -400.00, 'Expense'),
(48, 101, '2024-02-17', 800.00, 'Income'),
(49, 103, '2024-02-18', -100.00, 'Expense'),
(50, 105, '2024-02-19', 600.00, 'Income');




CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(100),
    account_type VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts (account_id, account_name, account_type, balance)
VALUES
(101, 'Checking Account', 'Checking', 5000.00),
(102, 'Savings Account', 'Savings', 10000.00),
(103, 'Investment Account', 'Investment', 25000.00),
(104, 'Business Account', 'Checking', 15000.00),
(105, 'Investment Portfolio', 'Investment', 50000.00),
(106, 'Personal Savings', 'Savings', 20000.00),
(107, 'Credit Card', 'Credit', -5000.00),
(108, 'Brokerage Account', 'Investment', 30000.00),
(109, 'Retirement Fund', 'Investment', 45000.00),
(110, 'Emergency Fund', 'Savings', 10000.00),
(111, 'Travel Savings', 'Savings', 8000.00),
(112, 'Business Savings', 'Savings', 30000.00),
(113, 'Education Fund', 'Savings', 25000.00),
(114, 'Charity Account', 'Checking', 7000.00),
(115, 'Medical Expenses', 'Checking', 12000.00),
(116, 'Rent Payments', 'Checking', -2000.00),
(117, 'Utility Bills', 'Checking', -3000.00),
(118, 'Insurance Premiums', 'Credit', -4000.00),
(119, 'Stock Market Investments', 'Investment', 55000.00),
(120, 'Real Estate Holdings', 'Investment', 75000.00),
(121, 'Personal Loan', 'Credit', -15000.00),
(122, 'Student Loan', 'Credit', -10000.00),
(123, 'Mortgage Loan', 'Credit', -25000.00),
(124, 'Car Loan', 'Credit', -8000.00),
(125, 'Vacation Fund', 'Savings', 15000.00),
(126, 'Wedding Expenses', 'Savings', 18000.00),
(127, 'Home Renovation', 'Savings', 25000.00),
(128, 'Healthcare Savings', 'Savings', 12000.00),
(129, 'Pet Care Fund', 'Savings', 5000.00),
(130, 'Emergency Medical Fund', 'Savings', 10000.00),
(131, 'Bonus Savings', 'Savings', 3000.00),
(132, 'Tax Payments', 'Checking', -6000.00),
(133, 'Child Education Fund', 'Savings', 35000.00),
(134, 'Elderly Care Fund', 'Savings', 15000.00),
(135, 'Business Expenses', 'Checking', -10000.00),
(136, 'Freelance Income', 'Checking', 8000.00),
(137, 'Consulting Fees', 'Checking', 12000.00),
(138, 'Investment Returns', 'Investment', 20000.00),
(139, 'Dividend Income', 'Investment', 15000.00),
(140, 'Pension Fund', 'Investment', 40000.00),
(141, 'Charitable Donations', 'Savings', -5000.00),
(142, 'Gift Fund', 'Savings', -3000.00),
(143, 'Legal Expenses', 'Credit', -7000.00),
(144, 'Home Loan Payments', 'Credit', -12000.00),
(145, 'Entertainment Budget', 'Checking', -4000.00),
(146, 'Fitness Membership', 'Savings', -1000.00),
(147, 'Gaming Enthusiast', 'Savings', -2000.00),
(148, 'Art Collection Fund', 'Investment', 25000.00),
(149, 'Music Lessons', 'Savings', -3000.00),
(150, 'Language Course Fees', 'Savings', -2500.00);



1. Example: Calculate Total Income and Expenses by Account Type
sql
 
SELECT 
    a.account_type,
    SUM(CASE WHEN t.transaction_type = 'Income' THEN t.amount ELSE 0 END) AS total_income,
    SUM(CASE WHEN t.transaction_type = 'Expense' THEN t.amount ELSE 0 END) AS total_expenses,
    SUM(t.amount) AS net_amount,
    a.balance AS current_balance
FROM 
    transactions t
JOIN 
    accounts a ON t.account_id = a.account_id
GROUP BY 
    a.account_type, a.balance
ORDER BY 
    a.account_type;
	
	
	
	
2. Example: Calculate Yearly Income Trends Across Accounts
sql
 
SELECT 
    YEAR(transaction_date) AS year,
    a.account_type,
    SUM(CASE WHEN t.transaction_type = 'Income' THEN t.amount ELSE 0 END) AS total_income
FROM 
    transactions t
JOIN 
    accounts a ON t.account_id = a.account_id
GROUP BY 
    YEAR(transaction_date), a.account_type
ORDER BY 
    year, a.account_type;
	
	
	
	
3. Example: Find Accounts with Highest and Lowest Average Monthly Expenses
sql
 
SELECT 
    a.account_name,
    AVG(t.amount) AS avg_monthly_expense
FROM 
    transactions t
JOIN 
    accounts a ON t.account_id = a.account_id
WHERE 
    t.transaction_type = 'Expense'
GROUP BY 
    a.account_name
HAVING 
    AVG(t.amount) > 0
ORDER BY 
    avg_monthly_expense DESC;
	
	
	
	
	
4. Example: Identify Accounts with Highest and Lowest Balance Fluctuations
sql
 
SELECT 
    a.account_name,
    MAX(a.balance) - MIN(a.balance) AS balance_fluctuation
FROM 
    accounts a
GROUP BY 
    a.account_name
ORDER BY 
    balance_fluctuation DESC;  
    
    
    




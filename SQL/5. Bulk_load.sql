use class_6 ;

show tables ;

CREATE TABLE sales (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL);
    
    
SET SESSION sql_mode = '';

load data infile 
"F:/sales_data_final.csv"
into table sales
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

SET SQL_SAFE_UPDATES = 0;


select * from sales ; 

select str_to_date(order_date,'%m/%d/%y') from sales;  

alter table sales
add column order_date_real date after order_date ;

update sales
set order_date_real = str_to_date(order_date,'%m/%d/%Y');


update sales
set ship_date = str_to_date(ship_date,'%m/%d/%Y');


update sales
set sales = (sales + sales*0.6);

update sales
set sales = (sales + 10);




rollback ;




 

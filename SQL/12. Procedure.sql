use practice ;
show tables ;

select * from sales ;

select * from sales where market = "EU" ;

select * from sales where country = "france" and market = "EU" ;


delimiter $$
create procedure pro1(IN a varchar(20), IN b varchar(20))
Begin
	select * from sales where country = a and market = b ;
End $$

Delimiter $$


call pro1("sweden", "EU")


DELIMITER &&
create procedure pro2(IN var int)
BEGIN
	select * from sales where quantity > var ;
END &&


call pro2(20) ;


DELIMITER &&
CREATE PROCEDURE pro3 (IN A INT, IN c int, IN B VARCHAR(20), IN D VARCHAR(20))
BEGIN
SELECT country, region, sales, segment, shipping_cost FROM sales 
WHERE quantity >= A AND profit <= C AND (country = B OR country = D) ;
END &&


call pro3(300, 50, "India", "france") ;


DELIMITER &&
CREATE PROCEDURE Pro4
(IN A int, IN B varchar(30), IN C Date, IN D varchar(20), IN E varchar(20), IN F float, IN G float )
BEGIN
	SELECT Quantity, Ship_mode, order_date_real, country, profit, dicount, segment, region FROM sales
	WHERE quantity > A and Ship_mode = B and order_date_real = C and (country = D or County = E) 
	and (profit > F or profit = G) ;
END &&


call pro4(300, "second class", "2011-05-01", "cuba", "australia", 0.5, 1.0 ) ;

select sales, quantity, (sales*quantity) as total_sales,  (total_sales *0.18) as GST from sales ;

select sales, quantity, (sales*quantity) as total_sales  from sales  where (total_sales *0.18) as GST > 100;

select sales, quantity, (sales*quantity) as total_sales, ((sales * quantity) * 0.18) as GST  from sales  
where ((sales * quantity) * 0.18) > 1000 ;


SELECT sales, quantity, (sales * quantity) AS total_sales, ((sales * quantity) * 0.18) AS GST FROM sales
WHERE ((sales * quantity) * 0.18) > 100;


Delimiter //
create procedure Pro5 (IN tax float, IN CA int )
Begin
	SELECT sales, quantity, (sales * quantity) AS total_sales, ((sales * quantity) * 0.18) AS GST FROM sales
     WHERE ((sales * quantity) * tax) > CA;
end //

call pro5(25, 500) ;



create database new1 ;

use new1;

-- after and before / insert-update-delete


# After Insert

create table t1 (
c1 varchar(50),
c2 date,
c3 int);

create table t2 (
c11 varchar(50),
c12 date,
c13 int);


select * from t1 ;

select * from t2 ;

insert into t1 values("kaushik", "2020-12-8", 23000 ) ;


delimiter //
create trigger t1_to_t2
after insert on t1 for each row 
begin
	insert into t2(c11,c12,c13) values ("xyz", sysdate(), 120);
end; //



# after update

create table u1 (
c1 varchar(50),
c2 date,
c3 int);


create table u2 (
c11 varchar(50),
c12 date,
c13 int);


select * from u1 ;
select * from u2 ;


insert into u1 value ("java1", "2000-12-12", null) ;


delimiter //
create trigger u1_to_u2
before update on u1 for each row 
begin
	insert into u2(c11,c12,c13) values ("xyz", sysdate(), 120);
end; //



update u1 set c3 = 222 where c1 = "java1" and c3= 111 ;


create table u3 (
c11 varchar(50),
c12 date,
c13 int);

select * from u3 ;



delimiter //
create trigger u1_to_u3
after update on u1 for each row 
begin
	insert into u3(c11,c12,c13) values (new.c1, new.c2, new.c3);
end; //


# before delete


create table d1 (
c1 varchar(50),
c2 date,
c3 int);


create table d2 (
c11 varchar(50),
c12 date,
c13 int);


insert into d1 value ("java", "2000-12-12", 88) ;

insert into d1 value ("java1", "2000-12-12", 88) ;

insert into d1 value ("java2", "2000-12-12", 90) ;

select * from d1 ;

select * from d2 ;



delimiter //
create trigger d1_to_d2
before delete on d1 for each row 
begin
	insert into d2(c11,c12,c13) values (old.c1, old.c2, old.c3);
end; //


delete from d1 where c1 = "java1" ;

&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&



CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year YEAR NOT NULL
);


INSERT INTO books (title, author, published_year) VALUES
('To Kill a Mockingbird', 'Harper Lee', 1960),
('1984', 'George Orwell', 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
('Moby Dick', 'Herman Melville', 1975) ;


select * from books ;


DELIMITER //
CREATE PROCEDURE GetBookByID(IN bookId INT)
BEGIN
    SELECT * FROM books WHERE id = bookId;
END //
DELIMITER ;

call getbookbyid(20)

DELIMITER //
CREATE PROCEDURE GetBookByyear(IN launchyear INT)
BEGIN
    SELECT * FROM books WHERE publish_year = launchyear ;
END //
DELIMITER ;

call GetBookByyear(1960) ;



##################################




-- Table for Products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Table for Customers
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Table for Orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


-- Inserting sample products
INSERT INTO products (`name`, price, stock) VALUES
('Laptop', 999.99, 10),
('Smartphone', 599.99, 20),
('Headphones', 199.99, 30);

-- Inserting sample customers
INSERT INTO customers (`name`, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com');

select * from products ;
select * from customers ;
select * from orders ;

update products 
set stock = 2 where id = 3 ;

-- Procedure to Place an Order

DELIMITER //
CREATE PROCEDURE PlaceOrder(IN customerId INT, IN productId INT)
BEGIN
    DECLARE available_stock INT;

    -- Check available stock
    SELECT stock INTO available_stock FROM products WHERE id = productId;

    IF available_stock > 0 THEN
        -- Insert the order
        INSERT INTO orders (customer_id) VALUES (customerId);

        -- Decrease the stock
        UPDATE products SET stock = stock - 1 WHERE id = productId;

        SELECT 'Order placed successfully!' AS message;
    ELSE
        SELECT 'Product is out of stock!' AS message;
    END IF;
END //

DELIMITER ;


call PlaceOrder(1, 3) ;



$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE order1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Insert customers
INSERT INTO customer (name, email) VALUES
('Alice Johnson', 'alice1@example.com'),
('Bob Smith', 'bob1@example.com');


select * from customer ;

select * from order1 ;


-- Insert orders
INSERT INTO order1 (customer_id) VALUES (1); -- Valid
INSERT INTO order1 (customer_id) VALUES (2); -- Valid


delete from customer 
where customer_id = 1 ;





 

-- Table for Authors
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    bio TEXT
);

-- Table for Books
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Table for Borrowers
CREATE TABLE borrowers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Table for Loans
CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    return_date DATETIME,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(id)
);








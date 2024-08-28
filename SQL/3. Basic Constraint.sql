use class_6 ;


#Constraints used in MySQL

NOT NULL
CHECK
DEFAULT
PRIMARY KEY
AUTO_INCREMENT  -- it will not use without key column
UNIQUE
INDEX
ENUM
FOREIGN KEY
Composit key


#NOT NULL Constraint

CREATE TABLE Student(
Id INTEGER, 
LastName TEXT NOT NULL, 
FirstName TEXT NOT NULL, 
City VARCHAR(35));

select * from Student ;

INSERT INTO Student VALUES(1, 'Hanks', 'Peter', 'New York'); 
 
INSERT INTO Student VALUES(2, NULL, 'Amanda', 'Florida');

INSERT INTO Student VALUES(3, "lee", 'Amanda', null);

describe Student ;


#UNIQUE Constraint

CREATE TABLE ShirtBrands(
Id INTEGER, 
BrandName VARCHAR(40) UNIQUE, 
Size VARCHAR(30));

select * from shirtbrands ;

INSERT INTO ShirtBrands(Id, BrandName, Size) 
VALUES(1, 'abc', 38), (2, 'Cantabil', 40);  

INSERT INTO ShirtBrands(Id, BrandName, Size) 
VALUES(1, 'Raymond', 38), (2, 'Cantabil', 40); 


#CHECK Constraint
#CHECK (expression)
  
CREATE TABLE Persons (  
    ID int unique,  
    `Name` varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
);  

select * from persons;

INSERT INTO Persons(Id, `Name`, Age)   
VALUES (null,'Robert', 8), (5, 'Joseph', 35), (null, null, 10);  

INSERT INTO Persons(Id, `Name`, Age) VALUES (1,'Robert', 15);

update persons 
set age = 12 where id = 2 ;

drop table persons ;


#DEFAULT Constraint

CREATE TABLE Persons (  
    ID int NOT NULL,  
    `Name` varchar(45) NOT NULL,  
    Age int,  
    City varchar(25) DEFAULT 'New York'  
);  

INSERT INTO Persons(Id, `Name`, Age, City)   
VALUES (1,'Robert', 15, null),   
(2, 'Joseph', 35, 'California'),   
(3, 'Peter', 40, 'Alaska');  

INSERT INTO Persons(Id, `Name`, Age) VALUES (1,'Brayan', 15); 
 
SELECT * FROM Persons; 



#AUTO_INCREMENT Constraint

CREATE TABLE Animals(  
id int NOT NULL AUTO_INCREMENT,   
`name` CHAR(30) NOT NULL,   
PRIMARY KEY (id)) ;  

INSERT INTO Animals (`name`) VALUES   
('Tiger'),('Dog'),('Penguin'),   
('Camel'),('Cat'),('Ostrich'); 

INSERT INTO Animals (id, `name`) VALUES   
(111, 'Tiger'),(200, 'Dog'),(101 ,'Penguin') ;

SELECT * FROM Animals;



#ENUM Constraint

CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    `name` VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')  );  
    
CREATE TABLE Shirts1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(35),
    size ENUM('small', 'medium', 'large', 'x-large')  DEFAULT 'small'
);    

INSERT INTO Shirts1(id, `name`, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large'),
(4, 'formal-shirt', null); 

INSERT INTO Shirts1(`name`)     
VALUES ('t-shirt') ;

select * from shirts1 ;
select * from customers1 ;




create table emp(
ID int primary key auto_increment,
`name` varchar(30) not null default "Unknown",
DOB date not null check(DOB >= "2000-1-1") default "2000-1-1",
salary decimal(6,2) not null check (salary >=20000),
email varchar(20) Not null unique ,
department enum("Admin", "sales", "production", "operatrion") not null default "Admin" );




 



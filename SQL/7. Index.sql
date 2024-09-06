use class_6 ;

show tables;

create table if not exists course_Idx (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50));

show index from course_Idx ;


insert into course_Idx values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

select * from course_Idx ;

explain select * from course_Idx where course_name = "java" ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- simple index

create table if not exists course1_idx (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_name));

insert into course1_idx values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course1_idx ;

explain select * from course1_Idx where course_name = "java" ;

@@@@@@@@@@@@@@@@@@@@@@

-- composit index

create table if not exists course2_idx (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50));

insert into course2_idx values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course2_idx ;

explain select * from course2_idx where course_id = 103  and course_name = "fsds" ;

create index idx_1 on course2_idx (course_id, course_name);

explain select * from course2_idx where course_id = 103  and course_name = "fsds" ;

explain select * from course2_Idx where course_name = "java" ;

EXPLAIN ANALYZE select * from course2_idx where course_id = 106 or course_name = 'fsds';

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


create table if not exists course3_idx (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_desc,course_name,course_tag));

insert into course3_idx values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');


explain select * from course3_idx where course_desc = 'full stack big data'
  and course_name = "fsds" and course_tag = "BD";
  
  
@@@@@@@@@@@@@@@@@@@@@@@@


CREATE TABLE CUSTOMERS (
   ID INT primary key,
   `NAME` VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2)
);


INSERT INTO CUSTOMERS (ID, `NAME`, AGE, ADDRESS, SALARY) VALUES
(1, 'John Doe', 28, '123 Elm St.', 50000.00),
(2, 'Jane Smith', 34, '456 Oak Ave.', 60000.00),
(3, 'Emily Davis', 25, '789 Pine Rd.', 55000.00),
(4, 'Michael Brown', 40, '135 Maple Dr.', 70000.00),
(5, 'Jessica White', 29, '246 Cedar St.', 48000.00),
(6, 'David Johnson', 31, '357 Birch Blvd.', 52000.00),
(7, 'Sarah Wilson', 27, '468 Spruce St.', 53000.00),
(8, 'James Taylor', 38, '579 Willow Ct.', 65000.00),
(9, 'Linda Martinez', 32, '680 Fir Lane', 62000.00),
(10, 'Robert Anderson', 45, '791 Redwood Rd.', 75000.00);


show index from CUSTOMERS ;

explain select * from customers where `name` = 'David Johnson' ;

CREATE UNIQUE INDEX UNIQUE_INDEX ON CUSTOMERS (`Name`);

explain select * from customers where `name` = 'David Johnson' ;  


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- full text index

CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content TEXT
);


INSERT INTO articles (title, content) VALUES
('Introduction to MySQL', 'MySQL is an open-source relational database management system. It is widely used for web applications and is known for its reliability and performance.'),
('Understanding Indexes', 'Indexes are database objects that improve the speed of data retrieval operations. They are crucial for optimizing query performance and managing large datasets.'),
('SQL Joins Explained', 'SQL Joins are used to combine rows from two or more tables based on a related column between them. Types of joins include INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN.'),
('Advanced SQL Queries', 'Advanced SQL queries involve complex operations like subqueries, nested joins, and aggregate functions. These queries help in extracting meaningful insights from large datasets.'),
('Database Normalization', 'Database normalization is a process to organize a database into tables and columns to reduce redundancy and improve data integrity. It involves dividing a database into two or more tables and defining relationships between them.');


show index from articles ;

explain SELECT * FROM articles
WHERE MATCH(content) AGAINST('SQL Joins Explained');

CREATE FULLTEXT INDEX idx_content ON articles (content);

OPTIMIZE TABLE articles;

explain SELECT * FROM articles
WHERE MATCH(content) AGAINST('SQL Joins Explained');

explain select * from articles where title = 'SQL Joins Explained' ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

ALTER TABLE CUSTOMERS ADD INDEX AGE_INDEX (AGE);

DROP INDEX index_name ON composite_index;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


-- desc index

CREATE TABLE EMPLOYEES1 (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    `NAME` VARCHAR(50),
    AGE INT,
    POSITION VARCHAR(50),
    SALARY DECIMAL(15, 2)
);


INSERT INTO EMPLOYEES1 (NAME, AGE, POSITION, SALARY) VALUES
('Alice Johnson', 30, 'Software Engineer', 95000.00),
('Bob Smith', 45, 'Project Manager', 105000.00),
('Carol Davis', 28, 'Graphic Designer', 72000.00),
('David Wilson', 35, 'Database Administrator', 85000.00),
('Eve Adams', 42, 'HR Manager', 90000.00),
('Frank Miller', 50, 'Systems Analyst', 98000.00),
('Grace Lee', 29, 'Web Developer', 76000.00),
('Henry Brown', 40, 'Network Engineer', 89000.00),
('Ivy Taylor', 33, 'Marketing Specialist', 77000.00),
('Jack Martinez', 37, 'Business Analyst', 83000.00);

SHOW INDEX FROM EMPLOYEES1;

explain SELECT * FROM EMPLOYEES1
ORDER BY SALARY DESC;


CREATE INDEX idx_salary_desc ON EMPLOYEES1 (SALARY DESC);


explain SELECT * FROM employees1
ORDER BY salary DESC;


#Without Index: When sorting or filtering data in descending order without an index, 
-- MySQL might need to perform a full table scan or sort the data after fetching it, 
-- which can be slower for large datasets.
#With Index: With a descending index, MySQL can use the index to directly access 
-- the data in descending order, which can improve query performance, especially with large datasets.
#Small Dataset: For small datasets, the performance improvement of indexing might not be noticeable.
-- The query execution time might be very short regardless of whether an index is present or not.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

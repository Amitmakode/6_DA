use class_6 ;


CREATE TABLE Orders_part (
    OrderID INT,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO Orders_part (OrderID, OrderDate, CustomerID, TotalAmount)
VALUES
    (1, '2023-01-01', 101, 150.00),
    (2, '2023-01-02', 102, 200.00),
    (3, '2023-01-05', 103, 75.00),
    (4, '2023-02-10', 101, 300.00),
    (5, '2023-02-15', 102, 100.00),
    (6, '2023-02-28', 103, 250.00),
    (7, '2023-03-05', 101, 180.00),
    (8, '2023-03-08', 102, 220.00),
    (9, '2023-03-12', 103, 90.00),
    (10, '2023-04-01', 101, 280.00),
    (11, '2023-04-02', 102, 150.00),
    (12, '2023-04-05', 103, 200.00),
    (13, '2023-05-10', 101, 320.00),
    (14, '2023-05-15', 102, 180.00),
    (15, '2023-05-20', 103, 150.00),
    (16, '2023-06-01', 101, 200.00),
    (17, '2023-06-05', 102, 300.00),
    (18, '2023-06-10', 103, 250.00),
    (19, '2023-07-01', 101, 150.00),
    (20, '2023-07-02', 102, 200.00),
    (21, '2023-07-05', 103, 75.00),
    (22, '2023-08-10', 101, 300.00),
    (23, '2023-08-15', 102, 100.00),
    (24, '2023-08-28', 103, 250.00),
    (25, '2023-09-01', 101, 180.00),
    (26, '2023-09-08', 102, 220.00),
    (27, '2023-09-12', 103, 90.00),
    (28, '2023-10-01', 101, 280.00),
    (29, '2023-10-02', 102, 150.00),
    (30, '2023-10-05', 103, 200.00),
    (31, '2023-11-10', 101, 320.00),
    (32, '2023-11-15', 102, 180.00),
    (33, '2023-11-20', 103, 150.00),
    (34, '2023-12-01', 101, 200.00),
    (35, '2023-12-05', 102, 300.00),
    (36, '2023-12-10', 103, 250.00),
    (37, '2024-01-01', 101, 150.00),
    (38, '2024-01-02', 102, 200.00),
    (39, '2024-01-05', 103, 75.00),
    (40, '2024-02-10', 101, 300.00),
    (41, '2024-02-15', 102, 100.00),
    (42, '2024-02-28', 103, 250.00),
    (43, '2024-03-05', 101, 180.00),
    (44, '2024-03-08', 102, 220.00),
    (45, '2024-03-12', 103, 90.00),
    (46, '2024-04-01', 101, 280.00),
    (47, '2024-04-02', 102, 150.00),
    (48, '2024-04-05', 103, 200.00),
    (49, '2024-05-10', 101, 320.00),
    (50, '2024-05-15', 102, 180.00),
    (51, '2024-05-20', 103, 150.00),
    (52, '2024-06-01', 101, 200.00),
    (53, '2024-06-05', 102, 300.00),
    (54, '2024-06-10', 103, 250.00);
    
    
SELECT * FROM Orders_part;   


select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'orders_part';



-- 1. Pertition by range

CREATE TABLE Sales_Part (
    OrderID INT ,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)
) PARTITION BY RANGE (YEAR(OrderDate)) (
    PARTITION p2023 VALUES LESS THAN (2020),
    PARTITION p2024 VALUES LESS THAN (2021),
    PARTITION p2025 VALUES LESS THAN (2022),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);



INSERT INTO Sales_Part (OrderID, OrderDate, CustomerID, TotalAmount)
VALUES
    (1, '2020-01-01', 101, 150.00),
    (2, '2019-01-02', 102, 200.00),
    (3, '2021-01-05', 103, 75.00),
    (4, '2023-02-10', 101, 300.00),
    (5, '2024-02-15', 102, 100.00),
    (6, '2018-02-28', 103, 250.00);
    
select partition_name , table_name , table_rows from 
information_schema.partitions where table_name = 'Sales_Part';


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


-- 2. list partition


create table  courses_part1(
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list(course_launch_year)(
partition p0 values in(2019,2020),
partition p1 values in(2022,2021)
);

select partition_name , table_name , table_rows from 
information_schema.partitions where table_name = 'courses_part1';

insert into courses_part1 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2021) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2022) ;



@@@@@@@@@@@@@@@@@@@@@@@@@@@@


create table  courses_part2(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 5;


select partition_name , table_name , table_rows from 
information_schema.partitions where table_name = 'courses_part2';

insert into courses_part2 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2023) ;



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


drop table courses_part3 ;

create table courses_part3(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5 (
partition p0 values less than (2019) ,
partition p1 values less than (2020) ,
partition p2 values less than (2021) ,
partition p3 values less than (2022) 
);

select partition_name , table_name , table_rows from 
information_schema.partitions where table_name = 'courses_part3';


insert into courses_part3 (course_launch_year)values
(2019) ;










    
    
  
### delete cascade

use class_6 ;

show tables ;


CREATE TABLE courses1 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE students1 (
    student_id INT,
    `name` VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id)
        REFERENCES courses1(course_id)
        ON DELETE CASCADE
);

INSERT INTO courses1 (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'History');

INSERT INTO students1 (student_id, `name`, course_id) VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102);

select * from courses1 ;

select * from students1 ;

-- Deleting a course will delete associated student records due to ON DELETE CASCADE

DELETE FROM courses1 WHERE course_id = 102 ;

**********************************************************


CREATE TABLE courses2 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE students2 (
    student_id INT,
    `name` VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id)
        REFERENCES courses2(course_id)
        ON UPDATE CASCADE
);

INSERT INTO courses2 (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'History');

INSERT INTO students2 (student_id, `name`, course_id) VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102);

select * from courses2 ;

select * from students2 ;

-- Deleting a course will delete associated student records due to ON DELETE CASCADE

update courses2 
set course_id = 104 where course_name = "science" ;

set sql_safe_updates = 0 ;

DELETE FROM courses2 WHERE course_id = 104 ;

************************************************


CREATE TABLE courses3 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE students3 (
    student_id INT,
    `name` VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id)
        REFERENCES courses3(course_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO courses3 (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'History');

INSERT INTO students3 (student_id, `name`, course_id) VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102);

select * from courses3 ;

select * from students3 ;

-- Deleting a course will delete associated student records due to ON DELETE CASCADE

update courses3 
set course_id = 104 where course_name = "science" ;

set sql_safe_updates = 0 ;

DELETE FROM courses3 WHERE course_id = 104 ;

update students3 
set course_id = 103 where student_id = 1 ;


*************************************************************


CREATE TABLE courses4 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE students4 (
    student_id INT,
    `name` VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id)
        REFERENCES courses4(course_id)
        
);

INSERT INTO courses4 (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'History');

INSERT INTO students4 (student_id, `name`, course_id) VALUES
(1, 'John Doe', 101),
(2, 'Jane Smith', 102);

select * from courses4 ;

select * from students4 ;

-- Deleting a course will delete associated student records due to ON DELETE CASCADE

DELETE FROM courses4 WHERE course_id = 102 ;

Update students4 
set course_id = 103 where student_id = 2 ;


********************************************************


## ck with unique
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    PRIMARY KEY (customer_id, order_date, product_id),
    UNIQUE (customer_id, product_id),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, order_date, product_id) VALUES
(1, '2023-01-15', 101),
(1, '2023-02-20', 102),
(2, '2023-03-25', 103);

-- Trying to insert a duplicate composite key will fail
INSERT INTO orders (customer_id, order_date, product_id) VALUES (1, '2023-02-20', 102);  -- This will fail due to unique constraint



## fk with multiple column

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id, manager_id)
        REFERENCES departments(department_id, employee_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    employee_id INT,
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);


INSERT INTO employees (employee_id, first_name, last_name, department_id, manager_id) 
VALUES (1, 'John', 'Doe', 101, 102);


UPDATE employees SET department_id = 102 WHERE employee_id = 1 AND manager_id = 102;


DELETE FROM departments WHERE department_id = 101 AND employee_id = 1;


# pk and fk accross table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Inserting data with primary key and foreign key constraints
INSERT INTO departments (department_id, department_name) VALUES (1, 'Engineering');
INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES (101, 'John', 'Doe', 1);


INSERT INTO departments (department_id, department_name) VALUES (2, 'Marketing');
INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES (102, 'Jane', 'Smith', 2);

UPDATE employees SET department_id = 2 WHERE employee_id = 101;


DELETE FROM departments WHERE department_id = 1;


## CK with FK

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    PRIMARY KEY (customer_id, order_date, product_id),
    FOREIGN KEY (customer_id, product_id)
        REFERENCES customers(customer_id, product_id)
);

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    product_id INT,
    PRIMARY KEY (customer_id, product_id)
);


INSERT INTO customers (customer_id, customer_name, product_id) VALUES (1, 'John Doe', 101);
INSERT INTO orders (customer_id, order_date, product_id) VALUES (1, '2023-01-15', 101);


UPDATE customers SET product_id = 102 WHERE customer_id = 1;


DELETE FROM orders WHERE customer_id = 1 AND product_id = 101;


## unique constraint with FK
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_email VARCHAR(100),
    FOREIGN KEY (manager_email)
        REFERENCES employees(email)
);



INSERT INTO employees (employee_id, first_name, last_name, email) VALUES (1, 'John', 'Doe', 'john.doe@example.com');
INSERT INTO departments (department_id, department_name, manager_email) VALUES (101, 'Engineering', 'john.doe@example.com');


UPDATE employees SET email = 'j.doe@example.com' WHERE employee_id = 1;


DELETE FROM departments WHERE department_id = 101;


## e-commerce example

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Orders table with foreign keys
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items table linking orders to products
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting sample data
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO products (product_name, price) VALUES
('Laptop', 999.99),
('Smartphone', 599.99),
('Tablet', 299.99);

-- Placing orders
INSERT INTO orders (customer_id) VALUES (1);

-- Adding items to orders
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),  -- 2 laptops
(1, 2, 3);  -- 3 smartphones



## healthcare example

-- Patients table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other')
);

-- Doctors table
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100)
);

-- Appointments table with composite key and foreign keys
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date TIMESTAMP,
    PRIMARY KEY (patient_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Prescriptions table linking prescriptions to patients
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication VARCHAR(100),
    dosage VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Inserting sample data
INSERT INTO patients (first_name, last_name, date_of_birth, gender) VALUES
('John', 'Doe', '1980-05-15', 'Male'),
('Jane', 'Smith', '1990-08-20', 'Female');

INSERT INTO doctors (first_name, last_name, specialization) VALUES
('Dr. Michael', 'Johnson', 'Cardiologist'),
('Dr. Emily', 'Davis', 'Pediatrician');

-- Scheduling appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date) VALUES
(1, 1, '2023-06-15 10:00:00'),
(2, 2, '2023-06-20 11:30:00');

-- Prescribing medications
INSERT INTO prescriptions (patient_id, doctor_id, medication, dosage) VALUES
(1, 1, 'Aspirin', '100mg daily'),
(2, 2, 'Amoxicillin', '250mg three times a day');






## librabry manament example

-- Authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100),
    nationality VARCHAR(50)
);

-- Books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Borrowings table with composite key and foreign keys
CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrowing_date DATE,
    due_date DATE,
    returned_date DATE,
    PRIMARY KEY (member_id, book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Reservations table linking reservations to members and books
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    reservation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Inserting sample data
INSERT INTO authors (author_name, nationality) VALUES
('Jane Austen', 'British'),
('Mark Twain', 'American');

INSERT INTO books (title, author_id, publication_year) VALUES
('Pride and Prejudice', 1, 1813),
('The Adventures of Tom Sawyer', 2, 1876);

INSERT INTO members (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

-- Borrowing books
INSERT INTO borrowings (member_id, book_id, borrowing_date, due_date) VALUES
(1, 1, '2023-06-01', '2023-06-15'),
(2, 2, '2023-06-05', '2023-06-20');

-- Reserving books
INSERT INTO reservations (member_id, book_id) VALUES
(1, 2),
(2, 1);


## online retail example

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Orders table with foreign key
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items table linking orders to products
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting sample data
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO products (product_name, price) VALUES
('Laptop', 999.99),
('Smartphone', 599.99),
('Tablet', 299.99);

-- Placing orders
INSERT INTO orders (customer_id) VALUES (1);

-- Adding items to orders
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 999.99),  -- 2 laptops
(1, 2, 3, 599.99);  -- 3 smartphones




## on delete and on update 


-- Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Employees table with foreign key and ON DELETE CASCADE
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE CASCADE
);

-- Inserting sample data
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Marketing');

INSERT INTO employees (employee_id, employee_name, department_id) VALUES
(101, 'John Doe', 1),
(102, 'Jane Smith', 2),
(103, 'Michael Johnson', 1);

-- Deleting a department will automatically delete associated employees due to ON DELETE CASCADE
DELETE FROM departments WHERE department_id = 2;

-- Viewing employees after deletion
SELECT * FROM employees;



##

-- Updating the department_id in departments table will cascade update in employees table
UPDATE departments SET department_id = 3 WHERE department_id = 1;

-- Viewing updated employees
SELECT * FROM employees;





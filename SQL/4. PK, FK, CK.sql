use class_6 ;

CREATE TABLE class_6.students (
    student_id INT PRIMARY KEY,
    `name` VARCHAR(100),
    age INT,
    city VARCHAR(100)
);

select * from students ;

INSERT INTO students (student_id, `name`, age, city) VALUES
(5, 'John Doe', 18, 'New York'),
(2, 'Jane Smith', 17, 'Los Angeles'),
(3, 'Michael Johnson', 19, 'Chicago'),
(4, 'Emily Davis', 18, 'Houston');


UPDATE students SET city = 'Boston' WHERE student_id = 1;

DELETE FROM students WHERE student_id = 4;

************************************************************************************


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

INSERT INTO courses (course_id, course_name, instructor) VALUES
(104, 'Mathematics', 'Prof. Smith'),
(102, 'Science', 'Dr. Johnson'),
(103, 'History', 'Prof. Brown');

select * from courses ;

ALTER TABLE students
ADD COLUMN course_id INT,
ADD CONSTRAINT fk_course
    FOREIGN KEY (course_id)
    REFERENCES courses(course_id);


INSERT INTO students (student_id, `name`, age, city, course_id) VALUES
(1, 'John Doe', 18, 'New York', 101),
(2, 'Jane Smith', 17, 'Los Angeles', 102);


UPDATE students SET course_id = 102 WHERE student_id = 4;


DELETE FROM courses WHERE course_id = 103; -- This will fail if students are referencing this course_id

delete from students where course_id = 103 ;

UPDATE courses SET course_id = 104 WHERE course_name = "science";

UPDATE students SET course_id = 103 WHERE student_id = 5;

set sql_safe_updates = 0 ;


describe students ;

describe courses ;



******************************************

##### composit key



CREATE TABLE student_contacts (
    student_id INT,
    city VARCHAR(100),
    phone_number VARCHAR(20),
    PRIMARY KEY (student_id, city),
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);


INSERT INTO student_contacts (student_id, city, phone_number) VALUES
(4, 'Texax', '555-1234'),
(2, 'Los Angeles', '555-5678'),
(3, 'Chicago', '555-9101');

select * from students ;

select * from courses ;

select * from  student_contacts;


UPDATE student_contacts SET phone_number = '555-3333' WHERE student_id = 4 AND city = 'Houston';


DELETE FROM student_contacts WHERE student_id = 4 ;

delete from students WHERE student_id = 2 ;


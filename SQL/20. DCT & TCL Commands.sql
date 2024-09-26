use practice ;

show tables ;

-- DCL data control Language

-- Grant / revoke

create user "tanishq"@"localhost" identified by "tanishq1" ;

grant select on class11.bank to "tanishq"@"localhost" ;

grant update on class11.bank to "tanishq"@"localhost" ;

grant all on class11.* to "tanishq"@"localhost" ;

grant delete on class11.bank to "tanishq"@"localhost" ;

revoke all on class11.* from "tanishq"@"localhost" ;

revoke delete on class11.bank from "tanishq"@"localhost" ;

revoke update on class11.bank from "tanishq"@"localhost" ;

revoke select on class11.bank from "tanishq"@"localhost" ;


-------------------------------------------------------------------

-- TCL Transaction control language
use 5_30 ;

select * from t_school ;

select * from t_school1 ;

commit ;
rollback ;
savepoint ;

SET autocommit = 0;


INSERT INTO t_school(ID, School_Name, Number_Of_Students, Number_Of_Teachers,
 Number_Of_Classrooms, EmailID) 
 VALUES(1, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
 (2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"), 
 (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"), 
 (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"), 
 (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com");

rollback ;




select * from t_school1 ;

truncate table t_school1 ;

INSERT INTO t_school1(ID, School_Name, Number_Of_Students,
 Number_Of_Teachers, Number_Of_Classrooms, EmailID)
 VALUES(1, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
 (2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"), 
 (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"),
 (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"),
 (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com"); 
 
START TRANSACTION; 

SAVEPOINT Insertion0; 

SAVEPOINT Insertion1; 

SAVEPOINT Insertion3; 

UPDATE t_school1 SET Number_Of_Students = 9050 WHERE ID = 2; 

SAVEPOINT Updation; 

ROLLBACK TO Insertion; 

rollback to updation ;

rollback to Insertion1 ;

rollback to Insertion0 ;




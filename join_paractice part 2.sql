--WORKING ON OFFICE DATABASE

use advance_sql
create table employees
(emp_id varchar(20),
emp_name varchar(20),
salary int,
dept_id varchar(20),
manager_id varchar(20))
insert into employees values('E1', 'NIMRA', 15000,'D1','M1');
insert into employees values('E2' , 'MONAJ', 15000,'D1','M1');
insert into employees values('E3' , 'JAMES', 55000,'D2','M2');
insert into employees values('E4','MICHEALS',25000,'D2','M2');
insert into employees values('E5', 'ALI',  20000,'D10','M3');
insert into employees values('E6', 'ROBIN',35000,'D10','M3');

--SELECTING ALL 
SELECT * FROM EMPLOYEES

--NOW CREATING DEPARTMENT TABLE
create table Department 
( DEPT_ID varchar(20),
DEPT_NAME  varchar(50)
)
--insert data into the table
insert into Department values('D1', 'IT');
insert into Department  values('D2' , 'HR');
insert into Department values('D3', 'FINANCE');
insert into Department  values('D4' , 'ADMIN');

SELECT * FROM Department

--NOW CREATING MANAGER  TABLE
create table MANAGER 
( MANAGER_ID varchar(20),
MANAGER_NAME  varchar(50),
DEPT_ID VARCHAR(20)
)
insert into MANAGER values('M1','PREM','D3');
insert into MANAGER values('M2','SHAPATH','D4');
insert into MANAGER values('M3','NICK','D1');
insert into MANAGER values('M4','CORY','D1');
--SELETING ALL FROM MANAGER TABLE
SELECT * FROM MANAGER
--NOW CREATING PROJECT TABLE

create table PROJECTS 
( PROJECT_ID varchar(20),
PROJECT_NAME  varchar(100),
TEAM_MEMBER_ID VARCHAR(20)
)
insert into PROJECTS values('P1','DATA MIGRATION','E1');
insert into PROJECTS values('P1','DATA MIGRATION','E2');
insert into PROJECTS values('P1','DATA MIGRATION','M3');
insert into PROJECTS values('P2','ETL TOOL','E1');
insert into PROJECTS values('P2','ETL TOOL','M4');

--SELECT ALL RECORDS FROM PROJECT
SELECT * FROM PROJECTS


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--WORKING ON JOIN
--example of inner join| join 
--Query 1 fetch the employee name and the dept name they are working to 
--where on is the condition in which we are joining 
--column name does not matter but values should be the same
SELECT * FROM EMPLOYEES
SELECT * FROM Department


--query solution

select e.emp_name,d.dept_name
from employees as e inner join department as d
on D.DEPT_ID = e.dept_id


--example of left join 
--Query 1 fetch  all  employee name and their dept name they are working to 
--left join = inner join + any additional column in left join 

SELECT * FROM EMPLOYEES
SELECT * FROM Department

select e.emp_name,d.dept_name
from employees as e left join department as d 
on d.DEPT_ID = e.dept_id


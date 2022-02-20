use [portfolio project ]
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);

select * from dbo.employee
--finding max salary from this table 
select max(salary) as max_salary
from dbo.employee
--max salary earned by each department 
select DEPT_NAME,MAX(SALARY) as maximum_salary 
FROM dbo.employee
GROUP BY DEPT_NAME
order by max(SALARY) desc
--when we have to ectract the more details regarding employees so we will use row_number or ctes
select e.*,
max(salary) over(partition by dept_name) as max_salry 
from employee e 
--row_num 
select *,
row_number() over(PARTITION BY DEPT_NAME ORDER BY DEPT_NAME) AS RN
from employee 

--FETCH THE FIRST TWO EMPOLYEES FROM EACH DEPARTMENT TO JOIN THE COMPANY 
SELECT * FROM 
     (select *,
     row_number() over(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS RN
from employee)  X 
WHERE X.RN < 3

-- rank function
--rank function is used to give the rank according to the values 
--fetch the top three employees earning the max salary 
select * from 
(select *,
rank() over(partition by dept_name order by salary desc) as ranking
from employee) x
where x.ranking <3
--dense rank function 
(select *,
rank() over(partition by dept_name order by salary desc) as ranking
from employee)
--fetch a query if the salary of the employees is higher, lower, equal to the previous employees
--use of lag function 
--lag means before
select *,
lag(SALARY,1,0) over(partition by dept_name order by salary desc) as ranking
from employee
--use of lead function 
--lead means after
select *,
lag(SALARY) over(partition by dept_name order by salary desc) as lagging ,
lead(SALARY) over(partition by dept_name order by salary desc) as ranking
from employee
--fetch a query if the salary of the employees is higher, lower, equal to the previous employees
SELECT * FROM EMPLOYEES
select e.*,
lag(SALARY) over(partition by dept_name  order by emp_id desc ) as lagging ,
CASE WHEN e.SALARY > lag(SALARY) over(partition by dept_name order by emp_id desc)   then 'higher salary'
    WHEN e.SALARY < lag(SALARY) over(partition by dept_name order by emp_id desc)  then 'lower salary'
    WHEN e.SALARY = lag(SALARY) over(partition by dept_name order by emp_id desc)  then  'equal to salary'
    end salary_range
from employee AS e

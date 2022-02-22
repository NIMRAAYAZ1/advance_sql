use [portfolio project ]
create table emp
( emp_ID int
, emp_NAME varchar(50)
, SALARY int);

insert into emp values(101, 'Mohan', 40000);
insert into emp values(102, 'James', 50000);
insert into emp values(103, 'Robin', 60000);
insert into emp values(104, 'Carol', 70000);
insert into emp values(105, 'Alice', 80000);
insert into emp values(106, 'Jimmy', 90000);

select * from emp
--fetch employees who earn more than average salary of all emp
with average_salaries as 
(select avg(salary) averge_salary from emp) 
select * from emp,average_salaries 
where salary < average_salaries.averge_salary

-- QUERY 2 :

create table sales
(
	store_id  		int,
	store_name  	varchar(50),
	product			varchar(50),
	quantity		int,
	cost			int
);
insert into sales values
(1, 'Apple Originals 1','iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1','MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1','AirPods Pro', 2, 280),
(2, 'Apple Originals 2','iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3','iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3','MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3','MacBook Air', 4, 1100),
(3, 'Apple Originals 3','iPhone 12', 2, 1000),
(3, 'Apple Originals 3','AirPods Pro', 3, 280),
(4, 'Apple Originals 4','iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4','MacBook pro 13', 1, 2500);
select * from sales 

--use of cte 
--find sales whose sales are better than average sales across all store
--1 total sales
select store_id, sum(cost) as  total_sales
from sales
group by store_id 
--find the average of the sale with respect to all total sales
select avg(average_sales) as avg_sales_for_all_stores 
from 
    (select store_id, sum(cost) as average_sales 
     from sales
     group by store_id) as b

--find the store whose total sales is better then average sales
select * from 
    (select store_id, sum(cost) as  total_sales
     from sales
     group by store_id ) total_sales_table
inner join 
     (select avg(average_sales) as avg_sales_for_all_stores 
     from 
    (select store_id, sum(cost) as average_sales 
     from sales
     group by store_id) as b) as avg_sales
	 on avg_sales.avg_sales_for_all_stores > total_sales


--use of cte here come
with total_sales_per (store_id,total_sales) as 
 (select store_id, sum(cost) as  total_sales
  from sales
  group by store_id ),
  avg_sales(avg_sales_for_all_stores) as 
  (select avg(total_sales) as avg_sales_for_all_stores 
     from total_sales_per)
select* from total_sales_per as ts 
join avg_sales as av
 on av.avg_sales_for_all_stores > ts.total_sales

--end

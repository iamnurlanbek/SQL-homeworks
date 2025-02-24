/* HomeworkSQL-1 modul-class2 */
Create database Homework2
use Homework2
-- Easy level tasks --
-- 1. DDL and DML. Data Definition Language and Data Manipulation Langugae
-- DDL - Drop, Truncate, Alter, Create
-- DML - Insert, Delete, Update
Create table Countries
(ID int,Con_Name varchar(20), Capital varchar(20))
Select * from Countries
Insert into Countries values (1, 'BAA', 'Abu-Dabi',55)
Insert into Countries values (2, 'Spain', 'Madrid',23)
Insert into Countries values (1, 'Germany', 'Berlin',6)

Alter table Countries
add Rank int

Truncate table Countries

Delete from Countries
where Rank < 23

Drop table Countries

Update  Countries
set Rank = 20
where Rank = 55

-- 2. Write a query to create a table Employees with columns.
Create table Employees 
(EmpID int primary key, Name varchar(50), Salary decimal(10,2))
Select * from Employees
Insert into Employees values (1, 'Architect', 1300)
Insert into Employees values (2, 'Analyst', 1000)
Insert into Employees values (3, 'Scientist', 2300)

Update Employees
set Salary = 1500
where Salary = 1300

Delete from Employees
where EmpID = 2

-- Delete - is working with where, if we don't use where delete = truncate
-- Truncate - deletes all data in table, but it saves basics
-- Drop - Deletes all data and structure, after dropping we can't return data and structure.

Alter table Employees
Alter column Name varchar(80)

Alter table Employees
drop column Department 

Alter table Employees
add Department varchar(50)

 /* MEDIUM - LEVEL TASKS */
 -- 11 --
Create table Employees 
(EmpID int, Name varchar(50), Salary decimal(10,2),
constraint Fk_toEmpID foreign key(EmpID)
references Departments(DepID))

Insert into Employees values (1, 'Architect', 1300)
Insert into Employees values (2, 'Analyst', 1000)
Insert into Employees values (3, 'Scientist', 2300)
Insert into Employees values (2, 'Analyst', 10000)
Insert into Employees values (3, 'Scientist', 23500)


create table Departments (DepID int primary key)
insert into Departments values (1)
insert into Departments values (2)
insert into Departments values (3)
insert into Departments values (4)
insert into Departments values (5)

Truncate table Employees

select * from Departments
select * from Employees

Alter table Employees
Alter column Salary float

Alter table Employees
drop column Department
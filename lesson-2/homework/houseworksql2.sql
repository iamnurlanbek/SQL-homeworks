Create database Homeworksql2
Use Homeworksql2

 --- Easy-Level Tasks 
-- 1.	Define and explain DDL and DML. Give two examples of each.
-- DDL - Data Definition language -- Malumotni taxrirlash tili
--1 Create - crates new database, table
create table example(id int, name varchar(20))

--2. Alter - changes objects
Alter table example
drop column id

--3. Drop - deletes object
Alter table example
drop column name

--4. Truncate - deletes data and values in the table
Truncate table example

--- DML - Data Manipulation Language - Ma'lumotlar bn ishlash 
--1. Insert - adds information to the tables
insert into example values (1,'apex')

--2. Delete - deletes a value from the table but delete uses with where condition.
delete example
where name = 'apex'

--3. update - changes values and uses with where condition.
update  example
set name = 'alex'
where name = 'apex'

--2.	Write a query to create a table Employees with columns: EmpID (INT, PRIMARY KEY), Name (VARCHAR(50)), Salary (DECIMAL(10,2)).
Create table Employees 
(EmpID int primary key, name varchar(50),Salary decimal(10,2))

--3.	Insert three records into the Employees table using the INSERT INTO statement.
Insert into Employees values (1, 'Alex', 1500)
Insert into Employees values (2, 'Apex', 2500)
Insert into Employees values (3, 'Alen', 500)

--4.	Write a query to update the Salary of an employee where EmpID = 1.
Update Employees
set salary = 1000
where EmpID = 1

select * from Employees

--5.	Delete a record from the Employees table where EmpID = 2.
Delete Employees
where EmpID = 2

--6.	Explain the difference between DELETE, DROP, and TRUNCATE with examples.
Delete Employees -- delete uses with where condition, if dont use, it deletes all data in the table like truncate
where EmpID = 1 

Truncate table Employees -- deletes all data in the table but does not delete basics

Drop table Employees -- deletes table with basics

--7.	Modify the Name column in the Employees table to VARCHAR(100).
Alter table Employees
Alter column name varchar(100)

--8.	Use the ALTER TABLE statement to add a new column Department (VARCHAR(50)) to the Employees table.
Alter table Employees
add Department varchar(50)

--9.Use SSMS graphical tools to create a database named CompanyDB. Take a screenshot.
--Database -> New database -> Database name -> OK

--10.	Describe the purpose of the TRUNCATE TABLE command.
Truncate table Employees -- deletes just data and values



  --- Medium-Level Tasks ---
--11.	Create a table Departments with a PRIMARY KEY on DeptID and a FOREIGN KEY referencing Employees.EmpID.
Create table Departments (DeptID int primary key)

Create table Employees 
(EmpID int, constraint FK_toDeptID foreign key (EmpID) 
references Departments(DeptID))

--12.	Insert five records into the Departments table using INSERT INTO SELECT from another table.
Insert into Departments values (1),(2),(3),(4),(5)
Insert into Employees values (1),(2),(3),(4),(5)

Select * from Departments
Select * from Employees

--13.	Write a query that updates the Department of all employees where Salary > 5000 to 'Management'.
Update Employees
set department = 'Managment'
where salary > 5000

--14.	Write a query to remove all records from the Employees table without removing its structure.
Truncate table Employees

-- 15.	Explain the difference between VARCHAR and NVARCHAR when creating tables.
-- varchar - supports just latin letters
--nvarchar - supports unicode and other languages

-- 16.	Modify an existing column Salary to change its data type to FLOAT.
Alter table Employees
Alter column Salary float 

--17.	Drop the column Department from the Employees table using ALTER TABLE.
Alter table Employees
drop column Department

--18.Use SSMS graphical tools to modify the Employees table by adding a new column JoinDate (DATE). Take a screenshot.
-- columns -> new column

-- 19.	Create a temporary table and insert two records into it.
Create table temp_table (id int)
Insert into temp_table values (1),(2)

--20.	Write a query to remove the Departments table completely from the database.
Alter table Employees
Drop constraint [FK_toDeptID]

Drop table Departments

 --- Hard-Level Tasks ---
--21.	Write a script that creates a Customers table with a CHECK constraint ensuring Age > 18.
Create table Customers (age int check (age > 18))

--22.	Write a query to delete all employees who have not received a salary increase in the last two years.
Create table Employees (id int, Salary int, year int)
Insert into Employees values (1, 1500, 2023)
Insert into Employees values (2, 5500, 2023)
Insert into Employees values (3, 7000, 2022)
Insert into Employees values (4, 1500, 2024)
Insert into Employees values (5, 1500, 2025)
Select * from Employees

Delete Employees
Where Salary <= dateadd(year, -2, getdate())


--23.	Create a stored procedure that inserts a new employee record into the Employees table.

--24.	Write a query that creates a backup table Employees_Backup with the same structure as Employees.
Select * into Employees_backup from Employees
where 1 = 0

-- 25.	Write a query to insert multiple rows using MERGE INTO from another table.

-- 26.	Drop the CompanyDB database and recreate it using a script.
Drop database CompanyDB
Create database CompanyDB

-- 27.	Use SSMS graphical tools to rename the Employees table to StaffMembers. Take a screenshot.
-- Tables -> Employees -> rename

-- 28.	Explain the difference between CASCADE DELETE and CASCADE UPDATE with an example.

-- 29.	Write a query to reset the IDENTITY column seed of Employees after deleting all records.

--30.	Write a query that creates a table with both PRIMARY KEY and UNIQUE constraints on different columns.
Create table Users (id int primary key, salary int unique)




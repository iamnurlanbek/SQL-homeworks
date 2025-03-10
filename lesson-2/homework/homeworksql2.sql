 /* Create database HomeworkDB2
 Use HomeworkDB2 */

-- 1.	Define and explain DDL and DML. Give two examples of each.
 /* DDL - Data Definiton Language - it uses to change, create and delete a database
Create - it uses to create an new abject (database, table, view).
Alter - it uses to change an object
Drop - it uses to delete an object, but it is not possible to restore an object
Truncate - it uses to delete data in the table, but doesn not delete table's structure

DML - Data Manipulation Language - it uses to change, add and delete a data in the table.

Insert - it uses to add data to the table
Delete - it uses to delete data and uses with where condition.
Update - it uses to change data and uses with where condition. */

-- 2.	Write a query to create a table Employees with columns: EmpID (INT, PRIMARY KEY), Name (VARCHAR(50)), Salary (DECIMAL(10,2)).
CREATE TABLE Employees (EmpID int PRIMARY KEY, Name VARCHAR(50), Salary DECIMAL(10, 2))

-- 3.	Insert three records into the Employees table using the INSERT INTO statement.
INSERT INTO Employees VALUES (1, 'Alex', 1500.50),(2, 'Apex', 2000.500),(3, 'Anna', 5000.89)

-- 4.	Write a query to update the Salary of an employee where EmpID = 1.
UPDATE Employees
SET Salary = 3000
WHERE EmpID = 1

-- 5. Delete a record from the Employees table where EmpID = 2.
DELETE FROM Employees
WHERE EmpID = 2

-- 6.	Explain the difference between DELETE, DROP, and TRUNCATE with examples.
DELETE Employees
WHERE Salary = 2000.500 -- it uses to delete data from the table and uses with where condition

DROP TABLE Employees -- it uses to delete an object and it deletes object's structure, it is not possible to restore an object after dropping it.

TRUNCATE TABLE Employees -- it uses to delete data int the table and uses with where condition.

-- 7.	Modify the Name column in the Employees table to VARCHAR(100).
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100)

-- 8.	Use the ALTER TABLE statement to add a new column Department (VARCHAR(50)) to the Employees table.
ALTER TABLE Employees
ADD Department VARCHAR(50)

-- 9.	Use SSMS graphical tools to create a database named CompanyDB. Take a screenshot.
1. Database - - New Database - - Database Name - - OK

-- 10.	Describe the purpose of the TRUNCATE TABLE command.
-- The purpose of the Truncate table command is to delete data in the table but without deleting the table's structure.

-- 11.	Create a table Departments with a PRIMARY KEY on DeptID and a FOREIGN KEY referencing Employees.EmpID.
CREATE TABLE Departments (DeptID INT PRIMARY KEY)
CREATE TABLE Employees (EmpID INT, CONSTRAINT FK_toDeptID FOREIGN KEY(EmpID) REFERENCES Departments(DeptID))

--  12.	Insert five records into the Departments table using INSERT INTO SELECT from another table.
INSERT INTO Departments(DepID) SELECT  top 5 EmpID FROM Employees 

-- 13.	Write a query that updates the Department of all employees where Salary > 5000 to 'Management'.
UPDATE  Employees
SET Department  = 'Managment'
WHERE Salary > 5000

-- 14.	Write a query to remove all records from the Employees table without removing its structure.
TRUNCATE TABLE Employees

-- 15.	Explain the difference between VARCHAR and NVARCHAR when creating tables.
-- VARCHAR - VARIABLE-LENGTH NON-UNICODE DATA, MAX CHAR LENGTH IS 8000
-- NVARCHAR - VARIABLE-LENGTH UNICODE DATA, MAX CHAR LENGTH IS 4000

-- 16.	Modify an existing column Salary to change its data type to FLOAT.
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT

-- 17.	Drop the column Department from the Employees table using ALTER TABLE.
ALTER TABLE Employees
DROP COLUMN Department

-- 18.	Use SSMS graphical tools to modify the Employees table by adding a new column JoinDate (DATE). Take a screenshot.
-- Employees - - table - - new table - - columnname - - save

-- 19.	Create a temporary table and insert two records into it.
CREATE TABLE #Temp_table (id INT)
INSERT INTO #Temp_table VALUES (1),(2)


-- 20.	Write a query to remove the Departments table completely from the database.
DROP TABLE Departments

-- 21.	Write a script that creates a Customers table with a CHECK constraint ensuring Age > 18.
CREATE TABLE Customers (Age int check (Age > 15))

-- 22.	Write a query to delete all employees who have not received a salary increase in the last two years.
Delete Employees
where EmpID in (select EmpID from Employees where SalaryDate <= DATEADD(year, -2, GETDATE())

SELECT GETDATE() AS CURRENTDATE, DATEADD(YEAR, 5, GETDATE()) AS AFTER_5YEARS

SELECT GETDATE() AS CURRENTDATE, DATEADD(MINUTE, -30, GETDATE()) AS BEFORE_30MINUTES

-- 23.	Create a stored procedure that inserts a new employee record into the Employees table.
Create table employees (id int, name varchar(20))

Create procedure InsertEmployee -- creating a procedure
	@id int,
	@name varchar(20)
AS
	begin
		Insert into Employees(id, name)
		values (@id, @name);
	end;

exec InsertEmployee '1', 'alex' -- adds new data

Alter procedure InsertEmployee -- changes the procedure
	@id int,
	@name varchar(20)
AS
	BEGIN
		insert into Employees (id, name)
		values (@id, @name);
		print('Yangi hodim qoshildi');
	END;

EXEC InsertEmployee 2, 'JOHN'
EXEC InsertEmployee '2', 'JOHN'

DROP PROCEDURE InsertEmployee -- deletes the procedure

Select * from Employees

-- 24.	Write a query that creates a backup table Employees_Backup with the same structure as Employees.
SELECT * INTO Employees_Backup FROM Employees

--- 25.	Write a query to insert multiple rows using MERGE INTO from another table.
CREATE TABLE USERS (ID INT, NAME VARCHAR(50), AGE INT, SALARY INT)
INSERT INTO USERS VALUES (1, 'ALEX', 25, 1500),(2, 'APEX', 38, 2000),(3, 'LINDA', 45, 5000)

CREATE TABLE NEW_USERS (ID INT, NAME VARCHAR(50), AGE INT)

MERGE INTO NEW_USERS AS NU
USING USERS AS U
ON NU.ID = U.ID
WHEN NOT MATCHED THEN
	INSERT (ID, NAME, AGE)
	VALUES (U.ID, U.NAME, U.AGE);


-- 26.	Drop the CompanyDB database and recreate it using a script.
DROP DATABASE CompanyDB
CREATE DATABASE CompanyDB

-- 27.	Use SSMS graphical tools to rename the Employees table to StaffMembers. Take a screenshot.
-- tables -- employees -- rename -- StaffMember
SELECT * FROM StaffMembers

-- 28.	Explain the difference between CASCADE DELETE and CASCADE UPDATE with an example.
Create table customers (id int primary key, name varchar(50))
Create table orders (id int primary key, customer_id int, order_date date, constraint FK_toid foreign key(customer_id)  references customers(id) on delete cascade)

Insert into customers values (1, 'alex'),(2, 'apex'),(3, 'linda')
insert into orders values (100, 1, '2024-03-01'),(101, 1, '2024-05-09'),(102, 2, '2025-08-15')
Select * from customers
Select * from orders
delete from customers where id = 1


Create table customers1 (id int primary key, name varchar(50))
Create table orders1 (id int primary key, customer_id int, order_date date,  foreign key(customer_id)  references customers1(id) on update cascade)

Insert into customers1 values (1, 'alex'),(2, 'apex'),(3, 'linda')
insert into orders1 values (100, 1, '2024-03-01'),(101, 2, '2024-05-09'),(102, 2, '2025-08-15')

Select * from customers1
Select * from orders1

update customers1
set id = 10
where id = 2

-- 29.	Write a query to reset the IDENTITY column seed of Employees after deleting all records.
Create table pupils (id int identity primary key, name varchar(52))
insert into pupils(name) values ('alex'),('apex')

DBCC CHECKIDENT ('pupils', NORESEED)
select * from pupils

DBCC CHECKIDENT ('pupils', reseed, 0)

DBCC CHECKIDENT ('pupils', reseed, 100)

delete pupils


-- 30.	Write a query that creates a table with both PRIMARY KEY and UNIQUE constraints on different columns.
Create table examples (id int primary key, age int unique)







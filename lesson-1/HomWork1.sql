/* 1. Practical Tasks */
-- Creating a database
CREATE DATABASE HomeworkDB
USE HomeworkDB

--Creating a table
CREATE TABLE Students
(StudentID int, FullName varchar(50), Age int, GPA decimal(3,2))
select * from Students

-- Adding a new column
Alter table Students
add Email varchar(50)
select * from Students

-- Renaming the column
sp_rename 'Students.FullName','Name','Column'
select * from Students

--Droping the column
Alter table Students
drop column age
select * from Students

--Truncating the table
Truncate table Students
select * from Students

/* 2. Query Writing */
-- Retrieving server name using the command
Select @@SERVERNAME as Current_ServerName

-- Writing a query to display toady's date and time
select getdate() as Current_DataTime

-- Writing a query to select all data from the table
select * from Students







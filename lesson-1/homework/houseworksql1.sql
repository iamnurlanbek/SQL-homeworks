/* Homework Assignment: SQL Basics
1. Practical Tasks */
6.	Truncate the Students table.

-- 1. Create a new database named HomeworkDB.
Create database HomeworkDB
Use HomeworkDB

--2. Create a table called Students with the following structure:
Create table Students 
(StudentID int, FullName varchar(50), Age int, GPA decimal(3, 2))

Select * from Students

-- 3.	Add a new column Email (VARCHAR(50)) to the Students table.
Alter table Students
add Email varchar(50)

-- 4.Rename the column FullName to Name.
sp_rename 'Students.FullName', 'Name', 'Column'

-- 5.	Drop the column Age from the Students table.
Alter table Students
drop column Age

-- 6.Truncate the Students table.
Truncate table Students
  

  /* 2. Query Writing */
-- 1.	Retrieve the current server name using the appropriate command.
Select @@servername CurrentServerName

-- 2.	Write a query to display today’s date and time.
Select GETDATE() as CurrentTime

-- 3.	Write a query to select all data from the Students table.
Select * from Students


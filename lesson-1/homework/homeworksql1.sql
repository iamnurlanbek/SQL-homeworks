/* Homework 1 */
-- 1.	Create a new database named HomeworkDB.
Create database HomeworkDB

--2.	Create a table called Students with the following structure:
-- ?	FullName (VARCHAR(50))
-- ?	Age (INT)
-- ?	GPA (DECIMAL(3, 2))
CREATE TABLE Students (FullName VARCHAR(50), Age INT, GPA DECIMAL(3, 2))

-- 3.	Add a new column Email (VARCHAR(50)) to the Students table.
ALTER TABLE Students
ADD Email VARCHAR(50)

-- 4.	Rename the column FullName to Name.
sp_rename 'Students.FullName', 'Name', 'Column'

-- 5.	Drop the column Age from the Students table.
ALTER TABLE Students
DROP COLUMN Age

-- 6.	Truncate the Students table.
TRUNCATE TABLE Students

-- 1.	Retrieve the current server name using the appropriate command.
SELECT @@SERVERNAME AS CurrentServer

-- 2.	Write a query to display today’s date and time.
SELECT GETDATE() AS CurrentDate

-- 3.	Write a query to select all data from the Students table.
SELECT * FROM Students


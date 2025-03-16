--1. What is the result of Ascii('A') in SQL?
Select ASCII('A') -- 65

--2. Write a SQL query to get the length of the string 'Hello World' using Len().
Select len('Hello World') as Length 

--3. How do you reverse a string 'OpenAI' using SQL?
Select REVERSE('OpenAI') as ReverseOpenAI

--4. What function would you use to add 5 spaces before a string in SQL?
Select SPACE(5) + 'String' 

--5. How can you remove leading spaces from the string ' SQL Server'?
Select LTRIM(' SQL Server') as LTRIM_String
 
--6. Write a query that converts the string 'sql' to uppercase.
Select UPPER('sql') as UpperSQL

--7. What function would you use to extract the first 3 characters of the string 'Database'?
Select LEFT('Database', 3) as First3Char

--8. How can you get the last 4 characters from the string 'Technology'?
Select RIGHT('Technology',4) as Last4Char

--9. Use Substring() to get characters from position 3 to position 6 in the string 'Programming'.
Select SUBSTRING('Programming', 3, 3)

--10. Write a query to concatenate the strings 'SQL' and 'Server' using Concat().
Select CONCAT('SQL',' ','Server') as SQL_Server

--11. How can you replace all occurrences of 'apple' with 'orange' in the string 'apple pie'?
Select REPLACE('apple pie', 'apple','orange') as Orange_pie

--12. Write a query to find the position of the first occurrence of the word 'learn' in the string 'Learn SQL with LearnSQL'.
Select CHARINDEX('Learn','Learn SQL with LearnSQL') as learinstr

--13. What function can you use to check if the string 'Server' contains 'er' using SQL?
Select PATINDEX('%er%', 'Server') as Checking_er

--14. How can you split the string 'apple,orange,banana' into individual words using String_split()?
Select value from string_split('apple,orange,banana',',')

--15. What is the result of the expression Power(2, 3)?
SELECT POWER(2,3) -- 8

--16. Write a query that calculates the square root of 16 using SQL.
Select SQRT(16) as SquareRoot

--17. How do you get the current date and time in SQL?
Select GetDate() as CurrentDate

--18. What SQL function would you use to get the current UTC date and time?
Select GETUTCDATE() as CurrentUTCDate

--19. How can you get the day of the month from the date '2025-02-03'?
Select DAY('2025-02-03') as CurrentDay

--20. Write a query to add 10 days to the date '2025-02-03' using Dateadd().
Select DATEADD(DAY, 10, '2025-02-03') as DateAfter10Day

--1. Use Char() to convert the ASCII value 65 to a character.
Select CHAR(65) as ASCII65

--2. What is the difference between Ltrim() and Rtrim() in SQL?
Select LTRIM('  Value') -- removes space from the left side
Select RTRIM('Value   ') --removes space from the right side

--3. Write a query to find the position of the substring 'SQL' in the string 'Learn SQL basics'.
Select CHARINDEX('SQL', 'Learn SQL basics') as PositionSQL

--4. Use Concat_ws() to join 'SQL' and 'Server' with a comma between them.
Select CONCAT_WS(',', 'SQL', 'Server') as ConcatSQL

--5. How would you replace the substring 'test' with 'exam' using Stuff()?
Select STUFF('test',1,4,'exam') as StuffSubs

--6. Write a SQL query to get the square of 7 using Square().
Select SQUARE(7) as Square7

--7. How do you get the first 5 characters from the string 'International'?
Select left('International',5) First5char

--8. Write a query to get the last 2 characters of the string 'Database'.
Select RIGHT('Database',2) as Last2Char

--9. What is the result of Patindex('%n%', 'Learn SQL')?
Select PATINDEX('%n%', 'Learn SQL') as Result -- Result = 5

--10. How do you calculate the difference in days between '2025-01-01' and '2025-02-03' using Datediff()?
Select DATEDIFF(DAY,'2025-01-01','2025-02-03') AS DayCalc

--11. Write a query to return the month from the date '2025-02-03' using Month().
Select MONTH('2025-02-03') as Monthdate

--12. Use DatePart() to extract the year from the date '2025-02-03'.
Select DATEPART(Year,'2025-02-03') as DatepartYear

--13. How can you get the current system time without the date part in SQL?
Select Convert(Time,SYSDATETIME()) as CurrentSYStime

--14. What does the function Sysdatetime() return in SQL?
Select SYSDATETIME()

--15. How would you find the next occurrence of 'Wednesday' from today's date using Dateadd()?
Select DATEADD(DAY, 7, '03-19-2025') as NextWednesday

--16. What is the difference between Getdate() and Getutcdate()?
Select GETDATE() -- Current time 
Select GETUTCDATE() -- Universal Time System

--17. Use Abs() to get the absolute value of -15 in SQL.
Select ABS(-15)

--18. How would you round the number 4.57 to the nearest whole number using Ceiling()?
Select ceiling(4.57)

--19. Write a SQL query to get the current time using Current_Timestamp.
Select CURRENT_TIMESTAMP

--20. Use DateName() to return the day name for the date '2025-02-03'.
Select DATENAME(WEEKDAY,'2025-02-03')

--1. Write a query to reverse the string 'SQL Server' and then remove the spaces.
Select replace(REVERSE('SQL Server'),' ','')

--2. Write a query that uses String_agg() to concatenate all the values in the 'City' column of a table into a single string, separated by commas.
Select STRING_AGG(City,',') as List from States

--3. Write a SQL query that checks if a string contains both 'SQL' and 'Server' using Charindex().
Select CHARINDEX('SQL','SQL Server'), CHARINDEX('Server','SQL Server')

--4. How would you use Power() to calculate the cube of 5?
Select power(5,3)

--5. Write a query that splits a string 'apple;orange;banana' by the semicolon and returns each word as a separate row.
Select value from  string_split('apple;orange;banana', ';' )

--6. Use Trim() to remove both leading and trailing spaces from the string ' SQL '.\
Select TRIM(' SQL ')

--7. Write a SQL query to calculate the difference in hours between two timestamps using Datediff().
SELECT DATEDIFF(HOUR, '2025-03-15 08:00:00', '2025-03-16 20:00:00')

--8. How would you calculate the number of months between '2023-05-01' and '2025-02-03' using Datepart()?
Select datepart(MONTH, '2023-05-01') - datepart(MONTH, '2023-02-03')

--9. Write a query to find the position of the substring 'SQL' from the end of the string 'Learn SQL Server' using Reverse() and Charindex().
Select  REVERSE(CHARINDEX('SQL','Learn SQL Server')) as PositionSQL
SELECT LEN('Learn SQL Server') - CHARINDEX('SQL', REVERSE('Learn SQL Server')) + 1


--10. Use String_split() to split a comma-separated string 'apple,orange,banana' and return each word in a separate row.
Select value from String_split('apple,orange,banana',',')

--11. How would you find the number of days from '2025-01-01' to the current date using Datediff()?
Select DATEDIFF(DAY,'2025-01-01',GETDATE()) as NumberDay

--12. Write a SQL query that returns the first 4 characters of the string 'Data Science' using Left().
Select LEFT('Data Science',4)

--13. How can you calculate the square root of 225 and round it to the nearest whole number using Sqrt() and Ceiling()?\
Select Ceiling(sqrt(225))

--14. Write a query that concatenates two strings with a pipe ('|') separator using Concat_ws().
Select CONCAT_WS('|','SQL','Server')

--15. Use Patindex() to find the position of the first occurrence of any digit in the string 'abc123xyz'.
Select PATINDEX('%[0-9]%','abc123xyz')

--16. How would you find the second occurrence of the substring 'SQL' in the string 'SQL Server SQL' using Charindex()?
Select CHARINDEX('SQL','SQL Servver SQL',CHARINDEX('SQL','SQL Server SQL')+ 1)

--17. Write a SQL query to get the year from the current date using DatePart().
Select DATEPART(YEAR,GETDATE())

--18. How do you subtract 100 days from the current date using Dateadd()?
Select DATEADD(day, -100, GETDATE())

--19. Use DateName() to extract the day of the week from the date '2025-02-03'.
Select DATENAME(WEEKDAY,'2025-02-03')

--20. Write a query to get the square of a number using the Power() function and return it in the result set.
Select POWER(4,2)




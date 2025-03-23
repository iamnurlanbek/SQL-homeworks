--## 🔰 Beginner Level (10 Puzzles)  
--1️⃣ **Extract a Substring** → Extract the first **4** characters from **'DATABASE'**.  
Select SUBSTRING('DATABASE',1,4)
Select left('DATABASE',4)

--2️⃣ **Find Position of a Word** → Find position of **'SQL'** in **'I love SQL Server'**.  
Select CHARINDEX('SQL','I love SQL Server')

--3️⃣ **Replace a Word** → Replace **'World'** with **'SQL'** in **'Hello World'**.  
Select REPLACE('Hello World','World','SQL')

--4️⃣ **Find String Length** → Find length of **'Microsoft SQL Server'**.  
Select len('Microsoft SQL Server')

--5️⃣ **Extract Last 3 Characters** → Get last **3** characters from **'Database'**.
Select RIGHT('Database',3)

--6️⃣ **Count a Character** → Count occurrences of **'a'** in **'apple', 'banana', 'grape'**. 
select len(CONCAT('apple','banana','grape')) - len(replace(CONCAT('apple','banana','grape'),'a',''))

--7️⃣ **Remove Part of a String** → Remove first **5** characters from **'abcdefg'**.  
Select RIGHT('abcdefg',len('abcdefg') - 5)
Select SUBSTRING('abcdefg',6,len('abcdefg'))

--8️⃣ **Extract a Word** → Extract second word from **'SQL is powerful', 'I love databases'**. 
Select CHARINDEX(' ','SQL is powerful') + 1
Select SUBSTRING(
			'SQL is powerful',
					CHARINDEX(' ','SQL is powerful') + 1,
					CHARINDEX(' ','SQL is powerful',CHARINDEX(' ','SQL is powerful') + 1)
					- CHARINDEX(' ','SQL is powerful') - 1)

Select CHARINDEX(' ','SQL is powerful') + 1
Select CHARINDEX(' ','SQL is powerful',CHARINDEX(' ','SQL is powerful') + 1)

With WordList as(
	Select value, ROW_NUMBER() over (order by (select null)) as rn
	from string_split('SQL is powerful',' ')
	)
Select value as SecondWord
from WordList
Where rn = 2


--9️⃣ **Round a Number** → Round **15.6789** to **2 decimal places**. 
Select ROUND(15.6789,2)

--🔟 **Absolute Value** → Find absolute value of **-345.67**.  
Select ABS(-345.67)

--1️⃣1️⃣ **Find Middle Characters** → Extract middle **3** characters from **'ABCDEFGHI'**.  
Select SUBSTRING('ABCDEFGHI',len(left('ABCDEFGHI',4)),LEN(right('ABCDEFGHI',3)))
Select SUBSTRING('ABCDEFGHI',4,3)

--1️⃣2️⃣ **Replace Part of String** → Replace first **3** chars of **'Microsoft'** with **'XXX'**.  
Select REPLACE('Microsoft',left('Microsoft',3),'XXX')

Select CONCAT('XXX', SUBSTRING('Microsoft',4,len('Microsoft')))

--1️⃣3️⃣ **Find First Space** → Find position of first **space** in **'SQL Server 2025'**. 
Select CHARINDEX(' ','SQL Server 2025')

--1️⃣4️⃣ **Concatenate Names** → Join **FirstName** & **LastName** with **', '**.  
Select CONCAT_WS(', ','FirstName','LastName')

--1️⃣5️⃣ **Find Nth Word** → Extract **third word** from **'The database is very efficient'**. 

WITH WordList AS (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM STRING_SPLIT('The database is very efficient', ' ')
)
SELECT value AS ThirdWord
FROM WordList
WHERE rn = 3;

			

--1️⃣6️⃣ **Extract Only Numbers** → Get numeric part from **'INV1234', 'ORD5678'**. 
SELECT 
    'INV1234' AS Original, 
    STUFF('INV1234', 1, PATINDEX('%[0-9]%', 'INV1234') - 1, '') AS NumericPart
UNION ALL
SELECT 
    'ORD5678', 
    STUFF('ORD5678', 1, PATINDEX('%[0-9]%', 'ORD5678') - 1, '');


--1️⃣7️⃣ **Round to Nearest Integer** → Round **99.5** to the nearest integer. 
Select CEILING(99.5)


--1️⃣8️⃣ **Find Day Difference** → Days between **'2025-01-01'** & **'2025-03-15'**.  
Select DATEDIFF(DAY,'2025-01-01','2025-03-15')

--1️⃣9️⃣ **Find Month Name** → Retrieve month name from **'2025-06-10'**. 
Select DATENAME(MONTH,'2025-06-15')

--2️⃣0️⃣ **Calculate Week Number** → Week number for **'2025-04-22'**.
Select DATEPART(WEEK,'2025-04-22') AS Week_Count

--2️⃣1️⃣ **Extract After '@'** → Extract domain from **'user1@gmail.com', 'admin@company.org'**.  
Select CHARINDEX('@','user1@gmail.com',CHARINDEX('@','user1@gmail.com'))

--2️⃣2️⃣ **Find Last Occurrence** → Last **'e'** in **'experience'**. 
Select Substring('experience',len('experience') - CHARINDEX('e', REVERSE('experience')) + 1,1)
SELECT RIGHT('experience', CHARINDEX('e', REVERSE('experience')))


--2️⃣3️⃣ **Generate Random Number** → Random number **between 100-500**.  
SELECT FLOOR(RAND() * (500 - 100 + 1)) + 100 AS RandomNumber;

--2️⃣4️⃣ **Format with Commas** → Format **9876543** as **"9,876,543"**.  
SELECT FORMAT(9876543, 'N0') AS FormattedNumber;


--2️⃣5️⃣ **Extract First Name** → Get first name from **CREATE TABLE Customers (FullName VARCHAR(100)); INSERT INTO Customers VALUES ('John Doe'), ('Jane Smith')**.  
SELECT FullName, LEFT(FullName, CHARINDEX(' ', FullName) - 1) AS FirstName
FROM Customers;


--2️⃣6️⃣ **Replace Spaces with Dashes** → Change **'SQL Server is great'** → **'SQL-Server-is-great'**.  
Select REPLACE('SQL Server is great',' ','-')

--2️⃣7️⃣ **Pad with Zeros** → Convert **42** to **'00042'** (5-digit). 
select CONCAT('000','42')

--2️⃣8️⃣ **Find Longest Word Length** → Longest word in **'SQL is fast and efficient'**.  
Select top 1 value from string_split('SQL is fast and efficient',' ') order by len(value) desc

--2️⃣9️⃣ **Remove First Word** → Remove first word from **'Error: Connection failed'**. Output: Connection failed'** 
Select SUBSTRING('Error: Connection failed',CHARINDEX(' ','Error: Connection failed') + 1,len('Error: Connection failed'))

--3️⃣0️⃣ **Find Time Difference** → Minutes between **'08:15:00'** & **'09:45:00'**. 
Select DATEDIFF(MINUTE,'08:15:00','09:45:00')
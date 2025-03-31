--Create database homeworksql15
--use homeworksql15
----Tables
----1.
--CREATE TABLE Employees (
--    EmployeeID INT PRIMARY KEY,
--    DepartmentID INT,
--    FirstName VARCHAR(50),
--    LastName VARCHAR(50),
--    Salary DECIMAL(10, 2)
--);

--INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
--(1, 1, 'John', 'Doe', 60000.00),
--(2, 1, 'Jane', 'Smith', 65000.00),
--(3, 2, 'James', 'Brown', 70000.00),
--(4, 3, 'Mary', 'Johnson', 75000.00),
--(5, 4, 'Linda', 'Williams', 80000.00),
--(6, 2, 'Michael', 'Jones', 85000.00),
--(7, 1, 'Robert', 'Miller', 55000.00),
--(8, 3, 'Patricia', 'Davis', 72000.00),
--(9, 4, 'Jennifer', 'García', 77000.00),
--(10, 1, 'William', 'Martínez', 69000.00),
--(11, 5, 'Jennif', 'Garc', 5000.00);

----2.
--CREATE TABLE Departments (
--    DepartmentID INT PRIMARY KEY,
--    DepartmentName VARCHAR(50)
--);

--INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
--(1, 'HR'),
--(2, 'Sales'),
--(3, 'Marketing'),
--(4, 'Finance'),
--(5, 'IT'),
--(6, 'Operations'),
--(7, 'Customer Service'),
--(8, 'R&D'),
--(9, 'Legal'),
--(10, 'Logistics');

----3.
--CREATE TABLE Sales (
--    SalesID INT PRIMARY KEY,
--    EmployeeID INT,
--    ProductID INT,
--    SalesAmount DECIMAL(10, 2),
--    SaleDate DATE
--);

--INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
--(1, 1, 5, 1500.00, '2025-01-01'),
--(2, 2, 2, 2000.00, '2025-01-02'),
--(3, 3, 3, 1200.00, '2025-01-03'),
--(4, 4, 4, 1800.00, '2025-01-04'),
--(5, 5, 5, 2200.00, '2025-01-05'),
--(6, 6, 6, 1400.00, '2025-01-06'),
--(7, 7, 1, 2500.00, '2025-01-07'),
--(8, 8, 2, 1700.00, '2025-01-08'),
--(9, 9, 3, 1600.00, '2025-01-09'),
--(10, 10, 4, 1900.00, '2025-01-10'),
--(11, 1, 5, 2100.00, '2025-01-11'),
--(12, 2, 6, 1300.00, '2025-01-12'),
--(13, 3, 1, 2000.00, '2025-01-13'),
--(14, 4, 2, 1800.00, '2025-01-14'),
--(15, 5, 3, 1500.00, '2025-01-15'),
--(16, 6, 4, 2200.00, '2025-01-16'),
--(17, 7, 5, 1700.00, '2025-01-17'),
--(18, 8, 6, 1600.00, '2025-01-18'),
--(19, 9, 1, 2500.00, '2025-01-19'),
--(20, 10, 2, 1800.00, '2025-01-20'),
--(21, 1, 3, 1400.00, '2025-01-21'),
--(22, 2, 4, 1900.00, '2025-01-22'),
--(23, 3, 5, 2100.00, '2025-01-23'),
--(24, 4, 6, 1600.00, '2025-01-24'),
--(25, 5, 1, 1500.00, '2025-01-25'),
--(26, 6, 2, 2000.00, '2025-01-26'),
--(27, 7, 3, 2200.00, '2025-01-27'),
--(28, 8, 4, 1300.00, '2025-01-28'),
--(29, 9, 5, 2500.00, '2025-01-29'),
--(30, 10, 6, 1800.00, '2025-01-30'),
--(31, 1, 1, 2100.00, '2025-02-01'),
--(32, 2, 2, 1700.00, '2025-02-02'),
--(33, 3, 3, 1600.00, '2025-02-03'),
--(34, 4, 4, 1900.00, '2025-02-04'),
--(35, 5, 5, 2000.00, '2025-02-05'),
--(36, 6, 6, 2200.00, '2025-02-06'),
--(37, 7, 1, 2300.00, '2025-02-07'),
--(38, 8, 2, 1750.00, '2025-02-08'),
--(39, 9, 3, 1650.00, '2025-02-09'),
--(40, 10, 4, 1950.00, '2025-02-10'),
--(41, 11, 4, 15000.00, '2025-02-10');

----4.-
--CREATE TABLE Products (
--    ProductID INT PRIMARY KEY,
--    CategoryID INT,
--    ProductName VARCHAR(100),
--    Price DECIMAL(10, 2)
--);

--INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
--(1, 1, 'Laptop', 1000.00),
--(2, 1, 'Smartphone', 800.00),
--(3, 2, 'Tablet', 500.00),
--(4, 2, 'Monitor', 300.00),
--(5, 3, 'Headphones', 150.00),
--(6, 3, 'Mouse', 25.00),
--(7, 4, 'Keyboard', 50.00),
--(8, 4, 'Speaker', 200.00),
--(9, 5, 'Smartwatch', 250.00),
--(10, 5, 'Camera', 700.00);


--1.Find employees whose salary is above the average salary. (Derived Table)
-- Derived Table
Select FirstName, LastName,Salary 
from Employees 
join (Select avg(salary) as AvgSalary from Employees) as dt 
on Employees.Salary > dt.AvgSalary;

--2.Find employees who have the same salary as another employee. (CTE)

with cte as (
Select * from Employees where salary in (Select Salary from Employees group by salary having count(*) > 1
))
Select FirstName, LastName, Salary from cte;

--3.Get the number of employees in each department. (CTE);

With cte as (
Select DepartmentID, COUNT(EmployeeID) as CountEmpDep from Employees group by DepartmentID
)
Select Departments.DepartmentID, DepartmentName, CountEmpDep from Departments join cte on cte.DepartmentID = Departments.DepartmentID

--4.Find employees whose salary is below the average salary. (Derived Table)

Select concat(FirstName, ' ',LastName) as FullName, Employees.Salary from employees 
join (Select avg(Salary) as AvgSalary  from Employees) dt 
on Employees.Salary < AvgSalary;

--5.List products that have been sold at least twice. (CTE)

With cte as (
Select ProductID, COUNT(ProductID) as CountSales from Sales group by ProductID
)
Select Products.ProductID, Products.ProductName, CountSales 
from cte join Products 
on cte.ProductID = Products.ProductID 
where CountSales >= 2

--6.Find employees who made a single sale of more than $2000. (Derived Table)

Select Employees.FirstName, Employees.LastName, COUNT(*) as CountSale 
from Employees 
join 
(Select * from Sales where SalesAmount > 2000) dt 
on Employees.EmployeeID = dt.EmployeeID 
group by Employees.FirstName, Employees.LastName
Having COUNT(*) = 1

--7.Retrieve the most expensive product. (Derived Table)
Select * from  (Select top 1 price, ProductName from Products order by price desc) dt 



--8.Find the total sales made by each employee. (CTE)

With cte as (
Select EmployeeID, Sum(SalesAmount) as TotalSales 
from Sales 
group by EmployeeID
)
Select * from cte

--9.Find employees who have sold a "Laptop." (CTE)

With cte as (
Select ProductName, ProductID 
from Products 
where ProductName = 'Laptop'
)
Select S.EmployeeID,S.ProductID, cte.ProductName, S.SaleDate  
from cte 
join Sales as S 
on S.ProductID = cte.ProductID

--10.Find the highest-paid employee in each department. (Derived Table)

Select E.FirstName, E.LastName, E.DepartmentID, E.Salary
from Employees as E join  (Select DepartmentID, Max(salary) as MaxSalarybyDept 
from Employees
group by DepartmentID) dt 
on E.DepartmentID = dt.DepartmentID and E.Salary = dt.MaxSalarybyDept;


--11.Find departments with no employees. (CTE)


With cte as (
		Select DepartmentName, D.DepartmentID 
		from Departments as D
		left join Employees as E 
		on D.DepartmentID = E.DepartmentID
		Where EmployeeID is null 
)
Select * from cte;

--12.Find employees who have made the same total sales as another employee. (CTE)
WITH SalesTotals AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT S1.EmployeeID AS Employee1, S2.EmployeeID AS Employee2, S1.TotalSales
FROM SalesTotals S1
JOIN SalesTotals S2 
ON S1.TotalSales = S2.TotalSales AND S1.EmployeeID < S2.EmployeeID
ORDER BY S1.TotalSales DESC;



--13.Find the total revenue generated per product category. (CTE)

--cte
With cte as(
Select ProductId, Sum(SalesAmount) as TotalSales 
from Sales 
group by ProductId
)
Select CategoryID, Sum(TotalSales) as TotalRevenue
from cte join Products as P 
on cte.ProductID = P.ProductID
Group by CategoryID
Order by P.CategoryID;

--14.Find the top 3 highest-paid employees per department. (Derived Table)
-- Derived table
SELECT E.EmployeeID, E.DepartmentID,  E.Salary
FROM Employees AS E
JOIN (
    SELECT EmployeeID, DepartmentID, Salary,
           RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS rnk
    FROM Employees
) AS dt ON E.EmployeeID = dt.EmployeeID AND E.DepartmentID = dt.DepartmentID
WHERE dt.rnk <= 3;



--15.Find employees who have the highest number of sales transactions. (Derived Table)
-- Derived Table
Select E.FirstName, CountTrans from Employees as E join 
(Select  EmployeeID, COUNT(SalesID) CountTrans from Sales group by EmployeeID) dt
on E.EmployeeID = dt.EmployeeID
WHERE dt.CountTrans = (
Select max(CountTrans) 
from (Select Count(SalesID) as CountTrans 
from Sales 
group by  EmployeeID) as MaxTrans
);


--16.Find employees who sold more than 3 different products. (CTE)
WITH cte AS (
    SELECT EmployeeID, COUNT( DISTINCT ProductID) AS ProductCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT E.EmployeeID, CONCAT(E.FirstName, ' ', E.LastName) AS FullName, cte.ProductCount
FROM cte 
JOIN Employees E ON E.EmployeeID = cte.EmployeeID
WHERE cte.ProductCount > 3
ORDER BY cte.ProductCount DESC;


--17.Find the department with the highest total salary. (Derived Table)

Select D.DepartmentID,D.DepartmentName,dt.TotalHighSalary from Departments as D 
join (Select top 1 DepartmentID, SUM(Salary) as TotalHighSalary 
from Employees 
group by DepartmentID
order by TotalHighSalary desc) dt 
on d.DepartmentID = dt.DepartmentID;

--18.Find employees who made sales higher than their department's average sales. (Derived Table)

Select Concat(FirstName,' ',LastName)  as FullName,D.DepartmentName,Salary,AvgSalaryByDept 
from Employees as E join
(Select DepartmentID, AVG(Salary) AvgSalaryByDept 
from Employees 
group by DepartmentID) dt 
on E.DepartmentID = dt.DepartmentID and Salary > AvgSalaryByDept
join Departments as D on E.DepartmentID = D.DepartmentID;

 

-- 19.Find employees whose total sales exceed their own salary. (Derived Table)

Select dt.EmployeeID, D.DepartmentName, E.Salary, SalesAmount 
from Employees as E
 join (Select EmployeeID, Sum(SalesAmount) as SalesAmount 
 from Sales 
 group by EmployeeID) dt 
 on E.EmployeeID = dt.EmployeeID and SalesAmount > E.Salary
 join Departments as D on E.DepartmentID = D.DepartmentID;

--20.Find the department with the most sales transactions. (Derived Table)

-- Derived table
Select top 1 D.DepartmentName, CounTrans from Departments as D 
join 
	(Select  E.DepartmentID, COUNT(S.SalesID) as CounTrans 
	from Employees as E join Sales as S 
	on E.EmployeeID = S.EmployeeID 
	group by  E.DepartmentID
) dt 
on D.DepartmentID = dt.DepartmentID
Order by CounTrans desc


--21.Find the top-selling employee for each product. (Derived Table)

Select E.FirstName, S.ProductID, S.SalesAmount 
from Employees as E 
join Sales as S 
on E.EmployeeID = S.EmployeeID
join (Select ProductID, max(SalesAmount) as maxSalesAmount 
from Sales 
group by ProductID) dt 
on S.ProductID = dt.ProductID and S.SalesAmount = dt.maxSalesAmount




Create database HomeworkDB10
Use HomeworkDB10

-- 1. Write a query to perform an INNER JOIN between Orders and Customers using AND in the ON clause to filter orders placed after 2022.
Select C.CustomerName, O.OrderDate from Orders as O 
inner join Customers as C 
on O.CustomerID = C.CustomerID and year(O.OrderDate) > 2022

-- 2. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department.
Select E.EmployeeName, D.DepartmentName from Employees as E 
inner join Departments as D
on E.DeptID = D.DeptID or D.DepartmentName = 'Sales' or D.DepartmentName = 'Marketing'

-- 3. Write a query to join a derived table (for example, SELECT * FROM Products WHERE Price > 100) with the Orders table to display products and their corresponding orders.
Select Dt.ProductName, O.OrderID from Orders as O
inner join (SELECT * FROM Products WHERE Price > 100) as DT
on O.ProductID = DT.ProductID

-- 4. Write a query to join a Temp table (for example, Temp_Orders) and the Orders table to show orders that are present in both tables.
Insert into #Temp_Orders Select * from Orders

-- 5. Write a query to demonstrate a CROSS APPLY between Employees and a derived table that shows their department's 'top-performing sales (e.g., top 5 sales)'.
Select E.EmpName, E.DeptName from Employees as E cross apply (Select top 5 S.SalesPerformance  from Sales as S) ST

--6. Write a query to join Customers and Orders using AND in the ON clause to filter customers who have placed orders in 2023 and have a loyalty status of 'Gold'.
Select C.CustomerName, C.LoyaltyStatus, O.OrderDate from Customers as C join Orders as O on C.CustomerID = O.CustomerID and Year(O.OrderDate) = 2023 and C.LoyaltyStatus = 'Gold'

-- 7. Write a query to join a derived table (SELECT CustomerID, COUNT(*) FROM Orders GROUP BY CustomerID) with the Customers table to show the number of orders per customer.
Select C.CustomerName, DT.OrderCount from Customers as C cross join (SELECT CustomerID, COUNT(O.OrderAmount) as OrderCount FROM Orders as O GROUP BY CustomerID) as DT

-- 8. Write a query to join Products and Suppliers using OR in the ON clause to show products supplied by either 'Supplier A' or 'Supplier B'.
Select P.ProductID, S.SupplierName 
from Products as P inner join Suppliers as S 
on P.SupplierID = S.SupplierID or S.SupplierName = 'Supplier A' or S.SupplierName = 'Supplier B'

-- 9. Write a query to demonstrate the use of OUTER APPLY between Employees and a derived table that returns each employee's most recent order.
Select * from Employees as E
Outer apply (Select * from orders as O) as DT

-- 10. Write a query to perform a CROSS APPLY between Departments and a table-valued function that returns a list of employees working in that department.
Select EM.EmpName, D.DeptName from Departments as D cross apply (Select E.EmpName from Employees as E where D.DeptID = E.DeptID) as EM

-- 11. Write a query that uses the AND logical operator in the ON clause to join Orders and Customers, and filter customers who placed an order with a total amount greater than 5000.
Select C.CustomerName, O.OrderDate, Sum(O.OrderAmount) as TotalOrder 
from Orders as O 
inner join Customer as C 
on O.CustomerID = C.CustomerID
Group by C.CustomerName, O.OrderDate
Having Sum(O.OrderAmount) > 5000

--12. Write a query that uses the OR logical operator in the ON clause to join Products and Sales to filter products that were either sold in 2022 or have a discount greater than 20%.
Select P.ProductName, S.SaleDate, S.Discount
from Products as P 
inner join Sales as S 
on P.ProductID = S.ProductID 
and( Year(S.SaleDate) = 2022 
or S.Discount > 20)

-- 13. Write a query to join a derived table that calculates the total sales (SELECT ProductID, SUM(Amount) FROM Sales GROUP BY ProductID) with the Products table to show total sales for each product.
Select P.ProductName, ST.TotalSales 
from Products join (Select S.ProductID, Sum(Amount) as TotalSales 
from Sales as S Group by ProductID ) as ST
on P.ProductID = ST.ProductID;

-- 14. Write a query to join a Temp table (Temp_Products) and the Products table to show the products that have been discontinued in the Temp table.

INSERT INTO #Temp_Products (ProductID, ProductName, Discontinued)
SELECT ProductID, ProductName, Discontinued 
FROM Products 
WHERE Discontinued = 1;

SELECT P.ProductID, P.ProductName
FROM #Temp_Products AS T
JOIN Products AS P 
ON T.ProductID = P.ProductID;

-- 15. Write a query to demonstrate CROSS APPLY by applying a table-valued function to each row of the Employees table to return the sales performance for each employee.
Select * from Employees as E cross apply (Select  EmployeeID, SUM(SalesAmount) as TotSales from Sales where E.EmpID = S.EmpID ) as ST

-- 16. Write a query to join Employees and Departments using AND in the ON clause to filter employees who belong to the 'HR' department and whose salary is greater than 5000.
Select E.EmpName, D.DeptName, E.Salary from Employees as E 
inner join Departments as D 
on E.DeptID = D.DeptID and (D.DeptName = 'HR' and E.Salary > 5000)

-- 17. Write a query to join Orders and Payments using OR in the ON clause to show orders that have either been paid fully or partially.
Select * from Orders as O 
inner join Payments as P 
on O.OrderID = P.OrderID and ((P.PaidAmount = P.TotalAmount) or (P.PaidAmount > 0 and P.PaidAmount < P.TotalAmount))

-- 18. Write a query to use OUTER APPLY to return all customers along with their most recent orders, including customers who have not placed any orders.
SELECT C.*, OT.*
FROM Customers AS C 
OUTER APPLY (
    SELECT TOP 1 * 
    FROM Orders AS O 
    WHERE O.CustomerID = C.CustomerID
    ORDER BY O.OrderDate DESC
) AS OT;


-- 19. Write a query to join Products and Sales using AND in the ON clause to filter products that were sold in 2023 and have a rating greater than 4.
Select P.ProductName, S.SaleDate, S.Salerate  from Products as P inner join Sales as S on P.ProductID = S.ProductID and (year(S.SaleDate) = 2023 and S.SaleRate > 4)

-- 20. Write a query to join Employees and Departments using OR in the ON clause to show employees who either belong to the 'Sales' department or have a job title that contains 'Manager'.
Select E.EmpName, D.Deptname, E.JobTitle from Employees as E inner join Deparments as D on E.DeptId = D.DeptID and (D.DeptName = 'Sales' or E.JobTitle like '%Manager%')

-- 21. Write a query to demonstrate the use of the AND logical operator in the ON clause between Orders and Customers, and filter orders made by customers who are located in 'New York' and have made more than 10 orders.
Select C.CustomerName, C.CustomerLocation, Count(O.OrderAmount) as OrderCount 
from Orders as O 
inner join Customers as C 
on O.CustomerID = C.CustomerID
Where C.CustomerLocation = 'New York'
Group by C.CustomerName, C.CustomerLocation
Having Count(O.OrderAmount) > 10

-- 22. Write a query to demonstrate the use of OR in the ON clause when joining Products and Sales to show products that are either part of the 'Electronics' category or have a discount greater than 15%.
Select P.ProductName, S.CategoryName, S.Discount
from Products as P 
inner join Sales as S 
on P.ProductId = S.ProductID
and (S.CategoryName = 'Electronics' or S.Discount > 15)

-- 23. Write a query to join a derived table that returns a count of products per category (SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID) with the Categories table to show the count of products in each category.
Select C.CategoryID, PT.ProductCount   from Categories as C inner (Select P.CategoryID, Count(P.ProductID) as ProductCount from Products as P Group by Category ID) as PT

-- 24. Write a query to join a Temp table (Temp_Employees) with the Employees table using a complex condition in the ON clause (e.g., salary > 4000 AND department = 'IT').
Select E.EmployeeName, E.Salary, E.Department from #Temp_Employees as TE inner join Employees as E on E.Salary > 4000 and E.department = 'IT'

-- 25. Write a query to demonstrate CROSS APPLY by applying a table-valued function that returns the number of employees working in each department for every row in the Departments table.
SELECT D.DeptID, D.DeptName, DT.EmpCount 
FROM Departments AS D 
CROSS APPLY (
    SELECT COUNT(E.EmpID) AS EmpCount 
    FROM Employees AS E 
    WHERE E.DeptID = D.DeptID
) AS DT;

-- 26. Write a query to join Orders and Customers using AND in the ON clause to show orders where the customer is from 'California' and the order amount is greater than 1000.
Select C.CustomerLocation, O.OrderAmount from Orders as O inner join Customers as C on O.CustomerID = C.CustomerID  and (C.CustomerLocation = 'California' and O.OrderAmount > 1000)

-- 27. Write a query to join Employees and Departments using a complex OR condition in the ON clause to show employees who are in the 'HR' or 'Finance' department, or have an 'Executive' job title.
Select D.DeptName, E.JobTitle 
from Employees as E 
inner join Departments as D 
on E.DeptID = D.DeptID and (D.Department ='Finance', D.DeptName = 'HR' or E.JobTitle = 'Executive')

-- 28. Write a query to use OUTER APPLY between Customers and a table-valued function that returns all orders placed by each customer, and show customers who have not placed any orders.
SELECT C.CustomerID, C.CustomerName, OT.OrderID 
FROM Customers AS C 
OUTER APPLY (
    SELECT O.OrderID 
    FROM Orders AS O 
    WHERE O.CustomerID = C.CustomerID
) AS OT;

-- 29. Write a query to join Sales and Products using AND in the ON clause to filter products that have both a sales quantity greater than 100 and a price above 50.
SELECT P.ProductID, P.ProductName, S.Quantity, S.Price 
FROM Sales AS S  
INNER JOIN Products AS P 
ON S.ProductID = P.ProductID 
AND S.Quantity > 100 
AND S.Price > 50;


--30. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department, and with a salary greater than 6000.
Select E.Empname, D.Deptname, E.Salary 
from Employees as E 
inner join Departments as D 
on E.DeptID = D.DeptID and (D.DeptName = 'Sales' or D.DeptName = 'Marketing') and E.Salary > 6000
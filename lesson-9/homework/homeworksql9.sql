Create Database HomeworkDB9
USE HomeworkDB9
-- 1. Write a query to join Employees and Departments using an INNER JOIN, and apply a WHERE clause to show only employees whose salary is greater than 5000.
Select * from Employees as E inner join Departments as D on E.DeptID = D.DeptID where E.Salary > 5000

-- 2. Write a query to join Customers and Orders using an INNER JOIN, and apply the WHERE clause to return only orders placed in 2023.
Select * from Customers as C inner join Orders as O on C.CustomerID = O.CustomerID where YEAR(O.OrderDate) = 2023

-- 3. Write a query to demonstrate a LEFT OUTER JOIN between Employees and Departments, showing all employees and their respective departments (including employees without departments).
Select E.EmployeeName, D.DeptName from Employees as E left outer join Departments as D on E.DeptID = D.DeptID

-- 4. Write a query to perform a RIGHT OUTER JOIN between Products and Suppliers, showing all suppliers and the products they supply (including suppliers without products).
Select P.Productname, S.SupplierName from Products as P right outer join Suppliers as S on P.SupplierID = S.SupplierID 

-- 5. Write a query to demonstrate a FULL OUTER JOIN between Orders and Payments, showing all orders and their corresponding payments (including orders without payments and payments without orders).
Select O.OrderName, P.PaymentDate from Orders as O full outer join Payments as P on O.OrderID = P.OrderID

-- 6. Write a query to perform a SELF JOIN on the Employees table to display employees and their respective managers (showing EmployeeName and ManagerName).
Select E1.EmployeeName, E2.EmployeeName as Manager from Employees as E1  join Employees as E2 on E1.ManagerID = E2.ManagerID

-- 7. Write a query to demonstrate the logical order of SQL query execution by performing a JOIN between Products and Sales, followed by a WHERE clause to filter products with sales greater than 100.
Select * from Products as P join Sales as S on P.ProductID = S.ProductID where S.SalesAmount > 100

-- 8. Write a query to join Students and Courses using INNER JOIN, and use the WHERE clause to show only students enrolled in 'Math 101'.
Select * from Students as S inner join Courses as C on S.StudentID  = C.StudentID where C.CourseName = 'Math 101'

-- 9. Write a query that uses INNER JOIN between Customers and Orders, and filters the result with a WHERE clause to show customers who have placed more than 3 orders.
Select C.CustomerID, C.CustomerName, Count(O.OrderID) as OrderCount from Customers as C inner join Orders as O 
Group by C.CustomerID, C.CustomerName
on C.CustomerID = O.CustomerID Having Count(O.OrderID) > 3

-- 10. Write a query to join Employees and Departments using a LEFT OUTER JOIN and use the WHERE clause to filter employees in the 'HR' department.
Select * from Employees as E left outer join Departments as D on E.DeptID = D.DeptID where D.DeptName = 'HR'

--11. Write a query to perform an INNER JOIN between Employees and Departments, and use the WHERE clause to show employees who belong to departments with more than 10 employees.
Select D.DeptName, Count(E.EmpID) as EmpCount from Employees as E inner join Departments as D 
on E.DeptID = D.DeptID  
group by D.DeptName
Having Count(E.EmpID) > 10

--12. Write a query to perform a LEFT OUTER JOIN between Products and Sales, and use the WHERE clause to filter only products with no sales.
Select * from Products as P left outer join Sales as S on P.ProductID = S.ProductID where S.ProductID is null 

--13. Write a query to perform a RIGHT OUTER JOIN between Customers and Orders, and filter the result using the WHERE clause to show only customers who have placed at least one order.
Select * from Customers as C right outer join Orders as O on C.CustomerID = O.CustomerID where O.CustomerID is not null

-- 14. Write a query that uses a FULL OUTER JOIN between Employees and Departments, and filters out the results where the department is NULL.
Select * from Employees as E full outer join Departments as D on E.DeptID = D.DeptID where D.DeptName is not null

-- 15. Write a query to perform a SELF JOIN on the Employees table to show employees who report to the same manager.
Select E.EmployeeName as Employee, E2.EmployeeName as Manager from Employees as E join Employees as E1 on E.ManagerID = E1.ManagerID

-- 16. Write a query that uses the logical order of SQL execution to perform a LEFT OUTER JOIN between Orders and Customers, followed by a WHERE clause to filter orders placed in the year 2022.
Select * from Orders as O left outer join Customers as C on O.CustomerID = C.CustomerID where year(O.OrderDate) = 2022

-- 17. Write a query to use the ON clause with INNER JOIN to return only the employees from the 'Sales' department whose salary is greater than 5000.
Select  E.EmployeeName as Employee from Employees E inner join Departments as D on E.DeptID = D.DeptID where D.DepartmentName = 'Sales' and E.Salary > 5000

-- 18. Write a query to join Employees and Departments using INNER JOIN, and use WHERE to filter employees whose department's DepartmentName is 'IT'.
Select E.EmployeeName  from Employees as E inner join Departments as D on E.DeptID = D.DeptID where D.DepartmentName = 'IT'

-- 19. Write a query to join Orders and Payments using a FULL OUTER JOIN, and use the WHERE clause to show only the orders that have corresponding payments.
Select * from Orders as O full outer join Payments as P on O.OrderID = P.OrderID where P.PaymentID is not null

-- 20. Write a query to perform a LEFT OUTER JOIN between Products and Orders, and use the WHERE clause to show products that have no orders.
Select * from Products as P left outer join Orders as O on P.ProductID = O.ProductID where O.ProductID is null

--- 21. Write a query that explains the logical order of SQL execution by using a JOIN between Employees and Departments, followed by a WHERE clause to show employees whose salary is higher than the average salary of their department.
Select E.EmployeeName, E.Salary, D.DeptName 
from Employees as E 
inner join Departments as D on E.DeptID = D.DeptID
where E.Salary > (Select avg(E2.Salary) 
from Employees as E2 
where E2.DeptID = E.DeptID )

-- 22. Write a query to perform a LEFT OUTER JOIN between Orders and Payments, and use the WHERE clause to return all orders placed before 2020 that have not been paid yet.
Select O.OrderID, O.OrderDate, P.Paid from Orders as O 
left outer join Payments as P on O.OrderID = P.OrderID 
where year(O.OrderDate) < 2020 and (P.Paid is null or P.Paid = 0)

-- 23. Write a query to perform a FULL OUTER JOIN between Products and Categories, and use the WHERE clause to filter only products that have no category assigned.
Select P.ProductName, C.CategoryID from Products as P 
full outer join Categories as C 
on P.CategoryID = C.CategoryID 
where C.CategoryID is null

-- 24. Write a query to perform a SELF JOIN on the Employees table to find employees who report to the same manager and earn more than 5000.
Select E.EmployeeName, E1.EmployeeName as Manager 
from Employees as E 
join Employees as E1
on E.EmpID = E1.ManagerID
where E.Salary > 5000

-- 25. Write a query to join Employees and Departments using a RIGHT OUTER JOIN, and use the WHERE clause to show employees from departments where the department name starts with 'M'.
Select E.EmployeeName, D.DepartmentName from Employees as E 
right outer join Departments as D 
on E.DeptID = D.DeptID
Where D.DepartmentName like 'M%'

-- 26. Write a query to demonstrate the difference between the ON clause and the WHERE clause by joining Products and Sales, and using WHERE to filter only sales greater than 1000.
Select P.ProductName from Products as P 
inner join Sales as S 
on P.ProductID = S.ProductID
where S.SalesAmount > 1000

--27. Write a query to perform a LEFT OUTER JOIN between Students and Courses, and use the WHERE clause to show only students who have not enrolled in 'Math 101'.
Select S.StudentName from Students as S 
left outer join Courses as C 
on S.StudentID = C.StudentID
where C.CourseName != 'Math 101' and CourseName is  Null

--28. Write a query that explains the logical order of SQL execution by using a FULL OUTER JOIN between Orders and Payments, followed by a WHERE clause to filter out the orders with no payment.
Select O.OrderID from Orders as O
FULL outer join Payments as P
on O.OrderID = P.OrderID
Where P.Paid is null or P.Paid = 0

-- 29. Write a query to join Products and Categories using an INNER JOIN, and use the WHERE clause to filter products that belong to either 'Electronics' or 'Furniture'.
Select P.ProductID, P.ProductName, C.CategoryName
from Products as P 
inner join Categories as C 
on P.CategoryID = C.categoryID
where C.CategoryName  = 'Electronics' or C.CategoryName  = 'Furniture'

--30. Write a query to perform a CROSS JOIN between Customers and Orders, and use the WHERE clause to filter the result to show customers with more than 2 orders placed in 2023.
Select C.CustomerName, COUNT(O.OrderID) AS TotalOrders
from Customers as C 
cross join Orders as O
Where C.CustomerID = O.CustomerID and Year(O.OrderDate) = 2023
group by C.CustomerName
Having Count(O.OrderID) > 2
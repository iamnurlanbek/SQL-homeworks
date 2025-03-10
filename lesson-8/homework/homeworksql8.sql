Create database HomeworkDB8
USe HomeworkDB8
-- 1. Write a query to join the Customers and Orders tables using an INNER JOIN to get the CustomerName and their OrderDate.
Select C.CustomerName, O.Orderdate from Customers as C inner join Orders as O on C.CustomerID = O.CustomerID

-- 2. Write a query to demonstrate a One to One relationship between the EmployeeDetails and Employees tables by joining them.
Select E.EmployeeName, ED.Email from EmployeeDetails as ED inner join Employees as E on ED.Employee_id = E.Employee_id

-- 3. Write a query to join the Products and Categories tables to show ProductName along with CategoryName using INNER JOIN.
Select P.ProductName, C.CategoryName from Products as P inner join Categories as C on P.CategoryID = C.CategoryID

-- 4. Write a query to show all Customers and the corresponding OrderDate using LEFT JOIN between Customers and Orders.
Select C.CustomerName, O.OrderDate from Customers as C left join Orders as O on C.CustomerID = O.CustomerID

-- 5. Write a query that demonstrates a Many to Many relationship between Orders and Products tables using an intermediate OrderDetails table.
Select P.ProductName, O.OrderDate from Products as P
inner join OrderDetails as OD on P.ProductID = OD.ProductID
inner join Orders as O on OD.OrderID = O.OrderID

-- 6. Write a query to perform a CROSS JOIN between Products and Categories, showing all possible combinations of products and categories.
Select * from Products cross join Categories

-- 7. Write a query to demonstrate the One to Many relationship between Customers and Orders using INNER JOIN.
Select C.CustomerName, O.OrderDate from Customers as C inner join Orders on O.CustomerID = C.CustomerID

--8. Write a query to filter a CROSS JOIN result using the WHERE clause, showing only combinations of Products and Orders where OrderAmount > 500.
Select * from Products cross join Orders as O where O.OrderAmount > 500

-- 9. Write a query that uses INNER JOIN to join the Employees and Departments tables, showing employee names and their corresponding department names.
Select E.EmployeeName, D.DepName from Employees as E inner join Departments as D on E.DepID = D.DepID

-- 10. Write a query that uses the ON clause with a <> operator to join two tables and return rows where the values in the two columns are not equal.
Select * from table1 inner join table2 on table1.column <> table2.column

-- 11. Write a query to demonstrate a One to Many relationship by joining the Customers and Orders tables using INNER JOIN, showing the CustomerName and the total number of orders.
Select  C.CustomerName, Count(O.OrderAmount) as Total_Order from Customers as C
inner join Orders as O on C.CustomerID = O.CustomerID group by C.CustomerName

-- 12. Write a query to demonstrate a Many to Many relationship between Students and Courses by joining through the StudentCourses table.
Select S.StudentName, C.Coursename from Students as S 
inner join StudentCourses as SC on S.StudentID = SC.StudentID
inner join Courses as C on SC.CourseID = C.CourseID

-- 13. Write a query to use a CROSS JOIN between Employees and Departments tables, and filter the results by Salary > 5000 using the WHERE clause.
Select * from Employees as E cross join Departments as D where E.Salary > 5000

-- 14. Write a query to demonstrate a One to One relationship by joining the Employee and EmployeeDetails tables, showing each employee’s name and their details.
Select E.EmpName, ED.PhoneNumber from Employees as E inner join EmployeeDetails as ED on E.EmpID = ED.EmpID

-- 15. Write a query to perform an INNER JOIN between Products and Suppliers and use the WHERE clause to filter only products supplied by 'Supplier A'.
Select * from Products as P inner join Suppliers as S on P.SupplierID  = S.SupplierID  where S.SupplierName = 'Supplier A'

--16. Write a query to perform a LEFT JOIN between Products and Sales, and display all products along with their sales quantity (including products with no sales).
Select P.ProductName, S.Quantity from Products as P left join Sales as S on P.ProductID = S.ProductID

-- 17. Write a query to join Employees and Departments using a WHERE clause, and show all employees whose salary is greater than 4000 and who work in the ‘HR’ department.
Select * from Employees as E inner join Departments as D on E.DepID =D.DepID where E.Salary > 4000 and D.Department = 'HR'

-- 18. Write a query to show how to use the >= operator in the ON clause to join two tables and return rows where the values meet the condition.
Select * from table1 inner join table2 on table1.value >= table2.value

-- 19. Write a query to demonstrate INNER JOIN and use the >= operator to find all products with a price greater than or equal to 50, and their respective suppliers.
Select * from Products as P inner join Suppliers as S on P.SupplierID = S.SupplierID where P.Price >= 50

-- 20. Write a query to demonstrate a CROSS JOIN between Sales and Regions, and use the WHERE clause to show only regions with sales greater than 1000.
Select * from Sales as S cross join Regions as R where S.SalesAmount > 1000

--21. Write a query that demonstrates a Many to Many relationship between Authors and Books using the intermediate AuthorBooks table, showing the AuthorName and the BookTitle.
Select A.AuthorName, B.BookName from Authors as A 
inner join AuthorBooks as AB on A.AuthorID = AB.AuthorID
inner join Books as B on AB.BookID = B.BookID

--22. Write a query to join Products and Categories using INNER JOIN, and filter the result to only include products where the CategoryName is not ‘Electronics’.
Select * from Products as P inner join Categories as C on P.CategoryID = C.CategoryID where C.CategoryName != 'Electronics'

--23. Write a query to perform a CROSS JOIN between Orders and Products, and filter the result with a WHERE clause to show only orders where the quantity is greater than 100.
Select * from Orders cross join Products where Orders.Quantity > 100

--24. Write a query that joins the Employees and Departments tables and uses a logical operator in the ON clause to only return employees who have been with the company for over 5 years.
Select * from Employees as E inner join Departments as D on E.DepID = D.DepID where Datediff(year,E.Hiredate, Getdate() > 5

--25. Write a query to show the difference between INNER JOIN and LEFT JOIN by returning employees and their departments, ensuring that employees without departments are included in the left join.
Select * from Employees as E inner join Departments as D on E.DepID = D.DepID
Select * from Employees as E left join Departments as D on E.DepID = D.DepID

--26. Write a query that uses a CROSS JOIN between Products and Suppliers, and filters the result using WHERE to include only suppliers that supply products in 'Category A'.
Select * from Products as P cross join Suppliers as S where S.Category = 'Category A'

--27. Write a query to demonstrate a One to Many relationship using INNER JOIN between Orders and Customers, and apply the >= operator to filter only customers with at least 10 orders.
Select C.CustomerName, Count(O.OrderAmount) as TotalOrder from Orders as O
inner join Customers as C on O.CustomerID = C.CustomerID 
Group by C.CustomerName
Having Count(O.OrderAmount) >= 10

--28. Write a query to demonstrate the Many to Many relationship between Courses and Students, showing all courses and the number of students enrolled using the COUNT function.
Select C.CourseName, Count(SC.StudentID) as TotalStudents from Courses as C 
inner join StudentCourses as SC on C.CourseID = SC.CourseID 
group by C.CourseName

--29. Write a query to use a LEFT JOIN between Employees and Departments tables, and filter the result using the WHERE clause to show only employees in the 'Marketing' department.
Select * from Employees as E left join Departments as D where D.Department = 'Marketing' or D.Department is null

--30. Write a query that uses the ON clause with <= operator to join two tables and return rows where the values in the columns meet the condition.
Select * from Table1 inner join Table2 on Table1.value <= Table2.value

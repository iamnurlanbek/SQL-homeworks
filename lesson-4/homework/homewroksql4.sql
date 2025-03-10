/* CREATE DATABASE HomeworkDB3
USE HomeworkDB3 */
--1. Write a query to select the top 5 employees from the Employees table.
Select top 5 * from employees

-- 2. Use SELECT DISTINCT to select unique ProductName values from the Products table.
Select distinct ProductName from Products

-- 3. Write a query that filters the Products table to show products with Price > 100.
Select * from Products where Price  > 100

-- 4. Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
Select * from Customers
where CustomerName like 'A%'

-- 5. Order the results of a Products query by Price in ascending order.
Select * from Products
order by price asc

-- 6. Write a query that uses the WHERE clause to filter for employees with Salary >= 5000 and Department = 'HR'.
Select * from employees
where Salary >= 5000 and Department = 'HR'

-- 7. Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".
Select isnull(Email, 'naemail@example.com') from employess

-- 8. Write a query that shows all products with Price BETWEEN 50 AND 100.
Select * from Products
where price between 50 and 100

-- 9. Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
Select distinct category, Productname from Products

-- 10. Order the results by ProductName in descending order.
Select * from Products
order by ProductName desc

 -- 11. Write a query to select the top 10 products from the Products table, ordered by Price DESC.
 Select top 10 * from Products order by Price desc

-- 12. Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
Select coalesce(Firstname, LastName, 'No found non-nulls') from employees

-- 13. Write a query that selects distinct Category and Price from the Products table.
Select Distinct Category, Price from Products

-- 14. Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
Select * from Employees
Where Age between 30 and 40 or Department = 'Marketing'

-- 15. Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
Select * from Employees
order by Salary desc
offset 10 rows
fetch next 10 rows only

-- 16. Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
Select * from Products
Where Price <= 1000 and Stock > 50
order by Stock asc

-- 17. Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
Select * from Products
where ProductName like '%e%'

-- 18. Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
Select * from Employees
Where Department in ('HR','IT','Finance') 

-- 19. Write a query that uses the ANY operator to find employees who earn more than the average salary of all employees.
Select * from Employees
where Salary > (any) (select Avg(salary) from Employees)

-- 20. Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.
Select * from Customers
order by City asc, PostalCode desc

-- 21. Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
Select top 10 * from Products
order by SalesAmount desc

-- 22. Use COALESCE to combine FirstName and LastName into one column named FullName in the Employees table.
Select coalesce(Firstname, '') + ' ' + coalesce(LastName, '') as FullName from Employees

Select concat(coalesce(FirstName, ''), ' ' ,coalesce(LastName, '')) as FullName from Employees

-- 23. Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
Select Distinct Category, ProductName, Price from Products
Where Price > 50

-- 24. Write a query that selects products whose Price is within 10% of the average price in the Products table.
Select * from Products
where Price between (select avg(price) * 0.9 from products) and (select avg(price) * 1.1 from products)

-- 25. Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
Select * from Employees
Where Age < 30 and Department in ('HR','IT')

-- 26. Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
Select * from Customers
where Email like '%@gmail.com'

-- 27. Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
Select * from Employees
where Salary > all (select salary from employees where department = 'sales')

-- 28. Use ORDER BY with OFFSET-FETCH to show employees with the highest salaries, displaying 10 employees at a time (pagination).
Select * from Employees
order by Salary desc
offset 0 rows
fetch next 10 rows only

-- 29. Write a query that filters the Orders table for orders placed in the last 30 days using BETWEEN and CURRENT_DATE.
Select * from Orders
where OrderPlace >= DATEADD(day, -30, getdate())

Select * from Orders
where OrderPlace between DATEADD(day, -30, GETDATE()) and GETDATE()

-- 30. Use ANY with a subquery to select all employees who earn more than the average salary for their department.
Select * from employees
where salary > any (select department avg(salary) from employees group by department)



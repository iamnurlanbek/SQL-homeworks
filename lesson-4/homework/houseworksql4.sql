Create database Homework4
Use Homework4
--- Easy-Level Tasks ---
Create table Products (ProductName varchar(20), CustomerName varchar(50), Price int, Category varchar(15))

Insert into Products values ('Olma', 'Alex', 1300, 'Cheap')
Insert into Products values ('Behi', 'Apex', 5000, 'Exp')
Insert into Products values ('Tarvuz', 'Alen', 6000, 'Exp')
Insert into Products values ('Un', 'Alexandra', 3300, 'Exp')
Insert into Products values ('Anor', 'Alsher', 2300, 'Exp')
Insert into Products values ('Bana', 'Linda', 300, 'Cheap')
Insert into Products values ('Uzum', 'Leon', 900, 'Cheap')
Insert into Products values ('Olma', 'Micheal', 80, 'Cheap')
Select * from Products


Create table employees (FirstName varchar(20), LastName varchar(30), Salary int, Department varchar(50))

Insert into employees values ('Alex', 'Sanchez', 12300, 'HR')
Insert into employees values ('Apex', 'Arnold', 1300, 'Finance')
Insert into employees values ('Alen', 'Jorj', 11000, 'Marketing')
Insert into employees values ('Linda', 'Alina', 6000, 'Sales')
Insert into employees values ('Mario', 'Merlin', 9500, 'HR')
Insert into employees values ('Misha', 'Linkoln', 1200, 'Finance')
Insert into employees values ('John', 'Jack', 1000, 'Marketing')
Select * from Employees


-- 1. Write a query to select the top 5 employees from the Employees table.
Select top 5 * from Employees

-- 2. Use SELECT DISTINCT to select unique ProductName values from the Products table.
Select distinct ProductName from Products

-- 3. Write a query that filters the Products table to show products with Price > 100.
Select * from Products
where price > 100

-- 4. Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
Select * from Products
where CustomerName like 'A%'

-- 5. Order the results of a Products query by Price in ascending order.
Select * from Products
order by Price asc

-- 6. Write a query that uses the WHERE clause to filter for employees with Salary >= 5000 and Department = 'HR.
Select * from Employees
where Salary >= 5000 and Department = 'HR'

-- 7. Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".
Create table emails (email varchar(20))
Insert into emails values ('noil@example.com')
Insert into emails values (null)
Insert into emails values ('gmail@example.com')
Insert into emails values (null)
Insert into emails values ('emailru@ex.ru')
Select * from emails

Select isnull(email,'noemail@example.com') from emails

-- 8. Write a query that shows all products with Price BETWEEN 50 AND 100.
Select * from Products
where Price between 50 and 100

-- 9. Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
Select distinct Category, Productname from Products

-- 10. Order the results by ProductName in descending order.
Select * from Products
Order by ProductName desc

 --- Medium-Level Tasks ---
-- 11. Write a query to select the top 10 products from the Products table, ordered by Price DESC.
Select top 10 * from Products
Order by price desc

-- 12. Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
Select coalesce(FirstName, LastName, 'Not found') from Employees

-- 13. Write a query that selects distinct Category and Price from the Products table.
Select distinct Category, Price from Products

-- 14. Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
Select * from Employees
where Age between 30 and 40 or Department = 'Marketing'

-- 15. Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
Select * from Employees
order by Salary desc
offset 11 rows
fetch next 10 rows only

-- 16. Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
Select * from Products
Where Price <= 1000 and Stock > 50
order by Stock asc

-- 17. Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
Select * from Products
where ProductName like '%e%'

-- 18. Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
Select * from employees
Where Department in ('HR', 'IT') or Department = 'Finance'

-- 19. Write a query that uses the ANY operator to find employees who earn more than the average salary of all employees.
Select * from employees
Where Salary > any (select avg(salary) from employees)

-- 20. Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.
Select * from Customers
order by city asc, PostalCode desc

--- Hard-Level Tasks ---
-- 21. Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
Select top 10 * from Products
order by SalaeAmount desc

-- 22. Use COALESCE to combine FirstName and LastName into one column named FullName in the Employees table.


-- 23. Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
Select distinct Category, ProductName, Price from Products
where Price > 50

-- 24. Write a query that selects products whose Price is within 10% of the average price in the Products table.
Select * from Products
where price between ((avg(price) * 0.9) and (avg(price) * 1.1))


-- 25. Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
Select * from Employees
where Age < 30 and Department = 'HR' or Department = 'IT'

-- 26. Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
Select * from Employees
where Email like '%@gmail.com'

-- 27. Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
Select * from Employees
Where Salary > all (select Salary from employees where Department = 'Sales')

-- 28. Use ORDER BY with OFFSET-FETCH to show employees with the highest salaries, displaying 10 employees at a time (pagination).
Select * from employees
order by Salary desc
offset 0 rows
fetch next 10 rows only

-- 29. Write a query that filters the Orders table for orders placed in the last 30 days using BETWEEN and CURRENT_DATE.


-- 30. Use ANY with a subquery to select all employees who earn more than the average salary for their department.
Select * from employees
Where Salary > any (Select avg(salary) from employees)

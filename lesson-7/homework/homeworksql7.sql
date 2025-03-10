 /* Create database HomeworkDB7
USE HomeworkDB7 */
-- 1. Write a query to find the minimum (MIN) price of a product in the Products table.
Select MIN(price)as MinPrice from Products

-- 2. Write a query to find the maximum (MAX) Salary from the Employees table.
Select MAX(Salary) as MaxPrice from Products

-- 3. Write a query to count the number of rows in the Customers table using COUNT(*).
Select count(*) as NumberRows from Customers

-- 4. Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.
Select Count(Distinct Category) as UPCategory from Products

--5. Write a query to find the total (SUM) sales for a particular product in the Sales table.
Select ProductName, Sum(Amount) as TotalSales from Sales
group by ProductName

-- 6. Write a query to calculate the average (AVG) age of employees in the Employees table.
Select Avg(age) Avg_Age from Employees

-- 7. Write a query that uses GROUP BY to count the number of employees in each department.
Select department, count(EmpID) as CountEmp from employees
group by department

-- 8. Write a query to show the minimum and maximum Price of products grouped by Category.
Select Category, min(price) as MinPrice, max(price) as MaxPrice from Products
Group by Category

-- 9. Write a query to calculate the total (SUM) sales per Region in the Sales table.
Select Region, sum(Amount) as TotalSales from Sales
Group by Region

-- 10. Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.
Select department, count(EmpID) from Employees
Group by Department
having Count(EmpID) > 5

-- 11. Write a query to calculate the total sales and average sales for each product category from the Sales table.
Select Category, Sum(Amount) as TotalSales, Avg(Amount) as Avg_Sales from Sales
Group by Category

-- 12. Write a query that uses COUNT(columnname) to count the number of employees with a specific JobTitle.
Select JobTitle,count(EmpID) from Employees
Group by JobTitle

-- 13. Write a query that finds the highest (MAX) and lowest (MIN) Salary by department in the Employees table.
Select Department, Max(Salary) as Max_Salary, Min(Salary) as Min_Salary from Employees
Group by Department

-- 14. Write a query that uses GROUP BY to calculate the average salary per Department.
Select Department, avg(salary) as Avg_Salary from Employees
Group by Department

-- 15. Write a query to show the AVG salary and COUNT(*) of employees working in each department.
Select Department, Avg(Salary) as Avg_Salary, Count(EmpID) as CountEmp from Employees
Group by Department

-- 16. Write a query that uses HAVING to filter products with an average price greater than 100.
Select Category, Avg(Price) as Avg_Price from Products
Group by Category
Having Avg(Price) > 100

-- 17. Write a query to count how many products have sales above 100 units using COUNT(DISTINCT ProductID).
Select Count(Distinct ProductID) as Count_Products from Products
Where Quantity > 100

-- 18. Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.
Select SalesYear, SUM(AmountSales) as TotalSales from Sales
Group by SalesYear

-- 19. Write a query that uses COUNT to show the number of customers who placed orders in each region.
Select Region, count(CustomerID) as CountEmp from Orders
Group by Region

-- 20. Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 100,000.
Select department, Sum(Salary) as TotalSalary from Employees
Group by department
having Sum(Salary) > 100000

-- 21. Write a query that shows the average (AVG) sales for each product category, and then uses HAVING to filter categories with an average sales amount greater than 200.
Select Category, Avg(Amount) as AvgSales  from Sales
Group by Category
Having Avg(Amount) > 200

-- 22. Write a query to calculate the total (SUM) sales for each employee, then filter the results using HAVING to include only employees with total sales over 5000.
Select EmpID, Sum(Amount) as TotalSales from Sales
Group by EmpID
Having Sum(Amount) > 5000

-- 23. Write a query to find the total (SUM) and average (AVG) salary of employees grouped by department, and use HAVING to include only departments with an average salary greater than 6000.
Select Department, Sum(Salary) as TotalSalary, Avg(Salary) as Avg_Salary from Employees
Group by Department
Having Avg(Salary) > 6000

--24. Write a query that finds the maximum (MAX) and minimum (MIN) order value for each customer, and then applies HAVING to exclude customers with an order value less than 50.
Select CustomerID, Max(OrderValue) as Max_OderValue, Min(OrderValue) as Min_Ordervalue from orders
Group by CustomerID
Having Min(Ordervalue) > 50

-- 25. Write a query that calculates the total sales (SUM) and counts distinct products sold in each Region, and then applies HAVING to filter regions with more than 10 products sold.
Select Region, Sum(Amount) as TotalSales, Count(Distinct ProductID) as Count_Product from Sales
Group by Region
Having Count(Distinct ProductID) > 10

-- 26. Write a query to find the MIN and MAX order quantity per product, and then use GROUP BY to group the results by ProductCategory.
Select ProductCategory, Min(Quantity) as Min_Quantity, Max(Quantity) as Max_Quantity from Products
Group by ProductCategory

-- 27. Write a query to pivot the Sales table by Year and show the sum of SalesAmount for each Region.
Select Region, [2023] as Sales_2023, [2024] as Sales_2024, [2025] as Sales_2025
from (
	Select region, SalesYear, SalesAmount
	from Sales
	) as Sourcetable
Pivot (
	Sum(SalesAmount)
	for year in ([2023],[2024],[2025])
	) As Pivottable

-- 28. Write a query to unpivot the Sales table, converting Q1, Q2, Q3, and Q4 columns into rows showing total sales per quarter.
Select Year, Product, Quarter, TotalSales
	from (
	Select Year,Product, Q1, Q2, Q3, Q4 
	from Sales
	) as SourceTable
Unpivot (
	TotalSales
	for Quarter IN (Q1, Q2, Q3, Q4)
	) as Unpivottable


-- 29. Write a query to count the number of orders per product, filter those with more than 50 orders using HAVING, and group them by ProductCategory.
 Select ProductCategory, count(OrderID) as Count_Order from Orders
 Group by ProductCategory
 Having count(OrderID) > 50

-- 30. Write a query to pivot the EmployeeSales table, displaying the total sales per employee for each quarter (Q1, Q2, Q3, Q4).
Select Year, Employee, Q1, Q2, Q3, Q4
	from (
		Select Year, Employee, Quarter, TotalSales
		from EmployeeSales
		) as SourceTable
Pivot (
	sum(TotalSales)
	For Quarter In (Q1, Q2, Q3, Q4)
	) as PivotTable








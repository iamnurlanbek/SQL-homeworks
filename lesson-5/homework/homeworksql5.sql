-- 1. Write a query that uses an alias to rename the ProductName column as Name in the Products table.
Select ProductName as Name from Products

-- 2. Write a query that uses an alias to rename the Customers table as Client for easier reference.
Select * from Customers as Client

-- 3. Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discontinued.
Select ProductName from Products
Union
Select ProductName from Products_Discontinued  

-- 4. Write a query to find the intersection of Products and Products_Discontinued tables using INTERSECT.
Select ProductName from Products
Intersect
Select ProductName from Products_Discontinued

-- 5. Use UNION ALL to combine two tables, Products and Orders, that have the same structure.
Select * from Products
Union All
Select * from Orders

-- 6. Write a query to select distinct customer names (CustomerName) and their corresponding Country using SELECT DISTINCT.
Select Distinct  Customername, Country from Customers

-- 7. Write a query that uses CASE to create a conditional column that displays 'High' if Price > 100, and 'Low' if Price <= 100.
Select 
	*,
	case	
		when Price > 100 then 'High'
		else 'Low'
	end as PriceDisplay
from Products;

-- 8. Write a query to filter Employees by Department and group them by Country.
Select department, country from Employees
Group by department, country

-- 9. Use GROUP BY to find the number of products (ProductID) in each Category.
Select Category, count(ProductID) from Products
Group by Category

-- 10. Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise.
Select *, iif(Stock> 100, 'Yes', 'No') from Products

Select 
	*,
	case
		when Stock > 100 then 'Yes'
		else 'No'
	end as InStock
from Products

--11. Write a query that joins the Orders and Customers tables using INNER JOIN and aliases the CustomerName as ClientName.
Select Customers.CustomerName as ClientName from Orders inner join Customers on Orders.CustomerID = Customers.CustomerID

-- 12. Use UNION to combine results from two queries that select ProductName from Products and ProductName from OutOfStock tables.
Select ProductName from Products
Union
Select ProductName from OutOfStock

-- 13. Write a query that returns the difference between the Products and DiscontinuedProducts tables using EXCEPT.
Select * from Products
Except
Select * from DiscontinuedProducts

-- 14. Write a query that uses CASE to assign a value of 'Eligible' to customers who have placed more than 5 orders, otherwise 'Not Eligible'.
Select 
	*,
	case
		When Count(Orders.OrderID) > 5 then 'Eligible'
		else 'Not Eligible'
	end as AmountOrder
from Customers
Left join orders on Customers.CustomerID = Orders.CustomerID
Group by Customers.CustomerID

-- 15. Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 100, and 'Affordable' if less.
Select *, iif(Price > 100, 'Expensive', 'Affordable') from Products

-- 16. Write a query that uses GROUP BY to count the number of orders per CustomerID in the Orders table.
Select CustomerID, count(OrderID) OrderCount from Orders
group by CustomerID

-- 17. Write a query to find employees in the Employees table who have either Age < 25 or Salary > 6000.
Select * from Employees
where Age < 25 or Salary > 6000

-- 18. Use GROUP BY to find the total sales (SalesAmount) per Region in the Sales table.
Select Region, sum(SalesAmount) as TotalSales from sales
group by region

-- 19. Write a query that combines data from the Customers and Orders tables using LEFT JOIN, and create an alias for OrderDate.
Select OrderDate as OD,Customers.CustomerID from Customers left join Orders on Customers.CustomerID = Orders.CustomerID

-- 20. Use IF statement to update the salary of an employee based on their department, increase by 10% if they work in 'HR'.
Select *, iif(department = 'HR', salary *1.1, salary) from Employees

-- 21. Write a query that uses UNION ALL to combine two tables, Sales and Returns, and calculate the total sales and returns for each product.
Select 
		ProductId,
		ProductName,
		Sum(SalesAmount) as TotalSales,
		Sum(ReturnsAmount) as TotalReturns
	from (
		Select ProductId, ProductName, SalesAmount, 0 as ReturnsAmount from Sales
		Union All
		Select ProductID, ProductName, 0 as SalesAmount, ReturnsAmount from Returns
		) as CombineData
	group by ProductId, ProductName;


-- 22. Use INTERSECT to show products that are common between Products and DiscontinuedProducts tables.
Select * from Products
Intersect
Select * from DiscontinuedProducts

-- 23. Write a query that uses CASE to assign 'Top Tier' if TotalSales > 10000, 'Mid Tier' if TotalSales BETWEEN 5000 AND 10000, and 'Low Tier' otherwise.
Select 
	*,
	case
		When TotalSales > 10000 then 'Top Tier'
		When TotalSales between 5000 and 10000 then'Mid Tier'
		else 'Low Tier' as AmountSales
	end
from Sales

-- 24. Write a query that combines multiple conditions using IF and WHILE to iterate over all rows of the Employees table and update their salary based on certain criteria.
Update Employees
Set salary = 
		case
			when department = 'HR' then salary * 1.1
			When department = 'IT' then salary * 1.2
			else salary * 1.05
		end;

--25. Use EXCEPT to find customers who have placed orders but do not have a corresponding record in the Invoices table.
Select * from Orders
except
Select * from Invoices

-- 26. Write a query that uses GROUP BY on three columns: CustomerID, ProductID, and Region, and calculates the total sales.
Select CustomerID, ProductID, Region, sum(AmountSales) as TotalSales from Sales group by CustomerID, ProductID, Region

-- 27. Write a query that uses CASE to apply multiple conditions and returns a Discount column based on the Quantity purchased.
Select *,
	case	
		When Quantity >= 100 then '30% discont'
		When Quantity between 50 and 99 then '20% discont'
		When Quantity between 10 and 49 then '10% discont'
		Else 'No Discont'
	end as Discont
from Orders

--28. Use UNION and INNER JOIN to return all products that are either in the Products or DiscontinuedProducts table and also show if they are currently in stock.
--29. Write a query that uses IIF to create a new column StockStatus, where the status is 'Available' if Stock > 0, and 'Out of Stock' if Stock = 0.
Select *, iif(Stock > 0, 'Aviable','Out of Stock')) as StockStatus from Sales

-- 30. Write a query that uses EXCEPT to find customers in the Customers table who are not in the VIP_Customers table based on CustomerID.




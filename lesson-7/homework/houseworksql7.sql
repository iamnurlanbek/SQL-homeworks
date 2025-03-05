Create database HomeworSQL7
Use HomeworSQL7

Create table Products (id int identity, Product_Name varchar(20), Category varchar(20), price int)
insert into Products values ('apple', 'fruit', 1500)
insert into Products values ('carrot', 'vegatable', 2500)
insert into Products values ('onion', 'vegatable', 1000)
insert into Products values ('rose', 'flower', 500)
insert into Products values ('coffe', 'drink', 100)
insert into Products values ('tea', 'drink', 50)
Select * from Products

create table employees (id int identity, JobTitle varchar(20), Name varchar(20), Age int, Salary int, Department varchar(30))
insert into employees values('Analyst','Alex', 25, 1500, 'Finance')
insert into employees values('Scholar','Apex', 50, 2500, 'HR')
insert into employees values('Analyst','Alen', 35, 500, 'Finance')
insert into employees values('teacher','Alica', 15, 100, 'HR')
insert into employees values('Gamer','Linda', 28, 1500, 'Finance')
insert into employees values('teacher','Lucy', 22, 1500, 'Marketing')
Select * from employees
drop table employees

create table sales (id int identity, Product_Name varchar(20), Region varchar(20), Sales int, Date_Sales date, Category varchar(20))
Insert into sales values ('Apple', 'Uzb', 500, '2024-02-10', 'cheap')
Insert into sales values ('carrot', 'BAA', 5000, '2024-01-08','exp')
Insert into sales values ('oil', 'Russia', 2000, '2024-04-06','exp')
Insert into sales values ('Onion', 'Brazil', 1500, '2025-09-07','cheap')
Insert into sales values ('Apple', 'Belarus', 800, '2025-03-07','cheap')
Insert into sales values ('oil', 'BAA', 200, '2023-05-04','cheap')
Insert into sales values ('Gold', 'UK', 6000, '2024-04-06','exp')
Select * from sales
DROP TABLE SALES







 --- Easy-Level Tasks ---
-- 1. Write a query to find the minimum (MIN) price of a product in the Products table.
Select MIN(price) from Products

--2. Write a query to find the maximum (MAX) Salary from the Employees table.
Select MAX(Salary) as Max_salary from Employees

-- 3. Write a query to count the number of rows in the Customers table using COUNT(*).
Select COUNT(*) from Customers

-- 4. Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.
Select COUNT(DISTINCT Category) from Products

-- 5. Write a query to find the total (SUM) sales for a particular product in the Sales table.
Select Product_Name, SUM(Sales) as Total_Sales from Sales
group by Product_Name 

-- 6. Write a query to calculate the average (AVG) age of employees in the Employees table.
Select AVG(age) from Employees

-- 7. Write a query that uses GROUP BY to count the number of employees in each department.
Select Department, Count(ID) as Count_emp from Employees
group by Department

-- 8. Write a query to show the minimum and maximum Price of products grouped by Category.
Select Category, MAX(Price) as Max_price, MIN(Price) as Min_price from Products
Group by Category

-- 9. Write a query to calculate the total (SUM) sales per Region in the Sales table.
Select Region, SUM(sales) from Sales
Group by Region

-- 10. Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.
Select Department, COUNT(ID) Depm_emp from Employees
Group by Department
Having COUNT(ID) > 5



--  Medium-Level Tasks ---

-- 11. Write a query to calculate the total sales and average sales for each product category from the Sales table.
Select Category, SUM(Sales) Total_Sales, AVG(sales) Avg_Sales from Sales
group by Category

-- 12. Write a query that uses COUNT(columnname) to count the number of employees with a specific JobTitle.
Select JobTitle, count(ID) Count_emp from employees
group by JobTitle

--13. Write a query that finds the highest (MAX) and lowest (MIN) Salary by department in the Employees table.
Select Department, MAX(Salary) as Max_Salary, MIN(Salary) as MIn_Salary from employees
group by Department

--14. Write a query that uses GROUP BY to calculate the average salary per Department.
Select Department, AVG(salary) from employees group by Department

-- 15. Write a query to show the AVG salary and COUNT(*) of employees working in each department.
Select Department, Count(*) Dep_emp, AVG(Salary) Avg_Salary from employees group by Department

-- 16. Write a query that uses HAVING to filter products with an average price greater than 100.
Select Product_Name, AVG(price)as Product_100 from Products
group by Product_Name
Having AVG(price) > 100

-- 17. Write a query to count how many products have sales above 100 units using COUNT(DISTINCT ProductID).
sp_rename 'Products.id','ProductID', 'column'

Select Product_Name, Count(distinct ProductID) as Amount_sales from Products
group by Product_Name
having count(distinct ProductID) > 100 

-- 18. Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.
Select year(Date_Sales) Sales_Year, SUM(Sales) as Total_sales from sales
group by year(Date_Sales)


-- 19. Write a query that uses COUNT to show the number of customers who placed orders in each region.
Select region, count(distinct customerid) as Orders from sales
group by region

-- 20. Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 100,000.
Select Department, SUM(salary) Total_Salary from employees
group by Department
having Sum(salary) > 100000

-- Hard-Level Tasks --
-- 21. Write a query that shows the average (AVG) sales for each product category, and then uses HAVING to filter categories with an average sales amount greater than 200.
Select category, avg(Sales) as Avg_Sale from Sales
group by category
having avg(Sales) > 200

-- 22. Write a query to calculate the total (SUM) sales for each employee, then filter the results using HAVING to include only employees with total sales over 5000.
Select Name, SUM(Sales) Total_Sales from Sales
group by Name
Having SUM(Sales) > 5000

-- 23. Write a query to find the total (SUM) and average (AVG) salary of employees grouped by department, and use HAVING to include only departments with an average salary greater than 6000.
Select Department, SUM(Salary) Total_Salary, AVG(Salary) as Avg_Salary from Employees
Group by Department
Having Avg(Salary) > 6000

-- 24. Write a query that finds the maximum (MAX) and minimum (MIN) order value for each customer, and then applies HAVING to exclude customers with an order value less than 50.
Select customer, MAX(ordervalue) as Max_order, MIN(ordervalue) Min_order from Sales
group by customer
Having Min(ordervalue) > 50

-- 25. Write a query that calculates the total sales (SUM) and counts distinct products sold in each Region, and then applies HAVING to filter regions with more than 10 products sold.
Select Region, SUM(sales) as Total_Sales, COUNT(distinct ProductID) as Distinct_product from Sales
group by region
Having COUNT(distinct ProductID) > 10

-- 26. Write a query to find the MIN and MAX order quantity per product, and then use GROUP BY to group the results by ProductCategory.
Select ProductCategory,
	MIN(OrderQuantity) as Min_quantity,
	MAX(OrderQuantity) as MAX_quantity
Group by ProductCategory

-- 27. Write a query to pivot the Sales table by Year and show the sum of SalesAmount for each Region.
Select Region, Sum(Sales) as SalesAmount from Sales
group by Region

-- 28. Write a query to unpivot the Sales table, converting Q1, Q2, Q3, and Q4 columns into rows showing total sales per quarter.


-- 29. Write a query to count the number of orders per product, filter those with more than 50 orders using HAVING, and group them by ProductCategory.


-- 30. Write a query to pivot the EmployeeSales table, displaying the total sales per employee for each quarter (Q1, Q2, Q3, Q4).


-- 1. Write a query to get Product name and quantity/unit.
select ProductName, QuantityPerUnit from Products

-- 2. Write a query to get current Product list (Product ID and name).
select ProductID,ProductName from Products

-- 3. Write a query to get discontinued Product list (Product ID and name).
select ProductID, ProductName from Products
	where Discontinued = 1

-- 4. Write a query to get most expense and least expensive Product list (name and unit price).
select ProductName, UnitPrice from Products
order by UnitPrice desc

-- 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.
select ProductID,		
	   ProductName, 
       UnitPrice 
from Products
where UnitPrice < 20 AND Discontinued = 0

-- 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.
select ProductID,		
	   ProductName, 
       UnitPrice 
from Products
where UnitPrice BETWEEN 15 AND 25

-- 7. Write a query to get Product list (name, unit price) of above average price.
select ProductName, 
	   UnitPrice
from Products
where UnitPrice > (select AVG(UnitPrice) from Products)

-- 8. Write a query to get Product list (name, unit price) of ten most expensive products.
select top 10 ProductName, 
	   UnitPrice
from Products
order by UnitPrice desc

-- 9. Write a query to count current and discontinued products.
select COUNT(*) from Products
	group by Discontinued

-- 10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order.
select ProductName,
       UnitsOnOrder,
	   UnitsInStock 
from Products
where UnitsInStock < UnitsOnOrder 
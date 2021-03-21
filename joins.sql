--   Task1 
-- 1. Create�a�report�showing�the�first�and�last�name�of�all�sales�representatives�who�are�from� Seattle�or�Redmond
select distinct e.FirstName, e.LastName, e.City
from Employees e
    inner join Orders o
    on e.EmployeeID = o.EmployeeID
where e.City = 'Seattle' or e.City = 'Redmond'


--2. Create�a�report�that�shows�the�company�name,�contact�title,�city�and�country�of�all� customers�in�Mexico�or�in�any�city�in�Spain�except�Madrid.�
select c.CompanyName, c.ContactTitle, c.City, c.Country
from Customers c
    inner join Orders o
    on c.CustomerID = o.CustomerID
where o.ShipCountry in ('Mexico', 'Spain') and o.ShipCity not like 'Madrid'




-- Task 2
-- 1. Create�a�report�showing�the�information about employees and orders, whenever they had orders or not.
select e.FirstName, e.LastName, o.OrderID
from Employees e
    full outer join Orders o
    on e.EmployeeID = o.EmployeeID
order by e.LastName


-- 2. Create�a�report�that�shows�all �information about suppliiers and products.
select p.ProductName, s.CompanyName
from Products p
    full outer join Suppliers s
    on s.SupplierID = p.SupplierID


-- Task 3
-- 1. Show first and last names of the employees as well as the count of orders each of them have received during the year 1997.
select e.FirstName, e.LastName, COUNT(o.OrderID) as "Qty of Orders"
from Employees e
    join Orders o
    on e.EmployeeID = o.EmployeeID
where o.OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
group by e.LastName, e.FirstName

-- 2. Show first and last names of the employees as well as the count of their orders shipped after required date during the year 1997.
select e.FirstName, e.LastName, COUNT(o.OrderID) as "Qty of Orders"
from Employees e
    join Orders o
    on e.EmployeeID = o.EmployeeID
where o.OrderDate BETWEEN '1997-01-01' AND '1997-12-31' and o.ShippedDate  > o.RequiredDate
group by e.LastName, e.FirstName


--Task 4
-- 1. Show the list of french customers� names who used to order non-french products.
select c.ContactName
from Customers c
    join Orders o on c.CustomerID = o.CustomerID and c.Country = 'France'
    join [Order Details] od on o.OrderID = od.OrderID
    join Products p on p.ProductID = od.ProductID
    join Suppliers s on s.SupplierID = p.SupplierID and s.Country != 'France'

-- 2. Show the list of suppliers, products and its category
select s.ContactName, p.ProductName, c.CategoryName
from Suppliers s
    join Products p on s.SupplierID = p.SupplierID
    join Categories c on c.CategoryID = p.CategoryID


--Task 5 
-- 1. Show the list of french customers� names who are working in the same cities.
select A.ContactName, B.ContactName, A.City
from Customers A, Customers B
where A.CustomerID <> B.CustomerID
    and A.Country = 'France'
    and A.City = B.City


-- 2.Show the list of german suppliers� names who are not working in the same cities.
select A.ContactName, B.ContactName, A.City, B.City
from Suppliers A, Suppliers B
where A.SupplierID <> B.SupplierID
    and A.Country = 'Germany' and B.Country = 'Germany'
    and A.City <> B.City


-- Task 6
-- 1. Show the list of employee (firstname, lastname) and his manager.
select A.FirstName+' '+ A.LastName as "Employee", B.FirstName+' '+B.LastName as "Manager"
from Employees A, Employees B
where A.ReportsTo = B.EmployeeID

--Task 7 
-- 1.Show the count of orders made by each customer from France.
select c.ContactName, COUNT(o.CustomerID) as "Qty of Orders"
from Customers c
    join Orders o on c.CustomerID = o.CustomerID
where c.Country = 'France'
group by c.ContactName

-- 2. Show the list of french customers� names who have made more than one order.
select c.ContactName
from Customers c
    join Orders o on c.CustomerID = o.CustomerID
where c.Country = 'France'
group by c.ContactName
having COUNT(o.CustomerID) > 1


-- Task 8 
-- 1. Show the list of customers� names who used to order the �Tofu� product.
select c.ContactName
from Customers c
    join Orders o on c.CustomerID = o.CustomerID
    join [Order Details] od on o.OrderID = od.OrderID
    join Products p on p.ProductID = od.ProductID
where p.ProductName = 'Tofu'

-- 2. Show the list of french customers� names who used to order non-french products.
select c.ContactName, p.ProductName
from Customers c
    join Orders o on c.CustomerID = o.CustomerID and c.Country = 'France'
    join [Order Details] od on o.OrderID = od.OrderID
    join Products p on p.ProductID = od.ProductID
    join Suppliers s on s.SupplierID = p.SupplierID and s.Country != 'France'

--3. Show the list of french customers� names who used to order french products.
select c.ContactName, p.ProductName
from Customers c
    join Orders o on c.CustomerID = o.CustomerID and c.Country = 'France'
    join [Order Details] od on o.OrderID = od.OrderID
    join Products p on p.ProductID = od.ProductID
    join Suppliers s on s.SupplierID = p.SupplierID and s.Country = 'France' 


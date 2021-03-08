-- 1. Calculate the greatest, the smallest and the average age among the employees from London.
select MAX(DATEDIFF(year,BirthDate,GETDATE())) as GreatestAge,
	   MIN(DATEDIFF(year,BirthDate,GETDATE())) as MinAge,
	   AVG(DATEDIFF(year,BirthDate,GETDATE())) as AverageAge
from Employees
	where City = 'London'

-- 2. Calculate the greatest, the smallest and the average age of the employees for each city.
select MAX(DATEDIFF(year,BirthDate,GETDATE())) as GreatestAge,
	   MIN(DATEDIFF(year,BirthDate,GETDATE())) as MinAge,
	   AVG(DATEDIFF(year,BirthDate,GETDATE())) as AverageAge
from Employees

-- 3. Show the list of cities in which the average age of employees is greater than 60 (the average age is also to be shown)
select City, AVG(DATEDIFF(year,BirthDate,GETDATE())) as AverageAge 
from Employees
group by City
having AVG(DATEDIFF(year,BirthDate,GETDATE())) > 60

--4. Show the first and last name(s) of the eldest employee(s). Use a subquery.
select FirstName,
	   LastName,
	   DATEDIFF(year,BirthDate,GETDATE()) as Age
from Employees
order by DATEDIFF(year,BirthDate,GETDATE()) desc

-- 5. Show first, last names and ages of 3 eldest employees.
select top 3 FirstName,
			 LastName,
			 DATEDIFF(year,BirthDate,GETDATE()) as Age 
from Employees
order by DATEDIFF(year,BirthDate,GETDATE()) desc


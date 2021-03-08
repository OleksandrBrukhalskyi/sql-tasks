-- 1. Show info about employee with ID 8.
select * from Employees
	where EmployeeID = 8 

-- 2. Show the list of first and last names of the employees from London
select FirstName, LastName from Employees
	where City = 'London'

-- 3. Show the list of first and last names of the employees whose first name begins with letter A.
select FirstName, LastName from Employees
	where FirstName LIKE 'A%'

-- 4. Show the list of first, last names and ages of the employees whose age is greater than 55. Should be sorted by last name.
select FirstName, LastName from Employees
	where DATEDIFF(year,BirthDate,GETDATE()) > 55
	order by LastName

-- 5. Calculate the count of employees from London.
select COUNT(*) as QtyInLondon from Employees
	where City = 'London'
	

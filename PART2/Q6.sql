USE BNB_AIRPORT;

SELECT Person.Name
FROM Person
INNER JOIN Employee ON Person.PersonID=Employee.PersonID
WHERE Salary = (
	SELECT MAX(Salary)
	FROM Employee
	);


USE BNB_AIRPORT;

SELECT ServiceRecord.RecordID, ServiceRecord.MaintenanceDate, ServiceRecord.HoursSpent, ServiceRecord.WorkType, Person.Name
FROM ServiceRecord
INNER JOIN Employee ON ServiceRecord.EmployeeID=Employee.EmployeeID
INNER JOIN Person ON Employee.PersonID=Person.PersonID
WHERE ServiceRecord.PlaneRegistrationNumber='N123';
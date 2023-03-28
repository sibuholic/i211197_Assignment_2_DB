USE BNB_AIRPORT;

SELECT Plane.RegistrationNumber
FROM Plane
INNER JOIN PlaneType ON Plane.TypeID=PlaneType.TypeID
WHERE PlaneType.ModelNumber='Airbus A380';

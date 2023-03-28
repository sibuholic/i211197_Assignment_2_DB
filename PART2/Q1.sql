USE BNB_AIRPORT;

SELECT Plane.RegistrationNumber
FROM Plane 
INNER JOIN Hangar ON Plane.HangarID = Hangar.HangarID 
WHERE Hangar.Location = 'Pakistan';
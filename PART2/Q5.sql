USE BNB_AIRPORT;

SELECT Person.Address
FROM Person
INNER JOIN Pilot ON Person.PersonID=Pilot.PersonID
WHERE Pilot.LicenseNumber='P2345678';

USE BNB_AIRPORT;

SELECT Person.Name
FROM Person
INNER JOIN Pilot ON Person.PersonID=Pilot.PersonID
INNER JOIN HasAuthorization ON Pilot.PilotID=HasAuthorization.PilotID
INNER JOIN PlaneType ON HasAuthorization.TypeID=PlaneType.TypeID
WHERE ModelNumber='Airbus A380';
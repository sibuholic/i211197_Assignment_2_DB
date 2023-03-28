USE BNB_AIRPORT;


SELECT DISTINCT Person.Name AS PilotName
FROM Person 
JOIN Pilot ON Person.PersonID = Pilot.PersonID
JOIN HasAuthorization ON Pilot.PilotID = HasAuthorization.PilotID
JOIN PlaneType ON HasAuthorization.TypeID = PlaneType.TypeID
WHERE PlaneType.TypeID = 1;
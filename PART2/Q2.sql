USE BNB_AIRPORT;

SELECT Plane.RegistrationNumber
FROM Plane
WHERE HangarID IN (
	SELECT HangarID
	FROM Hangar
	WHERE Location='Pakistan'
	);
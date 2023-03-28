USE BNB_AIRPORT;

SELECT Location
FROM Hangar
WHERE HangarID = ( 
	SELECT DISTINCT HangarID
	FROM Plane
	WHERE TypeID= (
		SELECT TypeID
		FROM PlaneType
		WHERE ModelNumber='Airbus A380'
		)
	);
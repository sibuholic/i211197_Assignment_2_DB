USE BNB_AIRPORT;

SELECT RegistrationNumber
FROM Plane
WHERE RegistrationNumber NOT IN (
  SELECT DISTINCT PlaneRegistrationNumber
  FROM ServiceRecord
);
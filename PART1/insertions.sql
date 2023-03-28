USE BNB_AIRPORT;


		-- tABLES creation

CREATE TABLE Hangar (
  HangarID INT PRIMARY KEY,
  Number VARCHAR(20),
  Capacity INT,
  Location VARCHAR(20)
);

CREATE TABLE PlaneType (
  TypeID INT PRIMARY KEY,
  ModelNumber VARCHAR(20),
  Capacity INT,
  Weight FLOAT
);

CREATE TABLE Plane (
  RegistrationNumber VARCHAR(10) PRIMARY KEY,

  HangarID INT REFERENCES Hangar(HangarID),
  TypeID INT REFERENCES PlaneType(TypeID)
);

CREATE TABLE Owner (
  OwnerID INT PRIMARY KEY,
  Name VARCHAR(30),
  Address VARCHAR(70),
  TelephoneNumber VARCHAR(20)
);

CREATE TABLE Corporation (
  CorporationID INT PRIMARY KEY,
  Name VARCHAR(30),
  Address VARCHAR(70),
  TelephoneNumber VARCHAR(20)
);

CREATE TABLE Person (
  PersonID INT PRIMARY KEY,
  SSN VARCHAR(20),
  Name VARCHAR(30),
  Address VARCHAR(70),
  TelephoneNumber VARCHAR(20)
);

CREATE TABLE Pilot (
  PilotID INT PRIMARY KEY,
  LicenseNumber VARCHAR(20),
  Restrictions VARCHAR(40),

  PersonID INT REFERENCES Person(PersonID)
);

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  Salary FLOAT,
  Shift VARCHAR(10),

  PersonID INT REFERENCES Person(PersonID)
);

CREATE TABLE ServiceRecord (
  RecordID INT PRIMARY KEY,
  MaintenanceDate DATE,
  HoursSpent INT,
  WorkType VARCHAR(50),

  PlaneRegistrationNumber VARCHAR(10) REFERENCES Plane(RegistrationNumber),
  EmployeeID INT REFERENCES Employee(EmployeeID)
);

CREATE TABLE HasAuthorization (
  AuthorizationID INT PRIMARY KEY,

  PilotID INT REFERENCES Pilot(PilotID),
  TypeID INT REFERENCES PlaneType(TypeID)
);

CREATE TABLE MaintenanceAuthorization (
  MaintenanceAuthorizationID INT PRIMARY KEY,

  EmployeeID INT REFERENCES Employee(EmployeeID),
  TypeID INT REFERENCES PlaneType(TypeID)
);



				-- Data insertion

INSERT INTO Hangar(HangarID, Number,Capacity, Location)
VALUES (1, 'Hanger 1', 10, 'Pakistan'), (2, 'Hanger 2', 15, 'Los Angeles'), (3, 'Hanger 3', 20, 'Pakistan'), (4, 'Hanger 4', 19, 'New York');

INSERT INTO PlaneType(TypeID, ModelNumber, Capacity, Weight)
VALUES (1, 'Boeing 747', 416, 178800), (2, 'Airbus A380', 853, 560000), (3, 'Boeing 787', 330, 254000);

INSERT INTO Plane(RegistrationNumber, TypeID, HangarID)
VALUES ('N123', 1, 1), ('N124', 2, 2), ('N125', 3, 3), ('N126', 2, 2);

INSERT INTO Owner(OwnerID, Name, Address, TelephoneNumber)
VALUES (1, 'John Smith', '123 Main St., New York, NY', 555-1234), (2, 'Mary Johnson', '456 Elm St., Los Angeles, CA', 555-5678), (3, 'Robert Lee', '789 Oak St., Chicago, IL', 555-9012);

INSERT INTO Corporation(CorporationID, Name, Address, TelephoneNumber)
VALUES (1, 'ABC Corporation', '123 Main St., New York, NY', 555-1234), (2, 'XYZ Corporation', '456 Elm St., Los Angeles, CA', 555-5678), (3, 'DEF Corporation', '789 Oak St., Chicago, IL', 555-9012);

INSERT INTO Person(PersonID, SSN, Name, Address, TelephoneNumber)
VALUES (1, 123-45-6789, 'John Smith', '123 Main St., New York, NY', 555-1234), (2, 234-56-7890, 'Mary Johnson', '456 Elm St., Los Angeles, CA', 555-5678), (3, 345-67-8901, 'Robert Lee', '789 Oak St., Chicago, IL', 555-9012);

INSERT INTO Pilot(PilotID,PersonID, LicenseNumber, Restrictions)
VALUES (1, 2, 'P1234567', 'None'), (2, 3, 'P2345678', 'Glasses'), (3, 1, 'P3456789', 'Night flying only');

INSERT INTO Employee(EmployeeID, PersonID, Salary, Shift)
VALUES (1, 1, 50000, 'Day'), (2, 2, 60000, 'Night'), (3, 3, 55000, 'Evening');

INSERT INTO ServiceRecord(RecordID, PlaneRegistrationNumber, EmployeeID, MaintenanceDate, HoursSpent, WorkType)
VALUES (1, 'N123', 1, '2022-01-01', 10, 'Oil change'), (2, 'N124', 2, '2022-02-15', 20, 'Tire replacement'), (3, 'N125', 3, '2022-03-25', 15, 'Brake inspection');

INSERT INTO HasAuthorization(AuthorizationID, PilotID, TypeID)
VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3);

INSERT INTO MaintenanceAuthorization(MaintenanceAuthorizationID, EmployeeID, TypeID)
VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3);


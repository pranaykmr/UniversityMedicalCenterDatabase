USE master
GO
IF DB_ID('UniversityMedicalCenter') IS NOT NULL
  DROP DATABASE UniversityMedicalCenter;
GO
CREATE DATABASE UniversityMedicalCenter;
GO
USE UniversityMedicalCenter;
GO
CREATE TABLE PatientInfo (
  Id int NOT NULL,
  LastName nvarchar(50) NOT NULL,
  FirstName nvarchar(50) NOT NULL,
  HouseNo nvarchar(100) NULL,
  Street nvarchar(100) NULL,
  PostalCode nvarchar(10) NULL,
  City nvarchar(50) NULL,
  PhoneNumber nvarchar(20) NULL,
  LocationId int NULL,
  PrimaryCarePhysician int NULL,
  DateofBirth datetime NOT NULL,
  InsuranceNumber nvarchar(50) NOT NULL,
  InsuranceGroupId nvarchar(50) NOT NULL,
  CONSTRAINT PK_PatientInfo PRIMARY KEY (Id)
);

INSERT INTO PatientInfo (Id
, LastName
, FirstName
, HouseNo
, Street
, PostalCode
, City
, PhoneNumber
, LocationId
, PrimaryCarePhysician
, DateofBirth
, InsuranceNumber
, InsuranceGroupId)
  VALUES (1, 'Verma', 'Pranay Kumar', '932', 'Lancaster Ave', '13210', 'Syracuse', '2028487271', '101', '111', '07-20-1993', '1122343433', 'XYZ')
  , (2, 'Sahu', 'Prateek', '1436', 'East Genesee Street', '13210', 'Syracuse', '73727127847', '111', '211', '08-12-1991', '112232554', 'SU')
  , (3, 'Pattnaik', 'Hemanta', '932', 'Lancaster Ave', '13210', 'Syracuse', '867363133', '300', '124', '11-30-1989', '221133445', 'URH')
  , (4, 'Pattathil', 'Rohith', '106', 'Walnut Place', '13210', 'Syracuse', '8883336622', '234', '542', '03-12-1996', '1322547433', 'PKSDA')
  , (5, 'Desai', 'Malav', '800', 'Euclid Ave', '13210', 'Syracuse', '85726184843', '871', '276', '08-31-1973', '99877654432', 'POIUY')

CREATE TABLE PatientRecords (
  Id int IDENTITY (1, 1) NOT NULL,
  PatientId int NOT NULL,
  PatientWeight int NOT NULL,
  PatientHeight int NOT NULL,
  BloodPressure nvarchar(50) NOT NULL,
  Temperature nvarchar(100) NULL,
  CheckInTime datetime NOT NULL,
  CheckOutTime datetime NOT NULL,
  LocationId int NULL,
  Diagnosis nvarchar(max) NOT NULL,
  ProcedureId int NULL,
  EmployeeId int NOT NULL,
  PhysicianId int NOT NULL,
  MedicationId int NULL,
  ImagingTestId int NULL,
  LabTestId int NULL,
  CONSTRAINT PK_PatientRecords PRIMARY KEY (Id)
);

INSERT INTO PatientRecords (PatientId
, PatientWeight
, PatientHeight
, BloodPressure
, Temperature
, CheckInTime
, CheckOutTime
, LocationId
, Diagnosis
, ProcedureId
, EmployeeId
, PhysicianId
, MedicationId
, ImagingTestId
, LabTestId)
  VALUES (1, 177, 185, 110, 98, '03-20-2021 11:00', '03-20-2021 12:37', 2, 'COVID-19', 3, 21, 2, 4, NULL, 1),
  (1, 169, 185, 120, 97, '03-01-2021 10:00', '03-01-2021 10:30', 2, 'GeneralCheckup', NULL, 23, 2, NULL, NULL, NULL),
  (2, 149, 151, 100, 98, '03-02-2021 10:00', '03-02-2021 10:30', 3, 'Broken Wrist', 5, 43, 3, 5, 1, 2),
  (5, 249, 191, 103, 98, '05-02-2021 10:45', '05-02-2021 11:30', 1, 'RhinoVirus', 2, 45, 1, 4, 2, 3)

CREATE TABLE PatientPreScreen (
  Id int IDENTITY (1, 1) NOT NULL,
  PatientRecordId int NOT NULL,
  Temperature int NOT NULL,
  AnySympotoms bit NOT NULL,
  Vaccinated bit NOT NULL,
  CONSTRAINT PK_PatientPreScreen PRIMARY KEY (Id)
);

INSERT INTO PatientPreScreen (PatientRecordId
, Temperature
, AnySympotoms
, Vaccinated)
  VALUES (1, 98, 1, 0), (1, 97, 1, 0), (2, 98, 1, 0), (5, 98, 1, 1)

CREATE TABLE AdmittedPatients (
  Id int IDENTITY (1, 1) NOT NULL,
  PatientId int NOT NULL,
  FacilityId int NOT NULL,
  AdmitDate datetime NOT NULL,
  CONSTRAINT PK_AdmittedPatients PRIMARY KEY (Id)
);

INSERT INTO AdmittedPatients (PatientId,
FacilityId,
AdmitDate)
  VALUES (1, 1, '01-01-2021'), (2, 3, '06-05-2021'), (3, 2, '03-04-2020')



CREATE TABLE ProcedureInfo (
  Id int NOT NULL,
  ProcedureName nvarchar(50) NOT NULL,
  ProcedureDuration int NOT NULL,
  Cost money NOT NULL,
  CONSTRAINT PK_ProcedureInfo PRIMARY KEY (Id)
);

INSERT INTO ProcedureInfo (Id
, ProcedureName
, ProcedureDuration
, Cost)
  VALUES (1, 'Bandage', 15, 20)
  , (2, 'Nazal Swab', 20, 125)
  , (3, 'Fracture', 150, 275)
  , (4, 'Stiches', 50, 200)
  , (5, 'Surgery', 240, 1175)

CREATE TABLE MedicationInfo (
  Id int NOT NULL,
  PrescriptionId int NOT NULL,
  MedicationName nvarchar(50) NOT NULL,
  Refills nvarchar(50) NOT NULL,
  DozesPerDay int NOT NULL,
  Notes nvarchar(max) NULL,
  CONSTRAINT PK_MedicationInfo PRIMARY KEY (Id)
);

INSERT INTO MedicationInfo (Id
, PrescriptionId
, MedicationName
, Refills
, DozesPerDay
, Notes)
  VALUES (1, 1, 'Azithral 500mg', 4, 3, NULL)
  , (2, 2, 'Norflox 400mg', 0, 2, 'Contact in case of any side effects')
  , (3, 3, 'Miralax', 4, 3, NULL)
  , (4, 4, 'Tylenol', 0, 6, 'Every 4 hours')
  , (5, 5, 'Ibuprofen', 10, 4, 'Every 6 hours')

CREATE TABLE PrescriptionInfo (
  Id int NOT NULL,
  PharmacyId int NOT NULL,
  Cost money NOT NULL,
  CurrentStatus nvarchar(255) NOT NULL,
  CONSTRAINT PK_PrescriptionInfo PRIMARY KEY (Id)
);

INSERT INTO PrescriptionInfo (Id,
PharmacyId,
Cost,
CurrentStatus)
  VALUES (1, 121, 149, 'Processing')
  , (2, 223, 243, 'Waiting Approval')
  , (3, 52, 764, 'Ready For Pickup')
  , (4, 121, 764, 'Ready For Pickup')
  , (5, 23, 764, 'Processed')

CREATE TABLE PhyscianInfo (
  Id int NOT NULL,
  EmpId int NOT NULL,
  LicenseNumber nvarchar(50) NOT NULL,
  LocationId int NULL,
  TakingNewPatients bit NOT NULL,
  Active bit NOT NULL,
  Retired bit NOT NULL,
  Position nvarchar(50) NOT NULL,
  CONSTRAINT PK_PhyscianInfo PRIMARY KEY (Id)
);

INSERT INTO PhyscianInfo (Id,
EmpId,
LicenseNumber,
LocationId,
TakingNewPatients,
Active,
Retired,
Position)
  VALUES (1, 100, '1UZ', 123, 1, 1, 0, 'Assistant Professor - Family Medicine'),
  (2, 101, '1ZZ', 143, 1, 1, 0, 'Associate Professor - Ortho'),
  (3, 111, '2EZ', 153, 1, 1, 0, 'Associate Professor - ENT'),
  (4, 151, '5TU', 153, 0, 1, 0, 'Assistant Professor - Radiology'),
  (5, 152, '5TW', 123, 0, 1, 0, 'Assistant Professor - Oncology')

CREATE TABLE PhyscianSchedule (
  Id int IDENTITY (1, 1) NOT NULL,
  PhyscianId int NOT NULL,
  PatientId int NOT NULL,
  ScheduleDetails int NOT NULL,
  NurseId int NOT NULL,
  CONSTRAINT PK_PhyscianSchedule PRIMARY KEY (Id)
);

INSERT INTO PhyscianSchedule (PhyscianId,
PatientId,
ScheduleDetails,
NurseId)
  VALUES (2, 1, 1, 3), (2, 1, 2, 3), (3, 2, 3, 5), (5, 5, 4, 5)

CREATE TABLE ScheduleDetails (
  Id int IDENTITY (1, 1) NOT NULL,
  StartTime datetime NOT NULL,
  Duration int NOT NULL,
  FacilityId int NOT NULL,
  RoomNumber nvarchar(255) NOT NULL,
  EquipmentNeeded nvarchar(255) NULL,
  CONSTRAINT PK_ScheduleDetails PRIMARY KEY (Id)
);

INSERT INTO ScheduleDetails (StartTime,
Duration,
FacilityId,
RoomNumber,
EquipmentNeeded)
  VALUES ('03-20-2021 11:00', 120, 2, '2A3', 'XRAY MACHINE'),
  ('03-01-2021 10:00', 30, 2, '3A5', NULL),
  ('03-02-2021 10:00', 20, 3, '4A5', NULL),
  ('05-02-2021 10:40', 45, 2, '3Q5', NULL)

CREATE TABLE LicenseInfo (
  LicenseNumber nvarchar(50) NOT NULL,
  IssuedBy nvarchar(50) NOT NULL,
  IssuedOn datetime NOT NULL,
  ValidTill datetime NOT NULL,
  CONSTRAINT PK_LicenseInfo PRIMARY KEY (LicenseNumber)
);
INSERT INTO LicenseInfo (LicenseNumber,
IssuedBy,
IssuedOn,
ValidTill)
  VALUES ('1UZ', 'SUNY Upstate', '04-20-2020', '04-20-2025'),
  ('1ZZ', 'Syracuse University', '03-20-2019', '03-20-2022'),
  ('5TU', 'SUNY Stony Brook', '09-15-2020', '09-14-2021'),
  ('2EZ', 'John Hopkins', '06-11-2020', '06-11-2022'),
  ('5TW', 'UPenn', '01-13-2017', '01-13-2027')

CREATE TABLE InsuranceInfo (
  InsuranceNumber nvarchar(50) NOT NULL,
  IssuedBy nvarchar(50) NOT NULL,
  IssuedOn datetime NOT NULL,
  ValidTill datetime NOT NULL,
  Copay money NOT NULL,
  CovergePercentage int NOT NULL,
  BaseCoverage money NOT NULL,
  CONSTRAINT PK_InsuranceInfo PRIMARY KEY (InsuranceNumber)
);

INSERT INTO InsuranceInfo (InsuranceNumber,
IssuedBy,
IssuedOn,
ValidTill,
Copay,
CovergePercentage,
BaseCoverage)
  VALUES (1122343433, 'Aetna', '07-20-2020', '07-20-2021', 25, 80, 150)
  , (1322547433, 'UHG', '06-20-2020', '06-20-2022', 10, 85, 1050)
  , (112232554, 'Ameri', '01-11-2020', '01-11-2030', 5, 60, 50)
  , (221133445, 'StateFarm', '03-13-2020', '03-13-2021', 0, 75, 80)
  , (99877654432, 'Melody', '04-11-2020', '04-11-2021', 2, 95, 90)

CREATE TABLE NurseInfo (
  Id int NOT NULL,
  EmpId int NOT NULL,
  LocationId int NULL,
  CONSTRAINT PK_NurseInfo PRIMARY KEY (Id)
);
INSERT INTO NurseInfo (Id,
EmpId,
LocationId)
  VALUES (1, 21, 2), (2, 23, 5), (3, 43, 6), (5, 45, 7)

CREATE TABLE EmployeeInfo (
  Id int NOT NULL,
  LastName nvarchar(50) NOT NULL,
  FirstName nvarchar(50) NOT NULL,
  Street nvarchar(100) NULL,
  PostalCode nvarchar(10) NULL,
  City nvarchar(50) NULL,
  PhoneNumber nvarchar(20) NULL,
  DateofBirth datetime NOT NULL,
  Department nvarchar(255) NOT NULL,
  CONSTRAINT PK_EmployeeInfo PRIMARY KEY (Id)
);
INSERT INTO EmployeeInfo (Id,
LastName,
FirstName,
Street,
PostalCode,
City,
PhoneNumber,
DateofBirth,
Department)
  VALUES (21, 'Doe', 'Jane', 'Euclid', '10001', 'New York', '1112223334', '01-01-1990', 'Nursing')
  , (23, 'Singh', 'Roop', 'Lancaster', '10003', 'Brooklyn', '1112223444', '02-11-1989', 'Nursing')
  , (43, 'Bahadur', 'Ram', 'Comstock', '13210', 'Syracuse', '2223335555', '11-12-1988', 'Nursing')
  , (45, 'Schine', 'Robert', 'Lexington', '13210', 'Syracuse', '8779990000', '12-11-1987', 'Nursing')
  , (100, 'Lee', 'Andrew', 'Pine', '10001', 'New York', '3334445555', '12-12-1986', 'Ortho')
  , (101, 'Ercanli', 'Ehat', 'Eerie', '13210', 'Syracuse', '5556664444', '07-07-1990', 'Family Medicine')
  , (111, 'Zaf', 'Reza', 'Euclid', '13210', 'Syracuse', '7775554444', '11-20-1992', 'Family Medicine')
  , (151, 'Shaw', 'Tom', 'Sumner', '10001', 'New York', '8886665555', '01-01-1990', 'ENT')
  , (152, 'Hoque', 'Endadul', 'Euclid', '10001', 'New York', '8887774444', '12-12-1988', 'Radiology')


CREATE TABLE EmployeeBenefits (
  EmpId int NOT NULL,
  Salary money NOT NULL,
  Benefits nvarchar(255) NOT NULL,
  Schedule nvarchar(255) NOT NULL,
  ContractType nvarchar(50) NOT NULL,
  ContractTerms nvarchar(255) NULL,
  CONSTRAINT PK_EmployeeBenefits PRIMARY KEY (EmpId)
);

INSERT INTO EmployeeBenefits (EmpId,
Salary,
Benefits,
Schedule,
ContractType,
ContractTerms)
  VALUES (21, 75000, 'Insurance + 10 Paid leaves', 'Mon - Friday 9-5', 'Full Time', NULL)
  , (23, 65000, 'Insurance + 5 Paid leaves', 'Mon - Friday 9-5', 'Full Time', NULL)
  , (43, 80000, 'Insurance', 'Mon - Friday 5-12', 'Full Time', NULL)
  , (45, 95000, 'Insurance + Child Support', 'Mon - Friday 5-12', 'Part Time', NULL)
  , (100, 175000, 'Insurance + 20 Paid leaves', 'Mon - Friday 9-5', 'Full Time', NULL)
  , (101, 145000, 'Insurance + 20 Paid leaves', 'Mon - Friday 9-5', 'Full Time', NULL)
  , (111, 190000, 'Insurance + 20 Paid leaves', 'Mon - Friday 10-8', 'Full Time', NULL)
  , (151, 210000, 'Insurance + 20 Paid leaves', 'Mon - Friday 11-9', 'Full Time', NULL)
  , (152, 220000, 'Insurance + 20 Paid leaves', 'Mon - Friday 7-8', 'Full Time', NULL)

CREATE TABLE FacilityInfo (
  Id int NOT NULL,
  FacilityName nvarchar(50) NOT NULL,
  Street nvarchar(100) NULL,
  PostalCode nvarchar(10) NULL,
  City nvarchar(50) NULL,
  PhoneNumber nvarchar(20) NULL,
  CONSTRAINT PK_FacilityInfo PRIMARY KEY (Id)
);

INSERT INTO FacilityInfo (Id,
FacilityName,
Street,
PostalCode,
City,
PhoneNumber)
  VALUES (1, 'Upstate', 'Irving', '13210', 'Syracuse', '1112221111'),
  (2, 'Crouse', 'Comstock', '13210', 'Syracuse', '3332222222'),
  (3, 'Stony Brook', 'NYC', '10001', 'New York', '7778882323')

CREATE TABLE FacilityDetails (
  Id int NOT NULL,
  FacilityId int NOT NULL,
  LocationHours nvarchar(255) NOT NULL,
  Departments nvarchar(255) NOT NULL,
  RoomsAvailable int NOT NULL,
  ICUBeds int NOT NULL,
  CCUBeds int NOT NULL,
  TraumaCenterAvailability int NOT NULL,
  VentilatorsAvailable int NOT NULL,
  OxygenCylindersAvailable int NOT NULL,
  CONSTRAINT PK_FacilityDetails PRIMARY KEY (Id)
);

INSERT INTO FacilityDetails (Id,
FacilityId,
LocationHours,
Departments,
RoomsAvailable,
ICUBeds,
CCUBeds,
TraumaCenterAvailability,
VentilatorsAvailable,
OxygenCylindersAvailable)
  VALUES (100, 1, 'All Day', 'Ortho, Radiology', 50, 100, 23, 12, 200, 121),
  (101, 2, '6am to 12am', 'Ortho, Radiology, Family Medicine', 150, 10, 13, 120, 20, 22),
  (102, 3, 'All Day', 'Radiology, Oncology', 20, 70, 73, 52, 30, 331)


CREATE TABLE PharmacyInfo (
  Id int NOT NULL,
  PharmacyName nvarchar(50) NOT NULL,
  LocationHours nvarchar(255) NOT NULL,
  RentalEquipment nvarchar(255) NOT NULL,
  Street nvarchar(100) NULL,
  PostalCode nvarchar(10) NULL,
  City nvarchar(50) NULL,
  PhoneNumber nvarchar(20) NULL
  CONSTRAINT PK_PharmacyInfo PRIMARY KEY (Id)
);

INSERT INTO PharmacyInfo (Id
, PharmacyName
, LocationHours
, RentalEquipment
, Street
, PostalCode
, City
, PhoneNumber)
  VALUES (121, 'CVS', '10 - 8', 'OxygenCylinder', 'South Crouse', '13210', 'Syracuse', '2223334343'),
  (223, 'Walgreens', '10 - 8', 'Oxygen Cylinder, Beds', 'East Genesee', '13210', 'Syracuse', '1888222333'),
  (52, 'WellNow', 'AllDay', 'Beds', 'Cherry', '13210', 'Syracuse', '9998887766'),
  (23, 'Wegmans', 'AllDay', 'None', 'James', '13452', 'Syracuse', '8887776565')

CREATE TABLE VisitorInfo (
  Id int IDENTITY (1, 1) NOT NULL,
  LastName nvarchar(50) NOT NULL,
  FirstName nvarchar(50) NOT NULL,
  Street nvarchar(100) NULL,
  PostalCode nvarchar(10) NULL,
  City nvarchar(50) NULL,
  PhoneNumber nvarchar(20) NULL,
  FacilityId int NULL,
  PatientId int NULL,
  CheckInTime datetime NOT NULL,
  CheckOutTime datetime NOT NULL,
  TemperatureAtCheckin int NOT NULL,
  CONSTRAINT PK_VisitorInfo PRIMARY KEY (Id)
);

INSERT INTO VisitorInfo (LastName,
FirstName,
Street,
PostalCode,
City,
PhoneNumber,
FacilityId,
PatientId,
CheckInTime,
CheckOutTime,
TemperatureAtCheckin)
  VALUES ('Sharma', 'Harshit', 'Lancaster', '13210', 'Syracuse', '2223331312', '2', '1', '03-20-2021 10:10', '03-20-2021 10:25', 98),
  ('Babbar', 'Paras', 'Euclid', '13210', 'Syracuse', '5553434241', '1', '2', '03-01-2021 13:10', '03-01-2021 13:35', 98),
  ('Veprala', 'Kiran', 'Westcott', '13210', 'Syracuse', '888775521', '1', '2', '03-11-2021 14:10', '03-11-2021 14:55', 99)

CREATE TABLE LabTestInfo (
  Id int IDENTITY (1, 1) NOT NULL,
  TestName nvarchar(255) NOT NULL,
  Cost money NOT NULL,
  PaymentMethod nvarchar(50) NULL,
  CONSTRAINT PK_LabTestInfo PRIMARY KEY (Id)
);

INSERT INTO LabTestInfo (TestName,
Cost,
PaymentMethod)
  VALUES ('COVID AntiBody', 123, 'Card-Visa'), ('BloodWork-All', 254, 'Cash'), ('NazalSwab', 374, 'Cash')

CREATE TABLE LabTestResults (
  Id int IDENTITY (1, 1) NOT NULL,
  TestId int NOT NULL,
  Results nvarchar(255) NOT NULL,
  ReportToState bit NOT NULL,
  ReportToCounty nvarchar(50) NULL,
  CONSTRAINT PK_LabTestResults PRIMARY KEY (Id)
);

INSERT INTO LabTestResults (TestId,
Results,
ReportToState,
ReportToCounty)
  VALUES (1, 'Negative', 0, NULL), (2, 'Normal', 0, NULL), (3, 'Positive Rhino Virus', 0, NULL)

CREATE TABLE ImagingTestInfo (
  Id int IDENTITY (1, 1) NOT NULL,
  TestName nvarchar(255) NOT NULL,
  Cost money NOT NULL,
  PaymentMethod nvarchar(50) NULL,
  CONSTRAINT PK_ImagingTestInfo PRIMARY KEY (Id)
);

INSERT INTO ImagingTestInfo (TestName,
Cost,
PaymentMethod)
  VALUES ('Arm Xray', 555, 'Card - Amex'), ('Chest Xray', 1024, 'Card - MasterCard')

CREATE TABLE ImagingTestResults (
  Id int IDENTITY (1, 1) NOT NULL,
  TestId int NOT NULL,
  Results nvarchar(255) NOT NULL
  CONSTRAINT PK_ImagingTestResults PRIMARY KEY (Id)
);

INSERT INTO ImagingTestResults (TestId,
Results)
  VALUES (1, 'BrokenArm'), (2, 'Congestion')


-- GO
ALTER TABLE PatientRecords
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_PatientInfo FOREIGN KEY (PatientId) REFERENCES PatientInfo (Id)

ALTER TABLE PatientRecords
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_ProcedureInfo FOREIGN KEY (ProcedureId) REFERENCES ProcedureInfo (Id)

ALTER TABLE PatientRecords
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_MedicationInfo FOREIGN KEY (MedicationId) REFERENCES MedicationInfo (Id)

ALTER TABLE PatientRecords
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_EmployeeInfo FOREIGN KEY (EmployeeId) REFERENCES EmployeeInfo (Id)

ALTER TABLE PatientRecords
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_PhyscianInfo FOREIGN KEY (PhysicianId) REFERENCES PhyscianInfo (Id)

ALTER TABLE PatientRecords
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_LabTestInfo FOREIGN KEY (LabTestId) REFERENCES LabTestInfo (Id)

ALTER TABLE PatientRecords
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_ImagingTestInfo FOREIGN KEY (ImagingTestId) REFERENCES ImagingTestInfo (Id)

ALTER TABLE PatientPreScreen
WITH NOCHECK ADD CONSTRAINT FK_PatientRecords_PatientPreScreen FOREIGN KEY (PatientRecordId) REFERENCES PatientRecords (Id)

ALTER TABLE AdmittedPatients
WITH NOCHECK ADD CONSTRAINT FK_PatientInfo_AdmittedPatients FOREIGN KEY (PatientId) REFERENCES PatientInfo (Id)

ALTER TABLE AdmittedPatients
WITH NOCHECK ADD CONSTRAINT FK_FacilityInfo_AdmittedPatients FOREIGN KEY (FacilityId) REFERENCES FacilityInfo (Id)

ALTER TABLE MedicationInfo
WITH NOCHECK ADD CONSTRAINT FK_MedicationInfo_PrescriptionInfo FOREIGN KEY (PrescriptionId) REFERENCES PrescriptionInfo (Id)

ALTER TABLE PhyscianInfo
WITH NOCHECK ADD CONSTRAINT FK_PhyscianInfo_LicenseInfo FOREIGN KEY (LicenseNumber) REFERENCES LicenseInfo (LicenseNumber)

ALTER TABLE PatientInfo
WITH NOCHECK ADD CONSTRAINT FK_PatientInfo_InsuranceInfo FOREIGN KEY (InsuranceNumber) REFERENCES InsuranceInfo (InsuranceNumber)

ALTER TABLE PhyscianInfo
WITH NOCHECK ADD CONSTRAINT FK_PhyscianInfo_EmployeeInfo FOREIGN KEY (EmpId) REFERENCES EmployeeInfo (Id)

ALTER TABLE NurseInfo
WITH NOCHECK ADD CONSTRAINT FK_NurseInfo_EmployeeInfo FOREIGN KEY (EmpId) REFERENCES NurseInfo (Id)

ALTER TABLE EmployeeBenefits
WITH NOCHECK ADD CONSTRAINT FK_EmployeeBenefits_EmployeeInfo FOREIGN KEY (EmpId) REFERENCES EmployeeInfo (Id)

ALTER TABLE FacilityDetails
WITH NOCHECK ADD CONSTRAINT FK_FacilityDetails_FacilityInfo FOREIGN KEY (FacilityId) REFERENCES FacilityInfo (Id)

ALTER TABLE PrescriptionInfo
WITH NOCHECK ADD CONSTRAINT FK_PrescriptionInfo_PharmacyInfo FOREIGN KEY (PharmacyId) REFERENCES PharmacyInfo (Id)

ALTER TABLE VisitorInfo
WITH NOCHECK ADD CONSTRAINT FK_VisitorInfo_PatientInfo FOREIGN KEY (PatientId) REFERENCES PatientInfo (Id)

ALTER TABLE VisitorInfo
WITH NOCHECK ADD CONSTRAINT FK_VisitorInfo_FacilityInfo FOREIGN KEY (FacilityId) REFERENCES FacilityInfo (Id)

ALTER TABLE PhyscianSchedule
WITH NOCHECK ADD CONSTRAINT FK_PhyscianSchedule_PhyscianInfo FOREIGN KEY (PhyscianId) REFERENCES PhyscianInfo (Id)

ALTER TABLE PhyscianSchedule
WITH NOCHECK ADD CONSTRAINT FK_PhyscianSchedule_PatientInfo FOREIGN KEY (PatientId) REFERENCES PatientInfo (Id)

ALTER TABLE PhyscianSchedule
WITH NOCHECK ADD CONSTRAINT FK_PhyscianSchedule_ScheduleDetails FOREIGN KEY (ScheduleDetails) REFERENCES ScheduleDetails (Id)

ALTER TABLE PhyscianSchedule
WITH NOCHECK ADD CONSTRAINT FK_PhyscianSchedule_NurseInfo FOREIGN KEY (NurseId) REFERENCES NurseInfo (Id)

ALTER TABLE ScheduleDetails
WITH NOCHECK ADD CONSTRAINT FK_PhyscianSchedule_FacilityInfo FOREIGN KEY (FacilityId) REFERENCES FacilityInfo (Id)

ALTER TABLE LabTestResults
WITH NOCHECK ADD CONSTRAINT FK_LabTestResults_LabTestInfo FOREIGN KEY (TestId) REFERENCES LabTestInfo (Id)

ALTER TABLE ImagingTestResults
WITH NOCHECK ADD CONSTRAINT FK_ImagingTestResults_ImagingTestInfo FOREIGN KEY (TestId) REFERENCES ImagingTestInfo (Id)


GO
CREATE FUNCTION dbo.fnGetPRCost (@PatientRecordId int)
RETURNS money
BEGIN
  RETURN (SELECT
    ISNULL(pi.Cost, 0) + ISNULL(pri.Cost, 0) + ISNULL(lti.Cost, 0) + ISNULL(iti.Cost, 0)
  FROM PatientRecords pr
  LEFT JOIN ProcedureInfo pi
    ON pr.ProcedureId = pi.Id
  LEFT JOIN MedicationInfo mi
    ON pr.MedicationId = mi.Id
  JOIN PrescriptionInfo pri
    ON mi.PrescriptionId = pri.Id
  LEFT JOIN LabTestInfo lti
    ON pr.LabTestId = lti.Id
  LEFT JOIN ImagingTestInfo iti
    ON pr.ImagingTestId = iti.Id
  WHERE pr.Id = @PatientRecordId);
END;
GO
CREATE FUNCTION dbo.fnGetUpdatedCost (@PatientRecordId int
, @Cost money)
RETURNS money
BEGIN
  RETURN (SELECT
    CASE
      WHEN @Cost < BaseCoverage THEN ini.Copay
      ELSE (ini.Copay + (((100 - ini.CovergePercentage) * @Cost) / 100))
    END
  FROM PatientRecords pr
  JOIN PatientInfo pi
    ON pr.PatientId = pi.Id
  JOIN InsuranceInfo ini
    ON pi.InsuranceNumber = ini.InsuranceNumber
  WHERE pr.Id = @PatientRecordId);
END;
GO
CREATE VIEW InvoiceDetails
AS
SELECT
  pr.*
  --, pi.*
  ,
  ISNULL(dbo.fnGetPRCost(pr.Id), 0) AS Cost,
  dbo.fnGetUpdatedCost(pr.Id, ISNULL(dbo.fnGetPRCost(pr.Id), 0)) AS OutOfPocket
FROM PatientRecords pr
JOIN PatientInfo pi
  ON pr.PatientId = pi.Id
GO
CREATE VIEW PharmacyPrescriptions
AS
SELECT
  phari.*
FROM PrescriptionInfo presi
JOIN PharmacyInfo phari
  ON presi.PharmacyId = phari.Id
GO
GO
CREATE VIEW PatientVisitDetails
AS
SELECT
  PatientId,
  PatientWeight,
  PatientHeight,
  BloodPressure,
  Temperature,
  CheckInTime,
  CheckOutTime,
  pr.LocationId,
  Diagnosis,
  ProcedureId,
  EmployeeId,
  PhysicianId,
  MedicationId,
  ImagingTestId,
  LabTestId,
  pi.LastName AS PatientLastName,
  pi.FirstName AS PatientFirstName,
  pi.Street AS PatientStreet,
  pi.PostalCode AS PatientPostalCode,
  pi.City AS PatientCity,
  pi.PhoneNumber AS PatientPh,
  PrimaryCarePhysician,
  pi.DateofBirth AS PatientDOB,
  InsuranceNumber,
  ProcedureName,
  ProcedureDuration,
  proi.Cost AS ProcedureCost,
  psyi.EmpId AS PhyscianEmpId,
  LicenseNumber,
  MedicationName,
  Refills,
  DozesPerDay,
  Notes,
  lbti.TestName AS LabTestName,
  lbti.Cost AS LabCost,
  iti.TestName,
  iti.Cost
FROM PatientRecords pr
JOIN PatientInfo pi
  ON pr.PatientId = pi.Id
LEFT JOIN ProcedureInfo proi
  ON proi.Id = pr.ProcedureId
JOIN EmployeeInfo empi
  ON pr.EmployeeId = empi.Id
JOIN PhyscianInfo psyi
  ON psyi.Id = pr.PhysicianId
LEFT JOIN MedicationInfo medi
  ON pr.MedicationId = medi.Id
LEFT JOIN ImagingTestInfo iti
  ON pr.ImagingTestId = iti.Id
LEFT JOIN ImagingTestResults itr
  ON iti.Id = itr.TestId
LEFT JOIN LabTestInfo lbti
  ON pr.LabTestId = lbti.Id
LEFT JOIN LabTestResults lbtr
  ON lbtr.TestId = lbti.Id
GO
CREATE VIEW PhysicianScheduleWithDetails
AS
SELECT
  StartTime,
  Duration,
  FacilityId,
  RoomNumber,
  EquipmentNeeded,
  LicenseNumber,
  TakingNewPatients,
  Active,
  Retired,
  Position,
  ei.LastName AS PhysiscianLastName,
  ei.FirstName AS PhysiscianFirstName,
  ei.Department AS PhysiscianDept,
  ei.PhoneNumber AS PhysiscianPh,
  eni.LastName AS NurseLastName,
  eni.FirstName AS NurseFirstName,
  eni.Department AS NurseDept,
  eni.PhoneNumber AS NursePh,
  pni.LastName AS PatientLastName,
  pni.FirstName AS PatientFirstName,
  pni.Street AS PatientStreet,
  pni.PostalCode AS PatientPostalCode,
  pni.City AS PatientCity,
  pni.PhoneNumber AS PatientPh,
  PrimaryCarePhysician,
  pni.DateofBirth AS PatientDOB,
  InsuranceNumber
FROM PhyscianSchedule ps
JOIN PhyscianInfo pi
  ON ps.PhyscianId = pi.Id
JOIN EmployeeInfo ei
  ON pi.EmpId = ei.Id
JOIN ScheduleDetails sd
  ON ps.ScheduleDetails = sd.Id
JOIN FacilityInfo fi
  ON sd.FacilityId = fi.Id
JOIN NurseInfo ni
  ON ps.NurseId = ni.Id
JOIN EmployeeInfo eni
  ON ni.EmpId = eni.Id
JOIN PatientInfo pni
  ON ps.PatientId = pni.Id
GO

CREATE PROC spUpdateRooms @FacilityId int
AS
  DECLARE @NoOfRooms int
  SELECT
    @NoOfRooms = RoomsAvailable
  FROM FacilityDetails
  WHERE FacilityId = @FacilityId;
  IF @NoOfRooms > 0
  BEGIN
    UPDATE FacilityDetails
    SET RoomsAvailable = (@NoOfRooms - 1)
    WHERE FacilityId = @FacilityId;
  END
  ELSE
    THROW 50010
    , 'Cannot book rooom. No Rooms Available!'
    , 1;
GO

GO
CREATE PROC spUpdateBeds @FacilityId int
AS
  DECLARE @NoOfBeds int
  SELECT
    @NoOfBeds = ICUBeds
  FROM FacilityDetails
  WHERE FacilityId = @FacilityId;
  IF @NoOfBeds > 0
  BEGIN
    UPDATE FacilityDetails
    SET ICUBeds = (@NoOfBeds - 1)
    WHERE FacilityId = @FacilityId;
  END
  ELSE
    THROW 50010
    , 'Cannot book rooom. No Beds Available!'
    , 1;
GO

GO
CREATE PROC spDischargePatient @PatientId int
AS
  DECLARE @FacilityId int,
          @ICUBeds int
  SELECT
    @FacilityId = FacilityId
  FROM AdmittedPatients
  WHERE PatientId = @PatientId;
  SELECT
    @ICUBeds = ICUBeds
  FROM FacilityDetails
  WHERE FacilityId = @FacilityId;
  UPDATE FacilityDetails
  SET ICUBeds = (@ICUBeds + 1)
  WHERE FacilityId = @FacilityId;
  DELETE FROM AdmittedPatients
  WHERE PatientId = @PatientId
GO

CREATE PROC spPrescriptionStatus @PrescriptionId int
, @Status nvarchar(255)
AS
  UPDATE PrescriptionInfo
  SET CurrentStatus = @Status
  WHERE Id = @PrescriptionId;
GO

CREATE TRIGGER dbo.UpdateRoomsAvailable
ON dbo.PhyscianSchedule
AFTER INSERT
AS
BEGIN
  DECLARE @FacId int
  SELECT
    @FacId = FacilityId
  FROM ScheduleDetails s
  JOIN Inserted i
    ON i.ScheduleDetails = s.Id
  EXEC spUpdateRooms @FacilityId = @FacId
END
GO

CREATE TRIGGER dbo.UpdateBedsAvailable
ON dbo.AdmittedPatients
AFTER INSERT
AS
BEGIN
  DECLARE @FacId int
  SELECT
    @FacId = a.FacilityId
  FROM AdmittedPatients a
  JOIN Inserted i
    ON i.Id = a.Id
  EXEC spUpdateBeds @FacilityId = @FacId
END

GO

CREATE ROLE Doctors;
GRANT UPDATE, Insert
    ON AdmittedPatients
    TO Doctors;
GRANT UPDATE, Insert
    ON PatientInfo
    TO Doctors;
GRANT UPDATE
    , INSERT
    ON PatientRecords
    TO Doctors;

GRANT UPDATE
  , INSERT
  ON ImagingTestResults
  TO Doctors;

GRANT UPDATE
  , INSERT
  ON LabTestResults
  TO Doctors;

GRANT UPDATE
  , INSERT
  ON ProcedureInfo
  TO Doctors;

GRANT UPDATE
  , INSERT
  ON MedicationInfo
  TO Doctors;
ALTER ROLE db_datareader ADD MEMBER Doctors;
GO
CREATE ROLE LabAdmin;
GRANT UPDATE, Insert
    ON LabTestInfo
    TO LabAdmin;
GRANT UPDATE, Insert
    ON LabTestResults
    TO LabAdmin;
ALTER ROLE db_datareader ADD MEMBER LabAdmin;
GO
CREATE ROLE Pharmacist;
GRANT UPDATE, Insert
    ON PrescriptionInfo
    TO Pharmacist;
GRANT UPDATE, Insert
    ON MedicationInfo
    TO Pharmacist;
ALTER ROLE db_datareader ADD MEMBER Pharmacist;
GO
CREATE ROLE Nurse;
GRANT UPDATE, Insert
    ON PatientRecords
    TO Nurse;
GRANT UPDATE, Insert
    ON PatientInfo
    TO Nurse;
GRANT UPDATE, Insert
    ON PhyscianSchedule
    TO Nurse;
ALTER ROLE db_datareader ADD MEMBER Nurse;
GO
CREATE LOGIN DoctorLogin
    WITH PASSWORD = 'P@SSW0rd'
        , DEFAULT_DATABASE = UniversityMedicalCenter;
CREATE USER Doctor1
FOR LOGIN DoctorLogin;
ALTER ROLE Doctors ADD MEMBER Doctor1;
GO
CREATE LOGIN NurseLogin
    WITH PASSWORD = 'P@SSW0rd'
        , DEFAULT_DATABASE = UniversityMedicalCenter;

CREATE USER Nurse1
FOR LOGIN NurseLogin;
ALTER ROLE Nurse ADD MEMBER Nurse1;
GO
CREATE LOGIN Pharmacy
    WITH PASSWORD = 'Pharmacy'
        , DEFAULT_DATABASE = UniversityMedicalCenter;
CREATE USER Pharmacist1
FOR LOGIN Pharmacy;
ALTER ROLE Pharmacist ADD MEMBER Pharmacist1;
GO
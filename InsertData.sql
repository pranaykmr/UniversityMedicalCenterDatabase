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

INSERT INTO PatientPreScreen (PatientRecordId
, Temperature
, AnySympotoms
, Vaccinated)
  VALUES (1, 98, 1, 0), (1, 97, 1, 0), (2, 98, 1, 0), (5, 98, 1, 1)

INSERT INTO AdmittedPatients (PatientId,
FacilityId,
AdmitDate)
  VALUES (1, 1, '01-01-2021'), (2, 3, '06-05-2021'), (3, 2, '03-04-2020')

INSERT INTO ProcedureInfo (Id
, ProcedureName
, ProcedureDuration
, Cost)
  VALUES (1, 'Bandage', 15, 20)
  , (2, 'Nazal Swab', 20, 125)
  , (3, 'Fracture', 150, 275)
  , (4, 'Stiches', 50, 200)
  , (5, 'Surgery', 240, 1175)

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

INSERT INTO PrescriptionInfo (Id,
PharmacyId,
Cost,
CurrentStatus)
  VALUES (1, 121, 149, 'Processing')
  , (2, 223, 243, 'Waiting Approval')
  , (3, 52, 764, 'Ready For Pickup')
  , (4, 121, 764, 'Ready For Pickup')
  , (5, 23, 764, 'Processed')

INSERT INTO PhysicianInfo (Id,
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

INSERT INTO PhysicianSchedule (PhysicianId,
PatientId,
ScheduleDetails,
NurseId)
  VALUES (2, 1, 1, 3), (2, 1, 2, 3), (3, 2, 3, 5), (5, 5, 4, 5)

INSERT INTO ScheduleDetails (StartTime,
Duration,
FacilityId,
RoomNumber,
EquipmentNeeded)
  VALUES ('03-20-2021 11:00', 120, 2, '2A3', 'XRAY MACHINE'),
  ('03-01-2021 10:00', 30, 2, '3A5', NULL),
  ('03-02-2021 10:00', 20, 3, '4A5', NULL),
  ('05-02-2021 10:40', 45, 2, '3Q5', NULL)

INSERT INTO LicenseInfo (LicenseNumber,
IssuedBy,
IssuedOn,
ValidTill)
  VALUES ('1UZ', 'SUNY Upstate', '04-20-2020', '04-20-2025'),
  ('1ZZ', 'Syracuse University', '03-20-2019', '03-20-2022'),
  ('5TU', 'SUNY Stony Brook', '09-15-2020', '09-14-2021'),
  ('2EZ', 'John Hopkins', '06-11-2020', '06-11-2022'),
  ('5TW', 'UPenn', '01-13-2017', '01-13-2027')

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


INSERT INTO NurseInfo (Id,
EmpId,
LocationId)
  VALUES (1, 21, 2), (2, 23, 5), (3, 43, 6), (5, 45, 7)

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

INSERT INTO FacilityInfo (Id,
FacilityName,
Street,
PostalCode,
City,
PhoneNumber)
  VALUES (1, 'Upstate', 'Irving', '13210', 'Syracuse', '1112221111'),
  (2, 'Crouse', 'Comstock', '13210', 'Syracuse', '3332222222'),
  (3, 'Stony Brook', 'NYC', '10001', 'New York', '7778882323')

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

INSERT INTO LabTestInfo (TestName,
Cost,
PaymentMethod)
  VALUES ('COVID AntiBody', 123, 'Card-Visa'), ('BloodWork-All', 254, 'Cash'), ('NazalSwab', 374, 'Cash')

INSERT INTO LabTestResults (TestId,
Results,
ReportToState,
ReportToCounty)
  VALUES (1, 'Negative', 0, NULL), (2, 'Normal', 0, NULL), (3, 'Positive Rhino Virus', 0, NULL)

INSERT INTO ImagingTestInfo (TestName,
Cost,
PaymentMethod)
  VALUES ('Arm Xray', 555, 'Card - Amex'), ('Chest Xray', 1024, 'Card - MasterCard')

INSERT INTO ImagingTestResults (TestId,
Results)
  VALUES (1, 'BrokenArm'), (2, 'Congestion')
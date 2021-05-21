CREATE VIEW InvoiceDetails
AS
SELECT
  PatientWeight
, PatientHeight
, BloodPressure
, Temperature
, CheckInTime
, CheckOutTime
, Diagnosis
, ProcedureId
, EmployeeId
, PhysicianId
, MedicationId
, ImagingTestId
, LabTestId
,pi.*
,IssuedBy
,IssuedOn
,ValidTill
,Copay
,CovergePercentage
,BaseCoverage
,ISNULL(dbo.fnGetPRCost(pr.Id), 0) AS Cost
,dbo.fnGetUpdatedCost(pr.Id, ISNULL(dbo.fnGetPRCost(pr.Id), 0)) AS OutOfPocket
FROM PatientRecords pr
JOIN PatientInfo pi
  ON pr.PatientId = pi.Id
JOIN InsuranceInfo ii 
  ON pi.InsuranceNumber = ii.InsuranceNumber
GO


CREATE VIEW BillingSummary as 
SELECT Id as PatientId ,
InsuranceNumber ,
Copay,
CovergePercentage,
BaseCoverage,
Cost ,
OutOfPocket as OutOfPocketCost
from InvoiceDetails
GO


CREATE VIEW PharmacyPrescriptions
AS
SELECT
  phari.*, medi.MedicationName,
  medi.Refills ,
  medi.DozesPerDay,
  medi.Notes,
  Cost,
  CurrentStatus
FROM PrescriptionInfo presi
JOIN PharmacyInfo phari
  ON presi.PharmacyId = phari.Id
JOIN MedicationInfo medi
  ON medi.PrescriptionId = presi.Id
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
  psyi.EmpId AS PhysicianEmpId,
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
JOIN PhysicianInfo psyi
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
FROM PhysicianSchedule ps
JOIN PhysicianInfo pi
  ON ps.PhysicianId = pi.Id
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
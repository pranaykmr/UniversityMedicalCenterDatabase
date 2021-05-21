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
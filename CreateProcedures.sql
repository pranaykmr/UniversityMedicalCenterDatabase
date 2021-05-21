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
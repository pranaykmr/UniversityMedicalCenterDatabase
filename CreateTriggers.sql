CREATE TRIGGER dbo.UpdateRoomsAvailable
ON dbo.PhysicianSchedule
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
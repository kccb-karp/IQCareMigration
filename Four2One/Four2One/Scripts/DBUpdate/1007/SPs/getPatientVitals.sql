CREATE PROCEDURE [dbo].[getPatientVitals]
(
@PatientMasterVisitID int, @PatientID INT
)
AS
BEGIN
SELECT * FROM PatientVitals WHERE Patientid = @PatientID 
END

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[getPatientVitals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].getPatientVitals
GO


CREATE PROCEDURE [dbo].[getPatientVitals]
(
@PatientMasterVisitID int, @PatientID INT
)
AS
BEGIN
SELECT distinct
PatientId
, cast(visitdate as date) VisitDate
, Case when Height <= 0 then NULL ELSE Height end as Height
, CASE WHEN [Weight] <=0 THEN NULL ELSE [Weight] END AS [Weight]
, CASE WHEN Muac <=0 THEN NULL ELSE Muac END AS Muac
, CASE WHEN BPSystolic <=0 THEN NULL ELSE BPSystolic END AS BPSystolic
, CASE WHEN BPDiastolic <=0 THEN NULL ELSE BPDiastolic END AS BPDiastolic
, CASE WHEN Temperature <=0 THEN NULL ELSE Temperature END AS Temperature
, CASE WHEN HeartRate <=0 THEN NULL ELSE HeartRate END AS HeartRate
, CASE WHEN RespiratoryRate <=0 THEN NULL ELSE RespiratoryRate END AS RespiratoryRate
, CASE WHEN SpO2 <=0 THEN NULL ELSE SpO2 END AS SpO2
FROM PatientVitals 
WHERE Patientid = @PatientID 
order by VisitDate desc
END
GO



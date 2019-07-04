IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPatientVitals]') 
AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getPatientVitals]
GO

/****** Object:  StoredProcedure [dbo].[getPatientVitals]    Script Date: 10/8/2018 3:05:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getPatientVitals]
(
@PatientMasterVisitID int, @PatientID INT
)
AS
BEGIN
SELECT * FROM PatientVitals WHERE Patientid = @PatientID 
END
GO



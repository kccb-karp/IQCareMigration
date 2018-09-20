DECLARE 
@PatientID VARCHAR(50),
@RegistrationDate VARCHAR(100), 
@StartARTDate VARCHAR(100),
@TransferInFrom VARCHAR(1000),
@StartRegimen VARCHAR(1000)


DECLARE @C as cursor
Set @C =  CURSOR FOR
	
WITH HIVEnrollment AS (select 
		a.Ptn_Pk PatientPK
		, a.IQNumber
		, b.Visit_Id VisitPK
		, d.[Name] FacilityFrom
		from mst_patient a
		inner join ord_visit b on a.Ptn_Pk= b.Ptn_Pk
		inner join mst_VisitType c on b.VisitType = c.VisitTypeID
		left join mst_LPTF d ON a.LPTFTransferId = d.ID
		where c.VisitName = 'Enrollment'
		and (a.DeleteFlag = 0 or a.DeleteFlag IS NULL)
		and (b.DeleteFlag = 0 or b.DeleteFlag IS NULL)
		and a.TransferIn = 1)

, InitialEvaluation AS 
		(select 
		a.Ptn_Pk PatientPK
		, a.IQNumber
		, b.Visit_Id VisitPK
		, d.CurrentART StartRegimen
		, d.CurrentARTStartDate StartARTDate
		from mst_patient a
		inner join ord_visit b on a.Ptn_Pk= b.Ptn_Pk
		inner join mst_VisitType c on b.VisitType = c.VisitTypeID
		left join dtl_PatientHivPrevCareIE d on b.Visit_Id = d.Visit_pk

		where c.VisitName = 'Initial Evaluation'
		and (a.DeleteFlag = 0 or a.DeleteFlag IS NULL)
		and (b.DeleteFlag = 0 or b.DeleteFlag IS NULL)
		and (d.PrevARVExposure = 1)
		and YEAR(d.CurrentARTStartDate) > 1989)

, ARTHistory AS 
		(select a.Ptn_Pk PatientPK
		, b.Visit_Id VisitPK
		, CASE WHEN YEAR(d.ARTTransferInDate) > 1989 THEN ARTTransferInDate ELSE NULL END AS TransferInDate
		, h.Name ARTTransferInFrom
		, g.Name FromDistrict
		, CASE WHEN YEAR(e.ARTStartDate) > 1989 THEN e.ARTStartDate ELSE NULL END AS ARTStartDate
		, CASE WHEN YEAR(e.ConfirmHIVPosDate) > 1989 THEN e.ConfirmHIVPosDate ELSE NULL END AS ConfirmHIVPosDate
		, CASE WHEN f.HIVCareWhere = '' THEN NULL ELSE f.HIVCareWhere END AS ConfirmHIVPosWhere
		from mst_patient a
		inner join ord_visit b on a.Ptn_Pk= b.Ptn_Pk
		inner join mst_VisitType c on b.VisitType = c.VisitTypeID
		left join dtl_PatientHivPrevCareIE d on b.Visit_Id = d.Visit_pk
		left join dtl_PatientHivPrevCareEnrollment e ON b.Visit_Id = e.Visit_pk
		left join dtl_PriorArvAndHivCare f on b.Visit_Id = f.Visit_pk
		left join mst_District g on d.FromDistrict = g.ID
		left join mst_LPTF h ON  d.ARTTransferInFrom = h.ID
		where c.VisitName = 'ART History'
		and (a.DeleteFlag = 0 or a.DeleteFlag IS NULL)
		and (b.DeleteFlag = 0 or b.DeleteFlag IS NULL))

, ARTTherapy AS 
		(select a.Ptn_Pk PatientPK
		, b.Visit_Id VisitPK
		, CASE WHEN YEAR(d.FirstLineRegStDate) > 1989 THEN d.FirstLineRegStDate ELSE NULL END AS ARTStartDate
		, CASE WHEN d.FirstLineReg != '' THEN d.FirstLineReg ELSE NULL END AS StartRegimen


		from mst_patient a
		inner join ord_visit b on a.Ptn_Pk= b.Ptn_Pk
		inner join mst_VisitType c on b.VisitType = c.VisitTypeID
		inner join dtl_patientartcare d on b.Visit_Id = d.visit_Id

		where c.VisitName = 'ART Therapy'
		and (a.DeleteFlag = 0 or a.DeleteFlag IS NULL)
		and (b.DeleteFlag = 0 or b.DeleteFlag IS NULL)
		and YEAR(d.FirstLineRegStDate) > 1989)

, ClinicalEncounter AS
		(select 
		a.Ptn_Pk PatientPK
		, a.IQNumber
		, b.Visit_Id VisitPK
		, COALESCE(CASE WHEN YEAR(e.ARTStartDate) > 1989 THEN e.ARTStartDate ELSE NULL END
			, CASE WHEN YEAR(f.FirstLineRegStDate) > 1989 THEN f.FirstLineRegStDate ELSE NULL END) StartARTDate
		, g.RegimenName StartRegimen
		, h.Name TransferInFrom

		from mst_patient a
		inner join ord_visit b on a.Ptn_Pk= b.Ptn_Pk
		inner join mst_VisitType c on b.VisitType = c.VisitTypeID
		left join dtl_PatientHivPrevCareIE d on b.Visit_Id = d.Visit_pk
		left join dtl_PatientHivPrevCareEnrollment e on b.Visit_Id = e.Visit_pk
		left join dtl_patientARTCare f on b.Visit_Id = f.visit_Id
		left join mst_Regimen g on f.FirstLineReg = g.RegimenID
		left join mst_LPTF h on d.ARTTransferInFrom = h.ID

		where c.VisitName = 'Clinical Encounter'
		and (a.DeleteFlag = 0 or a.DeleteFlag IS NULL)
		and (b.DeleteFlag = 0 or b.DeleteFlag IS NULL)
		and a.TransferIn = 1
		and COALESCE(CASE WHEN YEAR(e.ARTStartDate) > 1989 THEN e.ARTStartDate ELSE NULL END
			, CASE WHEN YEAR(f.FirstLineRegStDate) > 1989 THEN f.FirstLineRegStDate ELSE NULL END) IS NOT NULL)


, triage AS (

		Select PatientPK
		, FacilityFrom 
		, NULL StartARTDate
		, NULL StartRegimen
		FROM HIVEnrollment a 

		UNION

		Select PatientPK
		, NULL FacilityFrom
		, StartARTDate
		, StartRegimen
		 FROM InitialEvaluation

		 UNION

		SELECT PatientPK
		, ARTTransferInFrom FacilityFrom
		, ARTStartDate StartARTDate 
		, NULL StartRegimen
		FROM ARTHistory

		UNION

		Select PatientPK
		, NULL
		, ARTStartDate StartARTDate
		, StartRegimen
		 FROM ARTTherapy

		 UNION

		Select PatientPK
		, TransferInFrom
		, StartARTDate
		, StartRegimen
		 FROM ClinicalEncounter)


 , StartART AS (
		 Select PatientPK
		 , MIN(StartARTDate)StartARTDate FROM triage
		 WHERE StartARTDate IS NOT NULL
		 GROUP BY PatientPK)
, TransferIn AS ( 
Select a.Ptn_Pk
, c.FacilityFrom
, b.StartARTDate
, c.StartRegimen 
FROM mst_Patient a 
LEFT JOIN StartART b ON a.Ptn_Pk = b.PatientPK
LEFT JOIN (
Select PatientPK
, MAX(FacilityFrom) FacilityFrom
, MAX(StartRegimen) StartRegimen 
FROM triage
WHERE Coalesce(FacilityFrom, StartRegimen) IS NOT NULL
GROUP BY PatientPK) c ON a.Ptn_Pk = c.PatientPK
WHERE coalesce(b.PatientPK, c.PatientpK) IS NOT NULL)

Select b.Id PatientId
, CASE WHEN a.FacilityFrom IS NULL THEN 'Facility From Not Documented' ELSE a.FacilityFrom END AS FacilityFrom
, CASE WHEN a.StartARTDate IS NULL THEN '' ELSE a.StartARTDate END AS StartARTDate
, CASE WHEN a.StartRegimen IS NULL THEN 'Start Regimen Not Documented' ELSE a.StartRegimen END AS StartRegimen
, b.RegistrationDate
 FROM TransferIn a INNER JOIN Patient b ON a.Ptn_Pk = b.ptn_pk
 LEFT JOIN PatientMasterVisit c ON b.Id = c.PatientId AND c.VisitType IS NULL
 WHERE c.Id IS NULL



OPEN @C



FETCH NEXT FROM @C INTO 

@PatientID,
@TransferInFrom,
@StartARTDate,
@StartRegimen,
@RegistrationDate

WHILE @@FETCH_STATUS = 0

BEGIN

EXEC
('UPDATE Patient 
SET PatientType = 260 WHERE Id = ' + @PatientID + ';')

EXEC('

DECLARE @PatientMasterVisitID as INT;
	INSERT INTO dbo.PatientMasterVisit
				(PatientId
				, ServiceId
				, Start
				, [End]
				, Active
				, VisitDate
				, VisitScheduled
				, VisitBy
				, VisitType
				, Status
				, CreateDate
				, DeleteFlag
				, CreatedBy
				, AuditData) 
			VALUES 
				('+@PatientID+'
				, 1
				, CAST('''+@RegistrationDate+''' AS DATETIME)
				, CAST('''+@RegistrationDate+''' AS DATETIME)
				, 1
				, CAST('''+@RegistrationDate+''' AS DATETIME)
				, 0
				, 0
				, NULL
				, 2
				, GETDATE(), 0, 1, NULL);
				
				SELECT @PatientMasterVisitID = IDENT_CURRENT(''PatientMasterVisit'')
				
				IF (YEAR(CAST('''+@StartARTDate+''' AS DATE)) != 1900)
				INSERT INTO [dbo].[PatientTransferIn]
				([PatientId]
				,[PatientMasterVisitId]
				,[ServiceAreaId]
				,[TransferInDate]
				,[TreatmentStartDate]
				,[CurrentTreatment]
				,[FacilityFrom]
				,[MFLCode]
				,[CountyFrom]
				,[TransferInNotes]
				,[DeleteFlag]
				,[CreatedBy]
				,[CreateDate]
				,[AuditData])
			VALUES
				('+@PatientID+'
				,@PatientMasterVisitID
				,1
				,CAST('''+@RegistrationDate+''' AS DATETIME)
				,CAST('''+@StartARTDate+''' AS DATETIME)
				,'''+@StartRegimen+'''
				,'''+@TransferInFrom+'''
				,''99999''
				,''48''
				,'''+@StartRegimen+' - '' + '''+@TransferInFrom+''' --Transfer In Notes
				,0
				,1
				,GETDATE()
				,NULL);
				
				')

FETCH NEXT FROM @C INTO 
@PatientID,
@TransferInFrom,
@StartARTDate,
@StartRegimen,
@RegistrationDate

END

CLOSE @C
DEALLOCATE @C
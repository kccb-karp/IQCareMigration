IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[pr_SCM_GetPharmacyVitals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pr_SCM_GetPharmacyVitals
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_SCM_GetPharmacyVitals] @ptn_pk INT
AS
BEGIN
	--0. Weight and height
	SELECT (
			SELECT TOP 1 Weight AS StartWeight
			FROM dtl_PatientVitals a
			WHERE a.Ptn_pk = @ptn_pk
				AND weight > 0
			ORDER BY Visit_pk ASC
			) AS StartWeight
		,(
			SELECT TOP 1 Height AS StartHeight
			FROM dtl_PatientVitals a
			WHERE a.Ptn_pk = @ptn_pk
				AND Height > 0
			ORDER BY Visit_pk ASC
			) AS StartHeight
		,(
			SELECT TOP 1 Weight AS CurrentWeight
			FROM dtl_PatientVitals a
			WHERE a.Ptn_pk = @ptn_pk
				AND weight > 0
			ORDER BY Visit_pk DESC
			) AS CurrentWeight
		,(
			SELECT TOP 1 Height AS Currentheight
			FROM dtl_PatientVitals a
			WHERE a.Ptn_pk = @ptn_pk
				AND Height > 0
			ORDER BY Visit_pk DESC
			) AS Currentheight
	FROM mst_patient
	WHERE ptn_pk = @ptn_pk

	--1. Start Regimen
	SELECT TOP 1 b.RegimenType AS StartRegimen
		,b.RegimenLine AS StartRegimenLine
		,convert(VARCHAR, b.DispensedByDate, 106) AS StartRegimenDate
	FROM mst_patient a
	LEFT JOIN VW_PatientPharmacy b
		ON a.Ptn_Pk = b.Ptn_pk
			AND RegimenType IS NOT NULL
			AND len(ltrim(RegimenType)) > 0
			AND b.DispensedByDate IS NOT NULL
	WHERE a.Ptn_Pk = @ptn_pk
	ORDER BY DispensedByDate ASC

	--2. Last Regimen
	SELECT TOP 1 b.RegimenType AS LastRegimen
		,b.RegimenLine AS LastRegimenLine
		,b.DispensedByDate AS LastRegimenDate
	FROM mst_patient a
	LEFT JOIN VW_PatientPharmacy b
		ON a.Ptn_Pk = b.Ptn_pk
			AND RegimenType IS NOT NULL
			AND len(ltrim(RegimenType)) > 0
			AND b.DispensedByDate IS NOT NULL
	WHERE a.Ptn_Pk = @ptn_pk
	ORDER BY DispensedByDate DESC

	--3. TB treatment
	SELECT TOP 1 CASE 
			WHEN TBRegimenStartDate IS NOT NULL
				THEN 'Yes'
			END AS OnTBtreatment
		,TBRegimenStartDate
		,TBRegimenEndDate
	FROM mst_Patient p
	LEFT JOIN (
		SELECT ptn_pk
			,TBRegimenStartDate
			,DATEADD(mm, 6, TBRegimenStartDate) AS TBRegimenEndDate
		FROM dtl_TBScreening
		WHERE TBRegimenStartDate > cast('1900-01-01' AS DATETIME)
		
		UNION
		
		SELECT ptn_pk
			,TBRxStartDate
			,TBRxEnddate
		FROM dtl_patientothertreatment
		WHERE TBRxStartDate > cast('1900-01-01' AS DATETIME)
		) a
		ON p.Ptn_Pk = a.Ptn_pk
			AND DATEADD(mm, 6, a.TBRegimenStartDate) >= GETDATE()
	WHERE p.Ptn_pk = @ptn_pk
	ORDER BY TBRegimenStartDate DESC

	--4. INH
	SELECT INHStartDate
		,INHStopDate
		,INHEndDate
	FROM mst_Patient p
	LEFT JOIN dtl_TBScreening a
		ON p.Ptn_Pk = a.Ptn_pk
			AND DATEADD(mm, 6, a.INHStartDate) >= GETDATE()
	LEFT JOIN mst_decode b
		ON a.IPT = b.ID
	WHERE p.Ptn_pk = @ptn_pk
	ORDER BY INHStartDate DESC

	--5. Previous Appointment
	SELECT TOP 1 convert(VARCHAR, a.AppDate, 106) AS AppDate
		,DATEDIFF(dd, GETDATE(), a.AppDate) AS DaysToNextAppointment
	FROM mst_Patient p
	LEFT JOIN dtl_PatientAppointment a
		ON p.Ptn_Pk = a.Ptn_pk
	LEFT JOIN mst_Decode b
		ON a.AppReason = b.ID
	WHERE p.Ptn_pk = @ptn_pk
		AND convert(VARCHAR, a.AppDate, 106) <> '01 Jan 1900' --and b.Name = 'Pharmacy Refill' 
	ORDER BY a.AppDate DESC

	----------------------------------------------------------------------------------------------------
	--6. Treatment Program
	SELECT b.ID
		,b.NAME
	FROM mst_Code a
	INNER JOIN mst_Decode b
		ON a.CodeID = b.CodeID
	WHERE a.NAME = 'Treatment Program'

	--7. Treatment Plan
	--SELECT b.ID
	--	,b.NAME
	--FROM mst_Code a
	--INNER JOIN mst_Decode b
	--	ON a.CodeID = b.CodeID
	--WHERE a.NAME IN (
	--		'ARTTreatmentPlan'
	--		,'ARV Therapy Plan'
	--		)
	--	AND isnull(b.DeleteFlag, 0) = 0

	select Id, Displayname Name from lookupitem where id in 
	(select LookupItemId from lookupmasteritem where LookupMasterId=(select top 1 id from lookupmaster where name = 'TreatmentPlan'))

	--8. WHO Stage
	--SELECT b.ID
	--	,b.NAME
	--FROM mst_Code a
	--INNER JOIN mst_Decode b
	--	ON a.CodeID = b.CodeID
	--WHERE a.NAME = 'WHO Stage'

	select  Id, Displayname Name  from lookupitem where id in 
	(select LookupItemId from lookupmasteritem where LookupMasterId=(select top 1 id from lookupmaster where name = 'WHOStage'))

	--9. Dispensing Store
	SELECT id
		,NAME
	FROM Mst_Store
	WHERE DeleteFlag = 0
		AND DispensingStore = 1

	--10. Employee list
	SELECT (FirstName + ' ' + LastName) NAME
		,EmployeeId
	FROM mst_Employee a
		,mst_Designation b
	WHERE a.DesignationID = b.Id
	ORDER BY FirstName

	-------------------------------------------------------------------------------------------------------
	--11. Patients treatment programme
	SELECT TOP 1 b.id
		,b.NAME
	FROM ord_PatientPharmacyOrder a
	INNER JOIN mst_Decode b
		ON a.ProgID = b.id
	WHERE Ptn_pk = @ptn_pk
	ORDER BY coalesce(a.OrderedByDate, a.dispensedbydate) DESC

	--12. Patients treatment plan
	SELECT TOP 1 id
		,treatmentPlan
	FROM (
		SELECT ptn_pk
			,visit_pk
			,b.id
			,b.NAME  AS treatmentPlan
		FROM dtl_PatientARVTherapy a
		INNER JOIN dbo.mst_Decode b
			ON a.TherapyPlan = b.ID
		
		UNION
		
		SELECT ptn_pk
			,visit_pk
			,b.id
			,b.NAME
		FROM DTL_Adult_Initial_Evaluation_Form a
		INNER JOIN dbo.mst_Decode b
			ON a.[ARTTreatmentPlanPeads] = b.ID
		) a
	WHERE a.Ptn_pk = @ptn_pk
	ORDER BY visit_pk DESC

	--13. Patients WHO Stage
	SELECT TOP 1 id
		,WHOStage
	FROM (
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,1 AS WHOStage
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'WHOStageIConditions'
		
		UNION
		
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,2
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'WHOStageIIConditions'
		
		UNION
		
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,3
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'WHOStageIIIConditions'
		
		UNION
		
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,4
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'WHOStageIVConditions'
		
		UNION
		
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,1
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'CurrentWHOStageIConditions'
		
		UNION
		
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,2
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'CurrentWHOStageIIConditions'
		
		UNION
		
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,3
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'CurrentWHOStageIIIConditions'
		
		UNION
		
		SELECT ptn_pk
			,Visit_pk
			,DateField1
			,b.ID
			,4
		FROM dtl_Multiselect_line a
		INNER JOIN mst_Decode b
			ON b.id = a.ValueID
		WHERE fieldname = 'CurrentWHOStageIVConditions'
		) a
	WHERE a.Ptn_pk = @ptn_pk
	ORDER BY visit_pk DESC;

	--14 Patient Classification List 
	SELECT ID
		,NAME
	FROM mst_Decode
	WHERE codeid = (
			SELECT CodeId
			FROM mst_code
			WHERE NAME = 'Patient Classification'
			)
		AND (
			DeleteFlag = 0
			OR DeleteFlag IS NULL
			);

	--15 Patient Classification 
	SELECT TOP 1 ov.PatientClassification
		,ov.IsEnrolDifferenciatedCare
		,ov.ARTRefillModel
	FROM ord_visit ov
	WHERE ov.ptn_pk = @ptn_pk
	ORDER BY visit_id DESC;

END

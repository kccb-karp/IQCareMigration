
	WITH PwPServices AS (
	select a.Ptn_Pk, a.Visit_Pk, b.Name PwPService from 
	dtl_PatientPreventionwithpositives a INNER JOIN mst_BlueDecode b on a.ID = b.ID
	UNION
	select a.Ptn_Pk, a.Visit_Pk, b.Name PwPService from 
	dtl_PatientAtRiskPopulationServices a INNER join mst_BlueDecode b on a.ID = b.ID 
	UNION
	select a.Ptn_Pk, a.Visit_Pk, 'On site screening for STIs/RTI' PwPService 
	from [dbo].[dtl_PwP] a WHERE ScreenedForSTI = 1)

	, PwPServices_f AS 
	(Select a.Ptn_Pk
	, CAST(b.VisitDate as DATE)VisitDate
	, a.PwPService 
	, CASE WHEN a.PwPService IN ('PT  =   Partner Testing','Partner received on site HIV testing') THEN 76 
	       WHEN a.PwPService IN ('C= Condom promotion/provision','Provided with condoms') THEN 73 
	       WHEN a.PwPService IN ('Disclosed HIV status to sexual partner') THEN 75 	      
			WHEN a.PwPService IN ('On site screening for STIs/RTI') THEN 77 
			WHEN a.PwPService IN ('AdC = Adherence counselling') THEN 72
	ELSE NULL END AS PwP
	FROM PwPServices a INNER JOIN ord_Visit b ON a.Visit_pk = b.Visit_Id 
	AND a.Ptn_Pk = b.Ptn_Pk
	WHERE b.DeleteFlag = 0 OR b.DeleteFlag IS NULL)


	insert into PatientPHDP (PatientId
	, PatientMasterVisitId
	, Phdp
	, DeleteFlag
	, CreateBy
	, CreateDate
	, AuditData)
	Select distinct  
	b.Id PatientId
	, c.Id PatientMasterVisitId
	, a.PwP PHDP
	, 0 DeleteFlag
	, c.CreatedBy
	, c.CreateDate
	, NULL AuditData
	FROM PwPServices_f a
	inner join Patient b on a.Ptn_pk = b.ptn_pk
	inner join PatientMasterVisit c on b.id = c.PatientId
	and cast(a.visitdate as date) = cast(c.visitdate as date)
	and c.VisitType = 0
	left join PatientPHDP d ON c.Id = d.PatientMasterVisitId
	where d.PatientMasterVisitId IS NULL
	AND a.PwP IS NOT NULL
	GO
SET CONCAT_NULL_YIELDS_NULL OFF
GO

	EXEC('IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''temp_Pharmacy'') AND type in (N''U''))
	DROP TABLE temp_Pharmacy')

	EXEC('IF EXISTS (Select name FROM sys.tables where name = ''TempPharmacyA'') DROP TABLE TempPharmacyA')
	EXEC('IF EXISTS (Select name FROM sys.tables where name = ''TempRegimenMap'') DROP TABLE TempRegimenMap')
	EXEC('IF EXISTS (Select name FROM sys.tables where name = ''tempLastRegimens'') DROP TABLE tempLastRegimens')



	EXEC('WITH 
	ARVs_A AS 
	(
	Select DISTINCT a.Ptn_Pk
	, c.VisitID
	, c.ptn_pharmacy_pk
	, g.GenericAbbrevation
	 FROM mst_Patient a
	INNER JOIN ord_Visit b ON a.Ptn_Pk = b.Ptn_Pk
	INNER JOIN ord_PatientPharmacyOrder c ON a.Ptn_Pk = c.Ptn_pk AND b.Visit_Id = c.VisitID
	INNER JOIN dtl_PatientPharmacyOrder d ON c.ptn_pharmacy_pk = d.ptn_pharmacy_pk
	INNER JOIN mst_Drug e ON d.Drug_Pk = e.Drug_pk
	INNER JOIN lnk_DrugGeneric f ON e.Drug_pk = f.Drug_pk
	INNER JOIN mst_Generic g ON f.GenericID = g.GenericID
	INNER JOIN lnk_DrugTypeGeneric h ON g.GenericID = h.GenericId
	INNER JOIN mst_DrugType i ON h.DrugTypeId = i.DrugTypeID
	Where (a.DeleteFlag = 0 Or a.DeleteFlag IS NULL)
	AND (b.DeleteFlag = 0 OR b.DeleteFlag IS NULL)
	AND (c.DeleteFlag = 0 OR c.DeleteFlag IS NULL)
	AND i.DrugTypeName = ''ARV Medication''
	And c.DispensedByDate IS NOT NULL
	)
	,ARVs AS 
	(
	Select Ptn_Pk
	, ROW_NUMBER() Over (Partition By ptn_pharmacy_pk Order By ptn_pk, ptn_pharmacy_pk, GenericAbbrevation) i
	, VisitID
	, ptn_pharmacy_pk
	, GenericAbbrevation
	 FROM ARVs_A
	)
	, ARVsPIVOT AS (
	Select * FROM ARVs PIVOT (MIN(GenericAbbrevation) FOR i IN ([1],[2],[3],[4])) b)

	, RegimenMap AS (
	Select Ptn_Pk, VisitID, ptn_pharmacy_pk
	,CASE WHEN [4] IS NOT NULL THEN [1] + ''+'' + [2] + ''+'' + [3] + ''+'' + [4]
	 WHEN [3] IS NOT NULL THEN [1] + ''+'' + [2] + ''+'' + [3] 
	 WHEN [3] IS NULL AND [2] IS NOT NULL THEN [1] + ''+'' + [2]
	 WHEN [2] IS NULL AND [1] IS NOT NULL THEN [1] 
	 ELSE NULL END AS Regimen
	 , [1],[2],[3],[4]
	  FROM ARVsPIVOT)

	--INSERT INTO TempRegimenMap
	Select Ptn_Pk, VisitID, ptn_pharmacy_pk,regimen
	, case when regimen like ''%ATV%'' and regimen like ''%RTV%'' then 1 else NULL END AS ATVRTV INTO TempRegimenMap  
	FROM RegimenMap')

	EXEC('UPDATE TempRegimenMap SET regimen = Case WHEN regimen LIKE ''%LOPr%'' 
	THEN REPLACE(regimen,''LOPr'', ''LPV/r'') ELSE regimen END')

	EXEC('with a as (
	Select Ptn_pk
	, ROW_NUMBER() Over (Partition By ptn_pk Order By ptn_pharmacy_Pk desc) i
	, VisitID
	, ptn_pharmacy_pk
	, regimen
	, len(regimen)reglength
	FROM TempRegimenMap)

	, b as
	(select * from a where i <= 4)

	, c as (
			select b.ptn_pk
			, b.visitid
			, b.ptn_pharmacy_pk
			, b.regimen
			 from b inner join (
				select ptn_pk			
				, max(reglength) reglength 
				from b group by ptn_pk) c on b.ptn_pk = c.ptn_pk
			and b.reglength = c.reglength)

	, lastregimen as (
			select c.ptn_pk
			, c.visitid, c.ptn_pharmacy_pk, c.regimen from c inner join (
			Select ptn_pk, max(ptn_pharmacy_pk) lastptn
			from c group by ptn_pk) d on c.ptn_pk = d.ptn_pk and c.ptn_pharmacy_pk = d.lastptn)

	, lastregimenStart as (
				Select a.ptn_pk, min(a.ptn_pharmacy_pk)lastStart FROM a inner join lastregimen b on a.ptn_pk = b.ptn_pk
				and a.regimen = b.regimen
				group by a.ptn_pk)

	, lastregimendispensed as 
				(select a.ptn_pk
				, a.i
				, a.regimen lastregimen
				, a.ptn_pharmacy_pk 
				, len(a.regimen) reglength
				from a inner join (select ptn_pk
									, max(ptn_pharmacy_pk) last_pk
									from a group by ptn_pk)b 
				on a.ptn_pk = b.ptn_pk and a.ptn_pharmacy_pk = b.last_pk)

	Select a.ptn_pk
	, a.visitid lastvisitID
	, a.ptn_pharmacy_pk lastdispensePK
	, case when c.reglength between 11 and 13 then c.lastregimen else a.regimen end as lastRegimen
	, case when c.reglength between 11 and 13 then c.ptn_pharmacy_pk else b.lastStart end as lastRegimenStartPK 
	into tempLastRegimens
	 from lastregimen a inner join lastregimenStart b on a.ptn_pk = b.ptn_pk
	 inner join lastregimendispensed c on a.ptn_pk = c.ptn_pk')

	
	--**ART Regimens
	EXEC('Select Distinct 
	m.Ptn_pk,
	a.VisitID,
	a.Ptn_Pharmacy_Pk,
	a.DispensedByDate dispenseDate,
	g.Regimen	
	
	, CASE WHEN LEN(g.Regimen) >= 11 AND i.Name IN (''ART'',''PMTCT'') THEN ''ART'' ELSE i.Name END AS treatmentType 
	, CASE WHEN i.Name = ''PMTCT'' THEN ''YES'' ELSE ''NO'' END AS PMTCT

	INTO TempPharmacyA

	From mst_Patient m 
	INNER Join ord_PatientPharmacyOrder a On m.Ptn_Pk = a.Ptn_pk
	INNER join dtl_PatientPharmacyOrder b On a.ptn_pharmacy_pk = b.ptn_pharmacy_pk 
	INNER JOIN TempRegimenMap g ON a.ptn_pharmacy_pk = g.ptn_pharmacy_pk

	LEFT Join mst_Decode i On a.ProgID = i.ID
	
	Where 
	m.RegistrationDate <= a.DispensedByDate 
	')

	EXEC('UPDATE TempPharmacyA SET TempPharmacyA.Regimen = B.lastRegimen FROM
	TempPharmacyA A INNER JOIN tempLastRegimens B ON A.Ptn_Pk = B.Ptn_Pk
	AND A.Ptn_Pharmacy_Pk >= B.lastRegimenStartPK')

	EXEC('Select  
	Pharmacy.PatientPK
	, Pharmacy.VisitID
	, Pharmacy.Drug
	, Pharmacy.DispenseDate	
	, Pharmacy.TreatmentType

	INTO temp_Pharmacy 

	FROM (
			Select  
			a.Ptn_pk PatientPK, 
			a.VisitID VisitID,   
			CASE WHEN LEN(a.Regimen) < 10 THEN NULL ELSE a.Regimen END AS Drug,
			a.dispenseDate DispenseDate, 
			a.TreatmentType collate database_default TreatmentType  
			
			From 
			TempPharmacyA a 
			Where a.treatmentType IN (''PMTCT'',''ART'') And  
			  a.regimen Is Not Null) Pharmacy')
	
	EXEC('IF EXISTS (Select name FROM sys.tables where name = ''TempPharmacyA'') DROP TABLE TempPharmacyA')
	EXEC('IF EXISTS (Select name FROM sys.tables where name = ''TempRegimenMap'') DROP TABLE TempRegimenMap')
	EXEC('IF EXISTS (Select name FROM sys.tables where name = ''tempLastRegimens'') DROP TABLE tempLastRegimens')


	Exec('CREATE CLUSTERED INDEX [IDX_PatientPK] ON 
	[dbo].[temp_Pharmacy] ([PatientPK] ASC )
	WITH (PAD_INDEX  = OFF
	, STATISTICS_NORECOMPUTE  = OFF
	, SORT_IN_TEMPDB = OFF
	, IGNORE_DUP_KEY = OFF
	, DROP_EXISTING = OFF
	, ONLINE = OFF
	, ALLOW_ROW_LOCKS  = ON
	, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	 ');




DECLARE 
@PatientID VARCHAR(50),
@RegistrationDate VARCHAR(100), 
@StartARTDate VARCHAR(100),
@TransferInFrom VARCHAR(1000),
@StartRegimen VARCHAR(1000),
@RegimenName varchar(1000)

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
		,g.RegimenCode RegimenCode
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


, tri AS (

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
		,StartRegimen
		 FROM ClinicalEncounter),

		 Triage as(
		 select t.PatientPK,t.StartARTDate,t.FacilityFrom,REPLACE(t.StartRegimen,'/','+') as Regimen,t.StartRegimen as StartRegimen
		
		
		--Else t.StartRegimen		 
		  from (
		 select t.PatientPK,t.StartARTDate,t.FacilityFrom,t.StartRegimen ,
		  SubString(t.StartRegimen, 0, 4) [1],
Case
When CharIndex('+', t.StartRegimen) > 0 Then SubString(t.StartRegimen,
CharIndex('+', t.StartRegimen) + 1, 3) End As [2],
Case
When CharIndex('+', t.StartRegimen, 6) > 0 Then SubString(t.StartRegimen,
CharIndex('+', t.StartRegimen, 6) + 1, 3) Else Null End As [3],
Case
When CharIndex('+', t.StartRegimen, 10) > 0 Then SubString(StartRegimen,
CharIndex('+', t.StartRegimen, 10) + 1, 3) Else Null End As [4],
Case
When CharIndex('+', t.StartRegimen, 14) > 0 Then SubString(StartRegimen,
CharIndex('+', t.StartRegimen, 14) + 1, 3) Else Null End As [5]
		 
		  from tri t) t)


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
, CASE WHEN lv.DisplayName IS NULL THEN (select ItemId from LookupItemView where MasterName = 'AdultFirstLineRegimen' and ItemName = 'Unknown') ELSE lv.ItemId END AS StartRegimen
,lv.StartRegimen as  RegimenName
, b.RegistrationDate
 FROM TransferIn a INNER JOIN Patient b ON a.Ptn_Pk = b.ptn_pk
 LEFT JOIN (select a.Ptn_pk,a.StartRegimen,l.DisplayName,l.ItemId from TransferIn a
 LEFT join LookupItemView  l on l.DisplayName=a.StartRegimen
 where l.MasterName ='AdultFirstLineRegimen') lv
 on lv.DisplayName=a.StartRegimen 
 LEFT JOIN PatientMasterVisit c ON b.Id = c.PatientId AND c.VisitType IS NULL
 WHERE c.Id IS NULL



OPEN @C



FETCH NEXT FROM @C INTO 

@PatientID,
@TransferInFrom,
@StartARTDate,
@StartRegimen,
@RegimenName,
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
				,'''+@RegimenName+' - '' + '''+@TransferInFrom+''' --Transfer In Notes
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
@RegimenName,
@RegistrationDate

END

CLOSE @C
DEALLOCATE @C

SET CONCAT_NULL_YIELDS_NULL ON
GO
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




DECLARE @PersonID VARCHAR(10),
@PatientID VARCHAR(50),
@HIVTestDate VARCHAR(100),
@RegistrationDate VARCHAR(100), 
@StartARTDate VARCHAR(100),
@StartRegimen VARCHAR(100),
@TransferInFrom VARCHAR(200),
@MFLCode VARCHAR(100),
@TransferIn VARCHAR(100)

DECLARE @C as cursor
Set @C =  CURSOR FOR
	WITH HIVTestDate AS (Select a.ptn_pk, Min(HIVDate)HIVTestDate From 
					(Select a.ptn_pk, a.ConfirmHIVPosDate HIVDate
					From dtl_PatientHivPrevCareEnrollment a  
					Where a.ConfirmHIVPosDate Is Not Null And a.ConfirmHIVPosDate <> Cast('' as datetime)
					union
					Select a.ptn_pk, a.DateHIVDiagnosis
					From dtl_PatientClinicalStatus a 
					Where a.DateHIVDiagnosis Is Not Null And a.DateHIVDiagnosis <> Cast('' as datetime)) a group by a.ptn_pk) 

, RandomSources AS (
select ptn_pk
, CASE WHEN FirstLineRegStDate IS NULL OR YEAR(FirstLineRegStDate) = 1900 THEN NULL ELSE 
FirstLineRegStDate END AS StartARTDate
, CASE WHEN a.FirstLineReg = '' THEN NULL 
       WHEN ISNUMERIC(a.FirstLineReg) = 1 THEN (SELECT RegimenName FROM mst_Regimen m WHERE m.RegimenID = a.FirstLineReg) 
	   ELSE a.FirstLineReg END AS StartRegimen
, NULL TransferInFrom
, NULL MFLCode
from dtl_PatientARTCare a 
WHERE CASE WHEN FirstLineRegStDate IS NULL OR YEAR(FirstLineRegStDate) = 1900 THEN NULL ELSE 
FirstLineRegStDate END IS NOT NULL

UNION

select Ptn_pk
, CurrentARTStartDate StartARTDate
, CASE WHEN CurrentART = '' THEN NULL ELSE CurrentART END StartRegimen
, b.Name TransferInFrom
, b.MFLCode
from dtl_PatientHivPrevCareIE a LEFT JOIN 
mst_LPTF b ON a.ARTTransferInFrom = b.ID
where PrevARVExposure = 1 and YEAR(CurrentARTStartDate) > 1900

UNION

select ptn_pk
, CASE WHEN YEAR(ARTStartDate) = 1900 THEN NULL ELSE ARTStartDate END AS StartARTDate 
, NULL StartRegimen
, NULL TransferInFrom
, NULL MFLCode
from dtl_PatientHivPrevCareEnrollment
WHERE  CASE WHEN YEAR(ARTStartDate) = 1900 THEN NULL ELSE ARTStartDate END IS NOT NULL)

, TransferInOnART AS (

select a.Ptn_Pk PatientPK
, b.StartARTDate
, b.StartRegimen
, b.TransferInFrom
, b.MFLCode
 from mst_Patient a INNER JOIN (
Select a.ptn_pk 
, MAX(CAST(StartARTDate as DATE)) StartARTDate
, MAX(StartRegimen) StartRegimen
, MAX(TransferInFrom) TransferInFrom
, MAX(MFLCode) MFLCode
FROM RandomSources a 
GROUP BY a.ptn_pk)
b ON a.ptn_pk = b.Ptn_Pk
WHERE (a.DeleteFlag = 0 OR a.DeleteFlag IS NULL)
and DATEDIFF(dd, b.StartARTDate ,a.RegistrationDate) > 30
)
					
, PharmStart AS (SELECT PatientPK, MIN(DispenseDate) StartDate 
FROM temp_Pharmacy
GROUP BY PatientPK)

, PrevStart AS (
Select PatientPK, MIN(StartARTDate) StartDate 
FROM TransferInOnART
GROUP BY PatientPK)

, StartART AS 
(Select a.PatientPK
, MIN(CAST(a.StartDate as date)) StartDate FROM 
(Select * FROM PharmStart UNION Select * FROM PrevStart) a 
GROUP BY a.PatientPK
)

SELECT
a.PersonId
, a.Id PatientId 
, CAST(b.HIVTestDate as DATE) HIVTestDate 
, CAST(a.RegistrationDate as DATE) RegistrationDate
, c.StartDate
, e.StartRegimen
, e.TransferInFrom
, e.MFLCode
, e.PatientPK TransferIn
FROM Patient a LEFT JOIN HIVTestDate b ON a.ptn_pk = b.ptn_pk
LEFT JOIN StartART c ON a.ptn_pk = c.PatientPK
LEFT JOIN PatientHivDiagnosis d ON a.Id = d.PatientId
LEFT JOIN TransferInOnART e ON a.ptn_pk = e.PatientPK
WHERE d.PatientId IS NULL

OPEN @C

FETCH NEXT FROM @C INTO 
@PersonID,
@PatientID,
@HIVTestDate,
@RegistrationDate,
@StartARTDate,
@StartRegimen,
@TransferInFrom,
@MFLCode,
@TransferIn

WHILE @@FETCH_STATUS = 0
BEGIN


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
				, 0
				, 2
				, GETDATE(), 0, 1, NULL);

	SELECT @PatientMasterVisitID = IDENT_CURRENT(''PatientMasterVisit'')

	INSERT INTO PatientHivDiagnosis
				 (PatientMasterVisitId
				 , PatientId
				 , HIVDiagnosisDate
				 , EnrollmentDate
				 , EnrollmentWHOStage
				 , ARTInitiationDate
				 , DeleteFlag
				 , CreatedBy
				 , CreateDate
				 , AuditData)
				 VALUES
				 (@PatientMasterVisitID
				 , '+@PatientID+'
				 , CASE WHEN '''+@HIVTestDate+''' = '''' THEN NULL ELSE CAST('''+@HIVTestDate+''' AS DATETIME) END
				 , CAST('''+@RegistrationDate+''' AS DATETIME)
				 , 0 --TODO
				 , CASE WHEN '''+@StartARTDate+''' = '''' THEN NULL ELSE CAST('''+@StartARTDate+''' AS DATETIME) END
				 , 0 , 1, GETDATE(), NULL);


	IF ('''+@TransferIn+''' != '''')
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
				,CASE WHEN '''+@TransferInFrom+''' = '''' THEN ''Not Documented'' ELSE '''+@TransferInFrom+''' END
				,CASE WHEN '''+@MFLCode+''' = '''' THEN ''99999'' ELSE '''+@MFLCode+''' END
				,''48''
				,'''+@StartRegimen+''' --Transfer In Notes
				,0
				,1
				,GETDATE()
				,NULL);
				')

	FETCH NEXT FROM @C INTO 
	@PersonID,
@PatientID,
@HIVTestDate,
@RegistrationDate,
@StartARTDate,
@StartRegimen,
@TransferInFrom,
@MFLCode,
@TransferIn

END

CLOSE @C
DEALLOCATE @C



SET CONCAT_NULL_YIELDS_NULL ON
GO
USE IQCareV4
GO

IF EXISTS(Select * FROM sys.views 
where name = N'CCCPatientsBeingMigrated')
DROP VIEW CCCPatientsBeingMigrated
GO

CREATE VIEW CCCPatientsBeingMigrated AS (
SELECT 
a.Ptn_pk
, c.Name Sex
, a.CreateDate
, a.DOB
, a.DobPrecision
, regCCC.RegistrationAtCCC
 FROM mst_Patient a

 INNER JOIN (Select a.Ptn_pk
	, MAX(e.FacilityName) f
	, Coalesce(Min(Case When c.ModuleName = 'HIVCARE-STATICFORM' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End) 
	,Min(Case When c.ModuleName = 'CCC Patient Card MoH 257' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,Min(Case When c.ModuleName = 'Paediatric ART' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,MIN(Case When c.ModuleName = 'Comprehensive Care Clinic' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)) RegistrationAtCCC

	From Lnk_PatientProgramStart a 
	LEFT JOIN Lnk_PatientReEnrollment b ON a.Ptn_pk = b.Ptn_Pk AND a.ModuleId = b.ModuleId 		
	LEFT join mst_module c on a.ModuleId = c.ModuleID
	INNER JOIN mst_Patient d ON a.Ptn_Pk = d.Ptn_Pk
	INNER JOIN mst_Facility e ON d.LocationID = e.FacilityID
	WHERE e.FacilityName NOT LIKE '%transit%'
	AND e.FacilityName NOT LIKE '%pep%'
	AND e.FacilityName NOT LIKE '%probation%'
	Group By a.Ptn_pk) regCCC ON a.Ptn_Pk = regCCC.Ptn_pk
LEFT JOIN mst_Decode c ON a.Sex = c.ID
Where 
a.DeleteFlag = 0
AND regCCC.RegistrationAtCCC IS NOT NULL
AND COALESCE(CAST(a.PatientEnrollmentID as VARCHAR(1000))
, CAST(a.PatientClinicID as VARCHAR(1000))) IS NOT NULL)

GO

USE IQCareV1
GO

IF EXISTS(Select * FROM sys.views 
where name = N'CCCPatientsBeingMigrated')
DROP VIEW CCCPatientsBeingMigrated
GO

CREATE VIEW CCCPatientsBeingMigrated AS (
SELECT 
a.Ptn_pk
, c.Name Sex
, a.CreateDate
, a.DOB
, a.DobPrecision
, regCCC.RegistrationAtCCC
 FROM mst_Patient a

 INNER JOIN (Select a.Ptn_pk
	, MAX(e.FacilityName) f
	, Coalesce(Min(Case When c.ModuleName = 'HIVCARE-STATICFORM' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End) 
	,Min(Case When c.ModuleName = 'CCC Patient Card MoH 257' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,Min(Case When c.ModuleName = 'Paediatric ART' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)
	,MIN(Case When c.ModuleName = 'Comprehensive Care Clinic' 
	Then COALESCE(b.OldEnrollDate, a.StartDate) Else Null End)) RegistrationAtCCC

	From Lnk_PatientProgramStart a 
	LEFT JOIN Lnk_PatientReEnrollment b ON a.Ptn_pk = b.Ptn_Pk AND a.ModuleId = b.ModuleId 		
	LEFT join mst_module c on a.ModuleId = c.ModuleID
	INNER JOIN mst_Patient d ON a.Ptn_Pk = d.Ptn_Pk
	INNER JOIN mst_Facility e ON d.LocationID = e.FacilityID
	WHERE e.FacilityName NOT LIKE '%transit%'
	AND e.FacilityName NOT LIKE '%pep%'
	AND e.FacilityName NOT LIKE '%probation%'
	Group By a.Ptn_pk) regCCC ON a.Ptn_Pk = regCCC.Ptn_pk
LEFT JOIN mst_Decode c ON a.Sex = c.ID
Where 
a.DeleteFlag = 0
AND regCCC.RegistrationAtCCC IS NOT NULL
AND COALESCE(CAST(a.PatientEnrollmentID as VARCHAR(1000))
, CAST(a.PatientClinicID as VARCHAR(1000))) IS NOT NULL)

GO

USE IQCareV4
GO

IF EXISTS(Select * FROM sys.views where name = N'CCCEncountersBeingMigrated')
DROP VIEW CCCEncountersBeingMigrated
GO

CREATE VIEW CCCEncountersBeingMigrated 
AS
Select 
a.Ptn_Pk
, case when a.visitdate > getdate() 
	then cast(a.CreateDate as date) 
	else cast(a.VisitDate as date) 
	end as VisitDate
, MIN(CAST(a.CreateDate as date)) CreateDate
FROM 
ord_Visit a
INNER JOIN mst_VisitType b ON a.VisitType = b.VisitTypeID
Where 
(a.DeleteFlag = 0 OR a.DeleteFlag iS NULL)
AND a.VisitType NOT IN (0,4,5,6,12,18,19)
AND b.VisitName NOT IN 
('Contact Tracking Form'
,'Councelling'
,'HEI Follow Up Card'
,'HEI Part II'
,'HTS Lab Form'
,'Laboratory Results'
,'Maternal and Exposed Infant I'
,'Maternal And Exposed Infant II'
,'Maternal And Exposed Infant III'
,'TB Initial and Continuation Phase'
,'TB Patient Profile'
,'Adolescent and Youth Psychosocial form'
,'Cervical Cancer Screening Form'
,'HIVCE - Alcohol Depression Screening'
,'HIVCE - ART Readiness Assessment'
,'HIVCE - Treatment Preparation')
AND b.VisitName NOT LIKE '%enrollment%'
AND YEAR(visitdate) >= 2000
GROUP BY 
ptn_pk
, case when a.visitdate > getdate() 
	then cast(a.CreateDate as date) 
	else cast(a.VisitDate as date) 
	end	
GO	
	
USE IQCareV1
GO

IF EXISTS(Select * FROM sys.views where name = N'CCCEncountersBeingMigrated')
DROP VIEW CCCEncountersBeingMigrated
GO

CREATE VIEW CCCEncountersBeingMigrated 
AS
Select 
a.Ptn_Pk
, case when a.visitdate > getdate() 
	then cast(a.CreateDate as date) 
	else cast(a.VisitDate as date) 
	end as VisitDate
, MIN(CAST(a.CreateDate as date)) CreateDate
FROM 
ord_Visit a
INNER JOIN mst_VisitType b ON a.VisitType = b.VisitTypeID
Where 
(a.DeleteFlag = 0 OR a.DeleteFlag iS NULL)
AND a.VisitType NOT IN (0,4,5,6,12,18,19)
AND b.VisitName NOT IN 
('Contact Tracking Form'
,'Councelling'
,'HEI Follow Up Card'
,'HEI Part II'
,'HTS Lab Form'
,'Laboratory Results'
,'Maternal and Exposed Infant I'
,'Maternal And Exposed Infant II'
,'Maternal And Exposed Infant III'
,'TB Initial and Continuation Phase'
,'TB Patient Profile'
,'Adolescent and Youth Psychosocial form'
,'Cervical Cancer Screening Form'
,'HIVCE - Alcohol Depression Screening'
,'HIVCE - ART Readiness Assessment'
,'HIVCE - Treatment Preparation')
AND b.VisitName NOT LIKE '%enrollment%'
AND YEAR(visitdate) >= 2000
GROUP BY 
ptn_pk
, case when a.visitdate > getdate() 
	then cast(a.CreateDate as date) 
	else cast(a.VisitDate as date) 
	end
GO
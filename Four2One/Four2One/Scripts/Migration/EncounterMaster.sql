INSERT INTO [dbo].[PatientMasterVisit]
           ([PatientId]
           ,[ServiceId]
           ,[Start]
           ,[End]
           ,[Active]
           ,[VisitDate]
           ,[VisitScheduled]
           ,[VisitBy]
           ,[VisitType]
           ,[Status]
           ,[CreateDate]
           ,[DeleteFlag]
           ,[CreatedBy]
           )
			Select distinct
			c.Id PatientId
			, 1 ServiceId
			, case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end as Starting
			, case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end Ending
			, 0 Active
			, case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end as VisitDate
			, MAX(ISNULL(k.Scheduled,0)) VisitScheduled
			, MAX(CASE WHEN COALESCE(i.Name, j.Name) = 'TS - Treatment Supporter' 
					THEN 112 ELSE 111 END) AS VisitBy
			, 0 VisitType
			, 2 Status
			, MIN(ISNULL(CAST(a.CreateDate as date),a.VisitDate)) CreateDate
			, 0 DeleteFlag
			, 1 CreatedBy

			FROM 
			ord_Visit a
			INNER JOIN mst_VisitType b ON a.VisitType = b.VisitTypeID
			INNER JOIN Patient c on a.Ptn_Pk = c.ptn_pk
			LEFT JOIN PatientMasterVisit d ON c.Id = d.PatientId 
				AND cast(a.VisitDate as date) = cast(d.VisitDate as date)
				AND d.VisitType = 0
			LEFT JOIN mst_BlueDecode i ON a.TypeOfVisit = i.ID
			LEFT JOIN mst_PMTCTDecode j ON a.TypeOfVisit = j.ID
			LEFT JOIN dtl_PatientARTEncounter k ON a.Visit_Id = k.Visit_Id AND a.Ptn_Pk = k.Ptn_Pk
			Where 
			(a.DeleteFlag = 0 OR a.DeleteFlag iS NULL)
			AND a.VisitType NOT IN (0,5,12,18,19)
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
			AND YEAR(a.visitdate) >= 2000
			and d.Id is null
			GROUP BY c.Id
			,  case when a.visitdate > getdate() 
				then cast(a.CreateDate as date) 
				else cast(a.VisitDate as date) 
				end 

INSERT INTO ComplaintsHistory
Select distinct 
a.PatientId
, a.Id
, '' PresentingComplaint
, NULL 
, 0
, a.CreatedBy
, a.CreateDate
, NULL
, 0
FROM PatientMasterVisit a LEFT JOIN
ComplaintsHistory b ON a.Id = b.PatientMasterVisitId
Where b.PatientMasterVisitId IS NULL
GO


declare @clinicalEncounter varchar(50) = (select top 1 Id from lookupitem where Name = 'ccc-encounter');
insert into PatientEncounter 
select a.patientid, @clinicalEncounter, a.Id, a.Start, a.Start, 203, 0, 1, a.createdate, null, 0 
from patientmastervisit a where visitby > 0 
and not exists (select 1 from PatientEncounter where PatientId = a.patientid 
and encountertypeid=@clinicalEncounter and patientmastervisitid = a.Id)
GO
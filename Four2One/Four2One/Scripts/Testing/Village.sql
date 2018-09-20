-- Village Testing Scripts
With V4Patients AS (
select p.Ptn_Pk V4_Ptn_pk,
p.VillageName V4_Village_Code,
v.Name V4_Village
from [IQCareV4].[dbo].[mst_Patient] p 
left join [IQCareV4].[dbo].[mst_Village] v on p.VillageName=v.ID  
inner join CCCPatientsBeingMigrated z ON p.Ptn_Pk = z.ptn_Pk
) 

, V1Patients AS (
select p.Ptn_Pk V1_Ptn_pk,
pl.Village V1_Village 
from [IQCareV1].[dbo].[Person] p inner join [IQCareV1].[dbo].[PersonLocation] pl on p.id=pl.PersonId  )



, LineList AS (
SELECT a.V4_Ptn_pk, a.V4_Village, b.V1_Village 
, CASE WHEN  a.V4_Village <>  b.V1_Village  THEN 1 ELSE 0 END as DoesNotMatch
FROM 
V4Patients a LEFT JOIN V1Patients b ON a.V4_Ptn_pk = b.V1_Ptn_pk)

Select 
'Village' DataElement
,COUNT(V4_Ptn_pk) Total
,SUM(DoesNotMatch) DoesNotMatch 
FROM LineList
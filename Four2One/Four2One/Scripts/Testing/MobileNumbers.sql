Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw==';
With V4Patients AS (
select a.Ptn_Pk
,Convert(varchar(500), Decryptbykey(Phone)) Phone
from [IQCareV4].[dbo].[mst_Patient] a
INNER JOIN CCCPatientsBeingMigrated b ON a.Ptn_Pk = b.Ptn_Pk
) 

, V1Patients AS (
select p.Ptn_Pk
, Convert(varchar(500), Decryptbykey(MobileNumber)) MobileNumber 
from [IQCareV1].[dbo].[Person] p 
inner join [IQCareV1].[dbo].[PersonContact] pc on p.Id=pc.PersonId  )

, LineList AS (
SELECT a.Ptn_Pk 
, CASE WHEN a.Phone <> b.MobileNumber THEN 1 ELSE 0 END AS DoesNotMatch

FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_Pk = b.Ptn_Pk)

Select 'Mobile Phone Numbers' DataElement
, COUNT(a.Ptn_Pk) Total
, SUM(DoesNotMatch)DoesNotMatch
FROM LineList a
close symmetric key Key_CTC 

/*Postal Address Testing Script
Test if all records in V4 have been moved to V1
VO-11/09/2018*/
Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw==';


With V4Patients AS (
select a.Ptn_Pk
, Convert(varchar(500), Decryptbykey([Address])) PhysicalAddress
from IQCareV4.dbo.CCCPatientsBeingMigrated a INNER JOIN mst_patient b ON
a.ptn_pk=b.ptn_pk )

, V1Patients AS (
select b.Ptn_Pk
, Convert(varchar(500), Decryptbykey(a.[PhysicalAddress])) PhysicalAddress
from PersonContact a INNER JOIN Person b on a.PersonId=b.Id)

, LineList AS (
SELECT a.Ptn_pk
, CASE WHEN a.PhysicalAddress <> b.PhysicalAddress THEN 1 ELSE 0 END as DoesNotMatch
FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_Pk = b.Ptn_Pk)

Select 
'Physical Address' DataElement
,COUNT(Ptn_Pk) Total
,SUM(DoesNotMatch) DoesNotMatch 
FROM LineList

--WHERE a.PhysicalAddress <> b.PhysicalAddress

CLOSE symmetric key Key_CTC
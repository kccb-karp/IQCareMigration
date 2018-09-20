Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw==';
With V4Patients AS (
select 
	a. ptn_pk,	[ID/PassportNo]
from Mst_Patient b
inner join IQCareV4.dbo.CCCPatientsBeingMigrated a on a.Ptn_pk = b.Ptn_Pk),

V1Patients AS (SELECT ptn_pk,
		Convert(varchar(50), Decryptbykey([NationalId])) NationaID
	 FROM IQCareV1.dbo.Patient p),

LineList AS (
SELECT a.Ptn_pk
, CASE WHEN a.[ID/PassportNo] <> b.NationaID THEN 1 ELSE 0 END as DoesNotMatch
FROM 
V4Patients a LEFT JOIN V1Patients b ON a.Ptn_Pk = b.Ptn_Pk)

Select 
'National/Passport ID' DataElement
,COUNT(Ptn_Pk) Total
,SUM(DoesNotMatch) DoesNotMatch 
FROM LineList
go

close symmetric key Key_CTC
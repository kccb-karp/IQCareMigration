IF  EXISTS (SELECT * FROM sys.objects WHERE object_id 
= OBJECT_ID(N'[dbo].[sp_PatientManagement_GetTreatmentSupporter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].sp_PatientManagement_GetTreatmentSupporter
GO

CREATE PROC sp_PatientManagement_GetTreatmentSupporter(@patientId int) as
begin

select a.PersonId
, convert(varchar(100), decryptbykey(b.FirstName)) + ' ' + convert(varchar(100), decryptbykey(b.LastName )) TreatmentSupporterName
, convert(varchar(100), decryptbykey(a.MobileContact)) TreatmentSupporterPhoneNumber 
from PatientTreatmentSupporter a inner join Person b on a.SupporterId = b.Id
inner join Patient c on a.PersonId = c.PersonId
where c.id = @patientId
end


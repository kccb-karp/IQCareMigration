IF NOT EXISTS(select Code from Identifiers where Code = N'PatientClinicId')
BEGIN
	INSERT INTO Identifiers([Name],Code,DisplayName,DataType,IdentifierType,CreatedBy,CreateDate)
	VALUES
	(N'Patient Clinic ID',N'PatientClinicId',N'Clinic ID',N'Numeric',1,1,GETDATE());


	insert into ServiceAreaIdentifiers
	(ServiceAreaId
	, IdentifierId
	, RequiredFlag)
	VALUES
	((select Id from ServiceArea WHERE Code = N'CCC')
	,(select Id from Identifiers Where Code = N'PatientClinicId')
	,0);
END

/*  UPDATE Identifiers SET DisplayName = 'Patient Clinic ID'
, DataType = 'Text'
, Code = 'PatientClinicId'
, [Name] = 'Patient Clinic ID'
WHERE Id = 6
GO

INSERT INTO ServiceAreaIdentifiers
(ServiceAreaId, IdentifierId, RequiredFlag)
VALUES
(1, 6, 0)
GO
*/


INSERT INTO PatientIdentifier(PatientId
, PatientEnrollmentId
, IdentifierTypeId
, IdentifierValue
, CreatedBy
, CreateDate
, Active
)
select b.Id PatientId
, d.Id EnrollmentId
, (select id from Identifiers where Code = 'PatientClinicId') IdentifierTypeId
, LTRIM(RTRIM(PatientClinicID))IdentifierValue 
, 1
, getdate()
, 1
from mst_Patient a INNER JOIN Patient b ON a.Ptn_Pk = b.ptn_pk
left join PatientIdentifier c on b.Id = c.PatientId and c.IdentifierTypeId = (select id from Identifiers where Code = 'PatientClinicId')
inner join PatientEnrollment d on b.Id = d.PatientId and d.ServiceAreaId = (select id from ServiceArea where Code = 'CCC')
where a.PatientClinicID is not null
and a.PatientClinicID != ''
and c.Id is null;

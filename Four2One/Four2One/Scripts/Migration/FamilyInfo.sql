IF EXISTS(Select * FROM sys.tables where name = N'PersonRelationship')
BEGIN
DROP TABLE PersonRelationship;

CREATE TABLE [dbo].[PersonRelationship](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[RelationshipTypeId] [int] NOT NULL,
	[BaselineResult] [int] NULL,
	[BaselineDate] [datetime] NULL,
	[FamilyInfoId] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	IndexPersonId int null,
	[AuditData] [xml] NULL

 CONSTRAINT [PK_PersonRelationship] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

ALTER TABLE [dbo].[PersonRelationship]  
WITH CHECK ADD  CONSTRAINT [FK_PersonRelationship_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id]);

ALTER TABLE [dbo].[PersonRelationship] 
ADD  CONSTRAINT [DF_PersonRelationship_Void]  DEFAULT ((0)) FOR [DeleteFlag];

ALTER TABLE [dbo].[PersonRelationship] 
ADD  CONSTRAINT [DF_PersonRelationship_CreateDate]  DEFAULT (getdate()) FOR [CreateDate];

ALTER TABLE [dbo].[PersonRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationship_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id]);

ALTER TABLE [dbo].[PersonRelationship] CHECK CONSTRAINT [FK_PersonRelationship_Person];

END

declare @patientid int
, @ptn_pk int
, @sexid int
, @dob datetime
, @relationshiptypeid int
, @baselineresult int
, @createdate datetime
, @firstname varchar(1000)
, @lastname varchar(1000)
, @newpersonid int
, @personid int


Open symmetric key Key_CTC decryption by password='ttwbvXWpqb5WOLfLrBgisw=='
DECLARE @C as cursor
Set @C =  CURSOR FOR


select distinct 
e.Id PatientId
, a.Ptn_pk
, CASE b.Sex WHEN 'Male' THEN 51 ELSE 52 End AS SexID
, DATEADD(yy, -1*AgeYear, COALESCE(a.CreateDate, b.RegistrationAtCCC)) DOB
--, c.[Name] RelationshipType
, CASE WHEN c.[Name] = 'Parent' and b.Sex = 'Male' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Father')
		WHEN c.[Name] = 'Parent' and b.Sex = 'Female' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Mother')
		WHEN c.[Name] = 'Aunt/Uncle' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Brother/Sister' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Sibling')
		WHEN c.[Name] = 'Child' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Child')
		WHEN c.[Name] = 'Cousin' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'GrandChild' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'GrandParent' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Niece/Nephew' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Not Family' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Other' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Spouse/Partner' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Partner')
		ELSE (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
END AS RelationTypeId
	, CASE 
		WHEN d.[Name] LIKE '%positive%' 
			THEN (select top 1  LookupItemId from LookupMasterItem 
			WHERE LookupMasterId = (SELECT Id FROM LookupMaster
				where name = 'BaseLineHivStatus') and DisplayName = 'Tested Positive')
		WHEN d.[Name] LIKE '%negative%' 
			THEN (select top 1  LookupItemId from LookupMasterItem 
			WHERE LookupMasterId = (SELECT Id FROM LookupMaster
				where name = 'BaseLineHivStatus') and DisplayName = 'Tested Negative')

ELSE (select top 1  LookupItemId from LookupMasterItem 
			WHERE LookupMasterId = (SELECT Id FROM LookupMaster
				where name = 'BaseLineHivStatus') and DisplayName = 'Unknown') 
	END AS BaselineResult
, COALESCE(a.CreateDate, b.RegistrationAtCCC) CreateDate
, Convert(varchar(100), Decryptbykey(RFirstName)) FirstName
, Convert(varchar(100), Decryptbykey(RLastName)) LastName

from dtl_FamilyInfo a inner join CCCPatientsBeingMigrated b ON a.Ptn_pk = b.Ptn_pk
inner join mst_RelationshipType c ON a.RelationshipType = c.ID
inner join mst_Decode d ON a.HivStatus = d.Id 
inner join Person f ON a.Ptn_pk = f.Ptn_Pk
inner join Patient e on f.Id = e.PersonId

where a.DeleteFlag = 0
and a.ReferenceId is null

open @c
fetch next from @c into @patientid, @ptn_pk, @sexid, @dob, @relationshiptypeid, @baselineresult, @createdate, @firstname, @lastname
while @@FETCH_STATUS = 0
begin
insert into person (FirstName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy, DateOfBirth, DobPrecision)
values
(ENCRYPTBYKEY(KEY_GUID('Key_CTC'), @firstname)
, ENCRYPTBYKEY(KEY_GUID('Key_CTC'), @lastname)
, @sexid
, 1
,0
, @createdate
, 4210, @dob, 0);

select @newpersonid = IDENT_CURRENT('Person');

insert into PersonRelationship(PatientId, PersonId, RelationshipTypeId, BaselineResult, CreateDate, CreatedBy, DeleteFlag)
values
(@patientid, @newpersonid, @relationshiptypeid, @baselineresult, @createdate, 4210, 0);


fetch next from @c into @patientid, @ptn_pk, @sexid, @dob, @relationshiptypeid, @baselineresult, @createdate, @firstname, @lastname
end
close @c
deallocate @c

close symmetric key Key_CTC;


Set @C =  CURSOR FOR
select distinct 
 e.Id PatientId
, g.Id PersonId
, CASE WHEN c.[Name] = 'Parent' and b.Sex = 'Male' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Father')
		WHEN c.[Name] = 'Parent' and b.Sex = 'Female' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Mother')
		WHEN c.[Name] = 'Aunt/Uncle' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Brother/Sister' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Sibling')
		WHEN c.[Name] = 'Child' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Child')
		WHEN c.[Name] = 'Cousin' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'GrandChild' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'GrandParent' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Niece/Nephew' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Not Family' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Other' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
		WHEN c.[Name] = 'Spouse/Partner' THEN (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Partner')
		ELSE (select top 1  ItemId from LookupItemView where MasterName = 'Relationship' and ItemName = 'Other')
END AS RelationTypeId
, COALESCE(a.CreateDate, b.RegistrationAtCCC) CreateDate


from dtl_FamilyInfo a inner join CCCPatientsBeingMigrated b ON a.Ptn_pk = b.Ptn_pk
inner join mst_RelationshipType c ON a.RelationshipType = c.ID
inner join Person f ON a.Ptn_pk = f.Ptn_Pk
inner join Patient e on f.Id = e.PersonId
inner join Person g on a.ReferenceId = g.Ptn_Pk
where a.DeleteFlag = 0
and a.ReferenceId is not null
and a.Ptn_pk != a.ReferenceId

open @c
fetch next from @c into @patientid, @personid, @relationshiptypeid, @createdate
while @@FETCH_STATUS = 0
begin

insert into PersonRelationship(PatientId, PersonId, RelationshipTypeId, CreateDate, CreatedBy, DeleteFlag)
values
(@patientid, @personid, @relationshiptypeid, @createdate, 4210, 0);


fetch next from @c into @patientid, @personid, @relationshiptypeid, @createdate
end
close @c
deallocate @c
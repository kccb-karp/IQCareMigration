If Not Exists (Select * From sys.columns Where Name = N'HEIIDNumber' And Object_ID = Object_id(N'mst_Patient'))    
Begin
  Alter table dbo.mst_Patient Add HEIIDNumber varchar(50) Null
End
Go

If Not Exists (Select * From sys.columns Where Name = N'PatientFacilityId' And Object_ID = Object_id(N'mst_Patient'))    
Begin
  Alter table dbo.mst_Patient Add PatientFacilityId  varchar(50) Null
End
Go
If Not Exists (Select * From sys.columns Where Name = N'MovedToPatientTable' And Object_ID = Object_id(N'mst_Patient'))    
Begin
  Alter table dbo.mst_Patient Add MovedToPatientTable  bit not null Constraint DF_mst_Patient_MovedToPatientTable Default 0
End
Go


If Not Exists (Select * From sys.columns Where Name = N'RegisteredAtPharmacy' And Object_ID = Object_id(N'mst_Patient'))    
Begin
  Alter table dbo.mst_Patient Add RegisteredAtPharmacy  int not null Constraint DF_mst_Patient_RegisteredAtPharmacy Default 0
End
Go

If Not Exists (Select * From sys.columns Where Name = N'ServiceRegisteredForAtPharmacy' And Object_ID = Object_id(N'mst_Patient'))    
Begin
  Alter table dbo.mst_Patient Add ServiceRegisteredForAtPharmacy  int not null Constraint DF_mst_Patient_ServiceRegisteredForAtPharmacy Default 0
End
Go

If Not Exists (Select * From sys.columns Where Name = N'DateOfDeath' And Object_ID = Object_id(N'mst_Patient'))    
Begin
  Alter table dbo.mst_Patient Add DateOfDeath  datetime Null
End
Go
If Not Exists (Select * From sys.columns Where Name = N'LandMark' And Object_ID = Object_id(N'mst_Patient'))    
Begin
  Alter table dbo.mst_Patient Add LandMark  varchar(50) Null
End
Go



-- Drop column Zero
If  Exists (Select * From sys.columns Where Name = N'0' And Object_ID = Object_id(N'mst_patient'))    
Begin
  Alter table dbo.mst_patient drop Column [0]  
End
Go
-- Change all identifier columns to varchar(50) 
declare @T Table(fieldname varchar(50)); 
declare @F varchar(50), @query varchar (700);

Insert Into @T
Select I.FieldName
From mst_PatientIdentifier I;

While ((Select Count(*) From @T) > 0)
Begin
	Select Top 1 @f=  fieldname From @T;
	
	If Exists (Select name	From syscolumns	Where name = @f	And Object_name(id) = 'mst_patient') 
	Begin
		Select @query ='ALTER TABLE mst_patient Alter Column [' + @f + '] varchar(50)';
		Exec (@query);
	End
	Delete From @T where fieldname=@f;
End

Go



If Exists (Select * From sys.columns Where Name = N'DeleteFlag'  And Object_ID = Object_id(N'mst_Patient') And system_type_id=TYPE_ID('int'))    Begin
	If Exists(SELECT * FROM sys.default_constraints WHERE  parent_object_id = OBJECT_ID('dbo.mst_Patient') And name='DF_mst_Patient_DeleteFlag') Begin 
		Alter table [mst_Patient] Drop CONSTRAINT DF_mst_Patient_DeleteFlag 

	End
End
Go
If Exists (Select * From sys.columns Where Name = N'DeleteFlag'  And Object_ID = Object_id(N'mst_Patient') And system_type_id=TYPE_ID('int'))    Begin
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_Patient]') AND name = N'NCI_MSTPatient_DeleteFlag')
	DROP INDEX [NCI_MSTPatient_DeleteFlag] ON [dbo].[mst_Patient] WITH ( ONLINE = OFF )
End
GO

If Exists (Select * From sys.columns Where Name = N'DeleteFlag'  And Object_ID = Object_id(N'mst_Patient') And system_type_id=TYPE_ID('int'))    Begin
	Alter table dbo.[mst_Patient] Alter Column [DeleteFlag] bit
End
Go


IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'RegisteredAtPharmacy'AND Object_ID = OBJECT_ID(N'mst_patient'))
    BEGIN
        ALTER TABLE mst_patient ADD RegisteredAtPharmacy int;
    END;
	
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ServiceRegisteredForAtPharmacy'AND Object_ID = OBJECT_ID(N'mst_patient'))
    BEGIN
        ALTER TABLE mst_patient ADD ServiceRegisteredForAtPharmacy int;
    END;



--  Table Changes specific to PSMART

IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'CardSerialNumber'
          AND Object_ID = Object_ID(N'schemaName.mst_Patient'))
BEGIN
    -- Column Exists
	ALTER TABLE mst_Patient 
		ADD  CardSerialNumber varchar(60) null
END

IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'HTSID'
          AND Object_ID = Object_ID(N'schemaName.mst_Patient'))
BEGIN
    -- Column Exists
	ALTER TABLE mst_Patient 
		ADD  HTSID varchar(60) null
END
Go
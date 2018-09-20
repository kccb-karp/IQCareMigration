If Exists(SELECT * FROM sys.triggers WHERE parent_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') 
and name ='TrDBAudit_dtl_PatientAppointment')
BEGIN
	DROP TRIGGER [dbo].[TrDBAudit_dtl_PatientAppointment]
END
If Exists(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') 
and name ='dta_index_dtl_PatientAppointment_PtnPK_AppStatus_AppDate_DeleteFlag')
BEGIN
	DROP INDEX [dta_index_dtl_PatientAppointment_PtnPK_AppStatus_AppDate_DeleteFlag] ON [dbo].[dtl_PatientAppointment]
END
If Exists(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') and name ='IX_PatientAppointment_PtnPk_OT')
DROP INDEX [IX_PatientAppointment_PtnPk_OT] ON [dbo].[dtl_PatientAppointment]
GO
If Exists(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') and name ='NCI_DTL_PatientAppointment_VisitPK_INC')
DROP INDEX [NCI_DTL_PatientAppointment_VisitPK_INC] ON [dbo].[dtl_PatientAppointment]
GO

IF  Exists (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') AND name = N'NCI_DTL_PatientAppointment_DeleteFlag_INC')
DROP INDEX [NCI_DTL_PatientAppointment_DeleteFlag_INC] ON [dbo].[dtl_PatientAppointment] WITH ( ONLINE = OFF )
GO
IF  Exists (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') AND name = N'NCI_Appointment_LocStatus')
DROP INDEX [NCI_Appointment_LocStatus] ON [dbo].[dtl_PatientAppointment] WITH ( ONLINE = OFF )
GO
IF  Exists (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') AND name = N'NCI_dtlAppointment_status')
DROP INDEX [NCI_dtlAppointment_status] ON [dbo].[dtl_PatientAppointment] WITH ( ONLINE = OFF )
GO
IF  Exists (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') AND name = N'NCI_Appointment_Ptn_Stat_Date_DelFlag')
DROP INDEX [NCI_Appointment_Ptn_Stat_Date_DelFlag] ON [dbo].[dtl_PatientAppointment] WITH ( ONLINE = OFF )
GO
IF  Exists (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientAppointment]') AND name = N'NCI_DTL_PatientAppointment_PK_INC')
DROP INDEX [NCI_DTL_PatientAppointment_VisitPK_INC] ON [dbo].[dtl_PatientAppointment] WITH ( ONLINE = OFF )
GO

--delete from dtl_PatientAppointment where AppDate is null or appstatus is null or userid is null
--Go
DELETE FROM dtl_PatientAppointment WHERE YEAR(AppDate) = 1900 OR AppDate IS NULL
GO
UPDATE dtl_PatientAppointment SET AppStatus = 0 WHERE AppStatus IS NULL
GO
UPDATE dtl_PatientAppointment SET UserId = 1 WHERE UserId IS NULL
GO



If  Exists (Select * From sys.columns Where Name = N'AppDate' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
  Alter table dbo.dtl_PatientAppointment Alter Column AppDate  datetime Not  Null
End
GO
If  Exists (Select * From sys.columns Where Name = N'AppStatus' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
  Alter table dbo.dtl_PatientAppointment Alter Column AppStatus  int Not  Null
End
GO
If Not Exists (Select * From sys.columns Where Name = N'ModuleId' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
  Alter table dbo.dtl_PatientAppointment Add ModuleId  int Null
End
GO
If Not Exists (Select * From sys.columns Where Name = N'AppNote' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
  Alter table dbo.dtl_PatientAppointment Add AppNote  varchar(250) Null
End
GO
If Not Exists (Select * From sys.columns Where Name = N'UpdateUserId' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
  Alter table dbo.dtl_PatientAppointment Add UpdateUserId  int Null
End
GO


If  Exists (Select * From sys.columns Where Name = N'UserId' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
  Alter table dbo.dtl_PatientAppointment Alter Column UserId  int Not  Null
End
Go
If  Exists (Select * From sys.columns Where Name = N'CreateDate' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
  Alter table dbo.dtl_PatientAppointment Alter Column CreateDate  datetime  Null
End
Go
If  Exists (Select * From sys.columns Where Name = N'DeleteFlag' And Object_ID = Object_id(N'dtl_PatientAppointment'))    
Begin
 Update dbo.dtl_PatientAppointment Set DeleteFlag = 0 Where DeleteFlag Is null  
End
Go

If  Exists (Select 1      from sys.all_columns c join sys.tables t on t.object_id = c.object_id join sys.schemas s on s.schema_id = t.schema_id join sys.default_constraints d on c.default_object_id = d.object_id
		where t.name ='dtl_PatientAppointment'    And c.name = 'deleteflag')
      Begin
		Alter table [dtl_PatientAppointment] Drop CONSTRAINT DF_dtl_PatientAppointment_DeleteFlag 
	 End
Go

If  Exists (Select * From sys.columns Where Name = N'DeleteFlag' And Object_ID = Object_id(N'dtl_PatientAppointment') And  system_type_id=TYPE_ID('int'))    
Begin
  Alter table dbo.dtl_PatientAppointment Alter Column DeleteFlag  bit Not  Null
End
Go	 
	If Not Exists (Select 1      from sys.all_columns c join sys.tables t on t.object_id = c.object_id join sys.schemas s on s.schema_id = t.schema_id join sys.default_constraints d on c.default_object_id = d.object_id
		where t.name ='dtl_PatientAppointment'    And c.name = 'deleteflag')
      Begin
		Alter table [dtl_PatientAppointment] ADD CONSTRAINT DF_dtl_PatientAppointment_DeleteFlag DEFAULT 0 FOR DeleteFlag
	 End
Go
CREATE NONCLUSTERED INDEX [NCI_DTL_PatientAppointment_VisitPK_INC] ON [dbo].[dtl_PatientAppointment]
(
	[Visit_pk] ASC,
	[DeleteFlag] ASC
)
INCLUDE ( 	[AppDate],
	[AppReason]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PatientAppointment_PtnPk_OT] ON [dbo].[dtl_PatientAppointment]
(
	[Ptn_pk] ASC,
	[AppStatus] ASC,
	[DeleteFlag] ASC,
	[AppDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


IF Not Exists (SELECT * FROM sys.columns WHERE Name = 'AppointmentId' AND object_id = OBJECT_ID('dbo.dtl_PatientAppointment'))
    ALTER TABLE dbo.dtl_PatientAppointment Add AppointmentId int Identity(1,1);
GO

IF EXISTS(SELECT * FROM sys.key_constraints WHERE type = 'PK' 
AND parent_object_id = OBJECT_ID('dbo.dtl_PatientAppointment') 
AND Name = 'PK_dtl_patient_appointments')

Begin
		Alter table [dtl_PatientAppointment] 
		Drop CONSTRAINT PK_dtl_patient_appointments 
End

IF Not Exists 

(SELECT * FROM sys.key_constraints WHERE type = 'PK' 
AND parent_object_id = OBJECT_ID('dbo.dtl_PatientAppointment') 
AND Name = 'PK_dtl_PatientAppointment')
   ALTER TABLE [dbo].[dtl_PatientAppointment] ADD  CONSTRAINT [PK_dtl_PatientAppointment] PRIMARY KEY CLUSTERED 
	(
	[AppointmentID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO
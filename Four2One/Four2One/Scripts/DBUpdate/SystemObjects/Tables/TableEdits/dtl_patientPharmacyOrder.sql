IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'pillCount'AND Object_ID = OBJECT_ID(N'dtl_patientPharmacyOrder'))
    BEGIN
        ALTER TABLE dtl_patientPharmacyOrder ADD pillCount int;
    END;

If Not Exists (Select * From sys.columns Where Name = N'Id' And Object_ID = Object_id(N'dtl_PatientPharmacyOrder'))    
Begin
  Alter table dbo.dtl_PatientPharmacyOrder Add Id int Not Null Identity(1,1)
End
Go

If Not Exists (Select * From sys.columns Where Name = N'WhyPartial' And Object_ID = Object_id(N'Dtl_PatientPharmacyOrder'))    
Begin
  Alter table dbo.Dtl_PatientPharmacyOrder Add WhyPartial  varchar(250) Null
End
Go

 If Not Exists (Select * From sys.columns Where Name = N'ScheduleId' And Object_ID = Object_id(N'Dtl_PatientPharmacyOrder'))    
Begin
  Alter table dbo.Dtl_PatientPharmacyOrder Add ScheduleId  int Null
End
Go


If  Exists (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientPharmacyOrder]') AND name = N'IDX_dtl_PatientPharmacyOrder_CL1')   

DROP INDEX [IDX_dtl_PatientPharmacyOrder_CL1] ON [dbo].[dtl_PatientPharmacyOrder] WITH ( ONLINE = OFF )
GO

CREATE NonCLUSTERED INDEX [IDX_dtl_PatientPharmacyOrder_CL1] ON [dbo].[dtl_PatientPharmacyOrder]
(
	[ptn_pharmacy_pk] ASC,
	[Drug_Pk] ASC,
	[GenericID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF
, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF, FILLFACTOR = 80)
GO

IF Not Exists (SELECT * FROM sys.key_constraints WHERE type = 'PK' AND parent_object_id = OBJECT_ID('dbo.dtl_PatientPharmacyOrder') 
AND Name = 'PK_dtl_PatientPharmacyOrder')
   ALTER TABLE [dbo].[dtl_PatientPharmacyOrder] ADD  CONSTRAINT [PK_dtl_PatientPharmacyOrder] PRIMARY KEY CLUSTERED 
	(
	[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF
	, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO

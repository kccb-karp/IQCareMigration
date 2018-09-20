SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledTask]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledTask](
	[TaskName] [varchar](50) NOT NULL,
	[LastRunDate] [datetime] NULL,
	[NextRunDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ScheduledTask] PRIMARY KEY CLUSTERED 
(
	[TaskName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[dtl_BillCreditVoucher]    Script Date: 9/1/2016 2:03:16 PM ******/
		
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_featureBusinessRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_FeatureBusinessRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureID] [int] NOT NULL,
	[BusRuleId] [int] NOT NULL,
	[Value] [varchar](1000) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Value1] [varchar](1000) NULL,
	[SetType] [int] NULL,
 CONSTRAINT [PK_lnk_featureBusinessRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FeatureID] ASC,
	[BusRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[dtl_PatientClinicalNotes]    Script Date: 5/12/2016 5:33:48 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientClinicalNotes]') AND type in (N'U'))
Begin
	If Not exists (Select * From sys.columns Where Name = N'VersionStamp' And Object_ID = Object_id(N'dtl_PatientClinicalNotes'))    
	Begin
		ALTER TABLE [dbo].[dtl_PatientClinicalNotes] DROP CONSTRAINT [PK_dtl_PatientClinicalNotes]	
	  Exec dbo.sp_rename 'dtl_PatientClinicalNotes', 'dtl_PatientClinicalNotes_Old'
	end
End
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientClinicalNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientClinicalNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[Visit_pk] [int] NOT NULL,
	[ModuleId] [int] NULL,
	[UserId] [int] NOT NULL,
	[ClinicalNotes] [varchar](8000) NOT NULL,
	[DeleteFlag] [int] NOT NULL CONSTRAINT [DF_dtl_PatientClinicalNotes_DeleteFlag]  DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[ModifiedFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_PatientClinicalNotes_ModifiedFlag]  DEFAULT ((0)),
	[ModifiedBy] [int] NULL,
	[VersionStamp] [timestamp] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeleteDate] [datetime] NULL,
 CONSTRAINT [PK_dtl_PatientClinicalNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_dtl_PatientClinicalNotes]    Script Date: 5/12/2016 5:33:48 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientClinicalNotes]') AND name = N'IX_dtl_PatientClinicalNotes')
CREATE NONCLUSTERED INDEX [IX_dtl_PatientClinicalNotes] ON [dbo].[dtl_PatientClinicalNotes]
(
	[Ptn_pk] ASC,
	[Visit_pk] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[dtl_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientWardAdmission](
	[AdmissionID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[WardID] [int] NOT NULL,
	[ReferredFrom] [varchar](50) NOT NULL,
	[AdmissionDate] [datetime] NOT NULL,
	[AdmittedBy] [int] NOT NULL,
	[BedNumber] [varchar](10) NULL,
	[ExpectedDischargeDate] [datetime] NULL,
	[ActualDischargeDate] [datetime] NULL,
	[DischargedBy] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NULL CONSTRAINT [DF_DTL_PatientWardAdmission_DeleteFlag]  DEFAULT ((0)),
	[Discharged]  AS (CONVERT([bit],case when [ActualDischargeDate] IS NULL then (0) else (1) end,(0))) PERSISTED,
 CONSTRAINT [PK_DTL_PatientWardAdmission] PRIMARY KEY CLUSTERED 
(
	[AdmissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mst_PatientWard]    Script Date: 07/21/2015 11:22:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_PatientWard](
	[WardID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NOT NULL,
	[WardName] [varchar](50) NOT NULL,
	[PatientCategory] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_Mst_PatientWard_DeleteFlag]  DEFAULT ((0)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Mst_PatientWard] PRIMARY KEY CLUSTERED 
(
	[WardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_PatientWardKey] UNIQUE NONCLUSTERED 
(
	[WardName] ASC,
	[PatientCategory] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard]  WITH CHECK ADD  CONSTRAINT [CK_Mst_PatientWard_PatientCategory] CHECK  (([PatientCategory]='All' OR [PatientCategory]='Peadiatric' OR [PatientCategory]='Female' OR [PatientCategory]='Male'))
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] CHECK CONSTRAINT [CK_Mst_PatientWard_PatientCategory]
GO




SET ANSI_PADDING OFF
GO

/****** Object:  UserDefinedFunction [dbo].[fn_Admission_GetWardOccupancy]    Script Date: 02/11/2015 16:21:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Admission_GetWardOccupancy]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 27 Jan 2015
-- Description:	Get the occupancy of a ward at the moment
-- =============================================
Create FUNCTION [dbo].[fn_Admission_GetWardOccupancy] 
(
	-- Add the paraers for the function here
	@WardID int
)
	
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Occupancy int;

	-- Add the T-SQL statements to compute the return value here
	Select @Occupancy = Count(AdmissionID)
	From DTL_PatientWardAdmission
	Where WardID = @WardID
	And Discharged = 0;
	-- Return the result of the function
	Return @Occupancy;

End
'
End
GO
If Not exists (Select * From sys.columns Where Name = N'Occupancy' And Object_ID = Object_id(N'mst_PatientWard'))    
Begin
Alter table dbo.mst_PatientWard Add Occupancy  as (dbo.fn_Admission_GetWardOccupancy(WardID) )
End
Go
/****** Object:  Table [dbo].[z_whz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_whz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_whz_young](
	[Sex] [smallint] NULL,
	[LengthCm] [float] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_whz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_whz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_whz_old](
	[Sex] [smallint] NULL,
	[HeightCm] [float] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL,
	[lorh] [varchar](1) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[z_waz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_waz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_waz_young](
	[Sex] [smallint] NULL,
	[agedays] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_waz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_waz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_waz_old](
	[Sex] [smallint] NULL,
	[Agemos] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_haz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_haz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_haz_young](
	[Sex] [smallint] NULL,
	[agedays] [smallint] NULL,
	[L] [smallint] NULL,
	[M] [float] NULL,
	[S] [float] NULL,
	[loh] [varchar](1) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[z_haz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_haz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_haz_old](
	[Sex] [smallint] NULL,
	[Agemos] [smallint] NULL,
	[L] [smallint] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[z_bmiz_young]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_bmiz_young]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_bmiz_young](
	[Sex] [smallint] NULL,
	[agedays] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL,
	[loh] [varchar](1) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[z_bmiz_old]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_bmiz_old]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[z_bmiz_old](
	[Sex] [smallint] NULL,
	[Agemos] [smallint] NULL,
	[L] [float] NULL,
	[M] [float] NULL,
	[S] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MST_QueryBuilderParameters]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MST_QueryBuilderParameters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MST_QueryBuilderParameters](
	[ReportID] [int] NOT NULL,
	[ParameterName] [varchar](50) NOT NULL,
	[ParameterDataType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MST_QueryBuilderParameters_1] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC,
	[ParameterName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_ItemSubType]    Script Date: 07/01/2014 12:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ItemSubType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_ItemSubType](
	[SubItemTypeID] [int] NOT NULL,
	[SubTypeName] [varchar](150) NOT NULL,
	[ItemTypeID] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[SRNo] [int] NULL,
 CONSTRAINT [PK_Mst_ItemSubType_1] PRIMARY KEY CLUSTERED 
(
	[SubItemTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ItemSubType]') AND name = N'IX_TypeIDAndName')
CREATE NONCLUSTERED INDEX [IX_TypeIDAndName] ON [dbo].[Mst_ItemSubType] 
(
	[ItemTypeID] ASC
)
INCLUDE ( [SubTypeName]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mst_ItemMaster]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ItemMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_ItemMaster](
	[Item_PK] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](50)  NULL,
	[ItemName] [varchar](255) NOT NULL,
	[ItemTypeID] [int] NOT NULL,
	[ItemInstructions] [varchar](250)  NULL,
	[DispensingMargin] [decimal](18, 0) NULL,
	[DispensingUnitPrice] [decimal](18, 0) NULL,
	[FDACode] [varchar](50) NULL,
	[Manufacturer] [int] NULL,
	[MaxStock] [int] NULL,
	[MinStock] [int] NULL,
	[PurchaseUnitPrice] [decimal](18, 0) NULL,
	[QtyPerPurchaseUnit] [int] NULL,
	[DispensingUnit] [int] NULL,
	[PurchaseUnit] [int] NULL,
	[DeleteFlag] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Mst_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[Item_PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END





GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dtl_PatientDeleteLog]    Script Date: 12/11/2014 15:36:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dtl_PatientDeleteLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dtl_PatientDeleteLog](
	[Ptn_PK] [int] NOT NULL,
	[Identifiers] [xml] NULL,
	[DeleteDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_PatientDeleteLog] PRIMARY KEY CLUSTERED 
(
	[Ptn_PK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

End
Go
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_BillingType]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_BillingType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_BillingType](
	[BillingTypeID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[MasterTableName] [varchar](100) NULL,
	[MasterFieldName] [varchar](100) NULL,
	[MasterIDField] [varchar](100) NULL,
	[DeleteFlag] [int] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mst_Bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mst_Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[ptn_pk] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[BillStatus] [int] NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[BillNumber] [varchar](50) NULL,
	[BillAmount] [decimal](18, 2) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteFlag] [int] NOT NULL,
	[UserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_mst_Bill] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'mst_Bill', N'COLUMN',N'BillStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=open(not paid or partially paid) 2=closed(paid in full, cancelled)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mst_Bill', @level2type=N'COLUMN',@level2name=N'BillStatus'
GO
/****** Object:  Table [dbo].[Lnk_ItemSubType]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lnk_ItemSubType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lnk_ItemSubType](
	[Item_PK] [int] NOT NULL,
	[ItemSubTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Lnk_ItemSubType] PRIMARY KEY CLUSTERED 
(
	[Item_PK] ASC,
	[ItemSubTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lnk_ItemCostConfiguration]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_ItemCostConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_ItemCostConfiguration](
	[CostId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[ItemType] [int] NULL,
	[ItemSellingPrice] [decimal](18, 2) NULL,
	[EffectiveDate] [datetime] NULL,
	[PriceStatus] [int] NULL,
	[PricePlanId] [int] Not Null,
	[statusDate] [datetime] NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[PharmacyPriceType] [int] NULL,
	[DeleteFlag] [bit] NULL,
	VersionStamp timestamp Not Null
 CONSTRAINT [PK_lnk_ItemCostConfiguration] PRIMARY KEY CLUSTERED 
(
	[CostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'lnk_ItemCostConfiguration', N'COLUMN',N'PharmacyPriceType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=tretment price 0=quantity price(for pharmacy drugs)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lnk_ItemCostConfiguration', @level2type=N'COLUMN',@level2name=N'PharmacyPriceType'
GO
/****** Object:  Table [dbo].[IQToolsExcelReports]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IQToolsExcelReports]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IQToolsExcelReports](
	[IQToolsCatID] [int] NOT NULL,
	[ReportName] [varchar](50) NOT NULL,
	[ReportStylesheet] [varbinary](max) NULL,
	[FileName] [varchar](50) NULL,
	[FileExt] [varchar](50) NULL,
	[ContentType] [varchar](50) NULL,
	[Filelength] [int] NULL,
 CONSTRAINT [PK_IQToolsExcelReports] PRIMARY KEY CLUSTERED 
(
	[IQToolsCatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[dtl_WaitingList]    Script Date: 09/11/2015 07:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_WaitingList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_WaitingList](
	[WaitingListID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[ListID] [int] NOT NULL,
	[ModuleID] [int] NULL,
	[Priority] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[WaitingFor] [int] NOT NULL,
	[LabID] [int] NULL,
 CONSTRAINT [PK_dtl_WaitingList] PRIMARY KEY CLUSTERED 
(
	[WaitingListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_Priority]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_Priority]  DEFAULT ((0)) FOR [Priority]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_WaitingFor]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_WaitingFor]  DEFAULT ((0)) FOR [WaitingFor]
END

GO


/****** Object:  Table [dbo].[dtl_PatientItemsOrder]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientItemsOrder](
	[PatientItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemTypeId] [int] NOT NULL,
	[ptn_Pk] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[DateIssued] [datetime] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_dtl_dtl_PatientItemsOrder] PRIMARY KEY CLUSTERED 
(
	[PatientItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]') AND name = N'IX_dtl_PatientItemsOrder')
CREATE NONCLUSTERED INDEX [IX_dtl_PatientItemsOrder] ON [dbo].[dtl_PatientItemsOrder] 
(
	[ItemId] ASC,
	[ItemTypeId] ASC,
	[ptn_Pk] ASC,
	[ModuleId] ASC,
	[DateIssued] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dtl_LabGroupItems]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dtl_LabGroupItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dtl_LabGroupItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LabGroupTestID] [int] NOT NULL,
	[LabTestID] [int] NOT NULL,
	[DeleteFlag] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[UserId] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_BillDepositTransaction]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_BillDepositTransaction](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNumber] [varchar](50) NOT NULL,
	[Ptn_PK] [int] NULL,
	[AccountID] [int] NULL,
	[LocationID] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionType]  AS (case [TransactionDescription] when 'Refund' then 'Debit' when 'Settlement' then 'Debit' when 'Deposit' then 'Credit'  end) PERSISTED,
	[TransactionDescription] [varchar](50) NOT NULL,
	[DepositType] [varchar](50) NOT NULL,
	[PatientDeposit]  AS (CONVERT([bit],case when [AccountID] IS NULL then (1) else (0) end,(0))) PERSISTED,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dtl_BillDepositTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_dtl_BillDepositTransaction] UNIQUE NONCLUSTERED 
(
	[ReferenceNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dtl_Billables]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dtl_Billables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dtl_Billables](
	[BillableDetailID] [int] IDENTITY(1,1) NOT NULL,
	[DeCodeID] [int] NULL,
	[BillingTypeID] [int] NULL,
	[ItemID] [int] NULL,
	[DeleteFlag] [int] NOT NULL,
	[UserID] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Dtl_Billables] PRIMARY KEY CLUSTERED 
(
	[BillableDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_Bill]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_Bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_Bill](
	[billItemID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NULL,
	[LocationID] [int] NOT NULL,
	[BillID] [int] NULL,
	[BillItemDate] [datetime] NOT NULL,
	[PaymentType] [int] NULL,
	[ItemId] [int] NOT NULL,
	[ItemName] [varchar](250) NOT NULL,
	[ItemType] [int] NOT NULL,
	[Quantity] [int] NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[PaymentStatus] [int] NOT NULL,
	[TransactionId] [int] NULL,
	[ServiceStatus] [int] NOT NULL,
	[DeleteFlag] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[ModuleID] [int] NULL,
	[ItemSourceReferenceID] [int] NULL,
	[CostCenter] [varchar](50) Null,
 CONSTRAINT [PK_dtl_Bill] PRIMARY KEY CLUSTERED 
(
	[billItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'dtl_Bill', N'COLUMN',N'ServiceStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'shows whether client has recived this service or not. 0=not yet recieved 1=recieved' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dtl_Bill', @level2type=N'COLUMN',@level2name=N'ServiceStatus'
GO
/****** Object:  Table [dbo].[ord_bill]    Script Date: 05/22/2015 14:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_bill](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[BillId] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL CONSTRAINT [DF_ord_bill_TransactionDate]  DEFAULT (getdate()),
	[TransactionType] [int] NOT NULL,
	[RefNumber] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[AmountPayable] [decimal](18, 2) NOT NULL,
	[TenderedAmount] [decimal](18, 2) NULL,
	[userId] [int] NOT NULL,
	[ReceiptNumber] [varchar](50) NOT NULL,
	[TransactionStatus] [varchar](50) NULL,
	[Reversed] [bit] NOT NULL CONSTRAINT [DF_ord_bill_Reversed]  DEFAULT ((0)),
	[Discount] [decimal](3, 2) NULL CONSTRAINT [DF_ord_bill_Discount]  DEFAULT ((0.0)),
	[Narrative] [varchar](50) Null,
 CONSTRAINT [PK_ord_bill] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [NCI_OrdBill_BillID]    Script Date: 09/11/2015 07:43:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND name = N'NCI_OrdBill_BillID')
CREATE NONCLUSTERED INDEX [NCI_OrdBill_BillID] ON [dbo].[ord_bill]
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_OrdBill_TranDate]    Script Date: 09/11/2015 07:43:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND name = N'NCI_OrdBill_TranDate')
CREATE NONCLUSTERED INDEX [NCI_OrdBill_TranDate] ON [dbo].[ord_bill]
(
	[TransactionDate] ASC
)
INCLUDE ( 	[TransactionId],
	[BillId],
	[TransactionType],
	[Amount],
	[userID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_OrdBill_TranType]    Script Date: 09/11/2015 07:43:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_bill]') AND name = N'NCI_OrdBill_TranType')
CREATE NONCLUSTERED INDEX [NCI_OrdBill_TranType] ON [dbo].[ord_bill]
(
	[TransactionType] ASC
)
INCLUDE ( 	[Ptn_PK],
	[TransactionDate],
	[Amount],
	[userID],
	[ReceiptNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill]  WITH CHECK ADD  CONSTRAINT [FK_ord_bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill] CHECK CONSTRAINT [FK_ord_bill_mst_Bill]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ord_bill', N'COLUMN',N'Amount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Amount payable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ord_bill', @level2type=N'COLUMN',@level2name=N'Amount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ord_bill', N'COLUMN',N'TenderedAmount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amoujnt given by client as payment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ord_bill', @level2type=N'COLUMN',@level2name=N'TenderedAmount'
GO
/****** Object:  Table [dbo].[ord_Bill_Reversals]    Script Date: 12/11/2014 15:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_Bill_Reversals](
	[TransactionReversalID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[TransactionID] [int] NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReversalReason] [varchar](250) NOT NULL,
	[ApprovalNotes] [varchar](250) NULL,
	[ApprovalDate] [datetime] NULL,
	[ApprovalStatus] [int] NOT NULL,
	[ApprovedBy] [int] NULL,
	[ReversalReference] [varchar](50) NULL,
	[Refunded] [bit] NOT NULL,
	[RefundDate] [datetime] NULL,
	[RefundBy] [int] NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD [RefundType] [varchar](50) NULL
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]') AND name = N'PK_dtl_Bill_Reversals')
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD  CONSTRAINT [PK_dtl_Bill_Reversals] PRIMARY KEY CLUSTERED 
(
	[TransactionReversalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ord_Bill_Reversals', N'COLUMN',N'ApprovalStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0(Pending),1(Approved),3(Rejected)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ord_Bill_Reversals', @level2type=N'COLUMN',@level2name=N'ApprovalStatus'
GO
/****** Object:  Default [DF_dtl_Bill_SellingPrice]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_SellingPrice]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_SellingPrice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_SellingPrice]  DEFAULT ((0.0)) FOR [SellingPrice]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_Discount]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_Discount]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_Discount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_Discount]  DEFAULT ((0)) FOR [Discount]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_PaymentStatus]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_PaymentStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_PaymentStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_PaymentStatus]  DEFAULT ((0)) FOR [PaymentStatus]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_ServiceStatus]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_ServiceStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_ServiceStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_Bill] ADD  CONSTRAINT [DF_dtl_Bill_ServiceStatus]  DEFAULT ((0)) FOR [ServiceStatus]
END


End
GO
/****** Object:  Default [DF_dtl_PatientItemsOrder_SellingPrice]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_PatientItemsOrder_SellingPrice]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_PatientItemsOrder_SellingPrice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_PatientItemsOrder] ADD  CONSTRAINT [DF_dtl_PatientItemsOrder_SellingPrice]  DEFAULT ((0.00)) FOR [SellingPrice]
END


End
GO
/****** Object:  Default [DF_dtl_PatientItemsOrder_DeleteFlag]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_PatientItemsOrder_DeleteFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientItemsOrder]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_PatientItemsOrder_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_PatientItemsOrder] ADD  CONSTRAINT [DF_dtl_PatientItemsOrder_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END


End
GO
/****** Object:  Default [DF_dtl_WaitingList_Priority]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_Priority]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_WaitingList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_WaitingList_Priority]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_Priority]  DEFAULT ((0)) FOR [Priority]
END


End
GO
/****** Object:  Default [DF_dtl_WaitingList_CreateDate]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_WaitingList_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_WaitingList]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_WaitingList_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_WaitingList] ADD  CONSTRAINT [DF_dtl_WaitingList_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
/****** Object:  Default [DF_lnk_ItemCostConfiguration_CreateDate]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_lnk_ItemCostConfiguration_CreateDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_ItemCostConfiguration]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_lnk_ItemCostConfiguration_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[lnk_ItemCostConfiguration] ADD  CONSTRAINT [DF_lnk_ItemCostConfiguration_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END


End
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditVoucher]') AND type in (N'U')) BEGIN
	CREATE TABLE [dbo].[dtl_BillCreditVoucher](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[LocationId] [int] NOT NULL,
		[VoucherDate] [datetime] NOT NULL,
		[Amount] [decimal](18, 2) NOT NULL,
		[KnockedOffAmount] [decimal](18, 2) NOT NULL CONSTRAINT [DF_dtl_BillCreditVoucher_KnockedOffAmount]  DEFAULT ((0.00)),
		[VoucherType] [varchar](50) NOT NULL,
		[ReferenceId] [varchar](50) NOT NULL,
		[Description] [varchar](300) NOT NULL,
		[UserId] [int] NOT NULL,
		[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_dtl_BillCreditVoucher_CreateDate]  DEFAULT (getdate()),
		[DeleteFlag] [bit] NOT NULL CONSTRAINT [dtl_BillCreditVoucher_DeleteFlag]  DEFAULT ((0)),
		[VoidDate] [datetime] NULL,
		[VoidedBy] [int] NULL,
	 CONSTRAINT [PK_dtl_BillCreditVoucher] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

End
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[dtl_BillCreditKnockOff]    Script Date: 9/1/2016 2:03:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]') AND type in (N'U')) Begin
	CREATE TABLE [dbo].[dtl_BillCreditKnockOff](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[TransactionId] [int] NOT NULL,
		[PaymentTypeId] [int] NOT NULL,
		[VoucherId] [int] NOT NULL,
		[KnockOffAmount] [decimal](18, 2) NOT NULL,
		[Description] [varchar](250) NULL,
		[UserId] [int] NOT NULL,
		[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_dtl_BillCreditKnockOff_CreateDate]  DEFAULT (getdate()),
		[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_BillCreditKnockOff_DeleteFlag]  DEFAULT ((0)),
		[VoidDate] [datetime] NULL,
		[VoidedBy] [int] NULL,
	 CONSTRAINT [PK_dtl_BillCreditKnockOff] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
End
GO

SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff]  WITH CHECK ADD  CONSTRAINT [FK_dtl_BillCreditKnockOff] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[ord_bill] ([TransactionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff] CHECK CONSTRAINT [FK_dtl_BillCreditKnockOff]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff_Voucher]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff]  WITH CHECK ADD  CONSTRAINT [FK_dtl_BillCreditKnockOff_Voucher] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[dtl_BillCreditVoucher] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillCreditKnockOff_Voucher]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillCreditKnockOff]'))
ALTER TABLE [dbo].[dtl_BillCreditKnockOff] CHECK CONSTRAINT [FK_dtl_BillCreditKnockOff_Voucher]
GO

	
/****** Object:  Default [DF_lnk_ItemCostConfiguration_PharmacyPriceType]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_lnk_ItemCostConfiguration_PharmacyPriceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_ItemCostConfiguration]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_lnk_ItemCostConfiguration_PharmacyPriceType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[lnk_ItemCostConfiguration] ADD  CONSTRAINT [DF_lnk_ItemCostConfiguration_PharmacyPriceType]  DEFAULT ((0)) FOR [PharmacyPriceType]
END


End
GO
/****** Object:  Default [DF_mst_Bill_DeleteFlag]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_Bill_DeleteFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_Bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_mst_Bill_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_Bill] ADD  CONSTRAINT [DF_mst_Bill_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END


End
GO
/****** Object:  Default [DF_ord_bill_TransactionDate]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ord_bill_TransactionDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ord_bill_TransactionDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_bill] ADD  CONSTRAINT [DF_ord_bill_TransactionDate]  DEFAULT (getdate()) FOR [TransactionDate]
END


End
GO
/****** Object:  Default [DF_ord_bill_Reversed]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ord_bill_Reversed]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ord_bill_Reversed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_bill] ADD  CONSTRAINT [DF_ord_bill_Reversed]  DEFAULT ((0)) FOR [Reversed]
END


End
GO
/****** Object:  Default [DF_dtl_Bill_Reversals_ApprovalStatus]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_Bill_Reversals_ApprovalStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_dtl_Bill_Reversals_ApprovalStatus]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD  CONSTRAINT [DF_dtl_Bill_Reversals_ApprovalStatus]  DEFAULT ((0)) FOR [ApprovalStatus]
END


End
GO
/****** Object:  Default [DF_ord_Bill_Reversals_CashRefunded]    Script Date: 12/11/2014 15:12:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_ord_Bill_Reversals_CashRefunded]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ord_Bill_Reversals_CashRefunded]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ord_Bill_Reversals] ADD  CONSTRAINT [DF_ord_Bill_Reversals_CashRefunded]  DEFAULT ((0)) FOR [Refunded]
END


End
GO
/****** Object:  Check [CK_dtl_BDT_Corporate_Patient]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BDT_Corporate_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction]  WITH CHECK ADD  CONSTRAINT [CK_dtl_BDT_Corporate_Patient] CHECK  (([AccountID] IS NOT NULL OR [Ptn_PK] IS NOT NULL))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BDT_Corporate_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction] CHECK CONSTRAINT [CK_dtl_BDT_Corporate_Patient]
GO
/****** Object:  Check [CK_dtl_BillDepositTransaction_Description]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillDepositTransaction_Description]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction]  WITH CHECK ADD  CONSTRAINT [CK_dtl_BillDepositTransaction_Description] CHECK  (([TransactionDescription]='Settlement' OR [TransactionDescription]='Refund' OR [TransactionDescription]='Deposit'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillDepositTransaction_Description]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillDepositTransaction]'))
ALTER TABLE [dbo].[dtl_BillDepositTransaction] CHECK CONSTRAINT [CK_dtl_BillDepositTransaction_Description]
GO
/****** Object:  ForeignKey [FK_dtl_Bill_mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
ALTER TABLE [dbo].[dtl_Bill]  WITH CHECK ADD  CONSTRAINT [FK_dtl_Bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_Bill]'))
ALTER TABLE [dbo].[dtl_Bill] CHECK CONSTRAINT [FK_dtl_Bill_mst_Bill]
GO
/****** Object:  ForeignKey [FK_mst_Bill_mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_mst_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_Bill]'))
ALTER TABLE [dbo].[mst_Bill]  WITH CHECK ADD  CONSTRAINT [FK_mst_Bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_mst_Bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_Bill]'))
ALTER TABLE [dbo].[mst_Bill] CHECK CONSTRAINT [FK_mst_Bill_mst_Bill]
GO
/****** Object:  ForeignKey [FK_ord_bill_mst_Bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill]  WITH CHECK ADD  CONSTRAINT [FK_ord_bill_mst_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_bill_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_bill]'))
ALTER TABLE [dbo].[ord_bill] CHECK CONSTRAINT [FK_ord_bill_mst_Bill]
GO
/****** Object:  ForeignKey [FK_ord_Bill_Reversals_ord_bill]    Script Date: 12/11/2014 15:12:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_Bill_Reversals_ord_bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
ALTER TABLE [dbo].[ord_Bill_Reversals]  WITH CHECK ADD  CONSTRAINT [FK_ord_Bill_Reversals_ord_bill] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[ord_bill] ([TransactionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ord_Bill_Reversals_ord_bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[ord_Bill_Reversals]'))
ALTER TABLE [dbo].[ord_Bill_Reversals] CHECK CONSTRAINT [FK_ord_Bill_Reversals_ord_bill]
GO
/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Patient]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Patient]
GO
/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Ward]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward]
GO
/****** Object:  Check [CK_DTL_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [CK_DTL_PatientWardAdmission]

END
GO
/****** Object:  Check [CK_Mst_PatientWard_PatientCategory]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] DROP CONSTRAINT [CK_Mst_PatientWard_PatientCategory]

END
GO
/****** Object:  Table [dbo].[dtl_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [CK_DTL_PatientWardAdmission]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DTL_PatientWardAdmission_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_PatientWardAdmission] DROP CONSTRAINT [DF_DTL_PatientWardAdmission_DeleteFlag]
END
GO

/****** Object:  Table [dbo].[Mst_PatientWard]    Script Date: 02/11/2015 15:38:08 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] DROP CONSTRAINT [CK_Mst_PatientWard_PatientCategory]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Mst_PatientWard_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mst_PatientWard] DROP CONSTRAINT [DF_Mst_PatientWard_DeleteFlag]
END
GO

/****** Object:  Table [dbo].[Mst_PatientWard]    Script Date: 02/11/2015 15:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_PatientWard](
	[WardId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[WardName] [varchar](50) NOT NULL,
	[PatientCategory] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Occupancy]  AS ([dbo].[fn_Admission_GetWardOccupancy]([WardID])),
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_Mst_PatientWard_DeleteFlag]  DEFAULT ((0)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Mst_PatientWard] PRIMARY KEY CLUSTERED 
(
	[WardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_PatientWardKey] UNIQUE NONCLUSTERED 
(
	[WardName] ASC,
	[PatientCategory] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Check [CK_DTL_PatientWardAdmission]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission]  WITH CHECK ADD  CONSTRAINT [CK_DTL_PatientWardAdmission] CHECK  (([ActualDischargeDate] IS NULL OR [ActualDischargeDate]>=[AdmissionDate]))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PatientWardAdmission]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] CHECK CONSTRAINT [CK_DTL_PatientWardAdmission]
GO
/****** Object:  Check [CK_Mst_PatientWard_PatientCategory]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard]  WITH CHECK ADD  CONSTRAINT [CK_Mst_PatientWard_PatientCategory] CHECK  (([PatientCategory]='Peadiatric' OR [PatientCategory]='Female' OR [PatientCategory]='Male' OR [PatientCategory]='All'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Mst_PatientWard_PatientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_PatientWard]'))
ALTER TABLE [dbo].[Mst_PatientWard] CHECK CONSTRAINT [CK_Mst_PatientWard_PatientCategory]
GO
/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Patient]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission]  WITH CHECK ADD  CONSTRAINT [FK_DTL_PatientWardAdmission_To_Patient] FOREIGN KEY([Ptn_PK])
REFERENCES [dbo].[mst_Patient] ([Ptn_Pk])
GO

/****** Object:  ForeignKey [FK_DTL_PatientWardAdmission_To_Ward]    Script Date: 02/11/2015 15:38:08 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission]  WITH CHECK ADD  CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward] FOREIGN KEY([WardID])
REFERENCES [dbo].[Mst_PatientWard] ([WardID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DTL_PatientWardAdmission_To_Ward]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_PatientWardAdmission]'))
ALTER TABLE [dbo].[dtl_PatientWardAdmission] CHECK CONSTRAINT [FK_DTL_PatientWardAdmission_To_Ward]
GO

/****** Object:  Check [CK_DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
BEGIN
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts] DROP CONSTRAINT [CK_DTL_PaymentDiscounts]

END
GO
/****** Object:  Table [dbo].[DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts] DROP CONSTRAINT [CK_DTL_PaymentDiscounts]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DTL_PaymentDiscounts_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DTL_PaymentDiscounts] DROP CONSTRAINT [DF_DTL_PaymentDiscounts_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]') AND type in (N'U'))
DROP TABLE [dbo].[DTL_PaymentDiscounts]
GO
/****** Object:  Table [dbo].[DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DTL_PaymentDiscounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [varchar](100) NOT NULL,
	[Rate] [decimal](3, 2) NOT NULL,
	[PaymentTypeID] [int]  NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime]  NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_DTL_PaymentDiscounts_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_DTL_PaymentDiscounts] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [CK_DTL_PaymentDiscounts]    Script Date: 05/22/2015 15:13:44 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts]  WITH CHECK ADD  CONSTRAINT [CK_DTL_PaymentDiscounts] CHECK  (([Rate]<(1.00) AND [Rate]>(0.00)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_DTL_PaymentDiscounts]') AND parent_object_id = OBJECT_ID(N'[dbo].[DTL_PaymentDiscounts]'))
ALTER TABLE [dbo].[DTL_PaymentDiscounts] CHECK CONSTRAINT [CK_DTL_PaymentDiscounts]
GO

/****** Object:  Table [dbo].[Mst_BillPaymentType]    Script Date: 09/02/2015 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_BillPaymentType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_BillPaymentType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[TypeDescription] [varchar](100) NULL,
	[Locked] [bit] NOT NULL,
	[PluginName] [varchar](50) NOT NULL ,
	[Credit] [bit] Not Null Constraint [DF_Mst_BillPaymentType_Credit] Default((1)),
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Mst_BillPaymentType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
/*
SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientLabTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_PatientLabTest](
	[LabTestOrderId] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[TestNotes] [varchar](255) NULL,
	[IsParent] [bit] NOT NULL CONSTRAINT [DF_dtl_PatientLabTest_IsParent]  DEFAULT ((1)),
	[ParentTestID] [int] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_PatientLabTest_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_PatientLabTest] PRIMARY KEY CLUSTERED 
(
	[LabTestOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End
Go
SET ANSI_NULLS ON
GO		 
*/

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemStockBalance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemStockBalance](
	[ItemId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[BatchId] [int] Not Null,
	[AvailableQuantity] [int] NOT NULL,
	[BalanceDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ItemStockBalance] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
Go
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ItemStockBalance_BalanceDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ItemStockBalance] ADD  CONSTRAINT [DF_ItemStockBalance_BalanceDate]  DEFAULT (getdate()) FOR [BalanceDate]
END
GO
/****** Object:  Table [dbo].[dtl_BillingReceipt]    Script Date: 10/15/2015 12:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_BillingReceipt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_PK] [int] NOT NULL,
	[ReceiptDate] [datetime] NOT NULL,
	[ReceiptType] int  NOT NULL,
	[ReceiptNumber] [varchar](50) NOT NULL,
	[TransactionId] int Not Null,
	[ReceiptData] xml NOT NULL,	
	[PrintCount] [int] NOT NULL,
	[UserId] [int] NOT NULL
 CONSTRAINT [PK_dtl_BillingReceipt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_dtl_BillingReceipt]    Script Date: 10/15/2015 12:12:30 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]') AND name = N'IX_dtl_BillingReceipt')
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtl_BillingReceipt] ON [dbo].[dtl_BillingReceipt]
(
	[ReceiptNumber] ASC
)
INCLUDE ( 	[Ptn_PK],[TransactionId],
	[ReceiptType]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_dtl_BillingReceipt_PrintCount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_BillingReceipt] ADD  CONSTRAINT [DF_dtl_BillingReceipt_PrintCount]  DEFAULT ((0)) FOR [PrintCount]
END

GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillingReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]'))
ALTER TABLE [dbo].[dtl_BillingReceipt]  WITH CHECK ADD  CONSTRAINT [CK_dtl_BillingReceipt] CHECK  (([ReceiptType]=1 OR [ReceiptType]=2 OR [ReceiptType]=3 OR [ReceiptType]=4))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_dtl_BillingReceipt]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillingReceipt]'))
ALTER TABLE [dbo].[dtl_BillingReceipt] CHECK CONSTRAINT [CK_dtl_BillingReceipt]
GO

/****** Object:  Table [dbo].[dtl_BillWriteOffTransaction]    Script Date: 01/14/2016 09:49:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_BillWriteOffTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_BillWriteOffTransaction](
	[WriteOffId] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NOT NULL,
	[WriteOffDate] [datetime] NOT NULL,
	[WriteOffAmount] [decimal](18, 2) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dtl_BillWriteOffTransaction] PRIMARY KEY CLUSTERED 
(
	[WriteOffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

End
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillWriteOffTransaction_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillWriteOffTransaction]'))
ALTER TABLE [dbo].[dtl_BillWriteOffTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dtl_BillWriteOffTransaction_mst_Bill] FOREIGN KEY([BillId])
REFERENCES [dbo].[mst_Bill] ([BillID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_BillWriteOffTransaction_mst_Bill]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_BillWriteOffTransaction]'))
ALTER TABLE [dbo].[dtl_BillWriteOffTransaction] CHECK CONSTRAINT [FK_dtl_BillWriteOffTransaction_mst_Bill]
GO

-- Lab and services Section

/****** Object:  UserDefinedFunction [dbo].[fn_Laboratory_GetParameterCount]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Laboratory_GetParameterCount]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 20160226
-- Description:	Get number of parameters for a lab test. A valid lab must have atleast one parameter other than a group lab
-- =============================================
CREATE FUNCTION [dbo].[fn_Laboratory_GetParameterCount]
(
	-- Add the parameters for the function here
	@LabTestId int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Count int

	-- Add the T-SQL statements to compute the return value here
	Select 
		@Count = Case 
					When IsGroup = 0 Then (Select Count(Id) From Mst_LabTestParameter Where LabTestId = @LabTestId And DeleteFlag = 0)
					Else (Select Count(P.Id) From lnk_GroupLabTest G 
								Inner join Mst_LabTestParameter P On G.LabTestId = P.LabTestId
								Where GroupLabTestId=@LabTestId and p.DeleteFlag = 0
						) End
	From mst_LabTestMaster M Where Id = @LabTestId

	-- Return the result of the function
	RETURN @Count

END
' 
END

GO
/****** Object:  Table [dbo].[dtl_ClinicalServiceOrder]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_ClinicalServiceOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ClinicalServiceId] [int] NOT NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_dtl_ClinicalServiceOrder_Quantity]  DEFAULT ((1)),
	[RequestNotes] [varchar](400) NULL,
	[ResultNotes] [varchar](400) NULL,
	[ResultDate] [datetime] NULL,
	[ResultBy] [int] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_ClinicalServiceOrder_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_ClinicalServiceOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtl_LabOrderTest]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabOrderTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[TestNotes] [varchar](255) NULL,
	[IsParent] [bit] NOT NULL CONSTRAINT [DF_LabOrderTest_IsParent]  DEFAULT ((1)),
	[ParentTestId] [int] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_LabOrderTest_DeleteFlag]  DEFAULT ((0)),
	[ResultNotes] [varchar](255) NULL,
	[ResultBy] [int] NULL,
	[ResultDate] [datetime] NULL,
	[ResultStatus] [varchar](50) NULL,
	[UserId] [int] NULL,
	[StatusDate] [datetime] NULL,
 CONSTRAINT [PK_dtl_LabOrderTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dtl_LabOrderTestResult]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabOrderTestResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[LabOrderTestId] [int] NOT NULL,
	[ParameterId] [int] NOT NULL,
	[ResultValue] [decimal](18, 2) NULL,
	[ResultText] [varchar](400) NULL,
	[ResultOptionId] [int] NULL,
	[ResultOption] [varchar](50) NULL,
	[HasResult]  AS (CONVERT([bit],case when [resultvalue] IS NULL AND [resulttext] IS NULL AND [resultoption] IS NULL then (0) else (1) end,(0))),
	[ResultUnit] [varchar](50) NULL,
	[ResultUnitId] [int] NULL,
	[ResultConfigId] [int] NULL,
	[Undetectable] [bit] NULL,
	[DetectionLimit] [decimal](18, 2) NULL,
	[UserId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_LabOrderTestResult_DeleteFlag]  DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dtl_LabOrderTestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF Not EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_dtl_LabOrderTestResult_DeleteFlag_INC')
CREATE NONCLUSTERED INDEX [NCI_dtl_LabOrderTestResult_DeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
(
	[DeleteFlag] ASC
)
INCLUDE ( 	[LabOrderId],
	[ParameterId],
	[ResultValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF Not EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_TestResult_OrderIdDeleteFlag_INC')
CREATE NONCLUSTERED INDEX [NCI_TestResult_OrderIdDeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
([LabOrderId],[DeleteFlag])
INCLUDE ( 	
	[ParameterId],
	[ResultValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterConfig]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabTestParameterConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParameterId] [int] NOT NULL,
	[MinBoundary] [decimal](18, 2) NULL,
	[MaxBoundary] [decimal](18, 2) NULL,
	[MinNormalRange] [decimal](18, 2) NULL,
	[MaxNormalRange] [decimal](18, 2) NULL,
	[UnitId] [int] NULL,
	[DefaultUnit] [bit] NULL,
	[DetectionLimit] [decimal](18, 2) NULL,
	[DeleteFlag] [bit] NULL CONSTRAINT [DF_dtl_LabTestParameterConfig_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_LabTestParameterConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterResultOption]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabTestParameterResultOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParameterId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_dtl_LabTestParameterResultOption_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_dtl_LabTestParameterResultOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lnk_GroupLabTest]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_GroupLabTest](
	[GroupLabTestId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
 CONSTRAINT [PK_lnk_GroupLabTest] PRIMARY KEY CLUSTERED 
(
	[GroupLabTestId] ASC,
	[LabTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Mst_ClinicalService]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_ClinicalService]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_ClinicalService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Mst_ClinicalService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mst_LabTestMaster]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mst_LabTestMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceId] [varchar](36) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[LoincCode] [varchar](50) NULL,
	[IsGroup] [bit] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_IsGroup]  DEFAULT ((0)),
	[DepartmentId] [int] NULL,
	[ParameterCount]  AS ([dbo].[fn_Laboratory_GetParameterCount]([Id])),
	[Active] [bit] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_Active]  DEFAULT ((1)),	
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_CreatedBy]  DEFAULT (getdate()),
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_mst_LabTestMaster_DeleteFlag]  DEFAULT ((0)),
	[DeletedBy] [int] NULL,
	[DeleteDate] datetime NULL
 CONSTRAINT [PK_mst_LabTestMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mst_LabTestParameter]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_LabTestParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceId] [varchar](36) NOT NULL,
	[ParameterName] [varchar](250) NOT NULL,
	[LabTestId] [int] NOT NULL,
	[DataType] [varchar](20) NOT NULL,
	[OrdRank] [decimal](5, 2) NOT NULL  CONSTRAINT [DF_Mst_LabTestParameter_OrdRank]  DEFAULT ((0.00)),
	[LoincCode] [varchar](50) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_Mst_LabTestParameter_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_Mst_LabTestParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ord_ClinicalServiceOrder]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_ClinicalServiceOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_ClinicalServiceOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_Pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[VisitId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[TargetModuleId] [int] NOT NULL,
	[OrderNumber] [varchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderedBy] [int] NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[ClinicalNotes] [varchar](400) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_ord_ClinicalServiceOrder_DeleteFlag]  DEFAULT ((0)),
 CONSTRAINT [PK_ord_ClinicalServiceOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ord_LabOrder]    Script Date: 03/17/2016 06:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_LabOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ord_LabOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_Pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[VisitId] [int] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[OrderedBy] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[PreClinicLabDate] [datetime] NULL,
	[ClinicalOrderNotes] [varchar](400) NULL,
	[OrderNumber] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_ord_LabOrder_DeleteFlag]  DEFAULT ((0)),
	[DeletedBy] [int] Null,
	[DeleteDate] [datetime] Null,
	[DeleteReason] [varchar](250) Null,
 CONSTRAINT [PK_ord_LabOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_dtl_LabTestParameterResultOption]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND name = N'IX_dtl_LabTestParameterResultOption')
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtl_LabTestParameterResultOption] ON [dbo].[dtl_LabTestParameterResultOption]
(
	[ParameterId] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Mst_LabTestMaster_Name]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND name = N'IX_Mst_LabTestMaster_Name')
CREATE NONCLUSTERED INDEX [IX_Mst_LabTestMaster_Name] ON [dbo].[mst_LabTestMaster]
(
	[Name] ASC
)
INCLUDE ( 	[IsGroup],
	[DeleteFlag]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_mst_LabTestMaster_Ref]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND name = N'IX_mst_LabTestMaster_Ref')
CREATE UNIQUE NONCLUSTERED INDEX [IX_mst_LabTestMaster_Ref] ON [dbo].[mst_LabTestMaster]
(
	[ReferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Mst_LabTestParameter]    Script Date: 03/17/2016 06:35:34 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND name = N'IX_Mst_LabTestParameter')
CREATE NONCLUSTERED INDEX [IX_Mst_LabTestParameter] ON [dbo].[Mst_LabTestParameter]
(
	[ParameterName] ASC,
	[DataType] ASC
)
INCLUDE ( 	[DeleteFlag]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClinicalServiceOrdered_ClinicalServiceOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalServiceOrdered_ClinicalServiceOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[ord_ClinicalServiceOrder] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ClinicalServiceOrdered_ClinicalServiceOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder] CHECK CONSTRAINT [FK_ClinicalServiceOrdered_ClinicalServiceOrder]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_ClinicalServiceOrder_ClinicalService]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_dtl_ClinicalServiceOrder_ClinicalService] FOREIGN KEY([ClinicalServiceId])
REFERENCES [dbo].[Mst_ClinicalService] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dtl_ClinicalServiceOrder_ClinicalService]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_ClinicalServiceOrder]'))
ALTER TABLE [dbo].[dtl_ClinicalServiceOrder] CHECK CONSTRAINT [FK_dtl_ClinicalServiceOrder_ClinicalService]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTest_LabOrder] FOREIGN KEY([LabOrderId])
REFERENCES [dbo].[ord_LabOrder] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest] CHECK CONSTRAINT [FK_LabOrderTest_LabOrder]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabTestMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTest_LabTestMaster] FOREIGN KEY([LabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabTestMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest] CHECK CONSTRAINT [FK_LabOrderTest_LabTestMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabOrderTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabOrderTest] FOREIGN KEY([LabOrderTestId])
REFERENCES [dbo].[dtl_LabOrderTest] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabOrderTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabOrderTest]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabTestParameter] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Mst_LabTestParameter] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabTestParameter]
GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterConfig]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabTestParameterConfig] FOREIGN KEY([ResultConfigId])
--REFERENCES [dbo].[dtl_LabTestParameterConfig] ([Id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterConfig]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabTestParameterConfig]
--GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterResultOption]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult]  WITH CHECK ADD  CONSTRAINT [FK_LabOrderTestResult_LabTestParameterResultOption] FOREIGN KEY([ResultOptionId])
--REFERENCES [dbo].[dtl_LabTestParameterResultOption] ([Id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameterResultOption]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
--ALTER TABLE [dbo].[dtl_LabOrderTestResult] CHECK CONSTRAINT [FK_LabOrderTestResult_LabTestParameterResultOption]
--GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterConfig_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]'))
ALTER TABLE [dbo].[dtl_LabTestParameterConfig]  WITH CHECK ADD  CONSTRAINT [FK_LabTestParameterConfig_LabTestParameter] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Mst_LabTestParameter] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterConfig_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]'))
ALTER TABLE [dbo].[dtl_LabTestParameterConfig] CHECK CONSTRAINT [FK_LabTestParameterConfig_LabTestParameter]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterResultOption_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]'))
ALTER TABLE [dbo].[dtl_LabTestParameterResultOption]  WITH CHECK ADD  CONSTRAINT [FK_LabTestParameterResultOption_LabTestParameter] FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Mst_LabTestParameter] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterResultOption_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]'))
ALTER TABLE [dbo].[dtl_LabTestParameterResultOption] CHECK CONSTRAINT [FK_LabTestParameterResultOption_LabTestParameter]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest]  WITH CHECK ADD  CONSTRAINT [FK_GroupLabTest_LabTest_1] FOREIGN KEY([LabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest] CHECK CONSTRAINT [FK_GroupLabTest_LabTest_1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_2]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest]  WITH CHECK ADD  CONSTRAINT [FK_GroupLabTest_LabTest_2] FOREIGN KEY([GroupLabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_2]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest] CHECK CONSTRAINT [FK_GroupLabTest_LabTest_2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTest_LabDepartment]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]'))
ALTER TABLE [dbo].[mst_LabTestMaster]  WITH CHECK ADD  CONSTRAINT [FK_LabTest_LabDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[mst_LabDepartment] ([LabDepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTest_LabDepartment]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]'))
ALTER TABLE [dbo].[mst_LabTestMaster] CHECK CONSTRAINT [FK_LabTest_LabDepartment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameter_LabTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]'))
ALTER TABLE [dbo].[Mst_LabTestParameter]  WITH CHECK ADD  CONSTRAINT [FK_LabTestParameter_LabTest] FOREIGN KEY([LabTestId])
REFERENCES [dbo].[mst_LabTestMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameter_LabTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]'))
ALTER TABLE [dbo].[Mst_LabTestParameter] CHECK CONSTRAINT [FK_LabTestParameter_LabTest]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_AllergiesDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_AllergiesDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ptn_pk] [int] NOT NULL,
	[AllergyType] [varchar](50)  NOT NULL,
	[Allergen] [varchar](200)  NULL,
	[OtherAllergen] [varchar](200)  NULL,
	[TypeReaction] [varchar](200)  NULL,
	[Severity] [varchar](50)  NULL,
	[DateAllergy] [varchar](50)  NULL,
	[UserId] [int] NOT NULL,
	[DeleteFlag] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
End

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_ServiceBusinessRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_ServiceBusinessRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[BusRuleId] [int] NOT NULL,
	[Value] [varchar](1000) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Value1] [varchar](1000) NULL,
	[SetType] [int] NULL
	
 CONSTRAINT [PK_lnk_ServiceBusinessRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ModuleId] ASC,
	[BusRuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
End
Go

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_featureBusinessRule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[lnk_featureBusinessRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureID] [int] NOT NULL,
	[BusRuleId] [int] NOT NULL,
	[Value] [varchar](1000) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Value1] [varchar](1000) NULL,
	[SetType] [int] NULL,
 CONSTRAINT [PK_lnk_featureBusinessRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FeatureID] ASC,
	[BusRuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
End
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTL_FBCUSTOMFIELD_Intensive_Case_Finding]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[DTL_FBCUSTOMFIELD_Intensive_Case_Finding](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ptn_pk] [int] NOT NULL,
	[Visit_Pk] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[BMIClassification] [int] NULL,
	[DetailsofSmearPositiveContact] [varchar](1000) NULL,
	[Cough] [bit] NULL,
	[Fever] [bit] NULL,
	[WeightLoss] [bit] NULL,
	[Sweat] [bit] NULL,
	[ContactTB] [bit] NULL,
	[SputumSmear] [int] NULL,
	[SputumDate] [datetime] NULL,
	[ChestXray] [int] NULL,
	[ChestXRayDate] [datetime] NULL,
	[Referral] [bit] NULL,
	[ReferalDate] [datetime] NULL,
	[StartAntiTB] [bit] NULL,
	[StartAntiTBDate] [datetime] NULL,
	[InvitationContacts] [bit] NULL,
	[InvitationContactsDate] [datetime] NULL,
	[IPTEvaluation] [bit] NULL,
	[IPTEvaluationDate] [datetime] NULL,
	[YellowUrine] [bit] NULL,
	[NumbnessAdult] [bit] NULL,
	[NumbnessPead] [bit] NULL,
	[YellowEyes] [bit] NULL,
	[TenderAbdomen] [bit] NULL,
	[PainAbdomen] [bit] NULL,
	[LiverFunctionTestALT] [decimal](18, 2) NULL,
	[LiverFunctionTestAST] [decimal](18, 2) NULL,
	[IPTStartDate] [datetime] NULL,
	[IndicationforIPT] [int] NULL,
	[IPTOutcome] [int] NULL,
	[IPTOutcomeDate] [datetime] NULL,
	[ReasonsforDiscontinuationIPT] [int] NULL,
	[FollowUpTBStatus] [int] NULL,
	[DateofTBDiagnosis] [datetime] NULL,
	[TBStatusDate] [datetime] NULL,
	[Hepatotoxicity] [bit] NULL,
	[HepatotoxicityAction] [varchar](8000) NULL,
	[PeripheralNeuropathy] [bit] NULL,
	[NeuropathyAction] [varchar](8000) NULL,
	[Rash] [bit] NULL,
	[RashAction] [varchar](8000) NULL,
	[TBAdherenceMeasurement] [int] NULL,
	[Remarks] [varchar](8000) NULL,
	[ChidExposedPTB] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO

/****** Object:  Table [dbo].[PatientLabTracker]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientLabTracker]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [patientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [LabName]              [VARCHAR](50) NOT NULL,
         [SampleDate]           [DATETIME] NOT NULL,
         [Reasons]              [VARCHAR](50) NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [DeleteFlag]           [BIT] NULL,
         [Results]              [VARCHAR](50) NULL,
         [LabOrderId]           [INT] NULL,
         [ResultValues]         [DECIMAL](18, 0) NULL,
         [FacilityId]           [INT] NULL,
         [LabTestId]            [INT] NULL,
         [ResultTexts]          [VARCHAR](50) NULL,
         [LabOrderTestId]       [INT] NULL,
         CONSTRAINT [PK_PatientLabTracker] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientReenrollment]    Script Date: 7/3/2017 12:25:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientReenrollment]')
          AND type IN(N'U')
)
BEGIN
	CREATE TABLE [dbo].[PatientReenrollment](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[PatientId] [int] NOT NULL,
		[ReenrollmentDate] [datetime] NOT NULL,
		[DeleteFlag] [bit] NOT NULL,
		[CreatedBy] [int] NOT NULL,
		[CreateDate] [datetime] NOT NULL,
		[AuditData] [xml] NULL,
	 CONSTRAINT [PK_PatientReenrollment] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
END;


/****** Object:  Table [dbo].[PatientWHOStage]    Script Date: 8/3/2017 5:05:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientWHOStage]')
          AND type IN(N'U')
)
BEGIN
	CREATE TABLE [dbo].[PatientWHOStage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[WHOStage] [int] NOT NULL,
	 CONSTRAINT [PK_PatientWHOStage] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY];
END;

IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[HIVReConfirmatoryTest]')
          AND type IN(N'U')
)
BEGIN
	CREATE TABLE [dbo].[HIVReConfirmatoryTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[TypeOfTest] [int] NOT NULL,
	[TestResult] [int] NOT NULL,
	[TestResultDate] [datetime] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
	 CONSTRAINT [PK_HIVReConfirmatoryTest] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
END;

/****** Object:  Table [dbo].[AdherenceAssessment]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[AdherenceAssessment]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[AdherenceAssessment]
        ([Id]                    [INT] IDENTITY(1, 1)
                                       NOT NULL,
         [PatientId]             [INT] NOT NULL,
         [PatientMasterVisitId]  [INT] NOT NULL,
         [ForgetMedicine]        [BIT] NOT NULL,
         [CarelessAboutMedicine] [BIT] NOT NULL,
         [FeelWorse]             [BIT] NOT NULL,
         [FeelBetter]            [BIT] NOT NULL,
         [Deleteflag]            [BIT] NOT NULL,
         [CreatedBy]             [INT] NOT NULL,
         [CreateDate]            [DATETIME] NOT NULL,
         [AuditData]             [XML] NULL,
         CONSTRAINT [PK_AdherenceAssessment] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[AdherenceOutcome]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[AdherenceOutcome]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [AdherenceType]        [INT] NOT NULL,
         [Score]                [INT] NOT NULL,
         [ScoreDescription]     [VARCHAR](150) NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_AdherenceOutcome] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[AdultChildVaccination]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[AdultChildVaccination]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[AdultChildVaccination]
        ([Id]                   [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Person]               [VARCHAR](5) NOT NULL,
         [Vaccine]              [INT] NOT NULL,
         [VaccineStage]         [VARCHAR](50) NOT NULL,
         [Void]                 [BIT] NOT NULL,
         [VoidBy]               [INT] NULL,
         [VoidDate]             [DATE] NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         CONSTRAINT [PK_AdultChildVaccination] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[AdverseEvent]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[AdverseEvent]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[AdverseEvent]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [EventName]            [VARCHAR](250) NOT NULL,
         [EventCause]           [VARCHAR](250) NULL,
         [Severity]             [VARCHAR](250) NULL,
         [Action]               [VARCHAR](250) NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_AdverseEvent] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO


SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ARTPataient]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ARTPataient]
        ([Ptn_Pk]                 [INT] IDENTITY(1, 1)
                                        NOT NULL,
         [FirstName]              [VARBINARY](MAX) NOT NULL,
         [LastName]               [VARBINARY](MAX) NOT NULL,
         [LocationID]             [INT] NULL,
         [PatientEnrollmentID]    [VARCHAR](50) NULL,
         [PatientClinicID]        [VARCHAR](50) NULL,
         [ReferredFrom]           [INT] NULL,
         [RegistrationDate]       [DATETIME] NULL,
         [Sex]                    [INT] NOT NULL,
         [DOB]                    [DATETIME] NOT NULL,
         [DobPrecision]           [INT] NULL,
         [LocalCouncil]           [VARCHAR](60) NULL,
         [VillageName]            [INT] NULL,
         [DistrictName]           [INT] NULL,
         [Province]               [INT] NULL,
         [Address]                [VARBINARY](MAX) NULL,
         [Phone]                  [VARBINARY](MAX) NULL,
         [MaritalStatus]          [INT] NULL,
         [EducationLevel]         [INT] NULL,
         [EducationOther]         [VARCHAR](50) NULL,
         [Literacy]               [INT] NULL,
         [EmployeeID]             [INT] NULL,
         [Status]                 [INT] NULL,
         [StatusChangedDate]      [DATETIME] NULL,
         [ProgramID]              [INT] NULL,
         [Notes]                  [VARCHAR](MAX) NULL,
         [DeleteFlag]             [INT] NULL,
         [UserID]                 [INT] NULL,
         [CreateDate]             [DATETIME] NULL,
         [UpdateDate]             [DATETIME] NULL,
         [ARTStartDate]           [DATETIME] NULL,
         [CountryId]              [VARCHAR](10) NULL,
         [PosId]                  [VARCHAR](10) NULL,
         [SatelliteId]            [VARCHAR](10) NULL,
         [MiddleName]             [VARBINARY](MAX) NULL,
         [Division]               [INT] NULL,
         [Ward]                   [INT] NULL,
         [ReferredFromSpecify]    [VARCHAR](200) NULL,
         [TransferIn]             [INT] NULL,
         [LPTFTransferId]         [INT] NULL,
         [ANCNumber]              [VARCHAR](50) NULL,
         [PMTCTNumber]            [VARCHAR](50) NULL,
         [AdmissionNumber]        [VARCHAR](50) NULL,
         [OutpatientNumber]       [VARCHAR](50) NULL,
         [HealthUnit]             [INT] NULL,
         [SubCountry]             [INT] NULL,
         [whose]                  [INT] NULL,
         [DateTransferredin]      [DATETIME] NULL,
         [NearestSchool]          [VARCHAR](300) NULL,
         [NearestHealthCentre]    [VARCHAR](300) NULL,
         [IQNumber]               [VARCHAR](100) NULL,
         [Home_based_care]        [VARCHAR](50) NULL,
         [PatientTelephonenumber] [VARCHAR](50) NULL,
         [Landmark]               [VARCHAR](50) NULL,
         [Sublocation]            [VARCHAR](50) NULL,
         [Parish]                 [INT] NULL,
         [ClinicalTeamLeader]     [INT] NULL,
         [ID/PassportNo]          [VARCHAR](100) NULL,
         [Nationality]            [INT] NULL,
         [PlaceofBirth]           [VARCHAR](100) NULL,
         [Religion]               [INT] NULL,
         [ReligionOther]          [VARCHAR](100) NULL,
         [Code]                   [VARCHAR](100) NULL,
         [Town]                   [INT] NULL,
         [Outpatienttoattend]     [INT] NULL,
         [AttendanceTime]         [VARCHAR](15) NULL,
         [Wardadmitted]           [INT] NULL,
         [MaternityNumber]        [VARCHAR](50) NULL,
         [HEIIDNumber]            [VARCHAR](50) NULL,
         [HTCNumber]              [VARCHAR](50) NULL,
         [DistrictRegistrationNr] [VARCHAR](50) NULL,
         [PEPNumber]              [VARCHAR](50) NULL,
         [IPTRegNo]               [VARCHAR](50) NULL,
         [PatientFacilityId]      [VARCHAR](50) NULL,
         [DateOfDeath]            [DATETIME] NULL
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientArtDistribution]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientArtDistribution]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [ArtRefillModel]       [NVARCHAR](500) NULL,
         [MissedArvDoses]       [BIT] NULL,
         [MissedArvDosesCount]  [INT] NOT NULL,
         [Fatigue]              [BIT] NULL,
         [Fever]                [BIT] NULL,
         [Nausea]               [BIT] NULL,
         [Diarrhea]             [BIT] NOT NULL,
         [Cough]                [BIT] NULL,
         [Rash]                 [BIT] NULL,
         [GenitalSore]          [BIT] NULL,
         [OtherSymptom]         [NVARCHAR](500) NULL,
         [NewMedication]        [BIT] NULL,
         [NewMedicationText]    [NVARCHAR](500) NULL,
         [FamilyPlanning]       [BIT] NULL,
         [FamilyPlanningMethod] [NVARCHAR](500) NULL,
         [ReferedToClinic]      [BIT] NULL,
         [ReferedToClinicDate]  [DATETIME] NULL,
         [PregnancyStatus]      [INT] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientArtDistribution] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO
if not exists (  select * from sys.all_columns c   join sys.tables t on t.object_id = c.object_id      join sys.schemas s on s.schema_id = t.schema_id
      join sys.default_constraints d on c.default_object_id = d.object_id    where t.name = 'PatientArtDistribution'   and c.name = 'DeleteFlag'     and s.name = 'dbo')
	ALTER TABLE [dbo].[PatientArtDistribution] ADD CONSTRAINT [DF_PatientArtDistribution_Void] DEFAULT((0)) FOR [DeleteFlag];
GO
if not exists (  select * from sys.all_columns c   join sys.tables t on t.object_id = c.object_id      join sys.schemas s on s.schema_id = t.schema_id
      join sys.default_constraints d on c.default_object_id = d.object_id    where t.name = 'PatientArtDistribution'   and c.name = 'CreateDate'     and s.name = 'dbo')
ALTER TABLE [dbo].[PatientArtDistribution] ADD CONSTRAINT [DF_PatientArtDistribution_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
GO

/****** Object:  Table [dbo].[ARVTreatmentTracker]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ARVTreatmentTracker]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ARVTreatmentTracker]
        ([Id]                      [INT] IDENTITY(1, 1)
                                         NOT NULL,
         [PatientId]               [INT] NOT NULL,
         [ServiceAreaId]           [INT] NOT NULL,
         [PatientMasterVisitId]    [INT] NOT NULL,
         [RegimenStartDate]        [INT] NULL,
         [RegimenId]               [INT] NOT NULL,
         [Regimen]                 [VARCHAR](50) NULL,
         [RegimenLineId]           [INT] NOT NULL,
         [RegimenLine]             [VARCHAR](50) NULL,
         [DrugId]                  [INT] NULL,
         [RegimenStatusDate]       [DATETIME] NULL,
         [TreatmentStatusId]       [INT] NOT NULL,
         [ParentId]                [INT] NULL,
         [DeleteFlag]              [BIT] NOT NULL,
         [CreateBy]                [INT] NOT NULL,
         [CreateDate]              [DATETIME] NOT NULL,
         [AuditData]               [XML] NULL,
         [TreatmentStatusReasonId] [INT] NULL,
         CONSTRAINT [PK_ARVTreatmentTracker] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[ComplaintsHistory]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ComplaintsHistory]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [PresentingComplaint]  [VARCHAR](1000) NOT NULL,
         [ComplaintHistory]     [VARCHAR](1000) NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [AnyComplaint]         [INT] NULL,
         CONSTRAINT [PK_ComplaintsHistory] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[County]    Script Date: 5/11/2017 4:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[County](
	[Id] [int] NOT NULL,
	[CountyId] [int] NOT NULL,
	[CountyName] [nvarchar](255) NOT NULL,
	[SubcountyId] [int] NULL,
	[Subcountyname] [nvarchar](255) NULL,
	[WardId] [int] NULL,
	[WardName] [nvarchar](255) NULL,
 CONSTRAINT [PK_County_Id] PRIMARY KEY CLUSTERED (	[Id] ASC)) ON [PRIMARY]
END
GO



SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Disclosure]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Disclosure]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Category]             [VARCHAR](15) NOT NULL,
         [DisclosureStage]      [VARCHAR](10) NOT NULL,
         [DisclosureDate]       [DATETIME] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [Active]               [BIT] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_Disclosure_1] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[HIVEnrollmentBaseline]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[HIVEnrollmentBaseline]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [HIVDiagnosisDate]     [DATE] NOT NULL,
         [EnrollmentDate]       [DATE] NOT NULL,
         [EnrollmentWHOStage]   [INT] NOT NULL,
         [ARTInitiationDate]    [DATE] NOT NULL,
         [ARTHistoryUse]        [BIT] NOT NULL,
         [HIVRetest]            [BIT] NOT NULL,
         [HIVRetestTypeId]      [INT] NULL,
         [ReasonForNoRetest]    [VARCHAR](250) NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         CONSTRAINT [PK_HIVEnrollmentBaseline] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[HIVTesting]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[HIVTesting]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PersonId]             [INT] NOT NULL,
         [BaselineResult]       [INT] NOT NULL,
         [BaselineDate]         [DATETIME] NULL,
         [TestingDate]          [DATETIME] NULL,
         [TestingResult]        [INT] NOT NULL,
         [ReferredToCare]       [BIT] NOT NULL,
         [CCCNumber]            [VARCHAR](20) NULL,
         [EnrollmentId]         [INT] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         CONSTRAINT [PK_HIVTesting] PRIMARY KEY CLUSTERED([Id] ASC)
        
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[INHProphylaxis]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[INHProphylaxis]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [StartDate]            [DATETIME] NULL,
         [Complete]             [BIT] NOT NULL,
         [CompletionDate]       [DATETIME] NULL,
         [DeleteFlag]           [BIT] NOT NULL ,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [Active]               [BIT] NOT NULL,
         CONSTRAINT [PK_INHProphylaxis] PRIMARY KEY CLUSTERED([Id] ASC)

        )
        ON [PRIMARY];
    END;
GO


SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ItemStockBalance]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ItemStockBalance]
        ([ItemId]            [INT] NOT NULL,
         [StoreId]           [INT] NOT NULL,
         [BatchId]           [INT] NOT NULL,
         [AvailableQuantity] [INT] NOT NULL,
         [BalanceDate]       [DATETIME] NOT NULL,
         CONSTRAINT [PK_ItemStockBalance] PRIMARY KEY CLUSTERED([ItemId] ASC, [StoreId] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[LookupItem]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[LookupItem]
        ([Id]          [INT] IDENTITY(1, 1)
                             NOT NULL,
         [Name]        [VARCHAR](250) NOT NULL,
         [DisplayName] [VARCHAR](250) NOT NULL,
         [DeleteFlag]  [BIT] NOT NULL
        )
        ON [PRIMARY];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_LookupItem_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[LookupItem]
        ADD  CONSTRAINT [DF_LookupItem_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
    END;
GO
/****** Object:  Table [dbo].[LookupMaster]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[LookupMaster]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[LookupMaster]
        ([Id]          [INT] IDENTITY(1, 1)
                             NOT NULL,
         [Name]        [VARCHAR](250) NOT NULL,
         [DisplayName] [VARCHAR](250) NULL,
         [DeleteFlag]  [BIT] NOT NULL 
        )
        ON [PRIMARY];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_LookupMaster_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[LookupMaster]
        ADD  CONSTRAINT [DF_LookupMaster_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
    END;
GO
/****** Object:  Table [dbo].[LookupMasterItem]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[LookupMasterItem]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[LookupMasterItem]
        ([LookupMasterId] [INT] NOT NULL,
         [LookupItemId]   [INT] NOT NULL,
         [DisplayName]    [VARCHAR](250) NULL,
         [OrdRank]        [DECIMAL](5, 2) NULL
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[Marital_Status]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Marital_Status]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Marital_Status]
        ([ID]         [INT] IDENTITY(1, 1)
                            NOT NULL,
         [Name]       [VARCHAR](50) NULL,
         [CodeID]     [INT] NULL,
         [SRNo]       [INT] NULL,
         [DeleteFlag] [INT] NULL,
         [UserID]     [INT] NULL,
         [CreateDate] [DATETIME] NULL,
         [UpdateDate] [DATETIME] NULL
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ModuleMaster]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ModuleMaster]
        ([Id]             [INT] IDENTITY(1, 1)
                                NOT NULL,
         [Name]           [VARCHAR](50) NOT NULL,
         [ReferenceId]    [VARCHAR](15) NOT NULL,
         [DisplayName]    [VARCHAR](150) NOT NULL,
         [Version]        [VARCHAR](50) NOT NULL,
         [ReleaseDate]    [DATE] NOT NULL,
         [ReleaseVersion] [VARCHAR](8) NOT NULL,
         [DeleteFlag]     [BIT] NOT NULL,
         [CreateBy]       [INT] NOT NULL,
         [CreateDate]     [DATETIME] NOT NULL,
         [AuditData]      [XML] NULL,
         CONSTRAINT [PK_ModuleMaster] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO


SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Patient]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Patient]
        ([Id]               [INT] IDENTITY(1, 1)
                                  NOT NULL,
         [ptn_pk]           [INT] NOT NULL,
         [PersonId]         [INT] NOT NULL,
         [PatientIndex]     [VARCHAR](50) NULL,
         [PatientType]      [INT] NOT NULL,
         [FacilityId]       [INT] NOT NULL,
         [Active]           [BIT] NOT NULL,
         [DateOfBirth]      [DATETIME] NOT NULL,
         [DobPrecision]     [BIT] NULL,
         [NationalId]       [VARBINARY](400) NOT NULL,
         [DeleteFlag]       [BIT] NOT NULL,
         [CreatedBy]        [INT] NOT NULL,
         [CreateDate]       [DATETIME] NOT NULL,
         [AuditData]        [XML] NULL,
         [RegistrationDate] [DATETIME] NOT NULL,
         CONSTRAINT [PK_person_1] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO


SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientAllergies]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientAllergies]
        ([id]                   [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [AllergyType]          [INT] NOT NULL,
         [Allagen]              [VARCHAR](150) NOT NULL,
         [Description]          [VARCHAR](150) NOT NULL,
         [OnsetDate]            [DATE] NULL,
         [Void]                 [INT] NOT NULL,
         [VoidBy]               [INT] NULL,
         [VoidDate]             [DATE] NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATE] NOT NULL,
         CONSTRAINT [PK_PatientAllergies] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientAllergy]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientAllergy]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientAllergy]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NULL,
         [Allergen]             [VARCHAR](250) NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [Reaction]             [INT] NULL,
         [Severity]             [INT] NULL,
         [OnsetDate]            [DATETIME] NULL,
         CONSTRAINT [PK_PatientAllergy] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientAppointment]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientAppointment]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientAppointment]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ServiceAreaId]        [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [AppointmentDate]      [DATETIME] NOT NULL,
         [ReasonId]             [INT] NOT NULL,
         [Description]          [VARCHAR](250) NULL,
         [StatusId]             [INT] NOT NULL,
         [StatusDate]           [DATETIME] NULL,
         [DifferentiatedCareId] [INT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientAppointment] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientARVHistory]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientARVHistory]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientARVHistory]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [TreatmentType]        [VARCHAR](50) NOT NULL,
         [Purpose]              [VARCHAR](150) NOT NULL,
         [Regimen]              [VARCHAR](150) NOT NULL,
         [DateLastUsed]         [DATETIME] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_ARTUseHistory] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientBaselineAssessment]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientBaselineAssessment]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientBaselineAssessment]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [HBVInfected]          [BIT] NOT NULL,
         [Pregnant]             [BIT] NULL,
         [TBinfected]           [BIT] NOT NULL,
         [WHOStage]             [INT] NOT NULL,
         [BreastFeeding]        [BIT] NULL,
         [CD4Count]             [DECIMAL](18, 0) NULL,
         [MUAC]                 [DECIMAL](8, 2) NULL,
         [Weight]               [DECIMAL](8, 2) NOT NULL,
         [Height]               [DECIMAL](8, 2) NOT NULL,
         [BMI] AS([Weight] / (([Height] / (100)) * ([Height] / (100)))) PERSISTED,
         [DeleteFlag]           [BIT] NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientARTInitiationBaseline] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientCareending]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientCareending]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientCareending]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [PatientEnrollmentId]  [INT] NOT NULL,
         [ExitReason]           [INT] NOT NULL,
         [ExitDate]             [DATETIME] NOT NULL,
         [TransferOutfacility]  [VARCHAR](250) NULL,
         [DateOfDeath]          [DATETIME] NULL,
         [CareEndingNotes]      [TEXT] NULL,
         [Active]               [BIT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientCareending_1] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientChronicIllness]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientChronicIllness]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ChronicIllness]       [INT] NOT NULL,
         [Treatment]            [VARCHAR](150) NOT NULL,
         [Dose]                 [INT] NULL,
         [Duration]             [INT] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [OnsetDate]            [DATETIME] NULL,
         [active]               [INT] NULL,
         CONSTRAINT [PK_PatientChronicIllness] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientClinicalDiagnosis]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalDiagnosis]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientClinicalDiagnosis]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Diagnosis]            [VARCHAR](250) NOT NULL,
         [Treatment]            [VARCHAR](250) NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientClinicalDiagnosis] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientClinicalNotes]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientClinicalNotes]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [FacilityId]           [INT] NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ServiceAreaId]        [INT] NOT NULL,
         [ClinicalNotes]        [VARCHAR](8000) NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [ModifyFlag]           [BIT] NOT NULL,
         [VersionStamp]         [TIMESTAMP] NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientClinicalNotes] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientConsent]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientConsent]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientConsent]
        ([id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ServiceAreaId]        [INT] NOT NULL,
         [ConsentType]          [INT] NOT NULL,
         [ConsentDate]          [DATETIME] NOT NULL,
         [DeclineReason]        [DATETIME] NULL,
         [Active]               [BIT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_patient_Consent] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientContact]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientContact]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientContact]
        ([id]              [INT] IDENTITY(1, 1)
                                 NOT NULL,
         [PersonId]        [INT] NOT NULL,
         [PhysicalAddress] [VARBINARY](MAX) NULL,
         [mobileNo]        [VARBINARY](MAX) NULL,
         [Active]          [BIT] NOT NULL,
         [DeleteFlag]      [INT] NOT NULL,
         [CreatedBy]       [INT] NOT NULL,
         [CreateDate]      [DATE] NOT NULL,
         CONSTRAINT [PK_patient_contact] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientDiagnosis]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Diagnosis]            [VARCHAR](400) NOT NULL,
         [ManagementPlan]       [VARCHAR](400) NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientDiagnosis] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientEncounter]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientEncounter]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientEncounter]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [EncounterTypeId]      [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [EncounterStartTime]   [DATETIME] NOT NULL,
         [EncounterEndTime]     [DATETIME] NOT NULL,
         [ServiceAreaId]        [INT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientEncounter] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientEnrollment]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientEnrollment]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientEnrollment]
        ([Id]                 [INT] IDENTITY(1, 1)
                                    NOT NULL,
         [PatientId]          [INT] NOT NULL,
         [ServiceAreaId]      [INT] NOT NULL,
         [EnrollmentDate]     [DATETIME] NOT NULL,
         [EnrollmentStatusId] [INT] NOT NULL,
         [TransferIn]         [BIT] NOT NULL,
         [CareEnded]          [BIT] NOT NULL,
         [DeleteFlag]         [BIT] NOT NULL,
         [CreatedBy]          [INT] NOT NULL,
         [CreateDate]         [DATETIME] NOT NULL,
         [AuditData]          [XML] NULL,
         CONSTRAINT [PK_PatientEnrollment] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientFamilyPlanning]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanning]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientFamilyPlanning]
        ([Id]                     [INT] IDENTITY(1, 1)
                                        NOT NULL,
         [PatientId]              [INT] NOT NULL,
         [PatientMasterVisitId]   [INT] NOT NULL,
         [FamilyPlanningStatusId] [INT] NOT NULL,
         [ReasonNotOnFPId]        [INT] NULL,
         [DeleteFlag]             [BIT] NOT NULL,
         [Active]                 [BIT] NULL,
         [CreatedBy]              [INT] NOT NULL,
         [CreateDate]             [DATETIME] NOT NULL,
         [AuditData]              [XML] NULL,
         CONSTRAINT [PK_PatientFamilyPlanning] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientFamilyPlanningMethod]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanningMethod]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientFamilyPlanningMethod]
        ([Id]          [INT] IDENTITY(1, 1)
                             NOT NULL,
         [PatientId]   [INT] NOT NULL,
         [PatientFPId] [INT] NOT NULL,
         [FPMethodId]  [INT] NOT NULL,
         [Active]      [BIT] NOT NULL,
         [DeleteFlag]  [BIT] NOT NULL,
         [CreatedBy]   [INT] NOT NULL,
         [CreateDate]  [DATETIME] NOT NULL,
		 [AuditData]   [XML] NULL,
         CONSTRAINT [PK_PatientFamilyPlanningMethod] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientHivDiagnosis]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientHivDiagnosis]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientHivDiagnosis]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientMasterVisitId] [INT] NULL,
         [PatientId]            [INT] NOT NULL,
         [HIVDiagnosisDate]     [DATETIME] NOT NULL,
         [EnrollmentDate]       [DATETIME] NOT NULL,
         [EnrollmentWHOStage]   [INT] NOT NULL,
         [ARTInitiationDate]    [DATETIME] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_diagnosis_arv_history] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientIcf]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientIcf]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientIcf]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [Cough]                [BIT] NULL,
         [Fever]                [BIT] NULL,
         [WeightLoss]           [BIT] NULL,
         [NightSweats]          [BIT] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [OnAntiTbDrugs]        [BIT] NULL,
         [OnIpt]                [BIT] NULL,
         CONSTRAINT [PK_PatientIcf] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientIcfAction]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientIcfAction]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientIcfAction]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [SputumSmear]          [BIT] NULL,
         [ChestXray]            [BIT] NULL,
         [StartAntiTb]          [BIT] NULL,
         [InvitationOfContacts] [BIT] NULL,
         [EvaluatedForIpt]      [BIT] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientIcfAction] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientIdentifier]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientIdentifier]
        ([Id]                  [INT] IDENTITY(1, 1)
                                     NOT NULL,
         [PatientId]           [INT] NOT NULL,
         [PatientEnrollmentId] [INT] NOT NULL,
         [IdentifierTypeId]    [INT] NOT NULL,
         [IdentifierValue]     [VARCHAR](50) NOT NULL,
         [DeleteFlag]          [BIT] NOT NULL,
         [CreatedBy]           [INT] NOT NULL,
         [CreateDate]          [DATETIME] NOT NULL,
         [Active]              [BIT] NOT NULL,
         [AuditData]           [XML] NULL,
         CONSTRAINT [PK_PatientIdentifier] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[GreenCardBlueCard_Transactional]    Script Date: 5/16/2017 4:37:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[GreenCardBlueCard_Transactional]')
          AND type IN(N'U')
)
    BEGIN
CREATE TABLE [dbo].[GreenCardBlueCard_Transactional](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Ptn_Pk] [int] NOT NULL,
 CONSTRAINT [PK_GreenCardBlueCard_Transactional] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END;
GO

/****** Object:  Table [dbo].[PatientIpt]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientIpt]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientIpt]
        ([Id]                         [INT] IDENTITY(1, 1)
                                            NOT NULL,
         [PatientMasterVisitId]       [INT] NOT NULL,
         [PatientId]                  [INT] NOT NULL,
         [IptDueDate]                 [DATETIME] NULL,
         [IptDateCollected]           [DATETIME] NULL,
         [Weight]                     [INT] NOT NULL,
         [Hepatotoxicity]             [BIT] NULL,
         [Peripheralneoropathy]       [BIT] NULL,
         [Rash]                       [BIT] NULL,
         [AdheranceMeasurement]       [INT] NOT NULL,
         [DeleteFlag]                 [BIT] NOT NULL,
         [CreatedBy]                  [INT] NOT NULL,
         [CreateDate]                 [DATETIME] NOT NULL,
         [AuditData]                  [XML] NULL,
         [HepatotoxicityAction]       [NVARCHAR](500) NULL,
         [PeripheralneoropathyAction] [NVARCHAR](500) NULL,
         [RashAction]                 [NVARCHAR](500) NULL,
         [AdheranceMeasurementAction] [NVARCHAR](500) NULL,
         CONSTRAINT [PK_PatientIpt] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientIptOutcome]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientIptOutcome]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientIptOutcome]
        ([Id]                       [INT] IDENTITY(1, 1)
                                          NOT NULL,
         [PatientMasterVisitId]     [INT] NOT NULL,
         [PatientId]                [INT] NOT NULL,
         [IptEvent]                 [BIT] NULL,
         [ReasonForDiscontinuation] [VARCHAR](250) NULL,
         [DeleteFlag]               [BIT] NOT NULL,
         [CreatedBy]                [INT] NOT NULL,
         [CreateDate]               [DATETIME] NOT NULL,
         [AuditData]                [XML] NULL,
         CONSTRAINT [PK_PatientIptOutcome] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientIptWorkup]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientIptWorkup]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientIptWorkup]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [YellowColouredUrine]  [BIT] NULL,
         [Numbness]             [BIT] NULL,
         [YellownessOfEyes]     [BIT] NULL,
         [AbdominalTenderness]  [BIT] NULL,
         [LiverFunctionTests]   [VARCHAR](250) NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientIptWorkup] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientLabTracker]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientLabTracker]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [patientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [LabName]              [VARCHAR](50) NOT NULL,
         [SampleDate]           [DATETIME] NOT NULL,
         [Reasons]              [VARCHAR](50) NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [DeleteFlag]           [BIT] NULL,
         [Results]              [VARCHAR](50) NULL,
         [LabOrderId]           [INT] NULL,
         [ResultValues]         [DECIMAL](18, 0) NULL,
         [FacilityId]           [INT] NULL,
         [LabTestId]            [INT] NULL,
         [ResultTexts]          [VARCHAR](50) NULL,
         [LabOrderTestId]       [INT] NULL,
         CONSTRAINT [PK_PatientLabTracker] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientLocation]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientLocation]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientLocation]
        ([id]                  [INT] NOT NULL,
         [PatientId]           [INT] NOT NULL,
         [County]              [INT] NOT NULL,
         [SubCounty]           [INT] NULL,
         [Ward]                [INT] NULL,
         [LocalCouncil]        [VARCHAR](250) NULL,
         [Location]            [VARCHAR](250) NULL,
         [SubLocation]         [VARCHAR](250) NULL,
         [LandMark]            [VARCHAR](250) NULL,
         [NearestHealthCentre] [VARCHAR](250) NULL,
         [is_active]           [BIT] NOT NULL,
         [sketch_map]          [BINARY](50) NOT NULL,
         [Void]                [BIT] NOT NULL,
         [VoidBy]              [INT] NULL,
         [VoidDate]            [DATETIME] NULL,
         [createBy]            [INT] NOT NULL,
         [createDate]          [DATETIME] NOT NULL,
         CONSTRAINT [PK_person_location] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientMaritalStatus]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientMaritalStatus]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientMaritalStatus]
        ([Id]              [INT] IDENTITY(1, 1)
                                 NOT NULL,
         [PersonId]        [INT] NOT NULL,
         [MaritalStatusId] [INT] NOT NULL,
         [Active]          [BIT] NOT NULL,
         [DeleteFlag]      [BIT] NOT NULL,
         [CreatedBy]       [INT] NOT NULL,
         [CreateDate]      [DATETIME] NOT NULL,
         [AuditData]       [XML] NULL,
         CONSTRAINT [PK_PatientMaritalStatus] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientMasterVisit]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientMasterVisit]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientMasterVisit]
        ([Id]             [INT] IDENTITY(1, 1)
                                NOT NULL,
         [PatientId]      [INT] NOT NULL,
         [ServiceId]      [INT] NOT NULL,
         [Start]          [DATETIME] NOT NULL,
         [End]            [DATETIME] NULL,
         [Active]         [BIT] NOT NULL,
         [VisitDate]      [DATETIME] NULL,
         [VisitScheduled] [INT] NULL,
         [VisitBy]        [INT] NULL,
         [VisitType]      [INT] NULL,
         [Status]         [INT] NULL,
         [CreateDate]     [DATETIME] NOT NULL,
         [DeleteFlag]     [BIT] NOT NULL,
         [CreatedBy]      [INT] NOT NULL,
         [AuditData]      [XML] NULL,
         CONSTRAINT [PK_PatientMasterVisit] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientOVCStatus]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientOVCStatus]
        ([Id]         [INT] IDENTITY(1, 1)
                            NOT NULL,
         [PersonId]   [INT] NOT NULL,
         [GuardianId] [INT] NOT NULL,
         [Orphan]     [BIT] NOT NULL,
         [InSchool]   [BIT] NOT NULL,
         [Active]     [BIT] NOT NULL,
         [DeleteFlag] [BIT] NOT NULL,
         [CreatedBy]  [INT] NOT NULL,
         [CreateDate] [DATETIME] NOT NULL,
         [AuditData]  [XML] NULL,
         CONSTRAINT [PK_PatientOVCStatus] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientPHDP]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientPHDP]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientPHDP]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Phdp]                 [INT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientPHDP] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientPhysicalExamination]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientPhysicalExamination]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientPhysicalExamination]
        ([id]                     [INT] IDENTITY(1, 1)
                                        NOT NULL,
         [PatientId]              [INT] NOT NULL,
         [PhysicalExaminationId]  [INT] NULL,
         [PatientMasterVisitId]   [INT] NOT NULL,
         [FemaleLMP]              [DATE] NULL,
         [PregnancyStatus]        [INT] NULL,
         [ExpectedDateOfChild]    [DATE] NULL,
         [ANCPNCProfile]          [VARCHAR](50) NULL,
         [OnFamilyPlanning]       [INT] NULL,
         [FPMethod]               [INT] NULL,
         [CaCxScreen]             [INT] NULL,
         [STIScreen]              [INT] NULL,
         [STIPartnerNotification] [INT] NULL,
         [Void]                   [BIT] NULL,
         [VoidBy]                 [INT] NULL,
         [VoidDate]               [DATE] NULL,
         [CreateBy]               [INT] NOT NULL,
         [CreateDate]             [DATE] NOT NULL,
         CONSTRAINT [PK_PatientPhysicalExamination] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientPopulation]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientPopulation]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientPopulation]
        ([Id]                 [INT] IDENTITY(1, 1)
                                    NOT NULL,
         [PersonId]           [INT] NOT NULL,
         [PopulationType]     [VARCHAR](250) NOT NULL,
         [PopulationCategory] [INT] NOT NULL,
         [Active]             [BIT] NOT NULL,
         [DeleteFlag]         [BIT] NOT NULL,
         [CreatedBy]          [INT] NOT NULL,
         [CreateDate]         [DATETIME] NOT NULL,
         [AuditData]          [XML] NULL,
         [PopulationTypeId]   [INT] NULL,
         CONSTRAINT [PK_PatientPopulation] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientProphylaxis]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientProphylaxis]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientProphylaxis]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [ProphylaxisTypeId]    [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [StartDate]            [DATE] NOT NULL,
         [Complete]             [BIT] NOT NULL,
         [CompletionDate]       [DATE] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         CONSTRAINT [PK_PatientProphylaxis] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientReferral]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientReferral]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientReferral]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ReferredFrom]         [INT] NOT NULL,
         [ReferredTo]           [VARCHAR](250) NULL,
         [ReferralReason]       [VARCHAR](250) NOT NULL,
         [ReferralDate]         [DATETIME] NOT NULL,
         [ReferredBy]           [VARCHAR](50) NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientReferral] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientScreening]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientScreening]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientScreening]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ScreeningTypeId]      [INT] NOT NULL,
         [ScreeningDone]        [BIT] NOT NULL,
         [ScreeningDate]        [DATE] NULL,
         [ScreeningCategoryId]  [INT] NULL,
         [ScreeningValueId]     [INT] NULL,
         [Comment]              [VARCHAR](250) NULL,
         [Active]               [BIT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientScreening] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientTransferIn]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientTransferIn]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientTransferIn]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ServiceAreaId]        [INT] NOT NULL,
         [TransferInDate]       [DATETIME] NOT NULL,
         [TreatmentStartDate]   [DATETIME] NOT NULL,
         [CurrentTreatment]     [VARCHAR](50) NOT NULL,
         [FacilityFrom]         [VARCHAR](150) NOT NULL,
         [MFLCode]              [INT] NOT NULL,
         [CountyFrom]           [VARCHAR](150) NOT NULL,
         [TransferInNotes]      [VARCHAR](250) NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientTransferIn] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientTreatementDiagnosis]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatementDiagnosis]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientTreatementDiagnosis]
        ([id]                   [INT] NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Diagnosis]            [VARCHAR](250) NOT NULL,
         [Treatment]            [VARCHAR](250) NOT NULL,
         [Dose]                 [INT] NOT NULL,
         [Duration]             [INT] NOT NULL,
         [NextAppointment]      [DATE] NOT NULL,
         [ReferredFor]          [VARCHAR](250) NOT NULL,
         [Void]                 [BIT] NOT NULL,
         [VoidBy]               [INT] NULL,
         [VoidDate]             [DATE] NULL,
         [CreateBy]             [INT] NULL,
         [CreateDate]           [DATE] NULL,
         CONSTRAINT [PK_PatientTreatementDiagnosis] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientTreatmentInitiation]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentInitiation]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientTreatmentInitiation]
        ([Id]                     [INT] IDENTITY(1, 1)
                                        NOT NULL,
         [PatientMasterVisitId]   [INT] NOT NULL,
         [PatientId]              [INT] NOT NULL,
         [DateStartedOnFirstLine] [DATETIME] NOT NULL,
         [Cohort]                 [VARCHAR](20) NOT NULL,
         [Regimen]                [INT] NULL,
		 [RegimenCode]            [VARCHAR](30) NULL,
         [BaselineViralload]      [DECIMAL](18, 0) NULL,
         [BaselineViralloadDate]  [DATETIME] NULL,
         [DeleteFlag]             [BIT] NOT NULL,
         [CreatedBy]              [INT] NOT NULL,
         [CreateDate]             [DATETIME] NOT NULL,
         [AuditData]              [XML] NULL,
         CONSTRAINT [PK_PatientTreatmentInitiation] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientTreatmentSupporter]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientTreatmentSupporter]
        ([Id]            [INT] IDENTITY(1, 1)
                               NOT NULL,
         [PersonId]      [INT] NOT NULL,
         [SupporterId]   [INT] NOT NULL,
         [MobileContact] [VARBINARY](MAX) NULL,
         [DeleteFlag]    [BIT] NOT NULL,
         [CreatedBy]     [INT] NOT NULL,
         [CreateDate]    [DATETIME] NOT NULL,
         [AuditData]     [XML] NULL,
         CONSTRAINT [PK_PatientTreatmentSupporter] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PatientVitals]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientVitals]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientVitals]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Temperature]          [DECIMAL](5, 2) NULL,
         [RespiratoryRate]      [DECIMAL](5, 2) NULL,
         [HeartRate]            [DECIMAL](5, 2) NULL,
         [BPDiastolic]          [INT] NULL,
         [BPSystolic]           [INT] NULL,
         [Height]               [DECIMAL](8, 2) NULL,
         [Weight]               [DECIMAL](8, 2) NULL,
         [Muac]                 [DECIMAL](8, 2) NULL,
         [SpO2]                 [DECIMAL](5, 2) NULL,
         [BMI]                  [DECIMAL](8, 2) NULL,
         [HeadCircumference]    [DECIMAL](8, 2) NULL,
         [BMIZ]                 [VARCHAR](50) NULL,
         [WeightForAge]         [VARCHAR](50) NULL,
         [WeightForHeight]      [VARCHAR](50) NULL,
         [Active]               [BIT] NULL,
         [VisitDate]            [DATETIME] NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PatientVitals_1] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO


SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Person]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Person]
        ([Id]         [INT] IDENTITY(1, 1)
                            NOT NULL,
         [FirstName]  [VARBINARY](800) NOT NULL,
         [MidName]    [VARBINARY](800) NULL,
         [LastName]   [VARBINARY](800) NOT NULL,
         [Sex]        [INT] NOT NULL,
         [Active]     [BIT] NOT NULL,
         [DeleteFlag] [BIT] NOT NULL,
         [CreateDate] [DATETIME2](7) NOT NULL,
         [CreatedBy]  [INT] NOT NULL,
         [AuditData]  [XML] NULL,
         CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PersonContact]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PersonContact]
        ([Id]                [INT] IDENTITY(1, 1)
                                   NOT NULL,
         [PersonId]          [INT] NOT NULL,
         [PhysicalAddress]   [VARBINARY](MAX) NOT NULL,
         [MobileNumber]      [VARBINARY](MAX) NOT NULL,
         [AlternativeNumber] [VARBINARY](MAX) NULL,
         [EmailAddress]      [VARBINARY](MAX) NULL,
         [Active]            [BIT] NOT NULL,
         [DeleteFlag]        [INT] NOT NULL,
         [CreatedBy]         [INT] NOT NULL,
         [CreateDate]        [DATETIME] NOT NULL,
         [AuditData]         [XML] NULL,
         CONSTRAINT [PK_person_contact] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PersonLocation]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PersonLocation]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PersonLocation]
        ([Id]                  [INT] IDENTITY(1, 1)
                                     NOT NULL,
         [PersonId]            [INT] NOT NULL,
         [County]              [INT] NOT NULL,
         [SubCounty]           [INT] NOT NULL,
         [Ward]                [INT] NOT NULL,
         [Village]             [VARCHAR](250) NOT NULL,
         [Location]            [VARCHAR](250) NOT NULL,
         [SubLocation]         [VARCHAR](250) NOT NULL,
         [LandMark]            [VARCHAR](250) NOT NULL,
         [NearestHealthCentre] [VARCHAR](250) NOT NULL,
         [Active]              [BIT] NOT NULL,
         [SketchMap]           [VARBINARY](1000) NULL,
         [DeleteFlag]          [BIT] NOT NULL,
         [CreatedBy]           [INT] NOT NULL,
         [CreateDate]          [DATETIME] NOT NULL,
         [AuditData]           [XML] NULL,
         CONSTRAINT [PK_PersonLocation] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PersonRelationship]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PersonRelationship]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PersonRelationship]
        ([PersonId]           [INT] NOT NULL,
         [RelatedTo]          [INT] NOT NULL,
         [RelationshipTypeId] [INT] NOT NULL,
         [DeleteFlag]         [BIT] NOT NULL,
         [CreatedBy]          [INT] NOT NULL,
         [CreateDate]         [DATETIME] NOT NULL,
         [AuditData]          [XML] NULL,
         [ID]                 [INT] IDENTITY(1, 1)
                                    NOT NULL,
         CONSTRAINT [PK_PersonRelationship] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO


/****** Object:  Table [dbo].[PatientLinkage]    Script Date: 7/24/2017 6:49:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientLinkage]')
          AND type IN(N'U')
)

BEGIN

CREATE TABLE [dbo].[PatientLinkage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[LinkageDate] [datetime] NOT NULL,
	[CCCNumber] [varchar](15) NOT NULL,
	[Facility] [varchar](50) NULL,
	[Enrolled] [bit] NULL,
	[PatientId] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientLinkage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END;
GO


/****** Object:  Table [dbo].[PhysicalExamination]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PhysicalExamination]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ExaminationTypeId]    [INT] NOT NULL,
         [ExamId]               [INT] NOT NULL,
         [Finding]              [VARCHAR](400) NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         CONSTRAINT [PK_PhysicalExamination_1] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[Pregnancy]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Pregnancy]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Pregnancy]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [LMP]                  [DATETIME] NOT NULL,
         [EDD]                  [DATETIME] NOT NULL,
         [Gravidae]             [VARCHAR](50) NULL,
         [Parity]               [VARCHAR](50) NULL,
         [Outcome]              [INT] NULL,
         [DateOfOutcome]        [DATETIME] NULL,
         [Active]               [BIT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_Pregnancy] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PregnancyIndicator]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PregnancyIndicator]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PregnancyIndicator]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [LMP]                  [DATETIME] NOT NULL,
         [EDD]                  [DATETIME] NULL,
         [PregnancyStatusId]    [INT] NOT NULL,
         [ANCProfile]           [BIT] NOT NULL,
         [ANCProfileDate]       [DATETIME] NULL,
         [Active]               [BIT] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_PregnancyIndicator] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/***** Object:  Table [dbo].[FacilityList]    Script Date: 6/5/2017 2:12:10 PM *****/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[FacilityList]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[FacilityList]
        ([id]      [INT] IDENTITY(1, 1)
                         NOT NULL,
         [MFLCode] [NVARCHAR](500) NULL,
         [Name]    [NVARCHAR](500) NULL,
         CONSTRAINT [PK_FacilityList] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PregnancyLog]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PregnancyLog]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PregnancyLog]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NULL,
         [PatientMasterVisitId] [INT] NULL,
         [LMP]                  [DATE] NOT NULL,
         [EDD]                  [DATE] NOT NULL,
         [Outcome]              [INT] NULL,
         [DateOfOutcome]        [DATE] NULL,
         [Active]               [BIT] NULL,
         [CreatedBy]            [INT] NULL,
         [DeleteFlag]           [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         CONSTRAINT [PK_PregnancyLog] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[PresentingComplaints]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PresentingComplaints]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PresentingComplaints]
        ([Id]                     [INT] IDENTITY(1, 1)
                                        NOT NULL,
         [PatientId]              [INT] NULL,
         [PatientMasterVisitId]   [INT] NULL,
         [PresentingComplaintsId] [INT] NULL,
         [onsetDate]              [DATETIME] NULL,
         [deleteFlag]             [INT] NULL,
         [CreatedBy]              [INT] NULL,
         [CreatedDate]            [DATETIME] NULL,
         CONSTRAINT [PK_PresentingComplaints] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[Referrals]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Referrals]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Referrals]
        ([id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [ReferredFrom]         [INT] NOT NULL,
         [ReferredTo]           [INT] NOT NULL,
         [ReferralReason]       [VARCHAR](150) NOT NULL,
         [ReferralDate]         [DATETIME] NOT NULL,
         [ReferredBy]           [VARCHAR](50) NOT NULL,
         [Void]                 [BIT] NOT NULL,
         [VoidBy]               [INT] NULL,
         [VoidDate]             [DATETIME] NULL,
         [CreateBy]             [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         CONSTRAINT [PK_Referrals] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[ServiceArea]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ServiceArea]
        ([Id]          [INT] IDENTITY(1, 1)  NOT NULL,
		[Name]        [VARCHAR](150) NULL,
         [Code]        [VARCHAR](10) NULL,
         [DisplayName] [VARCHAR](150) NULL,
         [CreateBy]    [INT] NOT NULL,
         [CreateDate]  [DATETIME] NOT NULL,
         [DeleteFlag]      [BIT] NOT NULL,
		 [AuditData]		[Xml] Null,
         CONSTRAINT [PK_ServiceArea] PRIMARY KEY CLUSTERED([Id] ASC)
        )        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[ServiceEntryPoint]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ServiceEntryPoint]
        ([Id]            [INT] IDENTITY(1, 1)
                               NOT NULL,
         [PatientId]     [INT] NOT NULL,
         [ServiceAreaId] [INT] NOT NULL,
         [EntryPointId]  [INT] NOT NULL,
         [DeleteFlag]    [BIT] NOT NULL,
         [CreatedBy]     [INT] NOT NULL,
         [CreateDate]    [DATETIME] NOT NULL,
         [Active]        [BIT] NOT NULL,
         [AuditData]     [XML] NULL,
         CONSTRAINT [PK_ServiceEntryPoint] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[tabledrugpharmacy]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[tabledrugpharmacy]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[tabledrugpharmacy]
        ([ptn_pharmacy_pk]   [INT] NOT NULL,
         [Drug_Pk]           [INT] NOT NULL,
         [GenericID]         [INT] NULL,
         [StrengthID]        [INT] NULL,
         [FrequencyID]       [INT] NULL,
         [Duration]          [INT] NULL,
         [OrderedQuantity]   [INT] NULL,
         [DispensedQuantity] [INT] NULL,
         [HoldMedicine]      [INT] NULL,
         [Financed]          [INT] NULL,
         [Pediatric]         [INT] NULL,
         [UserID]            [INT] NULL,
         [CreateDate]        [DATETIME] NULL,
         [UpdateDate]        [DATETIME] NULL
        )
        ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[TBTreatmentTracker]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TBTreatmentTracker]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[TBTreatmentTracker]
        ([Id]          [INT] IDENTITY(1, 1)
                             NOT NULL,
         [PatientId]   [INT] NOT NULL,
         [YearMonth]   [VARCHAR](8) NOT NULL,
         [ScreeningId] [INT] NOT NULL,
         [TBRegNumber] [VARCHAR](50) NOT NULL,
         [DeleteFlag]  [BIT] NOT NULL,
         [CreateBy]    [INT] NOT NULL,
         [CreateDate]  [DATETIME] NOT NULL,
         [AuditData]   [XML] NULL,
         CONSTRAINT [PK_TBTreatmentTracker] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[TreatmentEventTracker]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [EventDate]            [DATETIME] NOT NULL,
         [EventType]            [INT] NOT NULL,
         [Category]             [VARCHAR](50) NOT NULL,
         [Previous]             [VARCHAR](50) NULL,
         [Current]              [VARCHAR](50) NOT NULL,
         [Reason]               [INT] NULL,
         [Notes]                [VARCHAR](250) NOT NULL,
         [Active]               [BIT] NULL,
         [DeleteFlag]           [INT] NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_TreatmentEventTracker] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[User]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[User]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[User]
        ([Id]         [INT] NOT NULL,
         [UserName]   [VARBINARY](400) NOT NULL,
         [Password]   [VARBINARY](400) NOT NULL,
         [EmployeeId] [INT] NOT NULL,
         [Active]     [BIT] NOT NULL,
         [DeleteFlag] [BIT] NOT NULL,
         [Locked]     [BIT] NOT NULL,
         [CreateBy]   [INT] NOT NULL,
         [CreateDate] [DATETIME] NOT NULL,
         [AuditLog]   [XML] NULL,
         CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[Vaccination]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Vaccination]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Vaccination]
        ([Id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Vaccine]              [INT] NOT NULL,
         [VaccineStage]         [VARCHAR](50) NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         [VaccineDate]          [DATETIME] NULL,
         [Active]               [BIT] NOT NULL,
         CONSTRAINT [PK_Vaccination] PRIMARY KEY CLUSTERED([Id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[vitals]    Script Date: 5/9/2017 9:31:10 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[vitals]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[vitals]
        ([Ptn_pk] [INT] NOT NULL,
         [Weight] [DECIMAL](18, 1) NULL
        )
        ON [PRIMARY];
    END;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[Identifiers]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[Identifiers](
			[Id] [int] IDENTITY(1,1) NOT NULL,
			[Name] [varchar](50) NULL,
			[Code] [varchar](20) NULL,
			[DisplayName] [varchar](50) NULL,
			[DataType] [varchar](50) NULL,
			[PrefixType] [varchar](50) NULL,
			[SuffixType] [varchar](50) NULL,
			[DeleteFlag] [bit] NULL,
			[CreatedBy] [int] NOT NULL,
			[CreateDate] [datetime] NULL,
			[AuditData] [xml] NULL,
		 CONSTRAINT [PK_Identifiers] PRIMARY KEY CLUSTERED 
		(
			[Id] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

/****** Object:  Table [dbo].[ServiceAreaIdentifiers]    Script Date: 5/10/2017 9:39:18 AM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[ServiceAreaIdentifiers](
			[Id] [int] IDENTITY(1,1) NOT NULL,
			[ServiceAreaId] [int] NOT NULL,
			[IdentifierId] [int] NOT NULL,
			[RequiredFlag] [bit] NULL,
		 CONSTRAINT [PK_ServiceAreaIdentifiers] PRIMARY KEY CLUSTERED 
		(
			[Id] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY];
    END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientPsychosocialCriteria]')
          AND type IN(N'U')
)
BEGIN
/****** Object:  Table [dbo].[PatientPsychosocialCriteria]    Script Date: 7/31/2017 7:35:42 AM ******/
CREATE TABLE [dbo].[PatientPsychosocialCriteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[BenefitART] [bit] NULL,
	[Alcohol] [bit] NULL,
	[Depression] [bit] NULL,
	[Disclosure] [bit] NULL,
	[AdministerART] [bit] NULL,
	[effectsART] [bit] NOT NULL CONSTRAINT [DF_PatientPsychosocialCriteria_effectsART]  DEFAULT ((0)),
	[dependents] [bit] NOT NULL CONSTRAINT [DF_PatientPsychosocialCriteria_dependents]  DEFAULT ((0)),
	[AdherenceBarriers] [bit] NULL,
	[AccurateLocator] [bit] NULL,
	[StartART] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_PatientPsychosocialCriteria_CreateDate]  DEFAULT (getdate()),
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_PatientPsychosocialCriteria_DeletFlag]  DEFAULT ((0)),
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientPsychosocialCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END;
/****** Object:  Table [dbo].[PatientSupportSystemCriteria]    Script Date: 7/31/2017 7:35:42 AM ******/
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientSupportSystemCriteria]')
          AND type IN(N'U')
)
BEGIN
CREATE TABLE [dbo].[PatientSupportSystemCriteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[TakingART] [bit] NULL,
	[supportGroup] [bit] NULL CONSTRAINT [DF_PatientSupportSystemCriteria_supportGroup]  DEFAULT ((0)),
	[TSIdentified] [bit] NULL,
	[EnrollSMSReminder] [bit] NULL,
	[OtherSupportSystems] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_PatientSupportSystemCriteria_CreateDate]  DEFAULT (getdate()),
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_PatientSupportSystemCriteria_DeleteFlag]  DEFAULT ((0)),
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PatientSupportSystemCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END;


SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientArtDistribution]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientArtDistribution]
        ([id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Categorization]       [INT] NOT NULL,
         [DateAssessed]         [DATETIME] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_patient_ArtDistribution] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO



SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientCategorization]')
          AND type IN(N'U')
)
    BEGIN
        CREATE TABLE [dbo].[PatientCategorization]
        ([id]                   [INT] IDENTITY(1, 1)
                                      NOT NULL,
         [PatientId]            [INT] NOT NULL,
         [PatientMasterVisitId] [INT] NOT NULL,
         [Categorization]       [INT] NOT NULL,
         [DateAssessed]         [DATETIME] NOT NULL,
         [DeleteFlag]           [BIT] NOT NULL,
         [CreatedBy]            [INT] NOT NULL,
         [CreateDate]           [DATETIME] NOT NULL,
         [AuditData]            [XML] NULL,
         CONSTRAINT [PK_patient_Categorization] PRIMARY KEY CLUSTERED([id] ASC)
         WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        )
        ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
    END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientCategorization_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientCategorization]
        ADD CONSTRAINT [DF_PatientCategorization_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_HIVReConfirmatoryTest_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[HIVReConfirmatoryTest] ADD  CONSTRAINT [DF_HIVReConfirmatoryTest_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag];
    END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientCategorization_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientCategorization]
        ADD CONSTRAINT [DF_PatientCategorization_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]')
          AND name = N'IX_PatientClinicalNotes'
)
    CREATE NONCLUSTERED INDEX [IX_PatientClinicalNotes] ON [dbo].[PatientClinicalNotes]([PatientId] ASC, [PatientMasterVisitId] ASC, [FacilityId] ASC) ;
GO
SET ANSI_PADDING ON;
GO

/****** Object:  Index [IX_User_UserName]    Script Date: 5/9/2017 9:31:10 AM ******/

IF NOT EXISTS
(
    SELECT *
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'[dbo].[User]')
          AND name = N'IX_User_UserName'
)
    CREATE UNIQUE NONCLUSTERED INDEX [IX_User_UserName] ON [dbo].[User]([UserName] ASC) ;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_AdherenceAssessment_Deleteflag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[AdherenceAssessment]
        ADD CONSTRAINT [DF_AdherenceAssessment_Deleteflag] DEFAULT((0)) FOR [Deleteflag];
    END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientLinkage_Enrolled]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientLinkage]
        ADD  CONSTRAINT [DF_PatientLinkage_Enrolled]  DEFAULT ((0)) FOR [Enrolled]
    END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientLinkage_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientLinkage]
        ADD  CONSTRAINT [DF_PatientLinkage_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
    END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientReenrollment_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientReenrollment] ADD  CONSTRAINT [DF_PatientReenrollment_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag];
    END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientReenrollment_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientReenrollment] ADD  CONSTRAINT [DF_PatientReenrollment_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
    END;
GO

IF NOT EXISTS( SELECT * FROM sys.objects    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientReenrollment_Patient]')     AND type = 'F')  BEGIN
  ALTER TABLE [dbo].[PatientReenrollment]  WITH CHECK ADD  CONSTRAINT [FK_PatientReenrollment_Patient] FOREIGN KEY([PatientId])	REFERENCES [dbo].[Patient] ([Id])
  END;
GO


IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientAdheranceAssessment_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[AdherenceOutcome]
        ADD CONSTRAINT [DF_PatientAdheranceAssessment_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_AdultChildVaccination_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[AdultChildVaccination]
        ADD CONSTRAINT [DF_AdultChildVaccination_Void] DEFAULT((0)) FOR [Void];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Identifiers_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Identifiers]
        ADD CONSTRAINT [DF_Identifiers_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Identifiers_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Identifiers]
        ADD CONSTRAINT [DF_Identifiers_CreateDate] DEFAULT (getdate()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceAreaIdentifiers_ServiceAreaId]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ServiceAreaIdentifiers]
        ADD CONSTRAINT [DF_ServiceAreaIdentifiers_ServiceAreaId] DEFAULT ((0)) FOR [ServiceAreaId];
    END;
GO
IF NOT EXISTS( SELECT *  FROM sys.objects  WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_Identifiers]')   AND type = 'F')  BEGIN
   ALTER TABLE [dbo].[ServiceAreaIdentifiers]   WITH CHECK ADD  CONSTRAINT [FK_ServiceAreaIdentifiers_Identifiers] FOREIGN KEY([IdentifierId]) REFERENCES [dbo].[Identifiers] ([Id])
 END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_Identifiers]')
          AND type = 'F'
)
    BEGIN
        ALTER TABLE [dbo].[ServiceAreaIdentifiers] CHECK CONSTRAINT [FK_ServiceAreaIdentifiers_Identifiers];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_ServiceArea]')
          AND type = 'F'
)
    BEGIN
        ALTER TABLE [dbo].[ServiceAreaIdentifiers]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAreaIdentifiers_ServiceArea] FOREIGN KEY([ServiceAreaId])
		REFERENCES [dbo].[ServiceArea] ([Id])
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_ServiceArea]')
          AND type = 'F'
)
    BEGIN
		ALTER TABLE [dbo].[ServiceAreaIdentifiers] CHECK CONSTRAINT [FK_ServiceAreaIdentifiers_ServiceArea];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_AdverseEvent_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[AdverseEvent]
        ADD CONSTRAINT [DF_AdverseEvent_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_AdverseEvent_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[AdverseEvent]
        ADD CONSTRAINT [DF_AdverseEvent_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARTPataient_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ARTPataient]
        ADD CONSTRAINT [DF_ARTPataient_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_RegimenLineId]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ARVTreatmentTracker]
        ADD CONSTRAINT [DF_ARVTreatmentTracker_RegimenLineId] DEFAULT((0)) FOR [RegimenLineId];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_DrugId]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ARVTreatmentTracker]
        ADD CONSTRAINT [DF_ARVTreatmentTracker_DrugId] DEFAULT((0)) FOR [DrugId];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_ParentId]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ARVTreatmentTracker]
        ADD CONSTRAINT [DF_ARVTreatmentTracker_ParentId] DEFAULT((0)) FOR [ParentId];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ARVTreatmentTracker]
        ADD CONSTRAINT [DF_ARVTreatmentTracker_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARVTreatmentTracker_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ARVTreatmentTracker]
        ADD CONSTRAINT [DF_ARVTreatmentTracker_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ComplaintsHistory_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ComplaintsHistory]
        ADD CONSTRAINT [DF_ComplaintsHistory_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Disclosure_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Disclosure]
        ADD CONSTRAINT [DF_Disclosure_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Disclosure_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Disclosure]
        ADD CONSTRAINT [DF_Disclosure_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Disclosure_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Disclosure]
        ADD CONSTRAINT [DF_Disclosure_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Employment_Status_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Employment_Status]
        ADD CONSTRAINT [DF_Employment_Status_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_DiagnosisARVHistory_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[HIVEnrollmentBaseline]
        ADD CONSTRAINT [DF_DiagnosisARVHistory_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_HIVTesting_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[HIVTesting]
        ADD CONSTRAINT [DF_HIVTesting_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_HIVTesting_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[HIVTesting]
        ADD CONSTRAINT [DF_HIVTesting_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_INHProphylaxis_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[INHProphylaxis]
        ADD CONSTRAINT [DF_INHProphylaxis_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_INHProphylaxis_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[INHProphylaxis]
        ADD CONSTRAINT [DF_INHProphylaxis_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_INHProphylaxis_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[INHProphylaxis]
        ADD CONSTRAINT [DF_INHProphylaxis_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ItemStockBalance_BalanceDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ItemStockBalance]
        ADD CONSTRAINT [DF_ItemStockBalance_BalanceDate] DEFAULT(GETDATE()) FOR [BalanceDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Marital_Status_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Marital_Status]
        ADD CONSTRAINT [DF_Marital_Status_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ModuleMaster_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ModuleMaster]
        ADD CONSTRAINT [DF_ModuleMaster_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ModuleMaster_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ModuleMaster]
        ADD CONSTRAINT [DF_ModuleMaster_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Occupation_New_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Occupation_New]
        ADD CONSTRAINT [DF_Occupation_New_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Patient_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Patient]
        ADD CONSTRAINT [DF_Patient_Active] DEFAULT((1)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Patient_DobPrecision]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Patient]
        ADD CONSTRAINT [DF_Patient_DobPrecision] DEFAULT((0)) FOR [DobPrecision];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Patient_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Patient]
        ADD CONSTRAINT [DF_Patient_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Patient_RegistrationDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Patient]
        ADD CONSTRAINT [DF_Patient_RegistrationDate] DEFAULT(GETDATE()) FOR [RegistrationDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientAllergies_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientAllergies]
        ADD CONSTRAINT [DF_PatientAllergies_void] DEFAULT((0)) FOR [Void];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientAllergy_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientAllergy]
        ADD CONSTRAINT [DF_PatientAllergy_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_Status]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientAppointment]
        ADD CONSTRAINT [DF_PatientAppointment_Status] DEFAULT((0)) FOR [StatusId];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientAppointment]
        ADD CONSTRAINT [DF_PatientAppointment_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientAppointment_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientAppointment]
        ADD CONSTRAINT [DF_PatientAppointment_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARTUseHistory_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientARVHistory]
        ADD CONSTRAINT [DF_ARTUseHistory_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARTUseHistory_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientARVHistory]
        ADD CONSTRAINT [DF_ARTUseHistory_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientARTInitiationBaseline_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientBaselineAssessment]
        ADD CONSTRAINT [DF_PatientARTInitiationBaseline_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ARTInitiationBaseline_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientBaselineAssessment]
        ADD CONSTRAINT [DF_ARTInitiationBaseline_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientCareending_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientCareending]
        ADD CONSTRAINT [DF_PatientCareending_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientCareending_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientCareending]
        ADD CONSTRAINT [DF_PatientCareending_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ChronicIllness_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientChronicIllness]
        ADD CONSTRAINT [DF_ChronicIllness_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientChronicIllness_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientChronicIllness]
        ADD CONSTRAINT [DF_PatientChronicIllness_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientTreatementDiagnosis_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientClinicalDiagnosis]
        ADD CONSTRAINT [DF_PatientTreatementDiagnosis_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientClinicalNotes_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientClinicalNotes]
        ADD CONSTRAINT [DF_PatientClinicalNotes_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientClinicalNotes_ModifyFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientClinicalNotes]
        ADD CONSTRAINT [DF_PatientClinicalNotes_ModifyFlag] DEFAULT((0)) FOR [ModifyFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientConsent_IsActive]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientConsent]
        ADD CONSTRAINT [DF_PatientConsent_IsActive] DEFAULT((1)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientConsent_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientConsent]
        ADD CONSTRAINT [DF_PatientConsent_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientConsent_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientConsent]
        ADD CONSTRAINT [DF_PatientConsent_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientContact_IsActive]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientContact]
        ADD CONSTRAINT [DF_PatientContact_IsActive] DEFAULT((1)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_contact_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientContact]
        ADD CONSTRAINT [DF_patient_contact_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientDiagnosis_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientDiagnosis]
        ADD CONSTRAINT [DF_PatientDiagnosis_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_encounter_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientEncounter]
        ADD CONSTRAINT [DF_patient_encounter_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientEncounter_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientEncounter]
        ADD CONSTRAINT [DF_PatientEncounter_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_TransferIn]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientEnrollment]
        ADD CONSTRAINT [DF_PatientEnrollment_TransferIn] DEFAULT((0)) FOR [TransferIn];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientEnrollment]
        ADD CONSTRAINT [DF_PatientEnrollment_Active] DEFAULT((0)) FOR [CareEnded];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_enrollment_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientEnrollment]
        ADD CONSTRAINT [DF_patient_enrollment_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientEnrollment_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientEnrollment]
        ADD CONSTRAINT [DF_PatientEnrollment_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanning_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientFamilyPlanning]
        ADD CONSTRAINT [DF_PatientFamilyPlanning_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanning_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientFamilyPlanning]
        ADD CONSTRAINT [DF_PatientFamilyPlanning_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanning_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientFamilyPlanning]
        ADD CONSTRAINT [DF_PatientFamilyPlanning_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanningMethod_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientFamilyPlanningMethod]
        ADD CONSTRAINT [DF_PatientFamilyPlanningMethod_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanningMethod_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientFamilyPlanningMethod]
        ADD CONSTRAINT [DF_PatientFamilyPlanningMethod_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanningMethod_CreatedBy]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientFamilyPlanningMethod]
        ADD CONSTRAINT [DF_PatientFamilyPlanningMethod_CreatedBy] DEFAULT((0)) FOR [CreatedBy];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientFamilyPlanningMethod_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientFamilyPlanningMethod]
        ADD CONSTRAINT [DF_PatientFamilyPlanningMethod_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_DiagnosisARVHistory_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientHivDiagnosis]
        ADD CONSTRAINT [DF_DiagnosisARVHistory_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIcf_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIcf]
        ADD CONSTRAINT [DF_PatientIcf_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIcf_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIcf]
        ADD CONSTRAINT [DF_PatientIcf_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIcfAction_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIcfAction]
        ADD CONSTRAINT [DF_PatientIcfAction_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIcfAction_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIcfAction]
        ADD CONSTRAINT [DF_PatientIcfAction_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_identifier_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIdentifier]
        ADD CONSTRAINT [DF_patient_identifier_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIdentifier]
        ADD CONSTRAINT [DF_PatientIdentifier_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIdentifier]
        ADD CONSTRAINT [DF_PatientIdentifier_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIpt_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIpt]
        ADD CONSTRAINT [DF_PatientIpt_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIpt_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIpt]
        ADD CONSTRAINT [DF_PatientIpt_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIptOutcome_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIptOutcome]
        ADD CONSTRAINT [DF_PatientIptOutcome_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIptOutcome_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIptOutcome]
        ADD CONSTRAINT [DF_PatientIptOutcome_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIptWorkup_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIptWorkup]
        ADD CONSTRAINT [DF_PatientIptWorkup_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIptWorkup_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientIptWorkup]
        ADD CONSTRAINT [DF_PatientIptWorkup_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_person_location_is_active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientLocation]
        ADD CONSTRAINT [DF_person_location_is_active] DEFAULT((0)) FOR [is_active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_person_location_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientLocation]
        ADD CONSTRAINT [DF_person_location_void] DEFAULT((0)) FOR [Void];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_person_location_create_by]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientLocation]
        ADD CONSTRAINT [DF_person_location_create_by] DEFAULT((0)) FOR [createBy];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientMaritalStatus_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMaritalStatus]
        ADD CONSTRAINT [DF_PatientMaritalStatus_Active] DEFAULT((1)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_maritalstatus_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMaritalStatus]
        ADD CONSTRAINT [DF_patient_maritalstatus_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_maritalstatus_create_date]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMaritalStatus]
        ADD CONSTRAINT [DF_patient_maritalstatus_create_date] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_start]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMasterVisit]
        ADD CONSTRAINT [DF_PatientMasterVisit_start] DEFAULT(GETDATE()) FOR [Start];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMasterVisit]
        ADD CONSTRAINT [DF_PatientMasterVisit_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_Status]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMasterVisit]
        ADD CONSTRAINT [DF_PatientMasterVisit_Status] DEFAULT((0)) FOR [Status];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_createDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMasterVisit]
        ADD CONSTRAINT [DF_PatientMasterVisit_createDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientMasterVisit_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientMasterVisit]
        ADD CONSTRAINT [DF_PatientMasterVisit_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_ovcstatus_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientOVCStatus]
        ADD CONSTRAINT [DF_patient_ovcstatus_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientPHDP_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientPHDP]
        ADD CONSTRAINT [DF_PatientPHDP_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientPHDP_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientPHDP]
        ADD CONSTRAINT [DF_PatientPHDP_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientPhysicalExamination_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientPhysicalExamination]
        ADD CONSTRAINT [DF_PatientPhysicalExamination_Void] DEFAULT((0)) FOR [Void];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientPopulation_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientPopulation]
        ADD CONSTRAINT [DF_PatientPopulation_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_population_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientPopulation]
        ADD CONSTRAINT [DF_patient_population_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_population_create_date]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientPopulation]
        ADD CONSTRAINT [DF_patient_population_create_date] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientReferral_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientReferral]
        ADD CONSTRAINT [DF_PatientReferral_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientReferral_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientReferral]
        ADD CONSTRAINT [DF_PatientReferral_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientScreening_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientScreening]
        ADD CONSTRAINT [DF_PatientScreening_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientScreening_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientScreening]
        ADD CONSTRAINT [DF_PatientScreening_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientScreening_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientScreening]
        ADD CONSTRAINT [DF_PatientScreening_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_transfer_in_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientTransferIn]
        ADD CONSTRAINT [DF_transfer_in_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientTransferIn_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientTransferIn]
        ADD CONSTRAINT [DF_PatientTransferIn_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientTreatementDiagnosis_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientTreatementDiagnosis]
        ADD CONSTRAINT [DF_PatientTreatementDiagnosis_Void] DEFAULT((0)) FOR [Void];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientTreatementDiagnosis_VoidBy]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientTreatementDiagnosis]
        ADD CONSTRAINT [DF_PatientTreatementDiagnosis_VoidBy] DEFAULT((0)) FOR [VoidBy];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientTreatmentInitiation_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientTreatmentInitiation]
        ADD CONSTRAINT [DF_PatientTreatmentInitiation_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientTreatmentSupporter_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientTreatmentSupporter]
        ADD CONSTRAINT [DF_PatientTreatmentSupporter_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientVitals_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientVitals]
        ADD CONSTRAINT [DF_PatientVitals_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientVitals_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientVitals]
        ADD CONSTRAINT [DF_PatientVitals_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientVitals_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PatientVitals]
        ADD CONSTRAINT [DF_PatientVitals_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Person_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Person]
        ADD CONSTRAINT [DF_Person_Active] DEFAULT((1)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Person_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Person]
        ADD CONSTRAINT [DF_Person_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PersonContact_IsActive]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonContact]
        ADD CONSTRAINT [DF_PersonContact_IsActive] DEFAULT((1)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_person_contact_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonContact]
        ADD CONSTRAINT [DF_person_contact_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PersonContact_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonContact]
        ADD CONSTRAINT [DF_PersonContact_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientLocation_Village]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonLocation]
        ADD CONSTRAINT [DF_PatientLocation_Village] DEFAULT(NULL) FOR [Village];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientLocation_LandMark]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonLocation]
        ADD CONSTRAINT [DF_PatientLocation_LandMark] DEFAULT(NULL) FOR [LandMark];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientLocation_NearestHealthCentre]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonLocation]
        ADD CONSTRAINT [DF_PatientLocation_NearestHealthCentre] DEFAULT(NULL) FOR [NearestHealthCentre];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PersonLocation_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonLocation]
        ADD CONSTRAINT [DF_PersonLocation_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PersonRelationship_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonRelationship]
        ADD CONSTRAINT [DF_PersonRelationship_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PersonRelationship_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PersonRelationship]
        ADD CONSTRAINT [DF_PersonRelationship_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PhysicalExamination_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PhysicalExamination]
        ADD CONSTRAINT [DF_PhysicalExamination_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PhysicalExamination_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PhysicalExamination]
        ADD CONSTRAINT [DF_PhysicalExamination_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Pregnancy_Outcome]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Pregnancy]
        ADD CONSTRAINT [DF_Pregnancy_Outcome] DEFAULT((0)) FOR [Outcome];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Pregnancy_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Pregnancy]
        ADD CONSTRAINT [DF_Pregnancy_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Pregnancy_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Pregnancy]
        ADD CONSTRAINT [DF_Pregnancy_Void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Pregnancy_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Pregnancy]
        ADD CONSTRAINT [DF_Pregnancy_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PregnancyIndicator_ANCProfile]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PregnancyIndicator]
        ADD CONSTRAINT [DF_PregnancyIndicator_ANCProfile] DEFAULT((0)) FOR [ANCProfile];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PregnancyIndicator_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PregnancyIndicator]
        ADD CONSTRAINT [DF_PregnancyIndicator_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PregnancyIndicator_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PregnancyIndicator]
        ADD CONSTRAINT [DF_PregnancyIndicator_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PregnancyIndicator_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PregnancyIndicator]
        ADD CONSTRAINT [DF_PregnancyIndicator_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PregnancyLog_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PregnancyLog]
        ADD CONSTRAINT [DF_PregnancyLog_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_PregnancyLog_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[PregnancyLog]
        ADD CONSTRAINT [DF_PregnancyLog_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Referrals_Void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Referrals]
        ADD CONSTRAINT [DF_Referrals_Void] DEFAULT((0)) FOR [Void];
    END;
GO
IF NOT EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_CreateBy]') AND type = 'D')  BEGIN
        ALTER TABLE [dbo].[ServiceArea]   ADD CONSTRAINT [DF_ServiceArea_CreateBy] DEFAULT((0)) FOR [CreateBy];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ServiceArea]
        ADD CONSTRAINT [DF_ServiceArea_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ServiceEntryPoint]
        ADD CONSTRAINT [DF_ServiceEntryPoint_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ServiceEntryPoint]
        ADD CONSTRAINT [DF_ServiceEntryPoint_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[ServiceEntryPoint]
        ADD CONSTRAINT [DF_ServiceEntryPoint_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_TBTreatmentTracker_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[TBTreatmentTracker]
        ADD CONSTRAINT [DF_TBTreatmentTracker_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_TBTreatmentTracker_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[TBTreatmentTracker]
        ADD CONSTRAINT [DF_TBTreatmentTracker_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_TreatmentEventTracker_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[TreatmentEventTracker]
        ADD CONSTRAINT [DF_TreatmentEventTracker_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_TreatmentEventTracker_void]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[TreatmentEventTracker]
        ADD CONSTRAINT [DF_TreatmentEventTracker_void] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_TreatmentEventTracker_createDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[TreatmentEventTracker]
        ADD CONSTRAINT [DF_TreatmentEventTracker_createDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[User]
        ADD CONSTRAINT [DF_User_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_DeleteFlag]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[User]
        ADD CONSTRAINT [DF_User_DeleteFlag] DEFAULT((0)) FOR [DeleteFlag];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_User_Locked]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[User]
        ADD CONSTRAINT [DF_User_Locked] DEFAULT((0)) FOR [Locked];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_AdultChildVaccination_CreateDate]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Vaccination]
        ADD CONSTRAINT [DF_AdultChildVaccination_CreateDate] DEFAULT(GETDATE()) FOR [CreateDate];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vaccination_Active]')
          AND type = 'D'
)
    BEGIN
        ALTER TABLE [dbo].[Vaccination]
        ADD CONSTRAINT [DF_Vaccination_Active] DEFAULT((0)) FOR [Active];
    END;
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdherenceOutcome_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]')
)
    ALTER TABLE [dbo].[AdherenceOutcome]
    WITH CHECK
    ADD CONSTRAINT [FK_AdherenceOutcome_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdherenceOutcome_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]')
)
    ALTER TABLE [dbo].[AdherenceOutcome] CHECK CONSTRAINT [FK_AdherenceOutcome_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAdheranceAssessment_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]')
)
    ALTER TABLE [dbo].[AdherenceOutcome]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientAdheranceAssessment_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAdheranceAssessment_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdherenceOutcome]')
)
    ALTER TABLE [dbo].[AdherenceOutcome] CHECK CONSTRAINT [FK_PatientAdheranceAssessment_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdultChildVaccination_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdultChildVaccination]')
)
    ALTER TABLE [dbo].[AdultChildVaccination]
    WITH CHECK
    ADD CONSTRAINT [FK_AdultChildVaccination_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdultChildVaccination_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdultChildVaccination]')
)
    ALTER TABLE [dbo].[AdultChildVaccination] CHECK CONSTRAINT [FK_AdultChildVaccination_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdultChildVaccination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdultChildVaccination]')
)
    ALTER TABLE [dbo].[AdultChildVaccination]
    WITH CHECK
    ADD CONSTRAINT [FK_AdultChildVaccination_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
/****** Object:  Index [IX_County_CountyId]    Script Date: 5/11/2017 4:48:56 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND name = N'IX_County_CountyId')
CREATE NONCLUSTERED INDEX [IX_County_CountyId] ON [dbo].[County]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_County_SubCountyId]    Script Date: 5/11/2017 4:48:56 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND name = N'IX_County_SubCountyId')
CREATE NONCLUSTERED INDEX [IX_County_SubCountyId] ON [dbo].[County]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdultChildVaccination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdultChildVaccination]')
)
    ALTER TABLE [dbo].[AdultChildVaccination] CHECK CONSTRAINT [FK_AdultChildVaccination_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]')
)
    ALTER TABLE [dbo].[AdverseEvent]
    WITH CHECK
    ADD CONSTRAINT [FK_AdverseEvent_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]')
)
    ALTER TABLE [dbo].[AdverseEvent] CHECK CONSTRAINT [FK_AdverseEvent_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]')
)
    ALTER TABLE [dbo].[AdverseEvent]
    WITH CHECK
    ADD CONSTRAINT [FK_AdverseEvent_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdverseEvent_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[AdverseEvent]')
)
    ALTER TABLE [dbo].[AdverseEvent] CHECK CONSTRAINT [FK_AdverseEvent_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARVTreatmentTracker_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ARVTreatmentTracker]')
)
    ALTER TABLE [dbo].[ARVTreatmentTracker]
    WITH CHECK
    ADD CONSTRAINT [FK_ARVTreatmentTracker_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARVTreatmentTracker_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ARVTreatmentTracker]')
)
    ALTER TABLE [dbo].[ARVTreatmentTracker] CHECK CONSTRAINT [FK_ARVTreatmentTracker_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARVTreatmentTracker_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ARVTreatmentTracker]')
)
    ALTER TABLE [dbo].[ARVTreatmentTracker]
    WITH CHECK
    ADD CONSTRAINT [FK_ARVTreatmentTracker_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARVTreatmentTracker_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ARVTreatmentTracker]')
)
    ALTER TABLE [dbo].[ARVTreatmentTracker] CHECK CONSTRAINT [FK_ARVTreatmentTracker_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ComplaintsHistory_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]')
)
    ALTER TABLE [dbo].[ComplaintsHistory]
    WITH CHECK
    ADD CONSTRAINT [FK_ComplaintsHistory_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ComplaintsHistory_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ComplaintsHistory]')
)
    ALTER TABLE [dbo].[ComplaintsHistory] CHECK CONSTRAINT [FK_ComplaintsHistory_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disclosure_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Disclosure]')
)
    ALTER TABLE [dbo].[Disclosure]
    WITH CHECK
    ADD CONSTRAINT [FK_Disclosure_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Disclosure_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Disclosure]')
)
    ALTER TABLE [dbo].[Disclosure] CHECK CONSTRAINT [FK_Disclosure_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_HIVEnrollmentBaseline_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[HIVEnrollmentBaseline]')
)
    ALTER TABLE [dbo].[HIVEnrollmentBaseline]
    WITH CHECK
    ADD CONSTRAINT [FK_HIVEnrollmentBaseline_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_HIVEnrollmentBaseline_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[HIVEnrollmentBaseline]')
)
    ALTER TABLE [dbo].[HIVEnrollmentBaseline] CHECK CONSTRAINT [FK_HIVEnrollmentBaseline_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_HIVEnrollmentBaseline_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[HIVEnrollmentBaseline]')
)
    ALTER TABLE [dbo].[HIVEnrollmentBaseline]
    WITH CHECK
    ADD CONSTRAINT [FK_HIVEnrollmentBaseline_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_HIVEnrollmentBaseline_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[HIVEnrollmentBaseline]')
)
    ALTER TABLE [dbo].[HIVEnrollmentBaseline] CHECK CONSTRAINT [FK_HIVEnrollmentBaseline_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_INHProphylaxis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[INHProphylaxis]')
)
    ALTER TABLE [dbo].[INHProphylaxis]
    WITH CHECK
    ADD CONSTRAINT [FK_INHProphylaxis_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_INHProphylaxis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[INHProphylaxis]')
)
    ALTER TABLE [dbo].[INHProphylaxis] CHECK CONSTRAINT [FK_INHProphylaxis_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Patient_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]')
)
    ALTER TABLE [dbo].[Patient]
    WITH CHECK
    ADD CONSTRAINT [FK_Patient_Patient] FOREIGN KEY([Id]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Patient_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]')
)
    ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Patient_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]')
)
    ALTER TABLE [dbo].[Patient]
    WITH CHECK
    ADD CONSTRAINT [FK_Patient_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Patient_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]')
)
    ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAllergies_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAllergies]')
)
    ALTER TABLE [dbo].[PatientAllergies]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientAllergies_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAllergies_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAllergies]')
)
    ALTER TABLE [dbo].[PatientAllergies] CHECK CONSTRAINT [FK_PatientAllergies_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAppointment_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAppointment]')
)
    ALTER TABLE [dbo].[PatientAppointment]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientAppointment_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientAppointment_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientAppointment]')
)
    ALTER TABLE [dbo].[PatientAppointment] CHECK CONSTRAINT [FK_PatientAppointment_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientARVHistory]')
)
    ALTER TABLE [dbo].[PatientARVHistory]
    WITH CHECK
    ADD CONSTRAINT [FK_ARTUseHistory_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientARVHistory]')
)
    ALTER TABLE [dbo].[PatientARVHistory] CHECK CONSTRAINT [FK_ARTUseHistory_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientARVHistory]')
)
    ALTER TABLE [dbo].[PatientARVHistory]
    WITH CHECK
    ADD CONSTRAINT [FK_ARTUseHistory_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTUseHistory_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientARVHistory]')
)
    ALTER TABLE [dbo].[PatientARVHistory] CHECK CONSTRAINT [FK_ARTUseHistory_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientBaselineAssessment]')
)
    ALTER TABLE [dbo].[PatientBaselineAssessment]
    WITH CHECK
    ADD CONSTRAINT [FK_ARTInitiationBaseline_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientBaselineAssessment]')
)
    ALTER TABLE [dbo].[PatientBaselineAssessment] CHECK CONSTRAINT [FK_ARTInitiationBaseline_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientBaselineAssessment]')
)
    ALTER TABLE [dbo].[PatientBaselineAssessment]
    WITH CHECK
    ADD CONSTRAINT [FK_ARTInitiationBaseline_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ARTInitiationBaseline_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientBaselineAssessment]')
)
    ALTER TABLE [dbo].[PatientBaselineAssessment] CHECK CONSTRAINT [FK_ARTInitiationBaseline_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientCareending_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientCareending]')
)
    ALTER TABLE [dbo].[PatientCareending]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientCareending_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientCareending_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientCareending]')
)
    ALTER TABLE [dbo].[PatientCareending] CHECK CONSTRAINT [FK_PatientCareending_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientChronicIllness_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]')
)
    ALTER TABLE [dbo].[PatientChronicIllness]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientChronicIllness_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientChronicIllness_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientChronicIllness]')
)
    ALTER TABLE [dbo].[PatientChronicIllness] CHECK CONSTRAINT [FK_PatientChronicIllness_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientClinicalNotes_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]')
)
    ALTER TABLE [dbo].[PatientClinicalNotes]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientClinicalNotes_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientClinicalNotes_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]')
)
    ALTER TABLE [dbo].[PatientClinicalNotes] CHECK CONSTRAINT [FK_PatientClinicalNotes_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientClinicalNotes_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]')
)
    ALTER TABLE [dbo].[PatientClinicalNotes]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientClinicalNotes_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientClinicalNotes_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientClinicalNotes]')
)
    ALTER TABLE [dbo].[PatientClinicalNotes] CHECK CONSTRAINT [FK_PatientClinicalNotes_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientContact_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientContact]')
)
    ALTER TABLE [dbo].[PatientContact]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientContact_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientContact_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientContact]')
)
    ALTER TABLE [dbo].[PatientContact] CHECK CONSTRAINT [FK_PatientContact_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientDiagnosis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]')
)
    ALTER TABLE [dbo].[PatientDiagnosis]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientDiagnosis_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientDiagnosis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientDiagnosis]')
)
    ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientEncounter_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientEncounter]')
)
    ALTER TABLE [dbo].[PatientEncounter]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientEncounter_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientEncounter_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientEncounter]')
)
    ALTER TABLE [dbo].[PatientEncounter] CHECK CONSTRAINT [FK_PatientEncounter_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientEncounter_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientEncounter]')
)
    ALTER TABLE [dbo].[PatientEncounter]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientEncounter_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientEncounter_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientEncounter]')
)
    ALTER TABLE [dbo].[PatientEncounter] CHECK CONSTRAINT [FK_PatientEncounter_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientFamilyPlanning_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanning]')
)
    ALTER TABLE [dbo].[PatientFamilyPlanning]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientFamilyPlanning_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientFamilyPlanning_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanning]')
)
    ALTER TABLE [dbo].[PatientFamilyPlanning] CHECK CONSTRAINT [FK_PatientFamilyPlanning_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientFamilyPlanning_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanning]')
)
    ALTER TABLE [dbo].[PatientFamilyPlanning]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientFamilyPlanning_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientFamilyPlanning_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanning]')
)
    ALTER TABLE [dbo].[PatientFamilyPlanning] CHECK CONSTRAINT [FK_PatientFamilyPlanning_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientFamilyPlanningMethod_PatientFamilyPlanning]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanningMethod]')
)
    ALTER TABLE [dbo].[PatientFamilyPlanningMethod]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientFamilyPlanningMethod_PatientFamilyPlanning] FOREIGN KEY([PatientFPId]) REFERENCES [dbo].[PatientFamilyPlanning]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientFamilyPlanningMethod_PatientFamilyPlanning]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientFamilyPlanningMethod]')
)
    ALTER TABLE [dbo].[PatientFamilyPlanningMethod] CHECK CONSTRAINT [FK_PatientFamilyPlanningMethod_PatientFamilyPlanning];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiagnosisARVHistory_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientHivDiagnosis]')
)
    ALTER TABLE [dbo].[PatientHivDiagnosis]
    WITH CHECK
    ADD CONSTRAINT [FK_DiagnosisARVHistory_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiagnosisARVHistory_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientHivDiagnosis]')
)
    ALTER TABLE [dbo].[PatientHivDiagnosis] CHECK CONSTRAINT [FK_DiagnosisARVHistory_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIcf_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIcf]')
)
    ALTER TABLE [dbo].[PatientIcf]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientIcf_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIcf_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIcf]')
)
    ALTER TABLE [dbo].[PatientIcf] CHECK CONSTRAINT [FK_PatientIcf_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIcfAction_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIcfAction]')
)
    ALTER TABLE [dbo].[PatientIcfAction]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientIcfAction_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIcfAction_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIcfAction]')
)
    ALTER TABLE [dbo].[PatientIcfAction] CHECK CONSTRAINT [FK_PatientIcfAction_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]')
)
    ALTER TABLE [dbo].[PatientIdentifier]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientIdentifier_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]')
)
    ALTER TABLE [dbo].[PatientIdentifier] CHECK CONSTRAINT [FK_PatientIdentifier_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_PatientEnrollment]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]')
)
    ALTER TABLE [dbo].[PatientIdentifier]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientIdentifier_PatientEnrollment] FOREIGN KEY([PatientEnrollmentId]) REFERENCES [dbo].[PatientEnrollment]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_PatientEnrollment]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]')
)
    ALTER TABLE [dbo].[PatientIdentifier] CHECK CONSTRAINT [FK_PatientIdentifier_PatientEnrollment];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIpt_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIpt]')
)
    ALTER TABLE [dbo].[PatientIpt]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientIpt_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIpt_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIpt]')
)
    ALTER TABLE [dbo].[PatientIpt] CHECK CONSTRAINT [FK_PatientIpt_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIptOutcome_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIptOutcome]')
)
    ALTER TABLE [dbo].[PatientIptOutcome]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientIptOutcome_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIptOutcome_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIptOutcome]')
)
    ALTER TABLE [dbo].[PatientIptOutcome] CHECK CONSTRAINT [FK_PatientIptOutcome_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIptWorkup_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIptWorkup]')
)
    ALTER TABLE [dbo].[PatientIptWorkup]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientIptWorkup_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIptWorkup_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIptWorkup]')
)
    ALTER TABLE [dbo].[PatientIptWorkup] CHECK CONSTRAINT [FK_PatientIptWorkup_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientLocation_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientLocation]')
)
    ALTER TABLE [dbo].[PatientLocation]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientLocation_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientLocation_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientLocation]')
)
    ALTER TABLE [dbo].[PatientLocation] CHECK CONSTRAINT [FK_PatientLocation_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientMaritalStatus_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMaritalStatus]')
)
    ALTER TABLE [dbo].[PatientMaritalStatus]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientMaritalStatus_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientMaritalStatus_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientMaritalStatus]')
)
    ALTER TABLE [dbo].[PatientMaritalStatus] CHECK CONSTRAINT [FK_PatientMaritalStatus_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]')
)
    ALTER TABLE [dbo].[PatientOVCStatus]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientOVCStatus_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]')
)
    ALTER TABLE [dbo].[PatientOVCStatus] CHECK CONSTRAINT [FK_PatientOVCStatus_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Person1]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]')
)
    ALTER TABLE [dbo].[PatientOVCStatus]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientOVCStatus_Person1] FOREIGN KEY([GuardianId]) REFERENCES [dbo].[Person]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientOVCStatus_Person1]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientOVCStatus]')
)
    ALTER TABLE [dbo].[PatientOVCStatus] CHECK CONSTRAINT [FK_PatientOVCStatus_Person1];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPHDP_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPHDP]')
)
    ALTER TABLE [dbo].[PatientPHDP]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientPHDP_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPHDP_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPHDP]')
)
    ALTER TABLE [dbo].[PatientPHDP] CHECK CONSTRAINT [FK_PatientPHDP_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPhysicalExamination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPhysicalExamination]')
)
    ALTER TABLE [dbo].[PatientPhysicalExamination]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientPhysicalExamination_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPhysicalExamination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPhysicalExamination]')
)
    ALTER TABLE [dbo].[PatientPhysicalExamination] CHECK CONSTRAINT [FK_PatientPhysicalExamination_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPopulation_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPopulation]')
)
    ALTER TABLE [dbo].[PatientPopulation]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientPopulation_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientPopulation_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPopulation]')
)
    ALTER TABLE [dbo].[PatientPopulation] CHECK CONSTRAINT [FK_PatientPopulation_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientProphylaxis_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientProphylaxis]')
)
    ALTER TABLE [dbo].[PatientProphylaxis]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientProphylaxis_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientProphylaxis_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientProphylaxis]')
)
    ALTER TABLE [dbo].[PatientProphylaxis] CHECK CONSTRAINT [FK_PatientProphylaxis_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientProphylaxis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientProphylaxis]')
)
    ALTER TABLE [dbo].[PatientProphylaxis]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientProphylaxis_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientProphylaxis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientProphylaxis]')
)
    ALTER TABLE [dbo].[PatientProphylaxis] CHECK CONSTRAINT [FK_PatientProphylaxis_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientReferral_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientReferral]')
)
    ALTER TABLE [dbo].[PatientReferral]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientReferral_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientReferral_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientReferral]')
)
    ALTER TABLE [dbo].[PatientReferral] CHECK CONSTRAINT [FK_PatientReferral_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientScreening_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientScreening]')
)
    ALTER TABLE [dbo].[PatientScreening]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientScreening_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientScreening_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientScreening]')
)
    ALTER TABLE [dbo].[PatientScreening] CHECK CONSTRAINT [FK_PatientScreening_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientScreening_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientScreening]')
)
    ALTER TABLE [dbo].[PatientScreening]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientScreening_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientScreening_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientScreening]')
)
    ALTER TABLE [dbo].[PatientScreening] CHECK CONSTRAINT [FK_PatientScreening_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTransferIn_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTransferIn]')
)
    ALTER TABLE [dbo].[PatientTransferIn]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientTransferIn_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTransferIn_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTransferIn]')
)
    ALTER TABLE [dbo].[PatientTransferIn] CHECK CONSTRAINT [FK_PatientTransferIn_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatementDiagnosis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatementDiagnosis]')
)
    ALTER TABLE [dbo].[PatientTreatementDiagnosis]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientTreatementDiagnosis_PatientMasterVisit] FOREIGN KEY([PatientId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatementDiagnosis_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatementDiagnosis]')
)
    ALTER TABLE [dbo].[PatientTreatementDiagnosis] CHECK CONSTRAINT [FK_PatientTreatementDiagnosis_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentInitiation_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentInitiation]')
)
    ALTER TABLE [dbo].[PatientTreatmentInitiation]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientTreatmentInitiation_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentInitiation_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentInitiation]')
)
    ALTER TABLE [dbo].[PatientTreatmentInitiation] CHECK CONSTRAINT [FK_PatientTreatmentInitiation_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]')
)
    ALTER TABLE [dbo].[PatientTreatmentSupporter]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientTreatmentSupporter_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientTreatmentSupporter_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter]')
)
    ALTER TABLE [dbo].[PatientTreatmentSupporter] CHECK CONSTRAINT [FK_PatientTreatmentSupporter_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientVitals_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientVitals]')
)
    ALTER TABLE [dbo].[PatientVitals]
    WITH CHECK
    ADD CONSTRAINT [FK_PatientVitals_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientVitals_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PatientVitals]')
)
    ALTER TABLE [dbo].[PatientVitals] CHECK CONSTRAINT [FK_PatientVitals_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonContact_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PersonContact]')
)
    ALTER TABLE [dbo].[PersonContact]
    WITH CHECK
    ADD CONSTRAINT [FK_PersonContact_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonContact_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PersonContact]')
)
    ALTER TABLE [dbo].[PersonContact] CHECK CONSTRAINT [FK_PersonContact_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonLocation_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PersonLocation]')
)
    ALTER TABLE [dbo].[PersonLocation]
    WITH CHECK
    ADD CONSTRAINT [FK_PersonLocation_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonLocation_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PersonLocation]')
)
    ALTER TABLE [dbo].[PersonLocation] CHECK CONSTRAINT [FK_PersonLocation_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonRelationship_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PersonRelationship]')
)
    ALTER TABLE [dbo].[PersonRelationship]
    WITH CHECK
    ADD CONSTRAINT [FK_PersonRelationship_Person] FOREIGN KEY([PersonId]) REFERENCES [dbo].[Person]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonRelationship_Person]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PersonRelationship]')
)
    ALTER TABLE [dbo].[PersonRelationship] CHECK CONSTRAINT [FK_PersonRelationship_Person];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhysicalExamination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]')
)
    ALTER TABLE [dbo].[PhysicalExamination]
    WITH CHECK
    ADD CONSTRAINT [FK_PhysicalExamination_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhysicalExamination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PhysicalExamination]')
)
    ALTER TABLE [dbo].[PhysicalExamination] CHECK CONSTRAINT [FK_PhysicalExamination_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pregnancy_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Pregnancy]')
)
    ALTER TABLE [dbo].[Pregnancy]
    WITH CHECK
    ADD CONSTRAINT [FK_Pregnancy_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pregnancy_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Pregnancy]')
)
    ALTER TABLE [dbo].[Pregnancy] CHECK CONSTRAINT [FK_Pregnancy_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pregnancy_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Pregnancy]')
)
    ALTER TABLE [dbo].[Pregnancy]
    WITH CHECK
    ADD CONSTRAINT [FK_Pregnancy_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pregnancy_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Pregnancy]')
)
    ALTER TABLE [dbo].[Pregnancy] CHECK CONSTRAINT [FK_Pregnancy_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PregnancyIndicator_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PregnancyIndicator]')
)
    ALTER TABLE [dbo].[PregnancyIndicator]
    WITH CHECK
    ADD CONSTRAINT [FK_PregnancyIndicator_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PregnancyIndicator_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PregnancyIndicator]')
)
    ALTER TABLE [dbo].[PregnancyIndicator] CHECK CONSTRAINT [FK_PregnancyIndicator_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PregnancyIndicator_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PregnancyIndicator]')
)
    ALTER TABLE [dbo].[PregnancyIndicator]
    WITH CHECK
    ADD CONSTRAINT [FK_PregnancyIndicator_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_PregnancyIndicator_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[PregnancyIndicator]')
)
    ALTER TABLE [dbo].[PregnancyIndicator] CHECK CONSTRAINT [FK_PregnancyIndicator_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Referrals_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Referrals]')
)
    ALTER TABLE [dbo].[Referrals]
    WITH CHECK
    ADD CONSTRAINT [FK_Referrals_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Referrals_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Referrals]')
)
    ALTER TABLE [dbo].[Referrals] CHECK CONSTRAINT [FK_Referrals_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceEntryPoint_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]')
)
    ALTER TABLE [dbo].[ServiceEntryPoint]
    WITH CHECK
    ADD CONSTRAINT [FK_ServiceEntryPoint_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceEntryPoint_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]')
)
    ALTER TABLE [dbo].[ServiceEntryPoint] CHECK CONSTRAINT [FK_ServiceEntryPoint_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBTreatmentTracker_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[TBTreatmentTracker]')
)
    ALTER TABLE [dbo].[TBTreatmentTracker]
    WITH CHECK
    ADD CONSTRAINT [FK_TBTreatmentTracker_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBTreatmentTracker_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[TBTreatmentTracker]')
)
    ALTER TABLE [dbo].[TBTreatmentTracker] CHECK CONSTRAINT [FK_TBTreatmentTracker_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_TreatmentEventTracker_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]')
)
    ALTER TABLE [dbo].[TreatmentEventTracker]
    WITH CHECK
    ADD CONSTRAINT [FK_TreatmentEventTracker_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]) ON UPDATE CASCADE ON DELETE CASCADE;
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_TreatmentEventTracker_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[TreatmentEventTracker]')
)
    ALTER TABLE [dbo].[TreatmentEventTracker] CHECK CONSTRAINT [FK_TreatmentEventTracker_PatientMasterVisit];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]')
)
    ALTER TABLE [dbo].[Vaccination]
    WITH CHECK
    ADD CONSTRAINT [FK_Vaccination_Patient] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_Patient]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]')
)
    ALTER TABLE [dbo].[Vaccination] CHECK CONSTRAINT [FK_Vaccination_Patient];
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]')
)
    ALTER TABLE [dbo].[Vaccination]
    WITH CHECK
    ADD CONSTRAINT [FK_Vaccination_PatientMasterVisit] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit]([Id]);
GO
IF EXISTS
(
    SELECT *
    FROM sys.foreign_keys
    WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vaccination_PatientMasterVisit]')
          AND parent_object_id = OBJECT_ID(N'[dbo].[Vaccination]')
)
    ALTER TABLE [dbo].[Vaccination] CHECK CONSTRAINT [FK_Vaccination_PatientMasterVisit];
GO


IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'AdherenceOutcome', N'COLUMN', N'DeleteFlag')
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Defaults to zero(0) and one (1) when deleted',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'AdherenceOutcome',
         @level2type = N'COLUMN',
         @level2name = N'DeleteFlag';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'AdherenceOutcome', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Track patient adherance on both CTX/Dapsone or ARV ',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'AdherenceOutcome';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'AdverseEvent', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Track adverse events courses,medication causing the adverse events,severity and actiontaken.Recorded per visit',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'AdverseEvent';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'HIVEnrollmentBaseline', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'HIVEnrollmentBaseline';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'Patient', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Master patient details.Captures generic patient information to be used across all service areas',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'Patient';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientAllergies', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient allergies per visit',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientAllergies';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientAllergy', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient allergies per visit',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientAllergy';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientAppointment', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient appointments and ststus of the appointments',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientAppointment';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientARVHistory', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Records Prior ART use experience.Especially for TI patients',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientARVHistory';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientBaselineAssessment', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Baseline summary of Initiation parameters,collected once during enrollment',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientBaselineAssessment';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientCareending', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks care ending for patients either deaths/TO',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientCareending';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientChronicIllness', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks Chronic Illnesses cormodities and the current treatment of the illnesses per visit',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientChronicIllness';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientConsent', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks and manages patient Consent information,can be updated to reflect the current Consent details with history of the previous Consents',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientConsent';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientContact', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks and manages patient contact information,can be updated to reflect the current contact details with history of the previous contacts',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientContact';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientDiagnosis', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Clinician conclusions on the treatment plan,done per visit',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientDiagnosis';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientEncounter', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks and manages all patient encounters per visit per service',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientEncounter';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientEnrollment', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient enrollment into the different service areas',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientEnrollment';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientHivDiagnosis', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientHivDiagnosis';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientIcf', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient ICF details',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientIcf';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientIcfAction', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient ICF Action',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientIcfAction';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientIdentifier', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks and manages patient service identifier information',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientIdentifier';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientIpt', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient IPT details',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientIpt';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientIptOutcome', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient ICF details',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientIptOutcome';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PatientIptWorkup', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks patient IPT workup',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PatientIptWorkup';
GO
IF NOT EXISTS
(
    SELECT *
    FROM sys.fn_listextendedproperty(N'MS_Description', N'SCHEMA', N'dbo', N'TABLE', N'PersonContact', NULL, NULL)
)
    EXEC sys.sp_addextendedproperty
         @name = N'MS_Description',
         @value = N'Tracks and manages patient contact information,can be updated to reflect the current contact details with history of the previous contacts',
         @level0type = N'SCHEMA',
         @level0name = N'dbo',
         @level1type = N'TABLE',
         @level1name = N'PersonContact';
GO

/****** Object:  Table [dbo].[PatientAdverseEventOutcome]    Script Date: 10/10/2017 7:48:38 AM ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientAdverseEventOutcome]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[PatientAdverseEventOutcome](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[PatientId] [int] NOT NULL,
		[PatientMasterVisitId] [int] NOT NULL,
		[AdverseEventId] [int] NOT NULL,
		[OutComeId] [int] NOT NULL,
		[OutcomeDate] [datetime] NOT NULL,
		[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_AdverseEventOutcome_DeleteFlag]  DEFAULT ((0)),
		[CreateDate] [datetime] NOT NULL,
		[CreatedBy] [int] NOT NULL,
		[AuditData] [xml] NULL,
		[UserId] [int] NOT NULL,
	 CONSTRAINT [PK_AdverseEventOutcome] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
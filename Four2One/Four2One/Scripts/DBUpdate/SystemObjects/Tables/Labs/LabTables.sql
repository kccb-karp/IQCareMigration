IF Exists (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_PatientLabResults]') AND type in (N'U'))
Begin		
	  Exec dbo.sp_rename 'dtl_PatientLabResults', 'dtl_PatientLabResults_Old'	
End
Go
IF Exists (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTest]') AND type in (N'U'))
Begin		
	  Exec dbo.sp_rename 'Mst_LabTest', 'Mst_LabTest_Old'	
End
Go
IF Exists (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_TestParameter]') AND type in (N'U'))
Begin		
	  Exec dbo.sp_rename 'lnk_TestParameter', 'lnk_TestParameter_Old'	
End
Go
IF Exists (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_PatientLabOrder]') AND type in (N'U'))
Begin		
	  Exec dbo.sp_rename 'ord_PatientLabOrder', 'ord_PatientLabOrder_Old'	
End
Go
IF Exists (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_parameterresult]') AND type in (N'U'))
Begin		
	  Exec dbo.sp_rename 'lnk_parameterresult', 'lnk_parameterresult_Old'	
End
Go
IF Exists (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_LabValue]') AND type in (N'U'))
Begin		
	  Exec dbo.sp_rename 'lnk_LabValue', 'lnk_LabValue_Old'	
End
Go




/****** Object:  Trigger [Insert_Results_LabTracker]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Insert_Results_LabTracker]'))
DROP TRIGGER [dbo].[Insert_Results_LabTracker]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameter_LabTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]'))
ALTER TABLE [dbo].[Mst_LabTestParameter] DROP CONSTRAINT [FK_LabTestParameter_LabTest]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTest_LabDepartment]') AND parent_object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]'))
ALTER TABLE [dbo].[mst_LabTestMaster] DROP CONSTRAINT [FK_LabTest_LabDepartment]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_2]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest] DROP CONSTRAINT [FK_GroupLabTest_LabTest_2]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupLabTest_LabTest_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]'))
ALTER TABLE [dbo].[lnk_GroupLabTest] DROP CONSTRAINT [FK_GroupLabTest_LabTest_1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterResultOption_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]'))
ALTER TABLE [dbo].[dtl_LabTestParameterResultOption] DROP CONSTRAINT [FK_LabTestParameterResultOption_LabTestParameter]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabTestParameterConfig_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]'))
ALTER TABLE [dbo].[dtl_LabTestParameterConfig] DROP CONSTRAINT [FK_LabTestParameterConfig_LabTestParameter]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabTestParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult] DROP CONSTRAINT [FK_LabOrderTestResult_LabTestParameter]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTestResult_LabOrderTest]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]'))
ALTER TABLE [dbo].[dtl_LabOrderTestResult] DROP CONSTRAINT [FK_LabOrderTestResult_LabOrderTest]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabTestMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest] DROP CONSTRAINT [FK_LabOrderTest_LabTestMaster]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LabOrderTest_LabOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]'))
ALTER TABLE [dbo].[dtl_LabOrderTest] DROP CONSTRAINT [FK_LabOrderTest_LabOrder]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabType_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabType] DROP CONSTRAINT [DF_mst_LabType_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mst_LabTestParameter_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mst_LabTestParameter] DROP CONSTRAINT [DF_Mst_LabTestParameter_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mst_LabTestParameter_OrdRank]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mst_LabTestParameter] DROP CONSTRAINT [DF_Mst_LabTestParameter_OrdRank]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] DROP CONSTRAINT [DF_mst_LabTestMaster_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] DROP CONSTRAINT [DF_mst_LabTestMaster_CreatedBy]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] DROP CONSTRAINT [DF_mst_LabTestMaster_Active]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_IsGroup]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] DROP CONSTRAINT [DF_mst_LabTestMaster_IsGroup]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabDepartment_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabDepartment] DROP CONSTRAINT [DF_mst_LabDepartment_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_LabTestParameterResultOption_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabTestParameterResultOption] DROP CONSTRAINT [DF_dtl_LabTestParameterResultOption_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_LabTestParameterConfig_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabTestParameterConfig] DROP CONSTRAINT [DF_dtl_LabTestParameterConfig_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_LabOrderTestResult_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabOrderTestResult] DROP CONSTRAINT [DF_dtl_LabOrderTestResult_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LabOrderTest_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabOrderTest] DROP CONSTRAINT [DF_LabOrderTest_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LabOrderTest_IsParent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabOrderTest] DROP CONSTRAINT [DF_LabOrderTest_IsParent]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Dtl_LabGroupItems_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Dtl_LabGroupItems] DROP CONSTRAINT [DF_Dtl_LabGroupItems_DeleteFlag]
END
GO
/****** Object:  Index [IX_Mst_LabTestParameter]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND name = N'IX_Mst_LabTestParameter')
DROP INDEX [IX_Mst_LabTestParameter] ON [dbo].[Mst_LabTestParameter]
GO
/****** Object:  Index [IX_mst_LabTestMaster_Ref]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND name = N'IX_mst_LabTestMaster_Ref')
DROP INDEX [IX_mst_LabTestMaster_Ref] ON [dbo].[mst_LabTestMaster]
GO
/****** Object:  Index [IX_Mst_LabTestMaster_Name]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND name = N'IX_Mst_LabTestMaster_Name')
DROP INDEX [IX_Mst_LabTestMaster_Name] ON [dbo].[mst_LabTestMaster]
GO
/****** Object:  Index [IX_dtl_LabTestParameterResultOption]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND name = N'IX_dtl_LabTestParameterResultOption')
DROP INDEX [IX_dtl_LabTestParameterResultOption] ON [dbo].[dtl_LabTestParameterResultOption]
GO
/****** Object:  Index [NCI_TestResult_OrderIdDeleteFlag_INC]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_TestResult_OrderIdDeleteFlag_INC')
DROP INDEX [NCI_TestResult_OrderIdDeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
GO
/****** Object:  Index [NCI_dtl_LabOrderTestResult_DeleteFlag_INC]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_dtl_LabOrderTestResult_DeleteFlag_INC')
DROP INDEX [NCI_dtl_LabOrderTestResult_DeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
GO
/****** Object:  Table [dbo].[PatientLabTracker]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]') AND type in (N'U'))
DROP TABLE [dbo].[PatientLabTracker]
GO

/****** Object:  Table [dbo].[Mst_LabTestParameter]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND type in (N'U'))
DROP TABLE [dbo].[Mst_LabTestParameter]
GO
/****** Object:  Table [dbo].[mst_LabTestMaster]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND type in (N'U'))
DROP TABLE [dbo].[mst_LabTestMaster]
GO


/****** Object:  Table [dbo].[lnk_GroupLabTest]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lnk_GroupLabTest]') AND type in (N'U'))
DROP TABLE [dbo].[lnk_GroupLabTest]
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterResultOption]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND type in (N'U'))
DROP TABLE [dbo].[dtl_LabTestParameterResultOption]
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterConfig]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterConfig]') AND type in (N'U'))
DROP TABLE [dbo].[dtl_LabTestParameterConfig]
GO
/****** Object:  Table [dbo].[dtl_LabOrderTestResult]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND type in (N'U'))
DROP TABLE [dbo].[dtl_LabOrderTestResult]
GO
/****** Object:  Table [dbo].[dtl_LabOrderTest]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]') AND type in (N'U'))
DROP TABLE [dbo].[dtl_LabOrderTest]
GO
/****** Object:  Table [dbo].[Dtl_LabGroupItems]    Script Date: 5/23/2018 1:41:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dtl_LabGroupItems]') AND type in (N'U'))
DROP TABLE [dbo].[Dtl_LabGroupItems]
GO



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ord_LabOrder]') AND type in (N'U'))
DROP TABLE [dbo].[ord_LabOrder]
GO

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
	[OrderNumber] [varchar](50) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeleteDate] [datetime] NULL,
	[DeleteReason] [varchar](250) NULL,
	[PatientId] [int] NULL,
	[PatientMasterVisitId] [int] NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_ord_LabOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ord_LabOrder] ADD  CONSTRAINT [DF_ord_LabOrder_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO



/****** Object:  Table [dbo].[Dtl_LabGroupItems]    Script Date: 5/23/2018 1:41:53 PM ******/
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
/****** Object:  Table [dbo].[dtl_LabOrderTest]    Script Date: 5/23/2018 1:41:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabOrderTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[TestNotes] [varchar](255) NULL,
	[IsParent] [bit] NOT NULL,
	[ParentTestId] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[ResultNotes] [varchar](255) NULL,
	[ResultBy] [int] NULL,
	[ResultDate] [datetime] NULL,
	[ResultStatus] [varchar](50) NULL,
	[UserId] [int] NULL,
	[StatusDate] [datetime] NULL,
	[cpad_visit_id] [int] NULL,
	[cpad_enrollment_id] [varchar](36) NULL,
	[AuditData] [xml] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_dtl_LabOrderTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_LabOrderTestResult]    Script Date: 5/23/2018 1:41:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabOrderTestResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabOrderId] [int] NOT NULL,
	[LabTestId] [int] NOT NULL,
	[LabOrderTestId] [int] NOT NULL,
	[ParameterId] [int] NOT NULL,
	[ResultValue] [decimal](10, 2) NULL,
	[ResultText] [varchar](400) NULL,
	[ResultOptionId] [int] NULL,
	[ResultOption] [varchar](50) NULL,
	[ResultUnit] [varchar](50) NULL,
	[ResultUnitId] [int] NULL,
	[ResultConfigId] [int] NULL,
	[Undetectable] [bit] NULL,
	[DetectionLimit] [decimal](18, 2) NULL,
	[UserId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[StatusDate] [datetime] NOT NULL,
	[HasResult]  AS (CONVERT([bit],case when [resultvalue] IS NULL AND [resulttext] IS NULL AND [resultoption] IS NULL AND [Undetectable] IS NULL AND [DetectionLimit] IS NULL then (0) else (1) end,(0))),
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_dtl_LabOrderTestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterConfig]    Script Date: 5/23/2018 1:41:53 PM ******/
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
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_dtl_LabTestParameterConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[dtl_LabTestParameterResultOption]    Script Date: 5/23/2018 1:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dtl_LabTestParameterResultOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParameterId] [int] NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_dtl_LabTestParameterResultOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[lnk_GroupLabTest]    Script Date: 5/23/2018 1:41:54 PM ******/
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

/****** Object:  Table [dbo].[Mst_LabTestParameter]    Script Date: 5/23/2018 1:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mst_LabTestParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceId] [varchar](36) NOT NULL,
	[ParameterName] [varchar](250) NOT NULL,
	[LabTestId] [int] NOT NULL,
	[DataType] [varchar](20) NOT NULL,
	[OrdRank] [decimal](5, 2) NOT NULL,
	[LoincCode] [varchar](50) NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Mst_LabTestParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[fn_Laboratory_GetParameterCount]') 
AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Laboratory_GetParameterCount]
GO

/****** Object:  Table [dbo].[mst_LabTestMaster]    Script Date: 5/23/2018 1:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mst_LabTestMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceId] [varchar](36) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[IsGroup] [bit] NOT NULL,
	[DepartmentId] [int] NULL,
	--[ParameterCount]  AS ([dbo].[fn_Laboratory_GetParameterCount]([Id])),
	[Active] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[DeletedBy] [int] NULL,
	[DeleteDate] [datetime] NULL,
	[LoincCode] [varchar](50) NULL,
 CONSTRAINT [PK_mst_LabTestMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

CREATE FUNCTION [dbo].[fn_Laboratory_GetParameterCount]
(
	@LabTestId int
)
RETURNS int
AS
BEGIN
	DECLARE @Count int
	Select 
		@Count = Case 
					When IsGroup = 0 Then (Select Count(Id) From Mst_LabTestParameter Where LabTestId = @LabTestId And DeleteFlag = 0)
					Else (Select Count(P.Id) From lnk_GroupLabTest G 
								Inner join Mst_LabTestParameter P On G.LabTestId = P.LabTestId
								Where GroupLabTestId=@LabTestId and p.DeleteFlag = 0
						) End
	From mst_LabTestMaster M Where Id = @LabTestId
	RETURN @Count

END
GO

ALTER TABLE mst_LabTestMaster ADD [ParameterCount]  AS ([dbo].[fn_Laboratory_GetParameterCount]([Id]))
GO


/****** Object:  Table [dbo].[PatientLabTracker]    Script Date: 5/23/2018 1:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientLabTracker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientLabTracker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[PatientMasterVisitId] [int] NOT NULL,
	[LabName] [varchar](50) NOT NULL,
	[SampleDate] [datetime] NOT NULL,
	[Reasons] [varchar](50) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
	[DeleteFlag] [bit] NULL,
	[Results] [varchar](50) NULL,
	[LabOrderId] [int] NULL,
	[ResultValues] [decimal](18, 0) NULL,
	[FacilityId] [int] NULL,
	[LabTestId] [int] NULL,
	[ResultTexts] [varchar](50) NULL,
	[LabOrderTestId] [int] NULL,
	[ResultUnits] [varchar](50) NULL,
	[ResultDate] [datetime] NULL,
	[ResultOptions] [varchar](50) NULL,
 CONSTRAINT [PK_PatientLabTracker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[dtl_LabTestParameterConfig] ON 
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (1, 1, CAST(0.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), 127, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (2, 2, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 137, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (3, 3, CAST(50.00 AS Decimal(18, 2)), CAST(2000000.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(2000000.00 AS Decimal(18, 2)), 129, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (4, 5, CAST(5.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(55.00 AS Decimal(18, 2)), 137, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (5, 6, CAST(1.50 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), 130, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (6, 7, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), 125, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (7, 9, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 125, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (8, 10, CAST(0.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), 138, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (9, 11, CAST(0.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), 138, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (10, 12, CAST(0.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), 133, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (11, 13, CAST(0.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), 138, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (12, 28, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 128, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (13, 29, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 128, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (14, 30, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 128, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (15, 31, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 128, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (16, 32, CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 135, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (24, 54, CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 135, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (25, 82, CAST(0.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 126, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (26, 83, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), 137, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (27, 84, CAST(0.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 126, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (28, 85, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), 137, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (29, 86, CAST(0.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 126, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (30, 87, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 137, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (31, 88, CAST(0.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 126, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (32, 89, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 137, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (33, 90, CAST(0.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 136, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (34, 91, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 136, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (35, 92, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 136, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (36, 93, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 136, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (37, 94, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 136, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (38, 95, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 136, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (39, 96, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 136, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (40, 106, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(133.00 AS Decimal(18, 2)), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (41, 58, CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (42, 62, CAST(0.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (43, 69, CAST(0.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (44, 76, CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (45, 78, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (46, 54, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 133, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (47, 54, CAST(0.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), 139, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (48, 32, CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), 133, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (49, 32, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 131, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (50, 107, CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 129, 1, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (51, 5, CAST(0.05 AS Decimal(18, 2)), CAST(0.60 AS Decimal(18, 2)), CAST(0.05 AS Decimal(18, 2)), CAST(0.06 AS Decimal(18, 2)), 124, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (52, 6, CAST(5.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 135, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (53, 7, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 126, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (54, 83, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 124, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (55, 85, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, 124, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (56, 87, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, 124, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (57, 89, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, 124, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (58, 9, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, 126, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (59, 10, CAST(0.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), NULL, NULL, 134, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (60, 11, CAST(0.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), NULL, NULL, 134, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (61, 12, CAST(0.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, 135, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (62, 12, CAST(0.00 AS Decimal(18, 2)), CAST(1200.00 AS Decimal(18, 2)), NULL, NULL, 139, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[dtl_LabTestParameterConfig] ([Id], [ParameterId], [MinBoundary], [MaxBoundary], [MinNormalRange], [MaxNormalRange], [UnitId], [DefaultUnit], [DetectionLimit], [DeleteFlag]) VALUES (63, 13, CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), NULL, NULL, 134, 0, CAST(0.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[dtl_LabTestParameterConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[dtl_LabTestParameterResultOption] ON 
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (1, 53, N'Postive', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (2, 53, N'Negative', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (3, 53, N'Confirmatory', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (4, 97, N'0-2', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (5, 97, N'3-5', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (6, 97, N'6-10', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (7, 97, N'11-25', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (8, 97, N'TNTC', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (9, 98, N'0-2', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (10, 98, N'3-5', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (11, 98, N'6-10', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (12, 98, N'11-25', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (13, 98, N'TNTC', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (14, 99, N'0-2', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (15, 99, N'3-5', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (16, 99, N'6-10', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (17, 99, N'11-25', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (18, 99, N'TNTC', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (19, 100, N'Hyaline', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (20, 100, N'Granular', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (21, 100, N'RBC', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (22, 100, N'WBC', 0)
GO
INSERT [dbo].[dtl_LabTestParameterResultOption] ([Id], [ParameterId], [Value], [DeleteFlag]) VALUES (23, 100, N'Waxy', 0)
GO
SET IDENTITY_INSERT [dbo].[dtl_LabTestParameterResultOption] OFF
GO

SET IDENTITY_INSERT [dbo].[mst_LabTestMaster] ON 
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (1, N'CD4', N'CD4', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (2, N'CD4_PERCENT', N'CD4 Percent', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (3, N'VIRAL_LOAD', N'Viral Load', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (4, N'STOREPLASMA', N'Store Plasma', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (5, N'HCT_HBPERCENT', N'HCT/Hb percent', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (6, N'HCT_HB', N'HCT/Hb', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (7, N'WBC', N'WBC', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (8, N'WBCDIFF', N'WBC Diff', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (9, N'PLATELETS', N'Platelets', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (10, N'AST_SGOT', N'AST/SGOT', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (11, N'ALT_SGPT', N'ALT/SGPT', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (12, N'CREATININE', N'Creatinine', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (13, N'AMYLASE', N'Amylase', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (14, N'PREGNANCY', N'Pregnancy', 0, 3, 0, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 1, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (15, N'MALARIAPARASITE', N'Malaria parasite', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (16, N'SERUMCRYPTOAG', N'Serum Crypto Ag', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (17, N'SPUTUMAFB1', N'Sputum AFB 1', 0, 6, 0, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 1, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (18, N'SPUTUMAFB2', N'Sputum AFB 2', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (19, N'SPUTUMAFB3', N'Sputum AFB 3', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (20, N'SPUTUMGRAMSTAIN', N'Sputum Gram Stain', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (21, N'URINALYSIS', N'Urinalysis', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (22, N'URINECULTURE_SENSITIVITY', N'Urine Culture/Sensitivity', 0, 1, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (23, N'CSFCRYPTOCOCCALAG', N'CSF cryptococcal Ag', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (24, N'CSFINDIAINK', N'CSF India Ink', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (25, N'CSFGRAMSTAIN', N'CSF Gram Stain', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (26, N'CSFCULTURE', N'CSF Culture', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (27, N'CSFBIOCHEMISTRY', N'CSF Biochemistry', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (28, N'ESR', N'ESR', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (30, N'CELLCOUNTNEUTROPHILS', N'Cell Count Neutrophils', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (31, N'CELLCOUNTLYMPHOCYTES', N'Cell Count Lymphocytes', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (32, N'PROTEIN', N'Protein', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (53, N'HIVRAPIDTEST', N'HIV Rapid Test', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (54, N'GLUCOSE', N'Glucose', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (55, N'STOOLO_P', N'Stool O/P', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (56, N'RBC', N'RBC', 0, 7, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (57, N'WBC-2', N'WBC', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (58, N'ALBUMIN_MG_DL_', N'Albumin (mg/dL)', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (59, N'COLPOSCOPY_CERVICALCA_FEMALEONLY_', N'Colposcopy (Cervical CA – female only)', 0, 1, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (60, N'CYTOMEGALOVIRUS_CMV_', N'Cytomegalovirus (CMV)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (61, N'EPSTEINBARRVIRUS_EBV_', N'Epstein Barr Virus (EBV)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (62, N'HDL_MG_DL_', N'HDL (mg/dL)', 0, 2, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (63, N'HEPATITISAAB_TOTAL', N'Hepatitis A Ab-Total', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (64, N'HEPATITISAAB_IGM', N'Hepatitis A Ab-IgM', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (65, N'HEPATITISBCORE_ANTIBODYIGM_HBSAB_', N'Hepatitis B core - antibody IgM (HBsAb)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (66, N'HEPATITISBCORE_ANTIBODY_TOTAL', N'Hepatitis B core – antibody, total', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (67, N'HEPATITISBSURFACE_ANTIBODY_HBSAB_', N'Hepatitis B surface – antibody (HBsAb)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (68, N'HEPATITISBSURFACE_ANTIGEN_HBSAG_', N'Hepatitis B surface – antigen (HBsAg)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (69, N'LDL_MG_DL_', N'LDL (Mg/dL)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (70, N'PAPSMEAR_CERVICALCA_FEMALEONLY_', N'Pap Smear (Cervical CA – female only)', 0, 3, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (71, N'GONORRHEA', N'Gonorrhea', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (72, N'CHLAMYDIA', N'Chlamydia', 0, 6, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (73, N'RECTALPAPSMEAR', N'Rectal Pap Smear', 0, 3, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (74, N'SYPHILIS_FTA_', N'Syphilis (FTA)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (75, N'SYPHILIS_RPR_', N'Syphilis (RPR)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (76, N'TOTALCHOLESTEROL_MG_DL_', N'Total Cholesterol (mg/dL)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (77, N'TOXOPLASMAIGGANTIBODY', N'Toxoplasma IgG Antibody', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (78, N'TRIGLYCERIDES_MG_DL_', N'Triglycerides (mg/dL)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (79, N'VAGINALINSPECTIONWITHACETICACID_VIA_', N'Vaginal Inspection with Acetic Acid (VIA)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (80, N'VARICELLA_CHICKENPOX_', N'Varicella (Chicken Pox)', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (84, N'HEPATITISCANTIBODY', N'Hepatitis C antibody', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (85, N'HIVCONFIRM', N'HIV Confirm', 0, 4, 0, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 1, NULL, NULL, NULL)
GO
INSERT [dbo].[mst_LabTestMaster] ([Id], [ReferenceId], [Name], [IsGroup], [DepartmentId], [Active], [CreateDate], [DeleteFlag], [DeletedBy], [DeleteDate], [LoincCode]) VALUES (94, N'PCR', N'PCR', 0, 4, 1, CAST(N'2016-09-07T13:44:50.127' AS DateTime), 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[mst_LabTestMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Mst_LabTestParameter] ON 
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (1, N'CD4', N'CD4', 1, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (2, N'CD4PERCENT', N'CD4 Percent', 1, N'NUMERIC', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (3, N'VIRALLOAD', N'Viral Load', 3, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (4, N'STOREPLASMA', N'StorePlasma', 4, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (5, N'HCT', N'HCT', 5, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (6, N'HB', N'Hb', 6, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (7, N'WBC', N'WBC', 7, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (8, N'WBCDIFF', N'WBC Diff', 8, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (9, N'PLATELETS', N'Platelets', 9, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (10, N'AST_SGOT', N'AST/SGOT', 10, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (11, N'ALT_SGPT', N'ALT/SGPT', 11, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (12, N'CREATININE', N'Creatinine', 12, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (13, N'AMYLASE', N'Amylase', 13, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (14, N'PREGNANCY', N'Pregnancy', 14, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (15, N'MALARIA', N'Malaria', 15, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (16, N'SERUMCRYPTO', N'Serum Crypto', 16, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (17, N'SPUTUMAFB1', N'Sputum AFB1', 17, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (18, N'SPUTUMAFB2', N'Sputum AFB2', 18, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (19, N'SPUTUMAFB3', N'Sputum AFB3', 19, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (20, N'SPUTUMGRAMSTAIN', N'SputumGramStain', 20, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (21, N'UNINALYSIS', N'Uninalysis', 21, N'TEXT', CAST(4.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (22, N'URINECULTURE_SENSIVITY', N'Urine Culture/Sensivity', 22, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (23, N'CSFCRYPTO', N'CSF Crypto', 23, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (24, N'CSFINDIAINK', N'CSF IndiaInk', 24, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (25, N'CSFGRAMSTAIN', N'CSF GramStain', 25, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (26, N'CSFCULTURE', N'CSF Culture', 26, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (27, N'CSFBIOCHEMISTRY', N'CSFBiochemistry', 27, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (28, N'CELLCOUNTRBCS', N'Cell Count RBCs', 56, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (29, N'CELLCOUNTWBCS', N'Cell Count WBCs', 57, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (30, N'CELLCOUNTNEUTROPHILS', N'Cell Count Neutrophils', 30, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (31, N'CELLCOUNTLYMPHOCYTES', N'Cell Count Lymphocytes', 31, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (32, N'PROTEIN', N'Protein', 32, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (53, N'HIVRAPIDTEST', N'HIV Rapid Test', 53, N'SELECTLIST', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (54, N'CSFBIOCHEMISTRY_GLUCOSE', N'CSF Biochemistry - Glucose', 54, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (55, N'STOOLSTATUS', N'Stool Status', 21, N'TEXT', CAST(3.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (56, N'RBC', N'RBC', 56, N'TEXT', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (57, N'ESR', N'ESR', 28, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (58, N'ALBUMIN_MG_DL_', N'Albumin (mg/dL)', 58, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (59, N'COLPOSCOPY_CERVICALCA_FEMALEONLY_', N'Colposcopy (Cervical CA – female only)', 59, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (60, N'CYTOMEGALOVIRUS_CMV_', N'Cytomegalovirus (CMV)', 60, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (61, N'EPSTEINBARRVIRUS_EBV_', N'Epstein Barr Virus (EBV)', 61, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (62, N'HDL_MG_DL_', N'HDL (mg/dL)', 62, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (63, N'HEPATITISAAB_IGM', N'Hepatitis A Ab-IgM', 64, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (64, N'HEPATITISAAB_TOTAL', N'Hepatitis A Ab-Total', 63, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (65, N'HEPATITISBCORE_ANTIBODYIGM_HBSAB_', N'Hepatitis B core – antibody IgM (HBsAb)', 65, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (66, N'HEPATITISBCORE_ANTIBODY_TOTAL', N'Hepatitis B core – antibody. total', 66, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (67, N'HEPATITISBSURFACE_ANTIBODY_HBSAB_', N'Hepatitis B surface – antibody (HBsAb)', 67, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (68, N'HEPATITISBSURFACE_ANTIGEN_HBSAG_', N'Hepatitis B surface – antigen (HBsAg)', 68, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (69, N'LDL_MG_DL_', N'LDL (Mg/dL)', 69, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (70, N'PAPSMEAR_CERVICALCA_FEMALEONLY_', N'Pap Smear (Cervical CA – female only)', 70, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (71, N'GONORRHEA', N'Gonorrhea', 71, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (72, N'CHLAMYDIA', N'Chlamydia', 72, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (73, N'RECTALPAPSMEAR', N'Rectal Pap Smear', 73, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (74, N'SYPHILIS_FTA_', N'Syphilis (FTA)', 74, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (75, N'SYPHILIS_RPR_', N'Syphilis (RPR)', 75, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (76, N'TOTALCHOLESTEROL_MG_DL_', N'Total Cholesterol (mg/dL)', 76, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (77, N'TOXOPLASMAIGGANTIBODY', N'Toxoplasma IgG antibody', 77, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (78, N'TRIGLYCERIDES_MG_DL_', N'Triglycerides (mg/dL)', 78, N'NUMERIC', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (79, N'VAGINALINSPECTIONWITHACETICACID_VIA_', N'Vaginal Inspection with Acetic Acid (VIA)', 79, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (80, N'VARICELLA_CHICKENPOX_', N'Varicella (Chicken Pox)', 80, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (82, N'WBCDIFF_NEUT', N'WBC Diff - Neut', 8, N'NUMERIC', CAST(8.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (83, N'WBCDIFF_NEUT%', N'WBC Diff - Neut%', 8, N'NUMERIC', CAST(9.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (84, N'WBCDIFF_LYMPH', N'WBC Diff - Lymph', 8, N'NUMERIC', CAST(4.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (85, N'WBCDIFF_LYMPH%', N'WBC Diff - Lymph%', 8, N'NUMERIC', CAST(5.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (86, N'WBCDIFF_MONO', N'WBC Diff - Mono', 8, N'NUMERIC', CAST(6.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (87, N'WBCDIFF_MONO%', N'WBC Diff - Mono%', 8, N'NUMERIC', CAST(7.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (88, N'WBCDIFF_EOSIN', N'WBC Diff - Eosin', 8, N'NUMERIC', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (89, N'WBCDIFF_EOSIN%', N'WBC Diff - Eosin%', 8, N'NUMERIC', CAST(3.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (90, N'URINALYSIS_SPECGRAV', N'Urinalysis - Spec Grav', 21, N'NUMERIC', CAST(11.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (91, N'URINALYSIS_GLUCOSE', N'Urinalysis - Glucose', 21, N'NUMERIC', CAST(6.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (92, N'URINALYSIS_KETONE', N'Urinalysis - Ketone', 21, N'NUMERIC', CAST(7.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (93, N'URINALYSIS_PROTEIN', N'Urinalysis - Protein', 21, N'NUMERIC', CAST(10.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (94, N'URINALYSIS_LEUKEST', N'Urinalysis - Leuk Est', 21, N'NUMERIC', CAST(8.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (95, N'URINALYSIS_NITRATE', N'Urinalysis - Nitrate', 21, N'NUMERIC', CAST(9.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (96, N'URINALYSIS_BLOOD', N'Urinalysis - Blood', 21, N'NUMERIC', CAST(5.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (97, N'URINALYSISMICROSCOPICBLOOD', N'Urinalysis Microscopic Blood', 21, N'SELECTLIST', CAST(13.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (98, N'URINALYSISMICROSCOPICWBC', N'Urinalysis Microscopic WBC', 21, N'SELECTLIST', CAST(15.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (99, N'URINALYSISMICROSCOPICBACTERIA', N'Urinalysis Microscopic Bacteria', 21, N'SELECTLIST', CAST(12.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (100, N'URINALYSISMICROSCOPICCASTS', N'Urinalysis Microscopic Casts', 21, N'SELECTLIST', CAST(14.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (101, N'HIVCONFIRM', N'HIV Confirm', 85, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (103, N'CULTURESENSITIVITY', N'CultureSensitivity', 21, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (105, N'STOOL', N'Stool', 21, N'TEXT', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (106, N'CREATININEMM', N'Creatininemm', 12, N'NUMERIC', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (107, N'VIRALLOADUNDETECTABLE', N'ViralLoad Undetectable', 3, N'NUMERIC', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (108, N'HEPATITISCANTIBODY', N'Hepatitis C antibody', 84, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (109, N'GLUCOSEMG', N'Glucose mg', 27, N'TEXT', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (110, N'GLUCOSEMM', N'Glucose mm', 27, N'TEXT', CAST(3.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (111, N'PROTEINMG', N'Protein mg', 32, N'TEXT', CAST(2.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (112, N'PROTEINMM', N'Protein mm', 32, N'TEXT', CAST(3.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mst_LabTestParameter] ([Id], [ReferenceId], [ParameterName], [LabTestId], [DataType], [OrdRank], [LoincCode], [UserId], [CreateDate], [UpdateDate], [DeleteFlag]) VALUES (114, N'PCR', N'PCR', 94, N'TEXT', CAST(1.00 AS Decimal(5, 2)), NULL, 1, CAST(N'2016-09-07T13:44:50.143' AS DateTime), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Mst_LabTestParameter] OFF
GO

/****** Object:  Index [NCI_dtl_LabOrderTestResult_DeleteFlag_INC]    Script Date: 5/23/2018 1:41:54 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_dtl_LabOrderTestResult_DeleteFlag_INC')
CREATE NONCLUSTERED INDEX [NCI_dtl_LabOrderTestResult_DeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
(
	[DeleteFlag] ASC
)
INCLUDE ( 	[LabOrderId],
	[ParameterId],
	[ResultValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_TestResult_OrderIdDeleteFlag_INC]    Script Date: 5/23/2018 1:41:54 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabOrderTestResult]') AND name = N'NCI_TestResult_OrderIdDeleteFlag_INC')
CREATE NONCLUSTERED INDEX [NCI_TestResult_OrderIdDeleteFlag_INC] ON [dbo].[dtl_LabOrderTestResult]
(
	[LabOrderId] ASC,
	[DeleteFlag] ASC
)
INCLUDE ( 	[ParameterId],
	[ResultValue]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_dtl_LabTestParameterResultOption]    Script Date: 5/23/2018 1:41:54 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dtl_LabTestParameterResultOption]') AND name = N'IX_dtl_LabTestParameterResultOption')
CREATE UNIQUE NONCLUSTERED INDEX [IX_dtl_LabTestParameterResultOption] ON [dbo].[dtl_LabTestParameterResultOption]
(
	[ParameterId] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mst_LabTestMaster_Name]    Script Date: 5/23/2018 1:41:54 PM ******/
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
/****** Object:  Index [IX_mst_LabTestMaster_Ref]    Script Date: 5/23/2018 1:41:54 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[mst_LabTestMaster]') AND name = N'IX_mst_LabTestMaster_Ref')
CREATE UNIQUE NONCLUSTERED INDEX [IX_mst_LabTestMaster_Ref] ON [dbo].[mst_LabTestMaster]
(
	[ReferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Mst_LabTestParameter]    Script Date: 5/23/2018 1:41:54 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Mst_LabTestParameter]') AND name = N'IX_Mst_LabTestParameter')
CREATE NONCLUSTERED INDEX [IX_Mst_LabTestParameter] ON [dbo].[Mst_LabTestParameter]
(
	[ParameterName] ASC,
	[DataType] ASC
)
INCLUDE ( 	[DeleteFlag]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Dtl_LabGroupItems_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Dtl_LabGroupItems] ADD  CONSTRAINT [DF_Dtl_LabGroupItems_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LabOrderTest_IsParent]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabOrderTest] ADD  CONSTRAINT [DF_LabOrderTest_IsParent]  DEFAULT ((1)) FOR [IsParent]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LabOrderTest_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabOrderTest] ADD  CONSTRAINT [DF_LabOrderTest_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_LabOrderTestResult_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabOrderTestResult] ADD  CONSTRAINT [DF_dtl_LabOrderTestResult_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_LabTestParameterConfig_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabTestParameterConfig] ADD  CONSTRAINT [DF_dtl_LabTestParameterConfig_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_dtl_LabTestParameterResultOption_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[dtl_LabTestParameterResultOption] ADD  CONSTRAINT [DF_dtl_LabTestParameterResultOption_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabDepartment_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabDepartment] ADD  CONSTRAINT [DF_mst_LabDepartment_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_IsGroup]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] ADD  CONSTRAINT [DF_mst_LabTestMaster_IsGroup]  DEFAULT ((0)) FOR [IsGroup]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] ADD  CONSTRAINT [DF_mst_LabTestMaster_Active]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] ADD  CONSTRAINT [DF_mst_LabTestMaster_CreatedBy]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabTestMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabTestMaster] ADD  CONSTRAINT [DF_mst_LabTestMaster_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mst_LabTestParameter_OrdRank]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mst_LabTestParameter] ADD  CONSTRAINT [DF_Mst_LabTestParameter_OrdRank]  DEFAULT ((0.00)) FOR [OrdRank]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Mst_LabTestParameter_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Mst_LabTestParameter] ADD  CONSTRAINT [DF_Mst_LabTestParameter_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_mst_LabType_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[mst_LabType] ADD  CONSTRAINT [DF_mst_LabType_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
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
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_autobillLab_insert]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 2016-02-23
-- Description:	Trigger for updating billing automatically based on labs that have been ordered/done
-- =============================================
CREATE Trigger [dbo].[tr_autobillLab_insert] ON [dbo].[dtl_LabOrderTest] FOR INSERT
AS 	BEGIN
	Set Nocount on;
	declare @PatientId int,@BillItemDate datetime,@itemType int, @itemId int,@SellingPrice decimal(18,2),@UserId int,@orderId int,@BillItemId int,
			@PaymentStatus int,@ItemName varchar(250), @LocationId int, @VisitId int,@ServiceStatus int, @ParentTestId int,@OrderTestId int, @ResultStatus varchar(50);

	Select Top 1 @itemType = BillingTypeID	From Mst_BillingType	Where Name = ''Lab Tests'';
	declare @table Table(OrderTestId int, OrderId int, OrderDate datetime,LocationId int, VisitId int,PatientId int,
							ItemId int, ItemName varchar(250), UserId int, ParentTestId int, ResultStatus varchar(50));
		Insert Into @table (
			OrderTestId,
			OrderId,
			OrderDate,
			LocationId,
			VisitId,
			PatientId,
			ItemId,
			ItemName,
			UserId,
			ParentTestId,
			ResultStatus)
			Select	I.Id OrderTestId,
					O.Id OrderId,
					O.OrderDate,
					O.LocationId,
					O.VisitId,
					O.Ptn_Pk,
					I.LabTestId,
					TM.Name,
					I.UserId,
					I.ParentTestId,
					I.ResultStatus
			From Inserted I
			Inner Join mst_LabTestMaster TM
				On TM.Id = I.LabTestId
			Inner Join ord_LabOrder O
				On O.Id = I.LabOrderId
			Inner Join (Select F.FacilityID From lnk_FacilityModule F Inner Join Mst_module M On M.ModuleId = F.ModuleID Where M.ModuleName = ''Billing'') FM
			On FM.FacilityId = O.LocationId
			Where I.ParentTestId Is Null And O.Ptn_Pk > 0
			And(Select Paperless From mst_Facility F Where F.FacilityID = O.LocationId) = 1;

		While Exists(Select 1 From @table) Begin
			Select Top 1 @orderId = OrderId
					, @itemId = ItemId
					, @ItemName = ItemName 
					, @UserId = UserId
					, @ResultStatus = ResultStatus
					, @PatientId = PatientId
					, @BillItemDate = OrderDate
					, @LocationId = LocationId
					, @VisitId = VisitId
					, @OrderTestId = OrderTestId
			From @table
		Select Top 1 
			@SellingPrice =ItemSellingPrice 
		From dbo.lnk_ItemCostConfiguration 
		Where ItemId=@itemId  
		And ItemType = @itemType
		And (DATEADD(dd, 0, DATEDIFF(dd, 0, EffectiveDate)) <=@BillItemDate) 
		And DeleteFlag =0
		Order By EffectiveDate Desc, statusDate Desc; 

		If (@SellingPrice Is Not Null And @SellingPrice !=0) Begin			

			Select @paymentStatus = 0;-- Isnull(@PaymentStatus,0);

			Select @ServiceStatus = Case When (@ResultStatus = ''Pending'') Then 0 Else 1 End;

			Exec pr_Billing_SaveBillItem	
					@BillID = 0,
					@PatientId = @PatientId,
					@ModuleID = 0,
					@LocationId = @LocationId,
					@BillItemDate = @billitemDate,					
					@PaymentStatus = @paymentStatus,
					@ItemId = @itemID,
					@ItemName = @itemName,
					@ItemType = @itemType,
					@Quantity = 1,
					@SellingPrice = @SellingPrice,
					@Discount = 0 ,
					@UserId = @UserId,
					@serviceStatus = @ServiceStatus ,
					@ItemSourceReferenceID = @VisitId;
		End
		
		Delete From @table Where OrderTestId = @OrderTestId;

	End
	End' 
GO
ALTER TABLE [dbo].[dtl_LabOrderTest] ENABLE TRIGGER [tr_autobillLab_insert]
GO
*/

/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_autobillLab_update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 2016-02-23
-- Description:	Trigger for updating billing automatically based on labs that have been ordered/done
-- =============================================
CREATE Trigger [dbo].[tr_autobillLab_update] ON [dbo].[dtl_LabOrderTest] FOR UPDATE 
AS 	BEGIN
	Set Nocount on;
	declare @PatientId int,@BillItemDate datetime,@itemType int, @itemId int,@SellingPrice decimal(18,2),@UserId int,@orderId int,@BillItemId int,
			@PaymentStatus int,@ItemName varchar(250), @LocationId int, @VisitId int,@ServiceStatus int, @ParentTestId int,@OrderTestId int, @ResultStatus varchar(50);

	Select Top 1 @itemType = BillingTypeID	From Mst_BillingType	Where Name = ''Lab Tests'';
	declare @table Table(OrderTestId int, OrderId int, OrderDate datetime,LocationId int, VisitId int,PatientId int,
							ItemId int, ItemName varchar(250), UserId int, ParentTestId int, ResultStatus varchar(50));
		Insert Into @table (
			OrderTestId,
			OrderId,
			OrderDate,
			LocationId,
			VisitId,
			PatientId,
			ItemId,
			ItemName,
			UserId,
			ParentTestId,
			ResultStatus)
			Select	I.Id OrderTestId,
					O.Id OrderId,
					O.OrderDate,
					O.LocationId,
					O.VisitId,
					O.Ptn_Pk,
					I.LabTestId,
					TM.Name,
					I.UserId,
					I.ParentTestId,
					I.ResultStatus
			From Inserted I
			Inner Join mst_LabTestMaster TM	On TM.Id = I.LabTestId
			Inner Join ord_LabOrder O	On O.Id = I.LabOrderId
			Inner Join (Select F.FacilityID From lnk_FacilityModule F Inner Join Mst_module M On M.ModuleId = F.ModuleID Where M.ModuleName = ''Billing'') FM
			On FM.FacilityId = O.LocationId
			Where I.ParentTestId Is Null And O.Ptn_Pk > 0
			And(Select Paperless From mst_Facility F Where F.FacilityID = O.LocationId) = 1;

		While Exists(Select 1 From @table) Begin
			Select Top 1 @orderId = OrderId
					, @itemId = ItemId
					, @ItemName = ItemName 
					, @UserId = UserId
					, @ResultStatus = ResultStatus
					, @PatientId = PatientId
					, @BillItemDate = OrderDate
					, @LocationId = LocationId
					, @VisitId = VisitId
					, @OrderTestId = OrderTestId
			From @table
			

		Select Top 1	@BillItemId = db.billItemID,
						@PaymentStatus = db.PaymentStatus
		From dtl_Bill db
		Where db.ItemId = @itemId
		And db.ItemType = @itemType
		And db.DeleteFlag = 0
		And ItemSourceReferenceID = @VisitId
		And db.ptn_pk = @PatientId
		And db.ServiceStatus = 0;

		If (@BillItemId Is Not Null) Begin			

			Select @paymentStatus = Isnull(@PaymentStatus,0);
			Select @ServiceStatus = Case When (@ResultStatus = ''Pending'') Then 0 Else 1 End;
			Exec pr_Billing_SaveBillItem					
					@PatientId = @PatientId,					
					@LocationId = @LocationId,
					@BillItemId= @BillItemId,
					@BillItemDate = @billitemDate,				
					@PaymentStatus = @paymentStatus,
					@ItemId = @itemID,
					@ItemName = @itemName,
					@ItemType = @itemType,
					@Quantity = 1,	
					@UserId = @UserId,
					@serviceStatus = @ServiceStatus ,
					@ItemSourceReferenceID = @VisitId;
		End
		
		Delete From @table Where OrderTestId = @OrderTestId;

	End
End' 
GO


ALTER TABLE [dbo].[dtl_LabOrderTest] ENABLE TRIGGER [tr_autobillLab_update]
GO
*/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Insert_Results_LabTracker]'))
EXEC dbo.sp_executesql @statement = N'-- Author:  <pwangoo>
-- Create date: <20042017>
-- Description: <Insert labresults to patientlab tracker>
-- =============================================


CREATE TRIGGER [dbo].[Insert_Results_LabTracker]
ON [dbo].[dtl_LabOrderTestResult]

 AFTER UPDATE
AS
    IF UPDATE(ResultValue) OR UPDATE(ResultText) OR UPDATE(DetectionLimit) OR UPDATE(Undetectable)
    BEGIN
      UPDATE c
            SET ResultValues = COALESCE(i.ResultValue,i.DetectionLimit,50),
          ResultTexts = i.ResultText,
    ResultOptions = i.ResultOption,
       ResultDate = i.StatusDate,
    ResultUnits = i.ResultUnit,
          Results = ''Complete''    
        FROM PatientLabTracker AS c
          JOIN inserted AS i
            ON i.LabOrderTestId = c.LabOrderTestId     -- use the appropriate column for joining
          JOIN deleted AS d
            ON  i.Id = d.Id
    AND (( i.ResultValue <> d.ResultValue
    OR d.ResultValue IS NULL)
    OR ( i.ResultText <> d.ResultText
    OR d.ResultText IS NULL)
    OR ( i.ResultOption <> d.ResultOption
    OR d.ResultOption IS NULL)
 OR ( i.DetectionLimit <> d.DetectionLimit
    OR d.DetectionLimit IS NULL)
 OR ( i.Undetectable <> d.Undetectable
    OR d.Undetectable IS NULL)
         );
    END ;
	
/***** Object:  Trigger [dbo].[GenerateLabOrderNumber]    Script Date: 5/26/2017 8:57:46 AM *****/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[GenerateLabOrderNumber]'') AND type in (N''T''))
DROP TRIGGER [dbo].[GenerateLabOrderNumber]
' 
GO
ALTER TABLE [dbo].[dtl_LabOrderTestResult] ENABLE TRIGGER [Insert_Results_LabTracker]
GO

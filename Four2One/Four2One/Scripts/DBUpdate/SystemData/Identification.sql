/*Drop Service Area Objects */


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceEntryPoint_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]'))
ALTER TABLE [dbo].[ServiceEntryPoint] DROP CONSTRAINT [FK_ServiceEntryPoint_Patient]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_ServiceArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]'))
ALTER TABLE [dbo].[ServiceAreaIdentifiers] DROP CONSTRAINT [FK_ServiceAreaIdentifiers_ServiceArea]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_Identifiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]'))
ALTER TABLE [dbo].[ServiceAreaIdentifiers] DROP CONSTRAINT [FK_ServiceAreaIdentifiers_Identifiers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] DROP CONSTRAINT [DF_ServiceEntryPoint_Active]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] DROP CONSTRAINT [DF_ServiceEntryPoint_CreateDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] DROP CONSTRAINT [DF_ServiceEntryPoint_void]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceAreaIdentifiers_ServiceAreaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceAreaIdentifiers] DROP CONSTRAINT [DF_ServiceAreaIdentifiers_ServiceAreaId]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceArea] DROP CONSTRAINT [DF_ServiceArea_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceArea] DROP CONSTRAINT [DF_ServiceArea_CreateDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_CreateBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceArea] DROP CONSTRAINT [DF_ServiceArea_CreateBy]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceEntryPoint]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceAreaIdentifiers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceArea]
GO

/*****/

/*Drop Patient Identifier*/

IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientIdentifier', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientIdentifier'
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_PatientEnrollment]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]'))
ALTER TABLE [dbo].[PatientIdentifier] DROP CONSTRAINT [FK_PatientIdentifier_PatientEnrollment]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]'))
ALTER TABLE [dbo].[PatientIdentifier] DROP CONSTRAINT [FK_PatientIdentifier_Patient]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] DROP CONSTRAINT [DF_PatientIdentifier_Active]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] DROP CONSTRAINT [DF_PatientIdentifier_CreateDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_identifier_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] DROP CONSTRAINT [DF_patient_identifier_void]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]') AND type in (N'U'))
DROP TABLE [dbo].[PatientIdentifier]
GO

/*****/

/**Create Identifier Objects and Data***/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Identifiers_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Identifiers] DROP CONSTRAINT [DF_Identifiers_CreateDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Identifiers_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Identifiers] DROP CONSTRAINT [DF_Identifiers_DeleteFlag]
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentifierType]') AND type in (N'U'))
DROP TABLE [dbo].[IdentifierType]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Identifiers]') AND type in (N'U'))
DROP TABLE [dbo].[Identifiers]
GO
/****** Object:  Table [dbo].[Identifiers]    Script Date: 6/11/2018 10:02:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Identifiers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Identifiers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](20) NULL,
	[DisplayName] [varchar](50) NULL,
	[DataType] [varchar](50) NULL,
	[PrefixType] [varchar](50) NULL,
	[SuffixType] [varchar](50) NULL,	
	[AssigningAuthority] [varchar](15) NULL,
	[IssuingAuthority] [varchar](15) NULL,
	[IdentifierType] [int] NULL,
	[DeleteFlag] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_Identifiers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IdentifierType]    Script Date: 6/11/2018 10:02:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentifierType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IdentifierType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IdentifierType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Identifiers] ON 
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (1, N'CCC Registration Number', N'CCCNumber', N'CCC Number', N'Numeric', N'mfl_code', NULL, 0, 1, CAST(N'2018-04-16T14:04:53.650' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (2, N'TB Registration Number', N'TBNumber', N'TB Number', N'Numeric', NULL, NULL, 0, 1, CAST(N'2018-04-16T14:04:53.690' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (3, N'ANC Registration Number', N'ANCNumber', N'ANC Registration Number', N'Numeric', NULL, NULL, 0, 1, CAST(N'2018-04-16T14:04:53.747' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (4, N'PMTCT Registration Number', N'PMTCTNumber', N'PMTCT Number', N'Numeric', NULL, NULL, 0, 1, CAST(N'2018-04-16T14:04:53.767' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (5, N'HEI Registration Number', N'HEIRegistration', N'HEI Registration Number', N'Numeric', NULL, NULL, 0, 1, CAST(N'2018-04-16T14:04:53.790' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (6, N'Patient Number', N'PatientId', N'Patient Number', N'Numeric', NULL, NULL, 0, 1, CAST(N'2018-04-16T14:04:53.873' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (8, N'HTS Number', N'HTSNumber', N'HTS Number', N'Numeric', NULL, NULL, 0, 1, CAST(N'2018-05-30T14:59:23.483' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Identifiers] ([Id], [Name], [Code], [DisplayName], [DataType], [PrefixType], [SuffixType], [DeleteFlag], [CreatedBy], [CreateDate], [AuditData], [AssigningAuthority], [IssuingAuthority], [IdentifierType]) VALUES (9, N'CardSerialNumber', N'CARD_SERIAL_NUMBER', N'CARD SERIAL NUMBER', N'Text', N'', N'', 0, 1, CAST(N'2018-05-30T14:59:51.817' AS DateTime), NULL, N'PSMART_REGISTRY', NULL, 2)
GO
SET IDENTITY_INSERT [dbo].[Identifiers] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentifierType] ON 
GO
INSERT [dbo].[IdentifierType] ([Id], [Name]) VALUES (1, N'Appointment')
GO
INSERT [dbo].[IdentifierType] ([Id], [Name]) VALUES (2, N'HTSENCOUNTER')
GO
SET IDENTITY_INSERT [dbo].[IdentifierType] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Identifiers_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Identifiers] ADD  CONSTRAINT [DF_Identifiers_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Identifiers_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Identifiers] ADD  CONSTRAINT [DF_Identifiers_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO


/* Create Service Area Objects and Data */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceArea]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiceArea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Code] [varchar](10) NULL,
	[DisplayName] [varchar](150) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_ServiceArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]') AND type in (N'U'))
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
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServiceEntryPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[ServiceAreaId] [int] NOT NULL,
	[EntryPointId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_ServiceEntryPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ServiceArea] ON 
GO
INSERT [dbo].[ServiceArea] ([Id], [Name], [Code], [DisplayName], [CreatedBy], [CreateDate], [DeleteFlag], [AuditData]) VALUES (1, N'HIV COMPREHENSIVE CARE CLINIC', N'CCC', N'CCC Clinic', 1, CAST(N'2018-04-16T14:04:53.643' AS DateTime), 0, NULL)
GO
INSERT [dbo].[ServiceArea] ([Id], [Name], [Code], [DisplayName], [CreatedBy], [CreateDate], [DeleteFlag], [AuditData]) VALUES (2, N'HTS Module', N'HTS', N'HTS', 1, CAST(N'2018-05-30T14:50:49.307' AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[ServiceArea] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceAreaIdentifiers] ON 
GO
INSERT [dbo].[ServiceAreaIdentifiers] ([Id], [ServiceAreaId], [IdentifierId], [RequiredFlag]) VALUES (1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ServiceAreaIdentifiers] OFF
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_CreateBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceArea] ADD  CONSTRAINT [DF_ServiceArea_CreateBy]  DEFAULT ((0)) FOR [CreatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceArea] ADD  CONSTRAINT [DF_ServiceArea_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceArea_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceArea] ADD  CONSTRAINT [DF_ServiceArea_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceAreaIdentifiers_ServiceAreaId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceAreaIdentifiers] ADD  CONSTRAINT [DF_ServiceAreaIdentifiers_ServiceAreaId]  DEFAULT ((0)) FOR [ServiceAreaId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] ADD  CONSTRAINT [DF_ServiceEntryPoint_void]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] ADD  CONSTRAINT [DF_ServiceEntryPoint_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServiceEntryPoint_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServiceEntryPoint] ADD  CONSTRAINT [DF_ServiceEntryPoint_Active]  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_Identifiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]'))
ALTER TABLE [dbo].[ServiceAreaIdentifiers]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAreaIdentifiers_Identifiers] FOREIGN KEY([IdentifierId])
REFERENCES [dbo].[Identifiers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_Identifiers]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]'))
ALTER TABLE [dbo].[ServiceAreaIdentifiers] CHECK CONSTRAINT [FK_ServiceAreaIdentifiers_Identifiers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_ServiceArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]'))
ALTER TABLE [dbo].[ServiceAreaIdentifiers]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAreaIdentifiers_ServiceArea] FOREIGN KEY([ServiceAreaId])
REFERENCES [dbo].[ServiceArea] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceAreaIdentifiers_ServiceArea]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceAreaIdentifiers]'))
ALTER TABLE [dbo].[ServiceAreaIdentifiers] CHECK CONSTRAINT [FK_ServiceAreaIdentifiers_ServiceArea]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceEntryPoint_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]'))
ALTER TABLE [dbo].[ServiceEntryPoint]  WITH CHECK ADD  CONSTRAINT [FK_ServiceEntryPoint_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ServiceEntryPoint_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServiceEntryPoint]'))
ALTER TABLE [dbo].[ServiceEntryPoint] CHECK CONSTRAINT [FK_ServiceEntryPoint_Patient]
GO

/* Create Patient Identifer Objects */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientIdentifier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientEnrollmentId] [int] NOT NULL,
	[IdentifierTypeId] [int] NOT NULL,
	[IdentifierValue] [varchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[AuditData] [xml] NULL,
	[AssigningFacility] [varchar](15) NULL,
 CONSTRAINT [PK_PatientIdentifier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_patient_identifier_void]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] ADD  CONSTRAINT [DF_patient_identifier_void]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] ADD  CONSTRAINT [DF_PatientIdentifier_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PatientIdentifier_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PatientIdentifier] ADD  CONSTRAINT [DF_PatientIdentifier_Active]  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]'))
ALTER TABLE [dbo].[PatientIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_PatientIdentifier_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_Patient]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]'))
ALTER TABLE [dbo].[PatientIdentifier] CHECK CONSTRAINT [FK_PatientIdentifier_Patient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_PatientEnrollment]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]'))
ALTER TABLE [dbo].[PatientIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_PatientIdentifier_PatientEnrollment] FOREIGN KEY([PatientEnrollmentId])
REFERENCES [dbo].[PatientEnrollment] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PatientIdentifier_PatientEnrollment]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientIdentifier]'))
ALTER TABLE [dbo].[PatientIdentifier] CHECK CONSTRAINT [FK_PatientIdentifier_PatientEnrollment]
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PatientIdentifier', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tracks and manages patient service identifier information' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PatientIdentifier'
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LookupMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupMaster] DROP CONSTRAINT [DF_LookupMaster_DeleteFlag]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LookupItem_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupItem] DROP CONSTRAINT [DF_LookupItem_DeleteFlag]
END
GO
/****** Object:  Table [dbo].[LookupMasterItem]    Script Date: 6/11/2018 9:55:43 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMasterItem]') AND type in (N'U'))
DROP TABLE [dbo].[LookupMasterItem]
GO
/****** Object:  Table [dbo].[LookupMaster]    Script Date: 6/11/2018 9:55:43 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMaster]') AND type in (N'U'))
DROP TABLE [dbo].[LookupMaster]
GO
/****** Object:  Table [dbo].[LookupItem]    Script Date: 6/11/2018 9:55:43 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupItem]') AND type in (N'U'))
DROP TABLE [dbo].[LookupItem]
GO
/****** Object:  Table [dbo].[LookupItem]    Script Date: 6/11/2018 9:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookupItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[DisplayName] [varchar](200) NOT NULL,
	[DeleteFlag] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LookupMaster]    Script Date: 6/11/2018 9:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookupMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[DisplayName] [varchar](250) NULL,
	[DeleteFlag] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LookupMasterItem]    Script Date: 6/11/2018 9:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LookupMasterItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LookupMasterItem](
	[LookupMasterId] [int] NOT NULL,
	[LookupItemId] [int] NOT NULL,
	[DisplayName] [varchar](250) NULL,
	[OrdRank] [decimal](5, 2) NULL
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LookupItem] ON 
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1, N'FP', N'Family Planning', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (2, N'NOFP', N'No Family Planning', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (3, N'WFP', N'Wants Family Planning', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (4, N'C', N'Condoms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (5, N'ECP', N'Emergency Contraceptive Pills', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (6, N'OC', N'Oral Contraceptive Pills', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (7, N'INJ', N'Injectable', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (8, N'IMP', N'Implant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (9, N'IUD', N'Intra Uterine Device', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (10, N'LAM', N'Lactational Amenorrhea Method', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (11, N'D', N'Diaphragm/Cervical Cap', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (12, N'FA', N'Fertility Awareness Method', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (13, N'TL', N'Tubal Ligation /Female Sterilization', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (14, N'V', N'Vasectomy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (15, N'UND', N'Undecided', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (16, N'HBTC', N'Home Based Testing and Care', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (17, N'VCT', N'Volunatry Counselling Centre', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (18, N'OPD', N'Outpatient Department', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (19, N'MCH', N'Mother Child Health', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (20, N'TB', N'TB Clinic', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (21, N'IPD-Child', N'Inpatient Child', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (22, N'IPD-Adult', N'Inpatient Adult', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (23, N'CCC', N'Comprehensive Care Clinic', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (24, N'Self-Test', N'Self-Test', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (25, N'Other', N'Other', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (26, N'Scheduled', N'Scheduled', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (27, N'Unscheduled', N'Unscheduled', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (28, N'PrTB', N'Presumed TB', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (29, N'NoTB', N'Negative TB Screen', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (30, N'INH', N'Negative and Started INH', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (31, N'TBRx', N'On TB Treatment', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (32, N'Normal', N'Normal', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (33, N'SAM', N'Severe Acute Malnutrition', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (34, N'MAM', N'Moderate Acute Malnutrition', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (35, N'Obese', N'Overweight/Obese', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (36, N'TBScreening', N'TB Screening', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (37, N'NutritionScreening', N'Nutrition Screening', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (38, N'CaCxScreen', N' CaCX Screening', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (39, N'STIScreen', N'STI Screening', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (40, N'BaselineScreen', N'Baseline Screening', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (41, N'RoutineScreen', N'Routine Screening', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (42, N'B', N'Baseline', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (43, N'R', N'Routine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (44, N'DR', N'Suspected Drug Resistance', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (45, N'OT', N'Other', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (46, N'Confirmatory(c)', N'Confirmatory', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (47, N'Prep', N'PREP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (48, N'Pep', N'PEP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (49, N'PMTCT', N'PMTCT', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (50, N'None', N'NONE', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (51, N'Male', N'Male', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (52, N'Female', N'Female', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (53, N'1', N'stage 1', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (54, N'2', N'Stage 2', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (55, N'3', N'Stage 3', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (56, N'4', N'Stage 4', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (57, N'Married Monogamous', N'Married Monogamous', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (58, N'Single', N'Single', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (59, N'Cohabiting', N'Cohabiting', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (60, N'Married Polygamous', N'Married Polygamous', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (61, N'Separated', N'Separated', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (62, N'Divorced', N'Divorced', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (63, N'Gen.Pop', N'General Population', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (64, N'Key.Pop', N'Key Population', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (65, N'MSM', N'MSM', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (66, N'FSW', N'FSW', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (67, N'PWID', N'PWID', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (68, N'Good', N'Good', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (69, N'Inadequate', N'Inadequate', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (70, N'Fair', N'Fair', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (71, N'Poor', N'Poor', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (72, N'ADC', N'Adherence Counselling', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (73, N'CD', N'Condom Distribution', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (74, N'SA', N'Substance Abuse', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (75, N'Disc', N'Disclosure to Sex Partner', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (76, N'PT', N'Partner Testing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (77, N'STI', N'STI Screening', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (78, N'U', N'Unstable', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (79, N'SC', N'Standard Care', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (80, N'EC', N'Express Care', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (81, N'CBD', N'Community Based Dispensing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (82, N'PG', N'Pregnant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (83, N'NS', N'Not Sure', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (84, N'NPG', N'Not Pregnant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (85, N'AB', N'Recently Induced Abortion', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (86, N'MC', N'Recently Miscarriage', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (87, N'CTF', N'Clinical treatment failure ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (88, N'IF', N'Changing to Adult Regimen', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (89, N'VF', N'Immunological Failure', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (90, N'NDA', N'Virological Failure', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (91, N'OS', N'Drug Out Of Stock', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (92, N'Other Reason', N'Other Reason', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (93, N'Tox', N'Toxicity', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (94, N'P.Burd', N'Pill Burden', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (95, N'X-action', N'Drug Interaction', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (96, N'A.Reg', N'Changing to Adult Regimen', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (97, N'Preg', N'Pregnancy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (98, N'RPREG', N'Risk Of Pregnancy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (99, N'NTB', N'New TB', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (100, N'Tier 1', N'Community', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (101, N'Tier 2', N'Primary Care Level', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (102, N'Tier 3', N'County Level', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (103, N'Tier 4', N'National level', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (104, N'Yes', N'Yes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (105, N'No', N'No', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (106, N'N/A', N'Not Applicable', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (107, N'Mild', N'Mild', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (108, N'Moderate', N'Moderate', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (109, N'Severe', N'Severe', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (110, N'Fatal', N'Fatal', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (111, N'S', N'Self', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (112, N'TS', N'Treatment Supporter', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (113, N'WP', N'Wants to get pregnant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (114, N'UP', N'Thinks can’t get pregnant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (115, N'N Sex', N'Not Sexually Active now', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (116, N'NA', N'Currently Pregnant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (117, N'Pallor', N'Pallor', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (118, N'Jaundice', N'Jaundice', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (119, N'Oedema', N'Oedema', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (120, N'Oral thrush', N'Oral thrush', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (121, N'PhysicalExamination', N'PhysicalExamination', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (122, N'Clinical', N'Clinical', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (123, N'Pharmacy', N'Pharmacy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (124, N'Laboratory', N'Laboratory', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (125, N'Diabetes', N'Diabetes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (126, N'Cancer', N'Cancer', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (127, N'BCG', N'BCG', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (128, N'PV', N'PV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (129, N'Measles', N'Measles', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (130, N'PCV', N'PCV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (131, N'Penta', N'Penta', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (132, N'Stage1', N'Stage1', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (133, N'Stage2', N'Stage2', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (134, N'Stage3', N'Stage3', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (135, N'Stage4', N'Stage4', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (136, N'AF1A', N'AZT + 3TC + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (137, N'AF1B', N'AZT + 3TC + EFV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (138, N'AF1D', N'AZT + 3TC + DTG', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (139, N'AF2A', N'TDF + 3TC + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (140, N'AF2B', N'TDF + 3TC + EFV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (141, N'AF2D', N'TDF + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (142, N'AF2E', N'TDF + 3TC + DTG', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (143, N'AF2F', N'TDF + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (144, N'AF2G', N'TDF + 3TC + RAL', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (145, N'AF2H', N'TDF + FTC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (146, N'AF4A', N'ABC + 3TC + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (147, N'AF4B', N'ABC + 3TC + EFV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (148, N'AF4C', N'ABC + 3TC + DTG', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (149, N'AS1A', N'AZT + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (150, N'AS1B', N'AZT + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (151, N'AS2A', N'TDF + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (152, N'AS2C', N'TDF + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (153, N'AS5A', N'ABC + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (154, N'AS5B', N'ABC + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (155, N'AS6X', N'Any other 2nd line Adult regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (156, N'AT1D', N'RAL + DRV + RTV + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (157, N'AT1E', N'RAL + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (158, N'AT1F', N'RAL + DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (159, N'AT1G', N'RAL + other backbone ARVs', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (160, N'AT2B', N'ETV + other backbone ARVs ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (161, N'AT2C', N'ETV + DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (162, N'AT3A', N'DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (163, N'AT4A', N'DTG + DRV + RTV + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (164, N'AT4B', N'DTG + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (165, N'AT4C', N'DTG + DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (166, N'AT4D', N'DTG + other backbone ARVs', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (167, N'AT2X', N'Any other 3rd line Adult regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (168, N'CF1A', N'AZT + 3TC + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (169, N'CF1B', N'AZT + 3TC + EFV ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (170, N'CF1C', N'AZT + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (171, N'CF1D', N'AZT + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (172, N'CF1E', N'AZT + 3TC + RAL', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (173, N'CF2A', N'ABC + 3TC + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (174, N'CF2B', N'ABC + 3TC + EFV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (175, N'CF2D', N'ABC + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (176, N'CF2E', N'ABC + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (177, N'CF2F', N'ABC + 3TC + RAL', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (178, N'CF4A', N'TDF + 3TC + NVP (children > 35kg)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (179, N'CF4B', N'TDF + 3TC + EFV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (180, N'CF4C', N'TDF + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (181, N'CF4D', N'TDF + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (182, N'CS1A', N'AZT + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (183, N'CS1B', N'AZT + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (184, N'CS2A', N'ABC + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (185, N'CS2C', N'ABC + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (186, N'CS4X', N'Any other 2nd line Paediatric regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (187, N'CT1D', N'RAL + DRV + RTV + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (188, N'CT1E', N'RAL + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (189, N'CT1F', N'RAL + DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (190, N'CT1G', N'RAL + other backbone ARVs', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (191, N'CT2B', N'ETV + other backbone ARVs', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (192, N'CT2C', N'ETV + DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (193, N'CT3A', N'DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (194, N'CT4A', N'DTG + DRV + RTV + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (195, N'CT4B', N'DTG + ETV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (196, N'CT4C', N'DTG + DRV + RTV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (197, N'CT4D', N'DTG', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (198, N'CT3X', N'Any other 3rd line Paediatric regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (199, N'PM3', N'AZT + 3TC + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (200, N'PM4', N'AZT + 3TC + EFV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (201, N'PM5', N'AZT + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (202, N'PM6', N'TDF + 3TC + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (203, N'PM7', N'TDF + 3TC + LPV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (204, N'PM9', N'TDF + 3TC + EFV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (205, N'PM10', N'AZT + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (206, N'PM11', N'TDF + 3TC + ATV/r', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (207, N'PM1X', N'Any other PMTCT regimens for Women', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (208, N'PC6', N'NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (209, N'PC7', N'AZT liquid BID + NVP liquid', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (210, N'PC8', N'AZT liquid BID + NVP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (211, N'PC9', N'AZT liquid BID for 12 weeks', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (212, N'PC1X', N'Any other PMTCT regimens for Infants', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (213, N'PRP1A', N'TDF + FTC (PrEP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (214, N'PRP1B', N'TDF + 3TC (PrEP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (215, N'PRP1C', N'TDF (PrEP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (216, N'AdultARTThirdLine', N'Adult ART ThirdLine ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (217, N'AdultARTSecondLine', N'Adult ART SecondLine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (218, N'AdultARTFirstLine', N'Adult ART FirstLine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (219, N'PaedsARTFirstLine', N'Paeds ART FirstLine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (220, N'PaedsARTSecondLine', N'Paeds ART Secondline', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (221, N'PaedsARTThirdLine', N'Paeds ART ThirdLine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (222, N'PMTCTRegimens', N'PMTCT Regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (223, N'Pending', N'Pending', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (224, N'Missed', N'Missed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (225, N'Met', N'Met', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (226, N'All', N'All', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (227, N'CareEnded', N'Care Ended', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (228, N'PreviouslyMissed', N'Previously Missed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (229, N'CCCNumber', N'CCC Registration Number', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (230, N'PatientId', N'Patient Number', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (231, N'HEIRegistration', N'HEI Registration Number', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (232, N'PMTCTNumber', N'PMTCT Number', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (233, N'TBNumber', N'TB Registration Number', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (234, N'ANCNumber', N'ANC Registration Number', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (235, N'Follow Up', N'Follow Up', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (236, N'Lab Tests', N'Lab Tests', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (237, N'Treatment Preparation', N'Treatment Preparation', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (238, N'Pharmacy Refill', N'Pharmacy Refill', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (239, N'Community Based Dispensing', N'Community Based Dispensing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (240, N'Express Care', N'Express Care', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (241, N'Baseline', N'Baseline', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (242, N'Confirmatory', N'Confirmatory', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (243, N'Routine', N'Routine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (244, N'Suspected drug resistance', N'Suspected drug resistance', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (245, N'HBV', N'HBV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (246, N'FluVaccine', N'FluVaccine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (247, N'Never Tested', N'Never Tested', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (248, N'Tested Negative', N'Tested Negetive', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (249, N'Tested Positive', N'Tested Positive', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (250, N'Spouse', N'Spouse', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (251, N'Parent', N'Parent, ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (252, N'Sibling', N'Sibling', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (253, N'Guardian', N'Guardian', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (254, N'Partner', N'Partner', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (255, N'Care Ended', N'Care Ended', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (256, N'Previously Missed', N'Previously Missed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (257, N'Standard Care', N'Standard Care', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (258, N'MoH 257 GREENCARD', N'MoH 257 GREENCARD', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (259, N'Transit', N'Transit', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (260, N'Transfer-In', N'TransferIn Patient', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (261, N'New', N'New', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (262, N'Death', N'Death', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (263, N'Transfer Out', N'Transfer Out', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (264, N'HIV Negative', N'HIV Negative', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (265, N'Confirmed HIV Negative', N'Confirmed HIV Negative', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (266, N'PCR', N'PCR', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (267, N'Rapid Test', N'Rapid Test', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (268, N'Spontaneous abortion', N'Spontaneous abortion', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (269, N'STILLBIRTH', N'STILLBIRTH', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (270, N'Term birth of newborn', N'Term birth of newborn', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (271, N'Preterm Delivery (Maternal Condition)', N'Preterm Delivery (Maternal Condition)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (272, N'Therapeutic abortion procedure', N'Therapeutic abortion procedure', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (273, N'Liveborn, (Single, Twin, or Multiple)', N'Liveborn, (Single, Twin, or Multiple)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (274, N'SW', N'Switched regimen', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (275, N'Dos', N'Changed dose', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (276, N'Sub', N'Substituted drug', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (277, N'Stopped(s)', N'Stopped', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (278, N'Dose reduced', N'Dose reduced', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (279, N'Dose increased', N'Dose increased', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (280, N'Medicine causing AE substituted/withdrawn', N'Medicine causing AE substituted/withdrawn', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (281, N'Medicine not changed', N'Medicine not changed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (282, N'Dose not changed', N'Dose not changed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (283, N'St', N'Stopped drug', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (284, N'ConsentToSendSMS', N'Consent To Send SMS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (285, N'ConsentToHomeVisit', N'Consent To Home Visit', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (286, N'First-Line Regimens', N'First-Line Regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (287, N'Second-Line Regimens', N'Second-Line Regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (288, N'Third-Line Regimens', N'Third-Line Regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (289, N'PMTCT Regimens', N'PMTCT Regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (290, N'PrEP Regimens', N'PrEP Regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (291, N'PEP Regimens', N'PEP Regimens', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (292, N'Toxicity', N'Toxicity', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (293, N'Pregnancy', N'Pregnancy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (294, N'Risk Of Pregnancy', N'Risk Of Pregnancy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (295, N'New TB', N'New TB', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (296, N'New Drug Available', N'New Drug Available', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (297, N'Drug Out of Stock', N'Drug Out of Stock', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (298, N'Pill Burden', N'Pill Burden', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (299, N'Drug Interruptions', N'Drug Interruptions', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (300, N'Changing to Adult Regimen', N'Changing to Adult Regimen', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (301, N'DrugSwitches', N'Drug Switches', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (302, N'ART', N'ART', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (303, N'Non ART', N'Non ART', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (304, N'During Pregnancy', N'During Pregnancy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (305, N'During Labour', N'During Labour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (306, N'Post Natal', N'Post Natal', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (307, N'Start Treatment', N'Start Treatment', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (308, N'Skin', N'Skin', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (309, N'Eyes', N'Eyes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (310, N'ENT', N'ENT', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (311, N'Chest', N'Chest', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (312, N'CVS', N'CVS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (313, N'Abdomen', N'Abdomen', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (314, N'CNS', N'CNS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (315, N'Genito-urinary', N'Genito-urinary', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (316, N'Enrollment', N'Enrollment', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (317, N'Abdominal pain', N'Abdominal pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (318, N'Abnormal uterine bleeding', N'Abnormal uterine bleeding', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (319, N'Anxiety, depression', N'Anxiety, depression', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (320, N'Back pain', N'Back pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (321, N'Bloody Urine', N'Bloody Urine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (322, N'Breast pain', N'Breast pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (323, N'Chest pain', N'Chest pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (324, N'Cold/Chills', N'Cold/Chills', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (325, N'Confusion/Delirium', N'Confusion/Delirium', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (326, N'Convulsions/Seizure', N'Convulsions/Seizure', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (327, N'Cough', N'Cough', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (328, N'Crying infant', N'Crying infant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (329, N'Diarrhoea', N'Diarrhoea', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (330, N'Difficult in breathing', N'Difficult in breathing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (331, N'Difficulty in swallowing', N'Difficulty in swallowing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (332, N'Dizziness', N'Dizziness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (333, N'Ear pain', N'Ear pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (334, N'Epigastric Pain', N'Epigastric Pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (335, N'Eye pain', N'Eye pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (336, N'Facial pain', N'Facial pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (337, N'Fatigue/weakness', N'Fatigue/weakness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (338, N'Fever', N'Fever', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (339, N'Flank pain', N'Flank pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (340, N'Genital Discharge', N'Genital Discharge', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (341, N'Genital skin lesion/Ulcer', N'Genital skin lesion/Ulcer', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (342, N'Headache', N'Headache', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (343, N'Hearing loss', N'Hearing loss', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (344, N'Hypotension/Shock', N'Hypotension/Shock', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (345, N'Itchiness/Pruritus', N'Itchiness/Pruritus', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (346, N'Joint Pain', N'Joint Pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (347, N'Leg pain', N'Leg pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (348, N'Loss of appetite', N'Loss of appetite', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (349, N'Lymphadenopathy', N'Lymphadenopathy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (350, N'Memory loss', N'Memory loss', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (351, N'Mental status, acute change (coma, lethargy)', N'Mental status, acute change (coma, lethargy)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (352, N'Mouth pain/burning', N'Mouth pain/burning', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (353, N'Mouth ulcers', N'Mouth ulcers', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (354, N'Muscle cramps', N'Muscle cramps', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (355, N'Muscle pain', N'Muscle pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (356, N'Nausea', N'Nausea', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (357, N'Neck pain', N'Neck pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (358, N'Night sweats', N'Night sweats', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (359, N'Numbness', N'Numbness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (360, N'Pain when swallowing', N'Pain when swallowing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (361, N'Pelvic pain', N'Pelvic pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (362, N'Poor Vision', N'Poor Vision', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (363, N'Rash', N'Rash', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (364, N'Red eye', N'Red eye', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (365, N'Ringing/Buzzing ears', N'Ringing/Buzzing ears', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (366, N'Runny/blocked nose', N'Runny/blocked nose', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (367, N'Scrotal pain', N'Scrotal pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (368, N'Shoulder pain', N'Shoulder pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (369, N'Sleep disturbance', N'Sleep disturbance', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (370, N'Sore Throat', N'Sore Throat', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (371, N'Sweating-excessive', N'Sweating-excessive', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (372, N'Swollen legs', N'Swollen legs', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (373, N'Tremors', N'Tremors', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (374, N'Urinary symptoms Pain/frequency/Urgency', N'Urinary symptoms Pain/frequency/Urgency', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (375, N'Vertigo', N'Vertigo', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (376, N'Vomiting', N'Vomiting', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (377, N'Weight loss', N'Weight loss', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (378, N'Alzheimers Disease and other Dementias', N'Alzheimers Disease and other Dementias', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (379, N'Arthritis', N'Arthritis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (380, N'Asthma', N'Asthma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (381, N'Cardiovascular diseases', N'Cardiovascular diseases', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (382, N'Chronic hepatitis', N'Chronic hepatitis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (383, N'Chronic Kidney Disease', N'Chronic Kidney Disease', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (384, N'Chronic Obstructive Pulmonary Disease (COPD)', N'Chronic Obstructive Pulmonary Disease (COPD)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (385, N'Chronic renal failure', N'Chronic renal failure', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (386, N'Cystic Fibrosis', N'Cystic Fibrosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (387, N'Deafness and hearing impairment', N'Deafness and hearing impairment', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (388, N'Endometriosis', N'Endometriosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (389, N'Epilepsy', N'Epilepsy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (390, N'Glaucoma', N'Glaucoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (391, N'Heart Disease', N'Heart Disease', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (392, N'Hyperlipidaemia', N'Hyperlipidaemia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (393, N'Hypertension', N'Hypertension', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (394, N'Hypothyroidism', N'Hypothyroidism', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (395, N'Mental illness', N'Mental illness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (396, N'Multiple Sclerosis', N'Multiple Sclerosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (397, N'Obesity', N'Obesity', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (398, N'Osteoporosis', N'Osteoporosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (399, N'Sickle Cell Anemia', N'Sickle Cell Anemia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (400, N'Thyroid disease', N'Thyroid disease', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (401, N'Abscess', N'Abscess', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (402, N'Growths/Swellings', N'Growths/Swellings', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (403, N'Hair Loss', N'Hair Loss', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (404, N'Itching', N'Itching', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (405, N'Kaposis Sarcoma', N'Kaposis Sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (406, N'Skin Eruptions/Rashes', N'Skin Eruptions/Rashes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (407, N'Sores', N'Sores', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (408, N'Ulcers', N'Ulcers', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (409, N'Visual Changes', N'Visual Changes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (410, N'Change in Vision ', N'Change in Vision ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (411, N'Double Vision ', N'Double Vision ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (412, N'Excessive Tearing ', N'Excessive Tearing ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (413, N'Irritation ', N'Irritation ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (414, N'Photophobia ', N'Photophobia ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (415, N'Redness ', N'Redness ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (416, N'Apnea ', N'Apnea ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (417, N'Change in hearing', N'Change in hearing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (418, N'Dental carries', N'Dental carries', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (419, N'Discharge ', N'Discharge ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (420, N'Erythema', N'Erythema', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (421, N'Frequent Colds ', N'Frequent Colds ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (422, N'gingival bleeding', N'gingival bleeding', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (423, N'Hairy cell leukoplakia', N'Hairy cell leukoplakia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (424, N'Hoarsness', N'Hoarsness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (425, N'Masses', N'Masses', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (426, N'Nasal Discharge', N'Nasal Discharge', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (427, N'Nosebleed ', N'Nosebleed ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (428, N'Pain ', N'Pain ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (429, N'Post Nasal Drip ', N'Post Nasal Drip ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (430, N'Sinus Problems ', N'Sinus Problems ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (431, N'Snoring ', N'Snoring ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (432, N'Thrush', N'Thrush', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (433, N'Tinnitus ', N'Tinnitus ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (434, N'Toothache', N'Toothache', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (435, N'Bronchial breathing', N'Bronchial breathing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (436, N'Crackles', N'Crackles', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (437, N'Dullness', N'Dullness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (438, N'Reduced Breath sounds', N'Reduced Breath sounds', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (439, N'Respiratory distress', N'Respiratory distress', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (440, N'Wheezes', N'Wheezes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (441, N'Elevated blood pressure', N'Elevated blood pressure', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (442, N'Irregular rhythm', N'Irregular rhythm', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (443, N'Murmur', N'Murmur', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (444, N'Rub', N'Rub', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (445, N'Distension', N'Distension', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (446, N'Hepatomegaly', N'Hepatomegaly', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (447, N'Mass', N'Mass', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (448, N'Splenomegaly', N'Splenomegaly', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (449, N'Tenderness', N'Tenderness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (450, N'Altered Sensation', N'Altered Sensation', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (451, N'Bulging Anterior fontanelle', N'Bulging Anterior fontanelle', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (452, N'Brisk Reflexes', N'Brisk Reflexes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (453, N'Confused', N'Confused', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (454, N'Kernings positive', N'Kernings positive', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (455, N'Limb Weakness', N'Limb Weakness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (456, N'Neck stiffness', N'Neck stiffness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (457, N'Bleeding', N'Bleeding', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (458, N'Ulceration', N'Ulceration', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (459, N'Urethral discharge', N'Urethral discharge', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (460, N'Vaginal discharge', N'Vaginal discharge', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (461, N'Abacavir', N'Abacavir', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (462, N'ACE inhibitors', N'ACE inhibitors', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (463, N'Allopurinol', N'Allopurinol', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (464, N'Aminoglycosides', N'Aminoglycosides', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (465, N'ARBs (angiotensin II receptor blockers)', N'ARBs (angiotensin II receptor blockers)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (466, N'Aspirin', N'Aspirin', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (467, N'Atazanavir', N'Atazanavir', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (468, N'Carbamazepine', N'Carbamazepine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (469, N'Cephalosporins', N'Cephalosporins', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (470, N'Choloroquine', N'Choloroquine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (471, N'Codeine', N'Codeine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (472, N'Didanosine', N'Didanosine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (473, N'Efavirenz', N'Efavirenz', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (474, N'Erythromycins', N'Erythromycins', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (475, N'Ethambutol', N'Ethambutol', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (476, N'Griseofulvin', N'Griseofulvin', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (477, N'Heparins', N'Heparins', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (478, N'Hydralazine', N'Hydralazine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (479, N'Isoniazid', N'Isoniazid', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (480, N'Lopinavir/ritonavir', N'Lopinavir/ritonavir', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (481, N'Morphine', N'Morphine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (482, N'Nevirapine', N'Nevirapine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (483, N'Nitrofurans', N'Nitrofurans', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (484, N'Non-steroidal anti-inflammatory drugs', N'Non-steroidal anti-inflammatory drugs', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (485, N'Penicillamine', N'Penicillamine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (486, N'Penicillins', N'Penicillins', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (487, N'Phenolphthaleins', N'Phenolphthaleins', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (488, N'Phenytoin', N'Phenytoin', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (489, N'Procainamide', N'Procainamide', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (490, N'Pyrazinamide', N'Pyrazinamide', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (491, N'Quinidine', N'Quinidine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (492, N'Rifampin', N'Rifampin', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (493, N'Statins', N'Statins', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (494, N'Stavudine', N'Stavudine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (495, N'Sulfonamides', N'Sulfonamides', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (496, N'Tenofovir', N'Tenofovir', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (497, N'Tetracyline', N'Tetracyline', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (498, N'Zidovudine', N'Zidovudine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (499, N'Beef', N'Beef', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (500, N'Caffeine', N'Caffeine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (501, N'Chocolate', N'Chocolate', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (502, N'Dairy food', N'Dairy food', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (503, N'Eggs', N'Eggs', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (504, N'Fish', N'Fish', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (505, N'Milk protein', N'Milk protein', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (506, N'Peanuts', N'Peanuts', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (507, N'Shellfish', N'Shellfish', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (508, N'Soy', N'Soy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (509, N'Strawberries', N'Strawberries', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (510, N'Wheat', N'Wheat', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (511, N'Adhesive tape', N'Adhesive tape', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (512, N'Bee stings', N'Bee stings', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (513, N'Dust', N'Dust', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (514, N'Latex', N'Latex', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (515, N'Mold', N'Mold', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (516, N'Pollen', N'Pollen', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (517, N'Ragweed', N'Ragweed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (518, N'Unknown', N'Unknown', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (519, N'Anaemia', N'Anaemia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (520, N'Anaphylaxis', N'Anaphylaxis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (521, N'Angioedema', N'Angioedema', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (522, N'Arrhythmia', N'Arrhythmia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (523, N'Bronchospasm', N'Bronchospasm', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (524, N'Diarrhea', N'Diarrhea', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (525, N'Dystonia', N'Dystonia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (526, N'Flushing', N'Flushing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (527, N'GI upset', N'GI upset', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (528, N'Hepatotoxicity', N'Hepatotoxicity', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (529, N'Hives', N'Hives', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (530, N'Mental status change', N'Mental status change', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (531, N'Musculoskeletal pain', N'Musculoskeletal pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (532, N'Myalgia', N'Myalgia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (533, N'Cyanosis', N'Cyanosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (534, N'Dehydration', N'Dehydration', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (535, N'Finger Clubbing', N'Finger Clubbing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (536, N'Lethargic', N'Lethargic', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (537, N'Lymph nodes axillary', N'Lymph nodes axillary', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (538, N'Lymph nodes inguinal', N'Lymph nodes inguinal', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (539, N'Wasting', N'Wasting', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (540, N'Weight Changes', N'Weight Changes', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (541, N'Continue current treatment', N'Continue current treatment', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (542, N'Child', N'Child', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (543, N'Completed', N'Completed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (544, N'LostToFollowUp', N'Lost To Follow Up', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (545, N'Discontinued', N'Discontinued', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (546, N'Died', N'Died', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (547, N'TransferredOut', N'Transferred Out', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (548, N'Good(Missed<3/month)', N'Good(Missed<3/month)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (549, N'Fair(Missed4-8/month)', N'Fair(Missed4-8/month)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (550, N'Bad()Missed9', N'Bad()Missed9', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (551, N'PA1C', N'AZT + 3TC + ATV/r (Adult PEP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (552, N'PA3C', N'TDF + 3TC + ATV/r (Adult PEP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (553, N'PA4X', N'Any other PEP regimens for Adults', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (554, N'PC1A', N'AZT + 3TC + ATV/r (Adult PEP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (555, N'PC3A', N'ABC + 3TC + LPV/r (Paed PEP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (556, N'PC4X', N'Any other PEP regimens for Children', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (557, N'M800', N'Neoplasms NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (558, N'M8000/0', N'Neoplasm, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (559, N'M8000/1', N'Neoplasm, uncertain whether benign or malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (560, N'M8000/3', N'Neoplasm, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (561, N'M8000/6', N'Neoplasm, metastatic', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (562, N'M8001/0', N'Tumour cells, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (563, N'M8001/1', N'Tumour cells, uncertain whether benign or malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (564, N'M8001/3', N'Tumour cells, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (565, N'M8002/3', N'Malignant tumour, small cell type', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (566, N'M8003/3', N'Malignant tumour, giant cell type', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (567, N'M8004/3', N'Malignant tumour, fusiform cell type', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (568, N'M801-M804', N'Epithelial neoplasms NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (569, N'M8010/0', N'Epithelial tumour, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (570, N'M8010/2', N'Carcinoma in situ NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (571, N'M8010/3', N'Carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (572, N'M8010/6', N'Carcinoma, metastatic NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (573, N'M8011/0', N'Epithelioma, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (574, N'M8011/3', N'Epithelioma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (575, N'M8012/3', N'Large cell carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (576, N'M8020/3', N'Carcinoma, undifferentiated NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (577, N'M8021/3', N'Carcinoma, anaplastic NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (578, N'M8022/3', N'Pleomorphic carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (579, N'M8030/3', N'Giant cell and spindle cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (580, N'M8031/3', N'Giant cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (581, N'M8032/3', N'Spindle cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (582, N'M8033/3', N'Pseudosarcomatous carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (583, N'M8034/3', N'Polygonal cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (584, N'M8040/1', N'Tumorlet', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (585, N'M8041/3', N'Small cell carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (586, N'M8042/3', N'Oat cell carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (587, N'M8043/3', N'Small cell carcinoma, fusiform cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (588, N'M8044/3', N'Small cell carcinoma, intermediate cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (589, N'M8045/3', N'Small cell-large cell carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (590, N'M805-M808', N'Squamous cell neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (591, N'M8050/0', N'Papilloma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (592, N'M8050/2', N'Papillary carcinoma in situ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (593, N'M8050/3', N'Papillary carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (594, N'M8051/0', N'Verrucous papilloma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (595, N'M8051/3', N'Verrucous carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (596, N'M8052/0', N'Squamous cell papilloma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (597, N'M8052/3', N'Papillary squamous cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (598, N'M8053/0', N'Inverted papilloma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (599, N'M8060/0', N'Papillomatosis NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (600, N'M8070/2', N'Squamous cell carcinoma in situ NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (601, N'M8070/3', N'Squamous cell carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (602, N'M8070/6', N'Squamous cell carcinoma, metastatic NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (603, N'M8071/3', N'Squamous cell carcinoma, keratinizing NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (604, N'M8072/3', N'Squamous cell carcinoma, large cell, nonkeratinizing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (605, N'M8073/3', N'Squamous cell carcinoma, small cell, nonkeratinizing', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (606, N'M8074/3', N'Squamous cell carcinoma, spindle cell', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (607, N'M8075/3', N'Adenoid squamous cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (608, N'M8076/2', N'Squamous cell carcinoma in situ with questionable stromal invasion  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (609, N'M8076/3', N'Squamous cell carcinoma, microinvasive  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (610, N'M8077/2', N'Intraepithelial neoplasia, grade III, of cervix, vulva and vagina', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (611, N'M8080/2', N'Queyrats erythroplasia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (612, N'M8081/2', N'Bowens disease', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (613, N'M8082/3', N'Lymphoepithelial carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (614, N'M809-M811', N'Basal cell neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (615, N'M8090/1', N'Basal cell tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (616, N'M8090/3', N'Basal cell carcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (617, N'M8091/3', N'Multicentric basal cell carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (618, N'M8092/3', N'Basal cell carcinoma, morphoea  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (619, N'M8093/3', N'Basal cell carcinoma, fibroepithelial  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (620, N'M8094/3', N'Basosquamous carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (621, N'M8095/3', N'Metatypical carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (622, N'M8096/0', N'Intraepidermal epithelioma of Jadassohn  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (623, N'M8100/0', N'Trichoepithelioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (624, N'M8101/0', N'Trichofolliculoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (625, N'M8102/0', N'Tricholemmoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (626, N'M8110/0', N'Pilomatrixoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (627, N'M8110/3', N'Pilomatrix carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (628, N'M812-M813', N'Transitional cell papillomas and carcinomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (629, N'M8120/0', N'Transitional cell papilloma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (630, N'M8120/1', N'Urothelial papilloma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (631, N'M8120/2', N'Transitional cell carcinoma in situ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (632, N'M8120/3', N'Transitional cell carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (633, N'M8121/0', N'Schneiderian papilloma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (634, N'M8121/1', N'Transitional cell papilloma, inverted', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (635, N'M8121/3', N'Schneiderian carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (636, N'M8122/3', N'Transitional cell carcinoma, spindle cell', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (637, N'M8123/3', N'Basaloid carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (638, N'M8124/3', N'Cloacogenic carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (639, N'M8130/3', N'Papillary transitional cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (640, N'M814-M838', N'Adenomas and adenocarcinomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (641, N'M8140/0', N'Adenoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (642, N'M8140/1', N'Bronchial adenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (643, N'M8140/2', N'Adenocarcinoma in situ NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (644, N'M8140/3', N'Adenocarcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (645, N'M8140/6', N'Adenocarcinoma, metastatic NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (646, N'M8141/3', N'Scirrhous adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (647, N'M8142/3', N'Linitis plastica  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (648, N'M8143/3', N'Superficial spreading adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (649, N'M8144/3', N'Adenocarcinoma, intestinal type  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (650, N'M8145/3', N'Carcinoma, diffuse type  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (651, N'M8146/0', N'Monomorphic adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (652, N'M8147/0', N'Basal cell adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (653, N'M8147/3', N'Basal cell adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (654, N'M8150/0', N'Islet cell adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (655, N'M8150/3', N'Islet cell carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (656, N'M8151/0', N'Insulinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (657, N'M8151/3', N'Insulinoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (658, N'M8152/0', N'Glucagonoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (659, N'M8152/3', N'Glucagonoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (660, N'M8153/1', N'Gastrinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (661, N'M8153/3', N'Gastrinoma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (662, N'M8154/3', N'Mixed islet cell and exocrine adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (663, N'M8155/3', N'Vipoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (664, N'M8160/0', N'Bile duct adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (665, N'M8160/3', N'Cholangiocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (666, N'M8161/0', N'Bile duct cystadenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (667, N'M8161/3', N'Bile duct cystadenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (668, N'M8162/3', N'Klatskins tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (669, N'M8170/0', N'Liver cell adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (670, N'M8170/3', N'Hepatocellular carcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (671, N'M8171/3', N'Hepatocellular carcinoma, fibrolamellar  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (672, N'M8180/3', N'Combined hepatocellular carcinoma and cholangiocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (673, N'M8190/0', N'Trabecular adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (674, N'M8190/3', N'Trabecular adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (675, N'M8191/0', N'Embryonal adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (676, N'M8200/0', N'Eccrine dermal cylindroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (677, N'M8200/3', N'Adenoid cystic carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (678, N'M8201/3', N'Cribriform carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (679, N'M8202/0', N'Microcystic adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (680, N'M8210/0', N'Adenomatous polyp NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (681, N'M8210/2', N'Adenocarcinoma in situ in adenomatous polyp', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (682, N'M8210/3', N'Adenocarcinoma in adenomatous polyp', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (683, N'M8211/0', N'Tubular adenoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (684, N'M8211/3', N'Tubular adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (685, N'M8220/0', N'Adenomatous polyposis coli  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (686, N'M8220/3', N'Adenocarcinoma in adenomatous polyposis coli  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (687, N'M8221/0', N'Multiple adenomatous polyps', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (688, N'M8221/3', N'Adenocarcinoma in multiple adenomatous polyps', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (689, N'M8230/3', N'Solid carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (690, N'M8231/3', N'Carcinoma simplex', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (691, N'M8240/1', N'Carcinoid tumour NOS, of appendix  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (692, N'M8240/3', N'Carcinoid tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (693, N'M8241/1', N'Carcinoid tumour, argentaffin NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (694, N'M8241/3', N'Carcinoid tumour, argentaffin, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (695, N'M8243/3', N'Goblet cell carcinoid  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (696, N'M8244/3', N'Composite carcinoid', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (697, N'M8245/3', N'Adenocarcinoid tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (698, N'M8246/3', N'Neuroendocrine carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (699, N'M8247/3', N'Merkel cell carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (700, N'M8248/1', N'Apudoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (701, N'M8250/1', N'Pulmonary adenomatosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (702, N'M8250/3', N'Bronchiolo-alveolar adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (703, N'M8251/0', N'Alveolar adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (704, N'M8251/3', N'Alveolar adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (705, N'M8260/0', N'Papillary adenoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (706, N'M8260/3', N'Papillary adenocarcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (707, N'M8261/1', N'Villous adenoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (708, N'M8261/2', N'Adenocarcinoma in situ in villous adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (709, N'M8261/3', N'Adenocarcinoma in villous adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (710, N'M8262/3', N'Villous adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (711, N'M8263/0', N'Tubulovillous adenoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (712, N'M8263/2', N'Adenocarcinoma in situ in tubulovillous adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (713, N'M8263/3', N'Adenocarcinoma in tubulovillous adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (714, N'M8270/0', N'Chromophobe adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (715, N'M8270/3', N'Chromophobe carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (716, N'M8271/0', N'Prolactinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (717, N'M8280/0', N'Acidophil adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (718, N'M8280/3', N'Acidophil carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (719, N'M8281/0', N'Mixed acidophil-basophil adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (720, N'M8281/3', N'Mixed acidophil-basophil carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (721, N'M8290/0', N'Oxyphilic adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (722, N'M8290/3', N'Oxyphilic adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (723, N'M8300/0', N'Basophil adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (724, N'M8300/3', N'Basophil carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (725, N'M8310/0', N'Clear cell adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (726, N'M8310/3', N'Clear cell adenocarcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (727, N'M8311/1', N'Hypernephroid tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (728, N'M8312/3', N'Renal cell carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (729, N'M8313/0', N'Clear cell adenofibroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (730, N'M8314/3', N'Lipid-rich carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (731, N'M8315/3', N'Glycogen-rich carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (732, N'M8320/3', N'Granular cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (733, N'M8321/0', N'Chief cell adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (734, N'M8322/0', N'Water-clear cell adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (735, N'M8322/3', N'Water-clear cell adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (736, N'M8323/0', N'Mixed cell adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (737, N'M8323/3', N'Mixed cell adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (738, N'M8324/0', N'Lipoadenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (739, N'M8330/0', N'Follicular adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (740, N'M8330/3', N'Follicular adenocarcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (741, N'M8331/3', N'Follicular adenocarcinoma, well differentiated  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (742, N'M8332/3', N'Follicular adenocarcinoma, trabecular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (743, N'M8333/0', N'Microfollicular adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (744, N'M8334/0', N'Macrofollicular adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (745, N'M8340/3', N'Papillary carcinoma, follicular variant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (746, N'M8350/3', N'Nonencapsulated sclerosing carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (747, N'M8360/1', N'Multiple endocrine adenomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (748, N'M8361/1', N'Juxtaglomerular tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (749, N'M8370/0', N'Adrenal cortical adenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (750, N'M8370/3', N'Adrenal cortical carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (751, N'M8371/0', N'Adrenal cortical adenoma, compact cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (752, N'M8372/0', N'Adrenal cortical adenoma, heavily pigmented variant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (753, N'M8373/0', N'Adrenal cortical adenoma, clear cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (754, N'M8374/0', N'Adrenal cortical adenoma, glomerulosa cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (755, N'M8375/0', N'Adrenal cortical adenoma, mixed cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (756, N'M8380/0', N'Endometrioid adenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (757, N'M8380/1', N'Endometrioid adenoma, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (758, N'M8380/3', N'Endometrioid carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (759, N'M8381/0', N'Endometrioid adenofibroma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (760, N'M8381/1', N'Endometrioid adenofibroma, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (761, N'M8381/3', N'Endometrioid adenofibroma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (762, N'M839-M842', N'Adnexal and skin appendage neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (763, N'M8390/0', N'Skin appendage adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (764, N'M8390/3', N'Skin appendage carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (765, N'M8400/0', N'Sweat gland adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (766, N'M8400/1', N'Sweat gland tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (767, N'M8400/3', N'Sweat gland adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (768, N'M8401/0', N'Apocrine adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (769, N'M8401/3', N'Apocrine adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (770, N'M8402/0', N'Eccrine acrospiroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (771, N'M8403/0', N'Eccrine spiradenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (772, N'M8404/0', N'Hidrocystoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (773, N'M8405/0', N'Papillary hidradenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (774, N'M8406/0', N'Papillary syringadenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (775, N'M8407/0', N'Syringoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (776, N'M8408/0', N'Eccrine papillary adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (777, N'M8410/0', N'Sebaceous adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (778, N'M8410/3', N'Sebaceous adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (779, N'M8420/0', N'Ceruminous adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (780, N'M8420/3', N'Ceruminous adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (781, N'M843', N'Mucoepidermoid neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (782, N'M8430/1', N'Mucoepidermoid tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (783, N'M8430/3', N'Mucoepidermoid carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (784, N'M844-M849', N'Cystic, mucinous and serous neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (785, N'M8440/0', N'Cystadenoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (786, N'M8440/3', N'Cystadenocarcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (787, N'M8441/0', N'Serous cystadenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (788, N'M8441/3', N'Serous cystadenocarcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (789, N'M8442/3', N'Serous cystadenoma, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (790, N'M8450/0', N'Papillary cystadenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (791, N'M8450/3', N'Papillary cystadenocarcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (792, N'M8451/3', N'Papillary cystadenoma, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (793, N'M8452/1', N'Papillary cystic tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (794, N'M8460/0', N'Papillary serous cystadenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (795, N'M8460/3', N'Papillary serous cystadenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (796, N'M8461/0', N'Serous surface papilloma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (797, N'M8461/3', N'Serous surface papillary carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (798, N'M8462/3', N'Papillary serous cystadenoma, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (799, N'M8470/0', N'Mucinous cystadenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (800, N'M8470/3', N'Mucinous cystadenocarcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (801, N'M8471/0', N'Papillary mucinous cystadenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (802, N'M8471/3', N'Papillary mucinous cystadenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (803, N'M8472/3', N'Mucinous cystadenoma, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (804, N'M8473/3', N'Papillary mucinous cystadenoma, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (805, N'M8480/0', N'Mucinous adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (806, N'M8480/3', N'Mucinous adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (807, N'M8480/6', N'Pseudomyxoma peritonei  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (808, N'M8481/3', N'Mucin-producing adenocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (809, N'M8490/3', N'Signet ring cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (810, N'M8490/6', N'Metastatic signet ring cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (811, N'M850-M854', N'Ductal, lobular and medullary neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (812, N'M8500/2', N'Intraductal carcinoma, noninfiltrating NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (813, N'M8500/3', N'Infiltrating duct carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (814, N'M8501/2', N'Comedocarcinoma, noninfiltrating  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (815, N'M8501/3', N'Comedocarcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (816, N'M8502/3', N'Juvenile carcinoma of breast  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (817, N'M8503/0', N'Intraductal papilloma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (818, N'M8503/2', N'Noninfiltrating intraductal papillary adenocarcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (819, N'M8503/3', N'Intraductal papillary adenocarcinoma with invasion  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (820, N'M8504/0', N'Intracystic papillary adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (821, N'M8504/2', N'Noninfiltrating intracystic carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (822, N'M8504/3', N'Intracystic carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (823, N'M8505/0', N'Intraductal papillomatosis NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (824, N'M8506/0', N'Adenoma of nipple  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (825, N'M8510/3', N'Medullary carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (826, N'M8511/3', N'Medullary carcinoma with amyloid stroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (827, N'M8512/3', N'Medullary carcinoma with lymphoid stroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (828, N'M8520/2', N'Lobular carcinoma in situ  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (829, N'M8520/3', N'Lobular carcinoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (830, N'M8521/3', N'Infiltrating ductular carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (831, N'M8522/2', N'Intraductal carcinoma and lobular carcinoma in situ  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (832, N'M8522/3', N'Infiltrating duct and lobular carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (833, N'M8530/3', N'Inflammatory carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (834, N'M8540/3', N'Pagets disease, mammary  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (835, N'M8541/3', N'Pagets disease and infiltrating duct carcinoma of breast  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (836, N'M8542/3', N'Pagets disease, extramammary  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (837, N'M8543/3', N'Pagets disease and intraductal carcinoma of breast  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (838, N'M855', N'Acinar cell neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (839, N'M8550/0', N'Acinar cell adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (840, N'M8550/1', N'Acinar cell tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (841, N'M8550/3', N'Acinar cell carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (842, N'M856-M858', N'Complex epithelial neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (843, N'M8560/3', N'Adenosquamous carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (844, N'M8561/0', N'Adenolymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (845, N'M8562/3', N'Epithelial-myoepithelial carcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (846, N'M8570/3', N'Adenocarcinoma with squamous metaplasia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (847, N'M8571/3', N'Adenocarcinoma with cartilaginous and osseous metaplasia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (848, N'M8572/3', N'Adenocarcinoma with spindle cell metaplasia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (849, N'M8573/3', N'Adenocarcinoma with apocrine metaplasia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (850, N'M8580/0', N'Thymoma, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (851, N'M8580/3', N'Thymoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (852, N'M859-M867', N'Specialized gonadal neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (853, N'M8590/1', N'Sex cord-stromal tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (854, N'M8600/0', N'Thecoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (855, N'M8600/3', N'Thecoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (856, N'M8601/0', N'Thecoma, luteinized  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (857, N'M8602/0', N'Sclerosing stromal tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (858, N'M8610/0', N'Luteoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (859, N'M8620/1', N'Granulosa cell tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (860, N'M8620/3', N'Granulosa cell tumour, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (861, N'M8621/1', N'Granulosa cell-theca cell tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (862, N'M8622/1', N'Juvenile granulosa cell tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (863, N'M8623/1', N'Sex cord tumour with annular tubules  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (864, N'M8630/0', N'Androblastoma, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (865, N'M8630/1', N'Androblastoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (866, N'M8630/3', N'Androblastoma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (867, N'M8631/0', N'Sertoli-Leydig cell tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (868, N'M8632/1', N'Gynandroblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (869, N'M8640/0', N'Sertoli cell tumour NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (870, N'M8640/3', N'Sertoli cell carcinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (871, N'M8641/0', N'Sertoli cell tumour with lipid storage  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (872, N'M8650/0', N'Leydig cell tumour, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (873, N'M8650/1', N'Leydig cell tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (874, N'M8650/3', N'Leydig cell tumour, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (875, N'M8660/0', N'Hilus cell tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (876, N'M8670/0', N'Lipid cell tumour of ovary  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (877, N'M8671/0', N'Adrenal rest tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (878, N'M868-M871', N'Paragangliomas and glomus tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (879, N'M8680/1', N'Paraganglioma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (880, N'M8680/3', N'Paraganglioma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (881, N'M8681/1', N'Sympathetic paraganglioma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (882, N'M8682/1', N'Parasympathetic paraganglioma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (883, N'M8683/0', N'Gangliocytic paraganglioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (884, N'M8690/1', N'Glomus jugulare tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (885, N'M8691/1', N'Aortic body tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (886, N'M8692/1', N'Carotid body tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (887, N'M8693/1', N'Extra-adrenal paraganglioma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (888, N'M8693/3', N'Extra-adrenal paraganglioma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (889, N'M8700/0', N'Phaeochromocytoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (890, N'M8700/3', N'Phaeochromocytoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (891, N'M8710/3', N'Glomangiosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (892, N'M8711/0', N'Glomus tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (893, N'M8712/0', N'Glomangioma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (894, N'M8713/0', N'Glomangiomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (895, N'M872-M879', N'Naevi and melanomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (896, N'M8720/0', N'Pigmented naevus NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (897, N'M8720/2', N'Melanoma in situ  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (898, N'M8720/3', N'Malignant melanoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (899, N'M8721/3', N'Nodular melanoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (900, N'M8722/0', N'Balloon cell naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (901, N'M8722/3', N'Balloon cell melanoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (902, N'M8723/0', N'Halo naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (903, N'M8723/3', N'Malignant melanoma, regressing  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (904, N'M8724/0', N'Fibrous papule of nose  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (905, N'M8725/0', N'Neuronaevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (906, N'M8726/0', N'Magnocellular naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (907, N'M8727/0', N'Dysplastic naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (908, N'M8730/0', N'Nonpigmented naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (909, N'M8730/3', N'Amelanotic melanoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (910, N'M8740/0', N'Junctional naevus NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (911, N'M8740/3', N'Malignant melanoma in junctional naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (912, N'M8741/2', N'Precancerous melanosis NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (913, N'M8741/3', N'Malignant melanoma in precancerous melanosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (914, N'M8742/2', N'Hutchinsons melanotic freckle NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (915, N'M8742/3', N'Malignant melanoma in Hutchinsons melanotic freckle  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (916, N'M8743/3', N'Superficial spreading melanoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (917, N'M8744/3', N'Acral lentiginous melanoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (918, N'M8745/3', N'Desmoplastic melanoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (919, N'M8750/0', N'Intradermal naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (920, N'M8760/0', N'Compound naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (921, N'M8761/1', N'Giant pigmented naevus NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (922, N'M8761/3', N'Malignant melanoma in giant pigmented naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (923, N'M8770/0', N'Epithelioid and spindle cell naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (924, N'M8770/3', N'Mixed epithelioid and spindle cell melanoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (925, N'M8771/0', N'Epithelioid cell naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (926, N'M8771/3', N'Epithelioid cell melanoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (927, N'M8772/0', N'Spindle cell naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (928, N'M8772/3', N'Spindle cell melanoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (929, N'M8773/3', N'Spindle cell melanoma, type A  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (930, N'M8774/3', N'Spindle cell melanoma, type B  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (931, N'M8780/0', N'Blue naevus NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (932, N'M8780/3', N'Blue naevus, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (933, N'M8790/0', N'Cellular blue naevus  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (934, N'M880', N'Soft tissue tumours and sarcomas NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (935, N'M8800/0', N'Soft tissue tumour, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (936, N'M8800/3', N'Sarcoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (937, N'M8800/6', N'Sarcomatosis NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (938, N'M8801/3', N'Spindle cell sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (939, N'M8802/3', N'Giant cell sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (940, N'M8803/3', N'Small cell sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (941, N'M8804/3', N'Epithelioid sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (942, N'M881-M883', N'Fibromatous neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (943, N'M8810/0', N'Fibroma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (944, N'M8810/3', N'Fibrosarcoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (945, N'M8811/0', N'Fibromyxoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (946, N'M8811/3', N'Fibromyxosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (947, N'M8812/0', N'Periosteal fibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (948, N'M8812/3', N'Periosteal fibrosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (949, N'M8813/0', N'Fascial fibroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (950, N'M8813/3', N'Fascial fibrosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (951, N'M8814/3', N'Infantile fibrosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (952, N'M8820/0', N'Elastofibroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (953, N'M8821/1', N'Aggressive fibromatosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (954, N'M8822/1', N'Abdominal fibromatosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (955, N'M8823/1', N'Desmoplastic fibroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (956, N'M8824/1', N'Myofibromatosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (957, N'M8830/0', N'Fibrous histiocytoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (958, N'M8830/1', N'Atypical fibrous histiocytoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (959, N'M8830/3', N'Fibrous histiocytoma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (960, N'M8832/0', N'Dermatofibroma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (961, N'M8832/3', N'Dermatofibrosarcoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (962, N'M8833/3', N'Pigmented dermatofibrosarcoma protuberans', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (963, N'M884', N'Myxomatous neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (964, N'M8840/0', N'Myxoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (965, N'M8840/3', N'Myxosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (966, N'M8841/1', N'Angiomyxoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (967, N'M885-M888', N'Lipomatous neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (968, N'M8850/0', N'Lipoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (969, N'M8850/3', N'Liposarcoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (970, N'M8851/0', N'Fibrolipoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (971, N'M8851/3', N'Liposarcoma, well differentiated', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (972, N'M8852/0', N'Fibromyxolipoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (973, N'M8852/3', N'Myxoid liposarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (974, N'M8853/3', N'Round cell liposarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (975, N'M8854/0', N'Pleomorphic lipoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (976, N'M8854/3', N'Pleomorphic liposarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (977, N'M8855/3', N'Mixed liposarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (978, N'M8856/0', N'Intramuscular lipoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (979, N'M8857/0', N'Spindle cell lipoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (980, N'M8858/3', N'Dedifferentiated liposarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (981, N'M8860/0', N'Angiomyolipoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (982, N'M8861/0', N'Angiolipoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (983, N'M8870/0', N'Myelolipoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (984, N'M8880/0', N'Hibernoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (985, N'M8881/0', N'Lipoblastomatosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (986, N'M889-M892', N'Myomatous neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (987, N'M8890/0', N'Leiomyoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (988, N'M8890/1', N'Leiomyomatosis NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (989, N'M8890/3', N'Leiomyosarcoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (990, N'M8891/0', N'Epithelioid leiomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (991, N'M8891/3', N'Epithelioid leiomyosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (992, N'M8892/0', N'Cellular leiomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (993, N'M8893/0', N'Bizarre leiomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (994, N'M8894/0', N'Angiomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (995, N'M8894/3', N'Angiomyosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (996, N'M8895/0', N'Myoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (997, N'M8895/3', N'Myosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (998, N'M8896/3', N'Myxoid leiomyosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (999, N'M8897/1', N'Smooth muscle tumour NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1000, N'M8900/0', N'Rhabdomyoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1001, N'M8900/3', N'Rhabdomyosarcoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1002, N'M8901/3', N'Pleomorphic rhabdomyosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1003, N'M8902/3', N'Mixed type rhabdomyosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1004, N'M8903/0', N'Fetal rhabdomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1005, N'M8904/0', N'Adult rhabdomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1006, N'M8910/3', N'Embryonal rhabdomyosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1007, N'M8920/3', N'Alveolar rhabdomyosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1008, N'M893-M899', N'Complex mixed and stromal neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1009, N'M8930/0', N'Endometrial stromal nodule  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1010, N'M8930/3', N'Endometrial stromal sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1011, N'M8931/1', N'Endolymphatic stromal myosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1012, N'M8932/0', N'Adenomyoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1013, N'M8933/3', N'Adenosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1014, N'M8940/0', N'Pleomorphic adenoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1015, N'M8940/3', N'Mixed tumour, malignant NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1016, N'M8941/3', N'Carcinoma in pleomorphic adenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1017, N'M8950/3', N'MŸllerian mixed tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1018, N'M8951/3', N'Mesodermal mixed tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1019, N'M8960/1', N'Mesoblastic nephroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1020, N'M8960/3', N'Nephroblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1021, N'M8963/3', N'Rhabdoid sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1022, N'M8964/3', N'Clear cell sarcoma of kidney  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1023, N'M8970/3', N'Hepatoblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1024, N'M8971/3', N'Pancreatoblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1025, N'M8972/3', N'Pulmonary blastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1026, N'M8980/3', N'Carcinosarcoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1027, N'M8981/3', N'Carcinosarcoma, embryonal', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1028, N'M8982/0', N'Myoepithelioma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1029, N'M8990/0', N'Mesenchymoma, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1030, N'M8990/1', N'Mesenchymoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1031, N'M8990/3', N'Mesenchymoma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1032, N'M8991/3', N'Embryonal sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1033, N'M900-M903', N'Fibroepithelial neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1034, N'M9000/0', N'Brenner tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1035, N'M9000/1', N'Brenner tumour, borderline malignancy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1036, N'M9000/3', N'Brenner tumour, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1037, N'M9010/0', N'Fibroadenoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1038, N'M9011/0', N'Intracanalicular fibroadenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1039, N'M9012/0', N'Pericanalicular fibroadenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1040, N'M9013/0', N'Adenofibroma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1041, N'M9014/0', N'Serous adenofibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1042, N'M9015/0', N'Mucinous adenofibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1043, N'M9016/0', N'Giant fibroadenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1044, N'M9020/0', N'Phyllodes tumour, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1045, N'M9020/1', N'Phyllodes tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1046, N'M9020/3', N'Phyllodes tumour, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1047, N'M9030/0', N'Juvenile fibroadenoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1048, N'M904', N'Synovial-like neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1049, N'M9040/0', N'Synovioma, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1050, N'M9040/3', N'Synovial sarcoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1051, N'M9041/3', N'Synovial sarcoma, spindle cell', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1052, N'M9042/3', N'Synovial sarcoma, epithelioid cell', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1053, N'M9043/3', N'Synovial sarcoma, biphasic', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1054, N'M9044/3', N'Clear cell sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1055, N'M905', N'Mesothelial neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1056, N'M9050/0', N'Mesothelioma, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1057, N'M9050/3', N'Mesothelioma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1058, N'M9051/0', N'Fibrous mesothelioma, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1059, N'M9051/3', N'Fibrous mesothelioma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1060, N'M9052/0', N'Epithelioid mesothelioma, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1061, N'M9052/3', N'Epithelioid mesothelioma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1062, N'M9053/0', N'Mesothelioma, biphasic, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1063, N'M9053/3', N'Mesothelioma, biphasic, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1064, N'M9054/0', N'Adenomatoid tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1065, N'M9055/1', N'Cystic mesothelioma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1066, N'M906-M909', N'Germ cell neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1067, N'M9060/3', N'Dysgerminoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1068, N'M9061/3', N'Seminoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1069, N'M9062/3', N'Seminoma, anaplastic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1070, N'M9063/3', N'Spermatocytic seminoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1071, N'M9064/3', N'Germinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1072, N'M9070/3', N'Embryonal carcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1073, N'M9071/3', N'Endodermal sinus tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1074, N'M9072/3', N'Polyembryoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1075, N'M9073/1', N'Gonadoblastoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1076, N'M9080/0', N'Teratoma, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1077, N'M9080/1', N'Teratoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1078, N'M9080/3', N'Teratoma, malignant NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1079, N'M9081/3', N'Teratocarcinoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1080, N'M9082/3', N'Malignant teratoma, undifferentiated', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1081, N'M9083/3', N'Malignant teratoma, intermediate', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1082, N'M9084/0', N'Dermoid cyst NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1083, N'M9084/3', N'Teratoma with malignant transformation', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1084, N'M9085/3', N'Mixed germ cell tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1085, N'M9090/0', N'Struma ovarii NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1086, N'M9090/3', N'Struma ovarii, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1087, N'M9091/1', N'Strumal carcinoid  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1088, N'M910', N'Trophoblastic neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1089, N'M9100/0', N'Hydatidiform mole NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1090, N'M9100/1', N'Invasive hydatidiform mole  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1091, N'M9100/3', N'Choriocarcinoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1092, N'M9101/3', N'Choriocarcinoma combined with other germ cell elements', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1093, N'M9102/3', N'Malignant teratoma, trophoblastic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1094, N'M9103/0', N'Partial hydatidiform mole  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1095, N'M9104/1', N'Placental site trophoblastic tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1096, N'M911', N'Mesonephromas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1097, N'M9110/0', N'Mesonephroma, benign', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1098, N'M9110/1', N'Mesonephric tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1099, N'M9110/3', N'Mesonephroma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1100, N'M912-M916', N'Blood vessel tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1101, N'M9120/0', N'Haemangioma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1102, N'M9120/3', N'Haemangiosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1103, N'M9121/0', N'Cavernous haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1104, N'M9122/0', N'Venous haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1105, N'M9123/0', N'Racemose haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1106, N'M9124/3', N'Kupffer cell sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1107, N'M9125/0', N'Epithelioid haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1108, N'M9126/0', N'Histiocytoid haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1109, N'M9130/0', N'Haemangioendothelioma, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1110, N'M9130/1', N'Haemangioendothelioma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1111, N'M9130/3', N'Haemangioendothelioma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1112, N'M9131/0', N'Capillary haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1113, N'M9132/0', N'Intramuscular haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1114, N'M9133/1', N'Epithelioid haemangioendothelioma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1115, N'M9133/3', N'Epithelioid haemangioendothelioma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1116, N'M9134/1', N'Intravascular bronchial alveolar tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1117, N'M9140/3', N'Kaposis sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1118, N'M9141/0', N'Angiokeratoma ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1119, N'M9142/0', N'Verrucous keratotic haemangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1120, N'M9150/0', N'Haemangiopericytoma, benign ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1121, N'M9150/1', N'Haemangiopericytoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1122, N'M9150/3', N'Haemangiopericytoma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1123, N'M9160/0', N'Angiofibroma NOS ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1124, N'M9161/1', N'Haemangioblastoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1125, N'M917', N'Lymphatic vessel tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1126, N'M9170/0', N'Lymphangioma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1127, N'M9170/3', N'Lymphangiosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1128, N'M9171/0', N'Capillary lymphangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1129, N'M9172/0', N'Cavernous lymphangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1130, N'M9173/0', N'Cystic lymphangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1131, N'M9174/0', N'Lymphangiomyoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1132, N'M9174/1', N'Lymphangiomyomatosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1133, N'M9175/0', N'Haemolymphangioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1134, N'M918-M924', N'Osseous and chondromatous neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1135, N'M9180/0', N'Osteoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1136, N'M9180/3', N'Osteosarcoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1137, N'M9181/3', N'Chondroblastic osteosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1138, N'M9182/3', N'Fibroblastic osteosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1139, N'M9183/3', N'Telangiectatic osteosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1140, N'M9184/3', N'Osteosarcoma in Pagets disease of bone  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1141, N'M9185/3', N'Small cell osteosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1142, N'M9190/3', N'Juxtacortical osteosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1143, N'M9191/0', N'Osteoid osteoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1144, N'M9200/0', N'Osteoblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1145, N'M9200/1', N'Aggressive osteoblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1146, N'M9210/0', N'Osteochondroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1147, N'M9210/1', N'Osteochondromatosis NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1148, N'M9220/0', N'Chondroma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1149, N'M9220/1', N'Chondromatosis NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1150, N'M9220/3', N'Chondrosarcoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1151, N'M9221/0', N'Juxtacortical chondroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1152, N'M9221/3', N'Juxtacortical chondrosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1153, N'M9230/0', N'Chondroblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1154, N'M9230/3', N'Chondroblastoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1155, N'M9231/3', N'Myxoid chondrosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1156, N'M9240/3', N'Mesenchymal chondrosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1157, N'M9241/0', N'Chondromyxoid fibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1158, N'M925', N'Giant cell tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1159, N'M9250/1', N'Giant cell tumour of bone NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1160, N'M9250/3', N'Giant cell tumour of bone, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1161, N'M9251/1', N'Giant cell tumour of soft parts NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1162, N'M9251/3', N'Malignant giant cell tumour of soft parts', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1163, N'M926', N'Miscellaneous bone tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1164, N'M9260/3', N'Ewings sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1165, N'M9261/3', N'Adamantinoma of long bones  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1166, N'M9262/0', N'Ossifying fibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1167, N'M927-M934', N'Odontogenic tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1168, N'M9270/0', N'Odontogenic tumour, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1169, N'M9270/1', N'Odontogenic tumour NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1170, N'M9270/3', N'Odontogenic tumour, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1171, N'M9271/0', N'Dentinoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1172, N'M9272/0', N'Cementoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1173, N'M9273/0', N'Cementoblastoma, benign  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1174, N'M9274/0', N'Cementifying fibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1175, N'M9275/0', N'Gigantiform cementoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1176, N'M9280/0', N'Odontoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1177, N'M9281/0', N'Compound odontoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1178, N'M9282/0', N'Complex odontoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1179, N'M9290/0', N'Ameloblastic fibro-odontoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1180, N'M9290/3', N'Ameloblastic odontosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1181, N'M9300/0', N'Adenomatoid odontogenic tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1182, N'M9301/0', N'Calcifying odontogenic cyst  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1183, N'M9302/0', N'Odontogenic ghost cell tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1184, N'M9310/0', N'Ameloblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1185, N'M9310/3', N'Ameloblastoma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1186, N'M9311/0', N'Odontoameloblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1187, N'M9312/0', N'Squamous odontogenic tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1188, N'M9320/0', N'Odontogenic myxoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1189, N'M9321/0', N'Central odontogenic fibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1190, N'M9322/0', N'Peripheral odontogenic fibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1191, N'M9330/0', N'Ameloblastic fibroma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1192, N'M9330/3', N'Ameloblastic fibrosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1193, N'M9340/0', N'Calcifying epithelial odontogenic tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1194, N'M935-M937', N'Miscellaneous tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1195, N'M9350/1', N'Craniopharyngioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1196, N'M9360/1', N'Pinealoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1197, N'M9361/1', N'Pineocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1198, N'M9362/3', N'Pineoblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1199, N'M9363/0', N'Melanotic neuroectodermal tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1200, N'M9364/3', N'Peripheral neuroectodermal tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1201, N'M9370/3', N'Chordoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1202, N'M938-M948', N'Gliomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1203, N'M9380/3', N'Glioma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1204, N'M9381/3', N'Gliomatosis cerebri  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1205, N'M9382/3', N'Mixed glioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1206, N'M9383/1', N'Subependymal glioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1207, N'M9384/1', N'Subependymal giant cell astrocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1208, N'M9390/0', N'Choroid plexus papilloma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1209, N'M9390/3', N'Choroid plexus papilloma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1210, N'M9391/3', N'Ependymoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1211, N'M9392/3', N'Ependymoma, anaplastic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1212, N'M9393/1', N'Papillary ependymoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1213, N'M9394/1', N'Myxopapillary ependymoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1214, N'M9400/3', N'Astrocytoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1215, N'M9401/3', N'Astrocytoma, anaplastic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1216, N'M9410/3', N'Protoplasmic astrocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1217, N'M9411/3', N'Gemistocytic astrocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1218, N'M9420/3', N'Fibrillary astrocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1219, N'M9421/3', N'Pilocytic astrocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1220, N'M9422/3', N'Spongioblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1221, N'M9423/3', N'Spongioblastoma polare  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1222, N'M9424/3', N'Pleomorphic xanthoastrocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1223, N'M9430/3', N'Astroblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1224, N'M9440/3', N'Glioblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1225, N'M9441/3', N'Giant cell glioblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1226, N'M9442/3', N'Gliosarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1227, N'M9443/3', N'Primitive polar spongioblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1228, N'M9450/3', N'Oligodendroglioma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1229, N'M9451/3', N'Oligodendroglioma, anaplastic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1230, N'M9460/3', N'Oligodendroblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1231, N'M9470/3', N'Medulloblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1232, N'M9471/3', N'Desmoplastic medulloblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1233, N'M9472/3', N'Medullomyoblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1234, N'M9473/3', N'Primitive neuroectodermal tumour  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1235, N'M9480/3', N'Cerebellar sarcoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1236, N'M9481/3', N'Monstrocellular sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1237, N'M949-M952', N'Neuroepitheliomatous neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1238, N'M9490/0', N'Ganglioneuroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1239, N'M9490/3', N'Ganglioneuroblastoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1240, N'M9491/0', N'Ganglioneuromatosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1241, N'M9500/3', N'Neuroblastoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1242, N'M9501/3', N'Medulloepithelioma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1243, N'M9502/3', N'Teratoid medulloepithelioma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1244, N'M9503/3', N'Neuroepithelioma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1245, N'M9504/3', N'Spongioneuroblastoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1246, N'M9505/1', N'Ganglioglioma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1247, N'M9506/0', N'Neurocytoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1248, N'M9507/0', N'Pacinian tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1249, N'M9510/3', N'Retinoblastoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1250, N'M9511/3', N'Retinoblastoma, differentiated  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1251, N'M9512/3', N'Retinoblastoma, undifferentiated  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1252, N'M9520/3', N'Olfactory neurogenic tumour', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1253, N'M9521/3', N'Esthesioneurocytoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1254, N'M9522/3', N'Esthesioneuroblastoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1255, N'M9523/3', N'Esthesioneuroepithelioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1256, N'M953', N'Meningiomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1257, N'M9530/0', N'Meningioma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1258, N'M9530/1', N'Meningiomatosis NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1259, N'M9530/3', N'Meningioma, malignant  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1260, N'M9531/0', N'Meningotheliomatous meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1261, N'M9532/0', N'Fibrous meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1262, N'M9533/0', N'Psammomatous meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1263, N'M9534/0', N'Angiomatous meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1264, N'M9535/0', N'Haemangioblastic meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1265, N'M9536/0', N'Haemangiopericytic meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1266, N'M9537/0', N'Transitional meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1267, N'M9538/1', N'Papillary meningioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1268, N'M9539/3', N'Meningeal sarcomatosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1269, N'M954-M957', N'Nerve sheath tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1270, N'M9540/0', N'Neurofibroma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1271, N'M9540/1', N'Neurofibromatosis NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1272, N'M9540/3', N'Neurofibrosarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1273, N'M9541/0', N'Melanotic neurofibroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1274, N'M9550/0', N'Plexiform neurofibroma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1275, N'M9560/0', N'Neurilemmoma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1276, N'M9560/1', N'Neurinomatosis', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1277, N'M9560/3', N'Neurilemmoma, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1278, N'M9561/3', N'Triton tumour, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1279, N'M9562/0', N'Neurothekeoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1280, N'M9570/0', N'Neuroma NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1281, N'M958', N'Granular cell tumours and alveolar soft part sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1282, N'M9580/0', N'Granular cell tumour NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1283, N'M9580/3', N'Granular cell tumour, malignant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1284, N'M9581/3', N'Alveolar soft part sarcoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1285, N'M959-M971', N'Hodgkins and non-Hodgkins lymphoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1286, N'M959', N'Malignant lymphomas NOS or diffuse', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1287, N'M9590/3', N'Malignant lymphoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1288, N'M9591/3', N'Malignant lymphoma, non-Hodgkins NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1289, N'M9592/3', N'Lymphosarcoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1290, N'M9593/3', N'Reticulosarcoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1291, N'M9594/3', N'Microglioma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1292, N'M9595/3', N'Malignant lymphoma, diffuse NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1293, N'M965-M966', N'Hodgkins disease', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1294, N'M9650/3', N'Hodgkins disease NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1295, N'M9652/3', N'Hodgkins disease, mixed cellularity NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1296, N'M9653/3', N'Hodgkins disease, lymphocytic depletion NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1297, N'M9654/3', N'Hodgkins disease, lymphocytic depletion, diffuse fibrosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1298, N'M9655/3', N'Hodgkins disease, lymphocytic depletion, reticular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1299, N'M9657/3', N'Hodgkins disease, lymphocytic predominance NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1300, N'M9658/3', N'Hodgkins disease, lymphocytic predominance, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1301, N'M9659/3', N'Hodgkins disease, lymphocytic predominance, nodular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1302, N'M9660/3', N'Hodgkins paragranuloma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1303, N'M9661/3', N'Hodgkins granuloma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1304, N'M9662/3', N'Hodgkins sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1305, N'M9663/3', N'Hodgkins disease, nodular sclerosis NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1306, N'M9664/3', N'Hodgkins disease, nodular sclerosis, cellular phase  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1307, N'M9665/3', N'Hodgkins disease, nodular sclerosis, lymphocytic predominance  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1308, N'M9666/3', N'Hodgkins disease, nodular sclerosis, mixed cellularity  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1309, N'M9667/3', N'Hodgkins disease, nodular sclerosis, lymphocytic depletion  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1310, N'M967-M968', N'Malignant lymphoma, diffuse or NOS, specified type', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1311, N'M9670/3', N'Malignant lymphoma, small lymphocytic NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1312, N'M9671/3', N'Malignant lymphoma, lymphoplasmacytic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1313, N'M9672/3', N'Malignant lymphoma, small cleaved cell, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1314, N'M9673/3', N'Malignant lymphoma, lymphocytic, intermediate differentiation, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1315, N'M9674/3', N'Malignant lymphoma, centrocytic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1316, N'M9675/3', N'Malignant lymphoma, mixed small and large cell, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1317, N'M9676/3', N'Malignant lymphoma, centroblastic-centrocytic, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1318, N'M9677/3', N'Malignant lymphomatous polyposis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1319, N'M9680/3', N'Malignant lymphoma, large cell, diffuse NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1320, N'M9681/3', N'Malignant lymphoma, large cell, cleaved, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1321, N'M9682/3', N'Malignant lymphoma, large cell, noncleaved, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1322, N'M9683/3', N'Malignant lymphoma, centroblastic, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1323, N'M9684/3', N'Malignant lymphoma, immunoblastic NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1324, N'M9685/3', N'Malignant lymphoma, lymphoblastic  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1325, N'M9686/3', N'Malignant lymphoma, small cell, noncleaved, diffuse  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1326, N'M9687/3', N'Burkitts lymphoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1327, N'M969', N'Malignant lymphoma, follicular or nodular, with or without diffuse areas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1328, N'M9690/3', N'Malignant lymphoma, follicular NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1329, N'M9691/3', N'Malignant lymphoma, mixed small cleaved and large cell, follicular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1330, N'M9692/3', N'Malignant lymphoma, centroblastic-centrocytic, follicular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1331, N'M9693/3', N'Malignant lymphoma, lymphocytic, well differentiated, nodular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1332, N'M9694/3', N'Malignant lymphoma, lymphocytic, intermediate differentiation, nodular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1333, N'M9695/3', N'Malignant lymphoma, small cleaved cell, follicular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1334, N'M9696/3', N'Malignant lymphoma, lymphocytic, poorly differentiated, nodular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1335, N'M9697/3', N'Malignant lymphoma, centroblastic, follicular  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1336, N'M9698/3', N'Malignant lymphoma, large cell, follicular NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1337, N'M970', N'Specified cutaneous and peripheral T-cell lymphomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1338, N'M9700/3', N'Mycosis fungoides  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1339, N'M9701/3', N'SZzarys disease  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1340, N'M9702/3', N'Peripheral T-cell lymphoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1341, N'M9703/3', N'T-zone lymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1342, N'M9704/3', N'Lymphoepithelioid lymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1343, N'M9705/3', N'Peripheral T-cell lymphoma, AILD  (angioimmunoblastic lymphadenopathy with dysproteinaemia)  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1344, N'M9706/3', N'Peripheral T-cell lymphoma, pleomorphic small cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1345, N'M9707/3', N'Peripheral T-cell lymphoma, pleomorphic medium and large cell  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1346, N'M9709/3', N'Cutaneous lymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1347, N'M971', N'Other specified non-Hodgkins lymphomas', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1348, N'M9711/3', N'Monocytoid B-cell lymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1349, N'M9712/3', N'Angioendotheliomatosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1350, N'M9713/3', N'Angiocentric T-cell lymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1351, N'M9714/3', N'Large cell  (Ki-1+) lymphoma', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1352, N'M972', N'Other lymphoreticular neoplasms', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1353, N'M9720/3', N'Malignant histiocytosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1354, N'M9722/3', N'Letterer-Siwe disease  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1355, N'M9723/3', N'True histiocytic lymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1356, N'M973', N'Plasma cell tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1357, N'M9731/3', N'Plasmacytoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1358, N'M9732/3', N'Multiple myeloma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1359, N'M974', N'Mast cell tumours', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1360, N'M9740/1', N'Mastocytoma NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1361, N'M9740/3', N'Mast cell sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1362, N'M9741/3', N'Malignant mastocytosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1363, N'M976', N'Immunoproliferative diseases', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1364, N'M9760/3', N'Immunoproliferative disease NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1365, N'M9761/3', N'Waldenstrsms macroglobulinaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1366, N'M9762/3', N'Alpha heavy chain disease  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1367, N'M9763/3', N'Gamma heavy chain disease  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1368, N'M9764/3', N'Immunoproliferative small intestinal disease  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1369, N'M9765/1', N'Monoclonal gammopathy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1370, N'M9766/1', N'Angiocentric immunoproliferative lesion  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1371, N'M9767/1', N'Angioimmunoblastic lymphadenopathy  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1372, N'M9768/1', N'T-gamma lymphoproliferative disease  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1373, N'M980-M994', N'Leukaemias', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1374, N'M980', N'Leukaemias NOS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1375, N'M9800/3', N'Leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1376, N'M9801/3', N'Acute leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1377, N'M9802/3', N'Subacute leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1378, N'M9803/3', N'Chronic leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1379, N'M9804/3', N'Aleukaemic leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1380, N'M982', N'Lymphoid leukaemias', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1381, N'M9820/3', N'Lymphoid leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1382, N'M9821/3', N'Acute lymphoblastic leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1383, N'M9822/3', N'Subacute lymphoid leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1384, N'M9823/3', N'Chronic lymphocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1385, N'M9824/3', N'Aleukaemic lymphoid leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1386, N'M9825/3', N'Prolymphocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1387, N'M9826/3', N'Burkitts cell leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1388, N'M9827/3', N'Adult T-cell leukaemia/lymphoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1389, N'M983', N'Plasma cell leukaemia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1390, N'M9830/3', N'Plasma cell leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1391, N'M984', N'Erythroleukaemias', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1392, N'M9840/3', N'Erythroleukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1393, N'M9841/3', N'Acute erythraemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1394, N'M9842/3', N'Chronic erythraemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1395, N'M985', N'Lymphosarcoma cell leukaemia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1396, N'M9850/3', N'Lymphosarcoma cell leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1397, N'M986', N'Myeloid  (granulocytic) leukaemias', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1398, N'M9860/3', N'Myeloid leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1399, N'M9861/3', N'Acute myeloid leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1400, N'M9862/3', N'Subacute myeloid leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1401, N'M9863/3', N'Chronic myeloid leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1402, N'M9864/3', N'Aleukaemic myeloid leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1403, N'M9866/3', N'Acute promyelocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1404, N'M9867/3', N'Acute myelomonocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1405, N'M9868/3', N'Chronic myelomonocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1406, N'M987', N'Basophilic leukaemia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1407, N'M9870/3', N'Basophilic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1408, N'M988', N'Eosinophilic leukaemia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1409, N'M9880/3', N'Eosinophilic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1410, N'M989', N'Monocytic leukaemias', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1411, N'M9890/3', N'Monocytic leukaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1412, N'M9891/3', N'Acute monocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1413, N'M9892/3', N'Subacute monocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1414, N'M9893/3', N'Chronic monocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1415, N'M9894/3', N'Aleukaemic monocytic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1416, N'M990-M994', N'Other leukaemias', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1417, N'M9900/3', N'Mast cell leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1418, N'M9910/3', N'Acute megakaryoblastic leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1419, N'M9930/3', N'Myeloid sarcoma  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1420, N'M9931/3', N'Acute panmyelosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1421, N'M9932/3', N'Acute myelofibrosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1422, N'M9940/3', N'Hairy cell leukaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1423, N'M9941/3', N'Leukaemic reticuloendotheliosis  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1424, N'M995-M997', N'Miscellaneous myeloproliferative and lymphoproliferative disorders', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1425, N'M9950/1', N'Polycythaemia vera  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1426, N'M9960/1', N'Chronic myeloproliferative disease  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1427, N'M9961/1', N'Myelosclerosis with myeloid metaplasia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1428, N'M9962/1', N'Idiopathic thrombocythaemia  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1429, N'M9970/1', N'Lymphoproliferative disease NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1430, N'M998', N'Myelodysplastic syndrome', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1431, N'M9980/1', N'Refractory anaemia NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1432, N'M9981/1', N'Refractory anaemia without sideroblasts  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1433, N'M9982/1', N'Refractory anaemia with sideroblasts  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1434, N'M9983/1', N'Refractory anaemia with excess of blasts  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1435, N'M9984/1', N'Refractory anaemia with excess of blasts with transformation  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1436, N'M9989/1', N'Myelodysplastic syndrome NOS  ', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1437, N'Widowed', N'Widowed', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1438, N'Drug Substitutions', N'Drug Substitutions', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1439, N'Inconclusive', N'Inconclusive', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1440, N'Father', N'Father', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1441, N'Mother', N'Mother', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1442, N'Co-Wife', N'Co-Wife', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1443, N'Positive', N'Positive', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1444, N'Negative', N'Negative', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1445, N'Stable', N'Stable', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1446, N'UnStable', N'UnStable', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1447, N'FT', N'FT', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1448, N'CADH', N'CADH', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1449, N'CADP', N'CADP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1450, N'FADG', N'FADG', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1451, N'Recovering/Resolving', N'Recovering/Resolving', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1452, N'Recoverd/Resolved', N'Recoverd/Resolved', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1453, N'Requires or Prolongs hospitalization', N'Requires or Prolongs hospitalization', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1454, N'Caused a congenital anomaly', N'Caused a congenital anomaly', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1455, N'Requires intervention to prevent permanent damage', N'Requires intervention to prevent permanent damage', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1456, N'Died due to ADR', N'Died due to ADR', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1457, N'Died not due to ADR', N'Died not due to ADR', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1458, N'Abnormal dreams or nightmares (Frightening or unpleasant dreams)', N'Abnormal dreams or nightmares (Frightening or unpleasant dreams)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1459, N'Anxiety', N'Anxiety', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1460, N'Confusion/abnormal thinking', N'Confusion/abnormal thinking', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1461, N'Depression/mood changes (frequently feeling very low)', N'Depression/mood changes (frequently feeling very low)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1462, N'Dizziness/spinning sensation/vertigo', N'Dizziness/spinning sensation/vertigo', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1463, N'Fatigue/tiredness/weakness', N'Fatigue/tiredness/weakness', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1464, N'Insomnia (lacking sleep at night)/sleep problems', N'Insomnia (lacking sleep at night)/sleep problems', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1465, N'Poor concentration/ memory problems', N'Poor concentration/ memory problems', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1466, N'Burning and tingling in limbs/ Paresthesia/painful neuropathy', N'Burning and tingling in limbs/ Paresthesia/painful neuropathy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1467, N'Suicide ideation (thoughts on ending the life)', N'Suicide ideation (thoughts on ending the life)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1468, N'Skin rash/hypersensitivity reaction', N'Skin rash/hypersensitivity reaction', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1469, N'Abdominal discomfort/abdominal pain', N'Abdominal discomfort/abdominal pain', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1470, N'Nausea/vomiting', N'Nausea/vomiting', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1471, N'Fat changes/lipodystrophy/lipohypertrophy', N'Fat changes/lipodystrophy/lipohypertrophy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1472, N'Gynaecomastia', N'Gynaecomastia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1473, N'Anaemia/pancytopenia', N'Anaemia/pancytopenia', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1474, N'Renal failure/renal insufficiency', N'Renal failure/renal insufficiency', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1475, N'Other Specify', N'Other Specify', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1476, N'Registration-encounter', N'Registration', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1477, N'Triage-encounter', N'Triage', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1478, N'ccc-encounter', N'CCC', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1479, N'pmtct-encounter', N'PMTCT', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1480, N'tb-encounter', N'TB', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1481, N'Lab-encounter', N'Lab', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1482, N'Pharmacy-encounter', N'Pharmacy', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1483, N'Maternity', N'Maternity', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1484, N'PITC', N'PITC', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1485, N'Outreach', N'Outreach', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1486, N'ANC', N'ANC', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1487, N'PeD', N'PeD', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1488, N'Mobile Outreach', N'Mobile Outreach', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1489, N'VMMC', N'VMMC', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1490, N'NP', N'NP', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1491, N'VI', N'VI', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1492, N'HB', N'HB', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1493, N'HTS', N'HTS', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1494, N'D: Deaf/hearing impaired', N'D: Deaf/hearing impaired', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1495, N'B: Blind/Visually impaired', N'B: Blind/Visually impaired', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1496, N'M: Mentally Challenged', N'M: Mentally Challenged', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1497, N'P: Physically Challenged', N'P: Physically Challenged', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1498, N'I: Individual', N'I: Individual', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1499, N'C: Couple (includes polygamous)', N'C: Couple (includes polygamous)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1500, N'HP: Health Facility Patients', N'HP: Health Facility Patients', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1501, N'NP: Non-Patients', N'NP: Non-Patients', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1502, N'VI: Integrated VCT sites', N'VI: Integrated VCT sites', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1503, N'VS: Stand-alone VCT sites', N'VS: Stand-alone VCT sites', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1504, N'HB: Home-based', N'HB: Home-based', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1505, N'MO: Mobile and Outreach', N'MO: Mobile and Outreach', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1506, N'Declined', N'Declined', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1507, N'Positive IPV Outcome', N'Positive IPV Outcome', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1508, N'Fear losing partner', N'Fear losing partner', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1509, N'Invalid', N'Invalid', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1510, N'Determine', N'Determine', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1511, N'First Response', N'First Response', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1512, N'Adolescent Girls and Young Women', N'Adolescent Girls and Young Women', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1513, N'Fisher Folk', N'Fisher Folk', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1514, N'MSW', N'Male Sex Worker', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1515, N'Prisoner', N'Prisoner', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1516, N'Truck Driver', N'Truck Driver', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1517, N'Hts-encounter', N'hts-encounter', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1518, N'Contacted', N'Contacted', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1519, N'Contacted and Linked', N'Contacted and Linked', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1520, N'Not Contacted', N'Not Contacted', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1521, N'Phone', N'Phone', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1522, N'Physical', N'Physical', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1523, N'Emotional', N'Emotional', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1524, N'Sexual', N'Sexual', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1525, N'No IPV', N'No IPV', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1526, N'NA-CHILD', N'NA-CHILD', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1527, N'P', N'P', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1528, N'Sexual Partner (SP)', N'Sexual Partner (SP)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1529, N'Injectable Drug User (IDU)', N'Injectable Drug User (IDU)', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1530, N'Child - C', N'Child - C', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1531, N'Con: Contract Referral', N'Con: Contract Referral', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1532, N'D: Dual Referral', N'D: Dual Referral', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1533, N'Cr: Passive Referral', N'Cr: Passive Referral', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1534, N'Pr: Provider Referral', N'Pr: Provider Referral', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1535, N'ConsentToBeTested', N'ConsentToBeTested', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1536, N'ConsentToListPartners', N'ConsentToListPartners', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1537, N'PnsPhysicallyHurt', N'PnsPhysicallyHurt', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1538, N'PnsThreatenedHurt', N'PnsThreatenedHurt', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1539, N'PnsForcedSexual', N'PnsForcedSexual', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1540, N'IPVOutcome', N'IPVOutcome', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1541, N'PnsRelationship', N'PnsRelationship', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1542, N'LivingWithClient', N'LivingWithClient', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1543, N'HIVStatus', N'HIVStatus', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1544, N'PNSApproach', N'PNSApproach', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1545, N'EligibleTesting', N'EligibleTesting', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1546, N'CCCEnrollment', N'CCCEnrollment', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1547, N'HIVTesting', N'HIVTesting', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1548, N'Nutritional', N'Nutritional', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1549, N'Counselling', N'Counselling', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1550, N'HIV Exposed Infant', N'HIV Exposed Infant', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1551, N'ScreeningHivStatus', N'ScreeningHivStatus', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1552, N'Not Applicable', N'Not Applicable', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1553, N'Family', N'Family', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1554, N'Enrolment', N'Enrolment', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1555, N'Not Done', N'Not Done', 0)
GO
INSERT [dbo].[LookupItem] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1556, N'No Signs', N'No Signs', 0)
GO
SET IDENTITY_INSERT [dbo].[LookupItem] OFF
GO
SET IDENTITY_INSERT [dbo].[LookupMaster] ON 
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (1, N'FPMethod', N'FP Method', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (2, N'Entrypoint', N'Entry point', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (3, N'VisitType', N'Visit Type', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (4, N'TBStatus', N'TB Status', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (5, N'ScreeningCategory', N'Screening Category', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (6, N'VLReasons', N'VL Reasons', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (7, N'ARTUse', N'ART Use', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (8, N'MaritalStatus', N'Marital Status', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (9, N'PopulationType', N'PopulationType', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (10, N'KeyPopulation', N'Key Population', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (11, N'WHOStage', N'WHOStage', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (12, N'NutritionStatus', N'Nutrition Status', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (13, N'Adherance', N'Adherance', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (14, N'AppointmentType', N'Appointment Type', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (15, N'Regimen', N'Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (16, N'TBRegimen', N'TB Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (17, N'Gender', N'Gender', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (18, N'YesNo', N'YesNo', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (19, N'FPStatus', N'FP Status', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (20, N'ModuleMaster', N'Module Master', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (21, N'DrugInterruptions', N'Drug Interruptions', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (22, N'DrugSubstitutions', N'Drug Substitutions', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (23, N'PregnancyStatus', N'Pregnancy Status', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (24, N'Tier', N'Tier', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (25, N'CaCxScreening', N'CaCx Screening', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (26, N'STIScreening', N'STI Screening', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (27, N'STIPartnerNotification', N'STI Partner Notification', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (28, N'ADRSeverity', N'ADR Severity', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (29, N'VisitBy', N'Visit By', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (30, N'NoFamilyPlanning', N'No Family Planning', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (31, N'PhysicalExamination', N'Physical Examination', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (32, N'ExaminationType', N'Examination Type', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (33, N'PHDP', N'PHDP', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (34, N'ARVAdherence', N'ARV Adherence', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (35, N'CTXAdherence', N'CTX Adherence', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (36, N'ChronicIllness', N'ChronicIllness', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (37, N'Vaccinations', N'Vaccinations', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (38, N'VaccinationStages', N'Vaccination Stages', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (39, N'AdultFirstLineRegimen', N'Adult Firstline Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (40, N'AdultSecondlineRegimen', N'Adult Secondline Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (41, N'AdultThirdlineRegimen', N'Adult Thirdline Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (42, N'PaedsFirstLineRegimen', N'Paeds Firstline Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (43, N'PaedsSecondlineRegimen', N'Paeds SecondLine Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (44, N'PMTCTRegimens', N'PMTCT Regimens', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (45, N'Infants', N'Infants', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (46, N'PrEPRegimen', N'Pre-Exposure Prophylaxis (PrEP)', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (47, N'PePRegimen', N'Post Exposure Prophylaxis (PEP)', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (48, N'OIRegimen', N'Management of Opportunistic infections (OIs)', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (49, N'PaedsThirdlineRegimen', N'Paeds Thirdline Regimen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (50, N'UniversalProphylaxis', N'Universal prophylaxis', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (51, N'IPT', N'Isoniazid Prophylaxis Therapy (IPT)', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (52, N'Fluconazole', N'Fluconazole (treatment & prophylaxis)', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (53, N'RegimenClassification', N'Regimen Classification', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (54, N'AppointmentStatus', N'NULL', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (55, N'PatientIdentifier', N'NULL', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (56, N'BaseLineHivStatus', N'BaseLineHivStatus', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (57, N'HivTestingResult', N'HivTestingResult', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (58, N'LabOrderReason', N'LabOrderReason', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (59, N'Vaccine', N'Vaccine', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (60, N'BCG', N'BCG', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (61, N'PV', N'PV', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (62, N'Measles', N'Measles', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (63, N'PCV', N'PCV', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (64, N'Penta', N'Penta', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (65, N'FluVaccine', N'FluVaccine', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (66, N'HBV', N'HBV', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (67, N'AppointmentReason', N'Appointment Reason', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (68, N'DifferentiatedCare', N'Differentiated Care', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (69, N'Relationship', N'Relationship', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (70, N'ServiceArea', N'Service Area', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (71, N'PatientType', N'Patient Type', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (72, N'CareEnded', N'CareEnded', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (73, N'AdverseEventsActions', N'Adverse Events Actions', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (74, N'ConsentType', N'Consent Type', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (75, N'DrugSwitches', N'Drug Switches', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (76, N'Regimen Lines', N'Regimen Lines', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (77, N'TreatmentPlan', N'Treatment Plan', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (78, N'TreatmentProgram', N'Treatment Program', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (79, N'PeriodDrugsTaken', N'Period DrugsTaken', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (80, N'ReviewOfSystems', N'Review Of Systems', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (81, N'Skin', N'Skin', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (82, N'Eyes', N'Eyes', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (83, N'ENT', N'ENT', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (84, N'Chest', N'Chest', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (85, N'CVS', N'CVS', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (86, N'Abdomen', N'Abdomen', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (87, N'CNS', N'CNS', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (88, N'Genito-urinary', N'Genito-urinary', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (89, N'ICD10', N'ICD10', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (90, N'PresentingComplaints', N'Presenting Complaints', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (91, N'Allergies', N'Allergies', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (92, N'AllergyReactions', N'Allergy Reactions', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (93, N'GeneralExamination', N'General Examination', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (94, N'AdheranceMeasurement', N'Adherance Measurement', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (95, N'IptOutcome', N'Ipt Outcome', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (96, N'Unknown', N'Unknown', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (97, N'RegimenClassificationAdult', N'Regimen Classification Adult', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (98, N'RegimenClassificationPaeds', N'Regimen Classification Paeds', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (99, N'PregnancyOutcome', N'Pregnancy Outcome', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (100, N'ReConfirmatoryTest', N'ReConfirmatory Test', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (101, N'StabilityAssessment', N'Stability Assessment', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (102, N'HistoryARTUse', N'History ART Use', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (103, N'HivTestTypes', N'Test Types', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (104, N'GUS', N'Genito-urinary', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (105, N'ARTRefillModel', N'ARTRefillModel', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (106, N'AdverseEventOutcome', N'AEO', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (107, N'AdverseEvents', N'AdverseEvents', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (108, N'EncounterType', N'EncounterType', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (109, N'HTSEntryPoints', N'HTS Entry Points', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (110, N'Disabilities', N'Disabilities', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (111, N'TestedAs', N'TestedAs', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (112, N'Strategy', N'Strategy', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (113, N'ReasonsPartner', N'Reasons Partner Listing', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (114, N'HIVResults', N'HIV Results', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (115, N'HIVTestKits', N'HIV Test Kits', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (116, N'HIVFinalResults', N'HIV Final Results', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (117, N'TracingOutcome', N'Tracing Outcome', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (118, N'TracingMode', N'Tracing Mode', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (119, N'YesNoNA', N'Yes/No/NA', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (120, N'IpvOutcome', N'IpvOutcome', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (121, N'YesNoDeclined', N'YesNoDeclined', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (122, N'PNSRelationship', N'PNSRelationship', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (123, N'HivStatus', N'HivStatus', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (124, N'PnsApproach', N'PnsApproach', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (125, N'PnsScreening', N'PnsScreening', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (126, N'PnsTracingOutcome', N'PnsTracingOutcome', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (127, N'FamilyTracingOutcome', N'FamilyTracingOutcome', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (128, N'ReferralReason', N'ReferralReason', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (129, N'ScreeningHivStatus', N'ScreeningHivStatus', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (130, N'FamilyScreening', N'FamilyScreening', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (131, N'PriorityPopulation', N'PriorityPopulation', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (132, N'TracingType', N'TracingType', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (133, N'HTSKeyPopulation', N'HTSKeyPopulation', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (134, N'TbScreening', N'TbScreening', 0)
GO
INSERT [dbo].[LookupMaster] ([Id], [Name], [DisplayName], [DeleteFlag]) VALUES (135, N'HTSMaritalStatus', N'HTSMaritalStatus', 0)
GO
SET IDENTITY_INSERT [dbo].[LookupMaster] OFF
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1436, N'Myelodysplastic syndrome NOS  ', CAST(880.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1434, N'Refractory anaemia with excess of blasts  ', CAST(878.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1433, N'Refractory anaemia with sideroblasts  ', CAST(877.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1432, N'Refractory anaemia without sideroblasts  ', CAST(876.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1431, N'Refractory anaemia NOS  ', CAST(875.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1430, N'Myelodysplastic syndrome', CAST(874.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1429, N'Lymphoproliferative disease NOS  ', CAST(873.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1428, N'Idiopathic thrombocythaemia  ', CAST(872.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1427, N'Myelosclerosis with myeloid metaplasia  ', CAST(871.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1426, N'Chronic myeloproliferative disease  ', CAST(870.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1425, N'Polycythaemia vera  ', CAST(869.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1423, N'Leukaemic reticuloendotheliosis  ', CAST(867.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1422, N'Hairy cell leukaemia  ', CAST(866.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1421, N'Acute myelofibrosis  ', CAST(865.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1420, N'Acute panmyelosis  ', CAST(864.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1419, N'Myeloid sarcoma  ', CAST(863.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1418, N'Acute megakaryoblastic leukaemia  ', CAST(862.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1417, N'Mast cell leukaemia  ', CAST(861.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1416, N'Other leukaemias', CAST(860.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1415, N'Aleukaemic monocytic leukaemia  ', CAST(859.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1414, N'Chronic monocytic leukaemia  ', CAST(858.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1413, N'Subacute monocytic leukaemia  ', CAST(857.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1412, N'Acute monocytic leukaemia  ', CAST(856.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1411, N'Monocytic leukaemia NOS  ', CAST(855.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1410, N'Monocytic leukaemias', CAST(854.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1409, N'Eosinophilic leukaemia  ', CAST(853.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1408, N'Eosinophilic leukaemia', CAST(852.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1407, N'Basophilic leukaemia  ', CAST(851.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1406, N'Basophilic leukaemia', CAST(850.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1405, N'Chronic myelomonocytic leukaemia  ', CAST(849.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1404, N'Acute myelomonocytic leukaemia  ', CAST(848.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1403, N'Acute promyelocytic leukaemia  ', CAST(847.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1402, N'Aleukaemic myeloid leukaemia  ', CAST(846.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1401, N'Chronic myeloid leukaemia  ', CAST(845.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1400, N'Subacute myeloid leukaemia  ', CAST(844.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1399, N'Acute myeloid leukaemia  ', CAST(843.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1398, N'Myeloid leukaemia NOS  ', CAST(842.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1397, N'Myeloid  (granulocytic) leukaemias', CAST(841.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1396, N'Lymphosarcoma cell leukaemia  ', CAST(840.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1395, N'Lymphosarcoma cell leukaemia', CAST(839.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1394, N'Chronic erythraemia  ', CAST(838.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1393, N'Acute erythraemia  ', CAST(837.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1392, N'Erythroleukaemia  ', CAST(836.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1391, N'Erythroleukaemias', CAST(835.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1390, N'Plasma cell leukaemia  ', CAST(834.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1389, N'Plasma cell leukaemia', CAST(833.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1388, N'Adult T-cell leukaemia/lymphoma  ', CAST(832.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1387, N'Burkitts cell leukaemia  ', CAST(831.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1386, N'Prolymphocytic leukaemia  ', CAST(830.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1385, N'Aleukaemic lymphoid leukaemia  ', CAST(829.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1384, N'Chronic lymphocytic leukaemia  ', CAST(828.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1383, N'Subacute lymphoid leukaemia  ', CAST(827.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1382, N'Acute lymphoblastic leukaemia NOS  ', CAST(826.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1381, N'Lymphoid leukaemia NOS  ', CAST(825.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1380, N'Lymphoid leukaemias', CAST(824.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1379, N'Aleukaemic leukaemia NOS  ', CAST(823.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1378, N'Chronic leukaemia NOS  ', CAST(822.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1377, N'Subacute leukaemia NOS  ', CAST(821.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1376, N'Acute leukaemia NOS  ', CAST(820.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1375, N'Leukaemia NOS  ', CAST(819.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1374, N'Leukaemias NOS', CAST(818.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1373, N'Leukaemias', CAST(817.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1372, N'T-gamma lymphoproliferative disease  ', CAST(816.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1371, N'Angioimmunoblastic lymphadenopathy  ', CAST(815.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1370, N'Angiocentric immunoproliferative lesion  ', CAST(814.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1369, N'Monoclonal gammopathy  ', CAST(813.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1368, N'Immunoproliferative small intestinal disease  ', CAST(812.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1367, N'Gamma heavy chain disease  ', CAST(811.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1366, N'Alpha heavy chain disease  ', CAST(810.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1365, N'Waldenstrsms macroglobulinaemia  ', CAST(809.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1364, N'Immunoproliferative disease NOS  ', CAST(808.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1363, N'Immunoproliferative diseases', CAST(807.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1362, N'Malignant mastocytosis  ', CAST(806.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1361, N'Mast cell sarcoma  ', CAST(805.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1360, N'Mastocytoma NOS  ', CAST(804.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1359, N'Mast cell tumours', CAST(803.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1358, N'Multiple myeloma  ', CAST(802.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1357, N'Plasmacytoma NOS  ', CAST(801.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1356, N'Plasma cell tumours', CAST(800.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1355, N'True histiocytic lymphoma  ', CAST(799.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1354, N'Letterer-Siwe disease  ', CAST(798.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1353, N'Malignant histiocytosis  ', CAST(797.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1352, N'Other lymphoreticular neoplasms', CAST(796.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1351, N'Large cell  (Ki-1+) lymphoma', CAST(795.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1350, N'Angiocentric T-cell lymphoma  ', CAST(794.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1349, N'Angioendotheliomatosis  ', CAST(793.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1348, N'Monocytoid B-cell lymphoma  ', CAST(792.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1347, N'Other specified non-Hodgkins lymphomas', CAST(791.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1346, N'Cutaneous lymphoma  ', CAST(790.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1344, N'Peripheral T-cell lymphoma, pleomorphic small cell', CAST(788.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1342, N'Lymphoepithelioid lymphoma  ', CAST(786.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1341, N'T-zone lymphoma  ', CAST(785.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1340, N'Peripheral T-cell lymphoma NOS  ', CAST(784.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1339, N'SZzarys disease  ', CAST(783.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1338, N'Mycosis fungoides  ', CAST(782.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1336, N'Malignant lymphoma, large cell, follicular NOS  ', CAST(780.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1335, N'Malignant lymphoma, centroblastic, follicular  ', CAST(779.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1333, N'Malignant lymphoma, small cleaved cell, follicular', CAST(777.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1328, N'Malignant lymphoma, follicular NOS  ', CAST(772.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1326, N'Burkitts lymphoma NOS  ', CAST(770.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1324, N'Malignant lymphoma, lymphoblastic  ', CAST(768.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1323, N'Malignant lymphoma, immunoblastic NOS  ', CAST(767.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1322, N'Malignant lymphoma, centroblastic, diffuse  ', CAST(766.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1320, N'Malignant lymphoma, large cell, cleaved, diffuse  ', CAST(764.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1319, N'Malignant lymphoma, large cell, diffuse NOS  ', CAST(763.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1318, N'Malignant lymphomatous polyposis  ', CAST(762.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1315, N'Malignant lymphoma, centrocytic  ', CAST(759.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1313, N'Malignant lymphoma, small cleaved cell, diffuse  ', CAST(757.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1312, N'Malignant lymphoma, lymphoplasmacytic  ', CAST(756.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1311, N'Malignant lymphoma, small lymphocytic NOS  ', CAST(755.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1310, N'Malignant lymphoma, diffuse or NOS, specified type', CAST(754.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1305, N'Hodgkins disease, nodular sclerosis NOS  ', CAST(749.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1304, N'Hodgkins sarcoma  ', CAST(748.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1303, N'Hodgkins granuloma  ', CAST(747.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1302, N'Hodgkins paragranuloma NOS  ', CAST(746.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1299, N'Hodgkins disease, lymphocytic predominance NOS  ', CAST(743.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1298, N'Hodgkins disease, lymphocytic depletion, reticular', CAST(742.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1296, N'Hodgkins disease, lymphocytic depletion NOS  ', CAST(740.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1295, N'Hodgkins disease, mixed cellularity NOS  ', CAST(739.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1294, N'Hodgkins disease NOS  ', CAST(738.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1293, N'Hodgkins disease', CAST(737.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1292, N'Malignant lymphoma, diffuse NOS  ', CAST(736.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1291, N'Microglioma  ', CAST(735.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1290, N'Reticulosarcoma NOS  ', CAST(734.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1289, N'Lymphosarcoma NOS  ', CAST(733.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1288, N'Malignant lymphoma, non-Hodgkins NOS  ', CAST(732.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1287, N'Malignant lymphoma NOS  ', CAST(731.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1286, N'Malignant lymphomas NOS or diffuse', CAST(730.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1285, N'Hodgkins and non-Hodgkins lymphoma', CAST(729.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1284, N'Alveolar soft part sarcoma', CAST(728.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1283, N'Granular cell tumour, malignant', CAST(727.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1282, N'Granular cell tumour NOS', CAST(726.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1280, N'Neuroma NOS', CAST(724.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1279, N'Neurothekeoma', CAST(723.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1278, N'Triton tumour, malignant', CAST(722.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1277, N'Neurilemmoma, malignant', CAST(721.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1276, N'Neurinomatosis', CAST(720.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1275, N'Neurilemmoma NOS', CAST(719.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1274, N'Plexiform neurofibroma', CAST(718.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1273, N'Melanotic neurofibroma', CAST(717.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1272, N'Neurofibrosarcoma', CAST(716.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1271, N'Neurofibromatosis NOS  ', CAST(715.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1270, N'Neurofibroma NOS', CAST(714.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1269, N'Nerve sheath tumours', CAST(713.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1268, N'Meningeal sarcomatosis  ', CAST(712.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1267, N'Papillary meningioma  ', CAST(711.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1266, N'Transitional meningioma  ', CAST(710.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1265, N'Haemangiopericytic meningioma  ', CAST(709.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1264, N'Haemangioblastic meningioma  ', CAST(708.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1263, N'Angiomatous meningioma  ', CAST(707.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1262, N'Psammomatous meningioma  ', CAST(706.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1261, N'Fibrous meningioma  ', CAST(705.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1260, N'Meningotheliomatous meningioma  ', CAST(704.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1259, N'Meningioma, malignant  ', CAST(703.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1258, N'Meningiomatosis NOS  ', CAST(702.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1257, N'Meningioma NOS  ', CAST(701.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1256, N'Meningiomas', CAST(700.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1255, N'Esthesioneuroepithelioma  ', CAST(699.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1254, N'Esthesioneuroblastoma  ', CAST(698.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1253, N'Esthesioneurocytoma  ', CAST(697.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1252, N'Olfactory neurogenic tumour', CAST(696.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1251, N'Retinoblastoma, undifferentiated  ', CAST(695.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1250, N'Retinoblastoma, differentiated  ', CAST(694.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1249, N'Retinoblastoma NOS  ', CAST(693.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1248, N'Pacinian tumour', CAST(692.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1247, N'Neurocytoma', CAST(691.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1246, N'Ganglioglioma', CAST(690.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1245, N'Spongioneuroblastoma', CAST(689.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1244, N'Neuroepithelioma NOS', CAST(688.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1243, N'Teratoid medulloepithelioma', CAST(687.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1242, N'Medulloepithelioma NOS', CAST(686.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1241, N'Neuroblastoma NOS', CAST(685.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1240, N'Ganglioneuromatosis', CAST(684.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1239, N'Ganglioneuroblastoma', CAST(683.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1238, N'Ganglioneuroma', CAST(682.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1237, N'Neuroepitheliomatous neoplasms', CAST(681.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1236, N'Monstrocellular sarcoma  ', CAST(680.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1235, N'Cerebellar sarcoma NOS  ', CAST(679.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1234, N'Primitive neuroectodermal tumour  ', CAST(678.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1233, N'Medullomyoblastoma  ', CAST(677.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1232, N'Desmoplastic medulloblastoma  ', CAST(676.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1231, N'Medulloblastoma NOS  ', CAST(675.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1230, N'Oligodendroblastoma  ', CAST(674.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1229, N'Oligodendroglioma, anaplastic  ', CAST(673.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1228, N'Oligodendroglioma NOS  ', CAST(672.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1227, N'Primitive polar spongioblastoma  ', CAST(671.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1226, N'Gliosarcoma  ', CAST(670.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1225, N'Giant cell glioblastoma  ', CAST(669.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1224, N'Glioblastoma NOS  ', CAST(668.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1223, N'Astroblastoma  ', CAST(667.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1222, N'Pleomorphic xanthoastrocytoma  ', CAST(666.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1221, N'Spongioblastoma polare  ', CAST(665.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1220, N'Spongioblastoma NOS  ', CAST(664.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1219, N'Pilocytic astrocytoma  ', CAST(663.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1218, N'Fibrillary astrocytoma  ', CAST(662.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1217, N'Gemistocytic astrocytoma  ', CAST(661.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1216, N'Protoplasmic astrocytoma  ', CAST(660.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1215, N'Astrocytoma, anaplastic  ', CAST(659.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1214, N'Astrocytoma NOS  ', CAST(658.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1213, N'Myxopapillary ependymoma  ', CAST(657.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1212, N'Papillary ependymoma  ', CAST(656.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1211, N'Ependymoma, anaplastic  ', CAST(655.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1210, N'Ependymoma NOS  ', CAST(654.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1209, N'Choroid plexus papilloma, malignant  ', CAST(653.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1208, N'Choroid plexus papilloma NOS  ', CAST(652.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1207, N'Subependymal giant cell astrocytoma  ', CAST(651.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1206, N'Subependymal glioma  ', CAST(650.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1205, N'Mixed glioma  ', CAST(649.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1204, N'Gliomatosis cerebri  ', CAST(648.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1203, N'Glioma, malignant  ', CAST(647.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1202, N'Gliomas', CAST(646.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1201, N'Chordoma', CAST(645.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1200, N'Peripheral neuroectodermal tumour', CAST(644.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1199, N'Melanotic neuroectodermal tumour', CAST(643.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1198, N'Pineoblastoma  ', CAST(642.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1197, N'Pineocytoma  ', CAST(641.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1196, N'Pinealoma  ', CAST(640.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1195, N'Craniopharyngioma  ', CAST(639.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1194, N'Miscellaneous tumours', CAST(638.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1193, N'Calcifying epithelial odontogenic tumour  ', CAST(637.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1192, N'Ameloblastic fibrosarcoma  ', CAST(636.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1191, N'Ameloblastic fibroma  ', CAST(635.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1190, N'Peripheral odontogenic fibroma  ', CAST(634.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1189, N'Central odontogenic fibroma  ', CAST(633.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1188, N'Odontogenic myxoma  ', CAST(632.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1187, N'Squamous odontogenic tumour  ', CAST(631.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1186, N'Odontoameloblastoma  ', CAST(630.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1185, N'Ameloblastoma, malignant  ', CAST(629.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1184, N'Ameloblastoma NOS  ', CAST(628.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1183, N'Odontogenic ghost cell tumour  ', CAST(627.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1182, N'Calcifying odontogenic cyst  ', CAST(626.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1181, N'Adenomatoid odontogenic tumour  ', CAST(625.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1180, N'Ameloblastic odontosarcoma  ', CAST(624.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1179, N'Ameloblastic fibro-odontoma  ', CAST(623.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1178, N'Complex odontoma  ', CAST(622.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1177, N'Compound odontoma  ', CAST(621.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1176, N'Odontoma NOS  ', CAST(620.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1175, N'Gigantiform cementoma  ', CAST(619.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1174, N'Cementifying fibroma  ', CAST(618.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1173, N'Cementoblastoma, benign  ', CAST(617.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1172, N'Cementoma NOS  ', CAST(616.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1171, N'Dentinoma  ', CAST(615.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1170, N'Odontogenic tumour, malignant  ', CAST(614.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1169, N'Odontogenic tumour NOS  ', CAST(613.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1168, N'Odontogenic tumour, benign  ', CAST(612.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1167, N'Odontogenic tumours', CAST(611.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1166, N'Ossifying fibroma  ', CAST(610.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1165, N'Adamantinoma of long bones  ', CAST(609.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1164, N'Ewings sarcoma  ', CAST(608.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1163, N'Miscellaneous bone tumours', CAST(607.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1162, N'Malignant giant cell tumour of soft parts', CAST(606.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1161, N'Giant cell tumour of soft parts NOS', CAST(605.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1160, N'Giant cell tumour of bone, malignant  ', CAST(604.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1159, N'Giant cell tumour of bone NOS  ', CAST(603.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1158, N'Giant cell tumours', CAST(602.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1157, N'Chondromyxoid fibroma  ', CAST(601.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1156, N'Mesenchymal chondrosarcoma', CAST(600.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1155, N'Myxoid chondrosarcoma', CAST(599.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1154, N'Chondroblastoma, malignant  ', CAST(598.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1153, N'Chondroblastoma NOS  ', CAST(597.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1152, N'Juxtacortical chondrosarcoma  ', CAST(596.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1151, N'Juxtacortical chondroma  ', CAST(595.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1150, N'Chondrosarcoma NOS  ', CAST(594.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1149, N'Chondromatosis NOS', CAST(593.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1148, N'Chondroma NOS  ', CAST(592.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1147, N'Osteochondromatosis NOS  ', CAST(591.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1146, N'Osteochondroma  ', CAST(590.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1145, N'Aggressive osteoblastoma  ', CAST(589.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1144, N'Osteoblastoma NOS  ', CAST(588.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1143, N'Osteoid osteoma NOS  ', CAST(587.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1142, N'Juxtacortical osteosarcoma  ', CAST(586.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1141, N'Small cell osteosarcoma  ', CAST(585.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1140, N'Osteosarcoma in Pagets disease of bone  ', CAST(584.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1139, N'Telangiectatic osteosarcoma  ', CAST(583.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1138, N'Fibroblastic osteosarcoma  ', CAST(582.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1137, N'Chondroblastic osteosarcoma  ', CAST(581.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1136, N'Osteosarcoma NOS  ', CAST(580.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1135, N'Osteoma NOS  ', CAST(579.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1134, N'Osseous and chondromatous neoplasms', CAST(578.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1133, N'Haemolymphangioma  ', CAST(577.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1132, N'Lymphangiomyomatosis', CAST(576.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1131, N'Lymphangiomyoma  ', CAST(575.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1130, N'Cystic lymphangioma  ', CAST(574.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1129, N'Cavernous lymphangioma  ', CAST(573.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1128, N'Capillary lymphangioma  ', CAST(572.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1127, N'Lymphangiosarcoma', CAST(571.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1126, N'Lymphangioma NOS  ', CAST(570.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1125, N'Lymphatic vessel tumours', CAST(569.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1124, N'Haemangioblastoma', CAST(568.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1123, N'Angiofibroma NOS ', CAST(567.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1122, N'Haemangiopericytoma, malignant', CAST(566.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1121, N'Haemangiopericytoma NOS', CAST(565.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1120, N'Haemangiopericytoma, benign ', CAST(564.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1119, N'Verrucous keratotic haemangioma  ', CAST(563.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1118, N'Angiokeratoma ', CAST(562.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1117, N'Kaposis sarcoma  ', CAST(561.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1116, N'Intravascular bronchial alveolar tumour  ', CAST(560.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1115, N'Epithelioid haemangioendothelioma, malignant', CAST(559.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1114, N'Epithelioid haemangioendothelioma NOS', CAST(558.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1113, N'Intramuscular haemangioma  ', CAST(557.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1112, N'Capillary haemangioma  ', CAST(556.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1111, N'Haemangioendothelioma, malignant', CAST(555.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1110, N'Haemangioendothelioma NOS', CAST(554.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1109, N'Haemangioendothelioma, benign  ', CAST(553.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1108, N'Histiocytoid haemangioma  ', CAST(552.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1107, N'Epithelioid haemangioma  ', CAST(551.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1106, N'Kupffer cell sarcoma  ', CAST(550.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1105, N'Racemose haemangioma  ', CAST(549.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1104, N'Venous haemangioma  ', CAST(548.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1103, N'Cavernous haemangioma  ', CAST(547.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1102, N'Haemangiosarcoma', CAST(546.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1101, N'Haemangioma NOS  ', CAST(545.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1100, N'Blood vessel tumours', CAST(544.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1099, N'Mesonephroma, malignant', CAST(543.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1098, N'Mesonephric tumour', CAST(542.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1097, N'Mesonephroma, benign', CAST(541.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1096, N'Mesonephromas', CAST(540.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1095, N'Placental site trophoblastic tumour  ', CAST(539.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1094, N'Partial hydatidiform mole  ', CAST(538.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1093, N'Malignant teratoma, trophoblastic  ', CAST(537.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1091, N'Choriocarcinoma NOS', CAST(535.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1090, N'Invasive hydatidiform mole  ', CAST(534.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1089, N'Hydatidiform mole NOS  ', CAST(533.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1088, N'Trophoblastic neoplasms', CAST(532.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1087, N'Strumal carcinoid  ', CAST(531.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1086, N'Struma ovarii, malignant  ', CAST(530.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1085, N'Struma ovarii NOS  ', CAST(529.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1084, N'Mixed germ cell tumour', CAST(528.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1083, N'Teratoma with malignant transformation', CAST(527.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1082, N'Dermoid cyst NOS', CAST(526.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1081, N'Malignant teratoma, intermediate', CAST(525.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1080, N'Malignant teratoma, undifferentiated', CAST(524.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1079, N'Teratocarcinoma', CAST(523.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1078, N'Teratoma, malignant NOS', CAST(522.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1077, N'Teratoma NOS', CAST(521.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1076, N'Teratoma, benign', CAST(520.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1075, N'Gonadoblastoma', CAST(519.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1074, N'Polyembryoma', CAST(518.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1073, N'Endodermal sinus tumour', CAST(517.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1072, N'Embryonal carcinoma NOS', CAST(516.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1071, N'Germinoma', CAST(515.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1070, N'Spermatocytic seminoma  ', CAST(514.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1069, N'Seminoma, anaplastic  ', CAST(513.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1068, N'Seminoma NOS  ', CAST(512.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1067, N'Dysgerminoma', CAST(511.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1066, N'Germ cell neoplasms', CAST(510.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1065, N'Cystic mesothelioma', CAST(509.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1064, N'Adenomatoid tumour NOS  ', CAST(508.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1063, N'Mesothelioma, biphasic, malignant  ', CAST(507.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1062, N'Mesothelioma, biphasic, benign  ', CAST(506.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1061, N'Epithelioid mesothelioma, malignant  ', CAST(505.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1060, N'Epithelioid mesothelioma, benign  ', CAST(504.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1059, N'Fibrous mesothelioma, malignant  ', CAST(503.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1058, N'Fibrous mesothelioma, benign  ', CAST(502.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1057, N'Mesothelioma, malignant  ', CAST(501.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1056, N'Mesothelioma, benign  ', CAST(500.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1055, N'Mesothelial neoplasms', CAST(499.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1054, N'Clear cell sarcoma  ', CAST(498.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1053, N'Synovial sarcoma, biphasic', CAST(497.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1052, N'Synovial sarcoma, epithelioid cell', CAST(496.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1051, N'Synovial sarcoma, spindle cell', CAST(495.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1050, N'Synovial sarcoma NOS', CAST(494.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1049, N'Synovioma, benign', CAST(493.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1048, N'Synovial-like neoplasms', CAST(492.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1047, N'Juvenile fibroadenoma  ', CAST(491.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1046, N'Phyllodes tumour, malignant  ', CAST(490.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1045, N'Phyllodes tumour NOS  ', CAST(489.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1044, N'Phyllodes tumour, benign  ', CAST(488.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1043, N'Giant fibroadenoma  ', CAST(487.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1042, N'Mucinous adenofibroma  ', CAST(486.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1041, N'Serous adenofibroma  ', CAST(485.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1040, N'Adenofibroma NOS  ', CAST(484.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1039, N'Pericanalicular fibroadenoma  ', CAST(483.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1038, N'Intracanalicular fibroadenoma  ', CAST(482.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1037, N'Fibroadenoma NOS  ', CAST(481.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1036, N'Brenner tumour, malignant  ', CAST(480.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1035, N'Brenner tumour, borderline malignancy  ', CAST(479.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1034, N'Brenner tumour NOS  ', CAST(478.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1033, N'Fibroepithelial neoplasms', CAST(477.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1032, N'Embryonal sarcoma', CAST(476.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1031, N'Mesenchymoma, malignant', CAST(475.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1030, N'Mesenchymoma NOS', CAST(474.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1029, N'Mesenchymoma, benign', CAST(473.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1028, N'Myoepithelioma', CAST(472.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1027, N'Carcinosarcoma, embryonal', CAST(471.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1026, N'Carcinosarcoma NOS', CAST(470.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1025, N'Pulmonary blastoma  ', CAST(469.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1024, N'Pancreatoblastoma  ', CAST(468.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1023, N'Hepatoblastoma  ', CAST(467.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1022, N'Clear cell sarcoma of kidney  ', CAST(466.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1021, N'Rhabdoid sarcoma', CAST(465.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1020, N'Nephroblastoma NOS  ', CAST(464.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1019, N'Mesoblastic nephroma', CAST(463.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1018, N'Mesodermal mixed tumour', CAST(462.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1017, N'MŸllerian mixed tumour  ', CAST(461.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1016, N'Carcinoma in pleomorphic adenoma  ', CAST(460.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1015, N'Mixed tumour, malignant NOS', CAST(459.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1014, N'Pleomorphic adenoma', CAST(458.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1013, N'Adenosarcoma', CAST(457.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1012, N'Adenomyoma', CAST(456.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1011, N'Endolymphatic stromal myosis  ', CAST(455.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1010, N'Endometrial stromal sarcoma  ', CAST(454.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1009, N'Endometrial stromal nodule  ', CAST(453.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1008, N'Complex mixed and stromal neoplasms', CAST(452.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1007, N'Alveolar rhabdomyosarcoma', CAST(451.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1006, N'Embryonal rhabdomyosarcoma', CAST(450.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1005, N'Adult rhabdomyoma', CAST(449.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1004, N'Fetal rhabdomyoma', CAST(448.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1003, N'Mixed type rhabdomyosarcoma', CAST(447.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1002, N'Pleomorphic rhabdomyosarcoma', CAST(446.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1001, N'Rhabdomyosarcoma NOS', CAST(445.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 1000, N'Rhabdomyoma NOS', CAST(444.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 999, N'Smooth muscle tumour NOS', CAST(443.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 998, N'Myxoid leiomyosarcoma', CAST(442.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 997, N'Myosarcoma', CAST(441.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 996, N'Myoma', CAST(440.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 995, N'Angiomyosarcoma', CAST(439.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 994, N'Angiomyoma', CAST(438.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 993, N'Bizarre leiomyoma', CAST(437.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 992, N'Cellular leiomyoma', CAST(436.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 991, N'Epithelioid leiomyosarcoma', CAST(435.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 990, N'Epithelioid leiomyoma', CAST(434.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 989, N'Leiomyosarcoma NOS', CAST(433.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 988, N'Leiomyomatosis NOS', CAST(432.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 987, N'Leiomyoma NOS', CAST(431.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 986, N'Myomatous neoplasms', CAST(430.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 985, N'Lipoblastomatosis  ', CAST(429.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 984, N'Hibernoma  ', CAST(428.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 983, N'Myelolipoma  ', CAST(427.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 982, N'Angiolipoma NOS  ', CAST(426.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 981, N'Angiomyolipoma  ', CAST(425.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 980, N'Dedifferentiated liposarcoma', CAST(424.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 979, N'Spindle cell lipoma  ', CAST(423.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 978, N'Intramuscular lipoma  ', CAST(422.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 977, N'Mixed liposarcoma', CAST(421.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 976, N'Pleomorphic liposarcoma', CAST(420.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 975, N'Pleomorphic lipoma  ', CAST(419.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 974, N'Round cell liposarcoma', CAST(418.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 973, N'Myxoid liposarcoma', CAST(417.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 972, N'Fibromyxolipoma  ', CAST(416.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 971, N'Liposarcoma, well differentiated', CAST(415.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 970, N'Fibrolipoma  ', CAST(414.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 969, N'Liposarcoma NOS', CAST(413.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 968, N'Lipoma NOS  ', CAST(412.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 967, N'Lipomatous neoplasms', CAST(411.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 966, N'Angiomyxoma', CAST(410.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 965, N'Myxosarcoma', CAST(409.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 964, N'Myxoma NOS', CAST(408.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 963, N'Myxomatous neoplasms', CAST(407.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 962, N'Pigmented dermatofibrosarcoma protuberans', CAST(406.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 961, N'Dermatofibrosarcoma NOS  ', CAST(405.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 960, N'Dermatofibroma NOS  ', CAST(404.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 959, N'Fibrous histiocytoma, malignant', CAST(403.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 958, N'Atypical fibrous histiocytoma', CAST(402.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 957, N'Fibrous histiocytoma NOS', CAST(401.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 956, N'Myofibromatosis', CAST(400.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 955, N'Desmoplastic fibroma', CAST(399.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 954, N'Abdominal fibromatosis', CAST(398.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 953, N'Aggressive fibromatosis', CAST(397.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 952, N'Elastofibroma', CAST(396.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 951, N'Infantile fibrosarcoma', CAST(395.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 950, N'Fascial fibrosarcoma', CAST(394.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 949, N'Fascial fibroma', CAST(393.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 948, N'Periosteal fibrosarcoma  ', CAST(392.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 947, N'Periosteal fibroma  ', CAST(391.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 946, N'Fibromyxosarcoma', CAST(390.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 945, N'Fibromyxoma', CAST(389.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 944, N'Fibrosarcoma NOS', CAST(388.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 943, N'Fibroma NOS', CAST(387.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 942, N'Fibromatous neoplasms', CAST(386.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 941, N'Epithelioid sarcoma', CAST(385.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 940, N'Small cell sarcoma', CAST(384.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 939, N'Giant cell sarcoma  ', CAST(383.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 938, N'Spindle cell sarcoma', CAST(382.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 937, N'Sarcomatosis NOS', CAST(381.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 936, N'Sarcoma NOS', CAST(380.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 935, N'Soft tissue tumour, benign', CAST(379.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 934, N'Soft tissue tumours and sarcomas NOS', CAST(378.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 933, N'Cellular blue naevus  ', CAST(377.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 932, N'Blue naevus, malignant  ', CAST(376.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 931, N'Blue naevus NOS  ', CAST(375.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 930, N'Spindle cell melanoma, type B  ', CAST(374.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 929, N'Spindle cell melanoma, type A  ', CAST(373.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 928, N'Spindle cell melanoma NOS', CAST(372.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 927, N'Spindle cell naevus  ', CAST(371.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 926, N'Epithelioid cell melanoma', CAST(370.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 925, N'Epithelioid cell naevus  ', CAST(369.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 924, N'Mixed epithelioid and spindle cell melanoma', CAST(368.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 923, N'Epithelioid and spindle cell naevus  ', CAST(367.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 922, N'Malignant melanoma in giant pigmented naevus  ', CAST(366.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 921, N'Giant pigmented naevus NOS  ', CAST(365.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 920, N'Compound naevus  ', CAST(364.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 919, N'Intradermal naevus  ', CAST(363.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 918, N'Desmoplastic melanoma, malignant  ', CAST(362.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 917, N'Acral lentiginous melanoma, malignant  ', CAST(361.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 916, N'Superficial spreading melanoma  ', CAST(360.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 914, N'Hutchinsons melanotic freckle NOS  ', CAST(358.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 913, N'Malignant melanoma in precancerous melanosis  ', CAST(357.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 912, N'Precancerous melanosis NOS  ', CAST(356.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 911, N'Malignant melanoma in junctional naevus  ', CAST(355.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 910, N'Junctional naevus NOS  ', CAST(354.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 909, N'Amelanotic melanoma  ', CAST(353.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 908, N'Nonpigmented naevus  ', CAST(352.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 907, N'Dysplastic naevus  ', CAST(351.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 906, N'Magnocellular naevus  ', CAST(350.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 905, N'Neuronaevus  ', CAST(349.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 904, N'Fibrous papule of nose  ', CAST(348.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 903, N'Malignant melanoma, regressing  ', CAST(347.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 902, N'Halo naevus  ', CAST(346.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 901, N'Balloon cell melanoma  ', CAST(345.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 900, N'Balloon cell naevus  ', CAST(344.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 899, N'Nodular melanoma  ', CAST(343.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 898, N'Malignant melanoma NOS', CAST(342.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 897, N'Melanoma in situ  ', CAST(341.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 896, N'Pigmented naevus NOS  ', CAST(340.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 895, N'Naevi and melanomas', CAST(339.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 894, N'Glomangiomyoma', CAST(338.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 893, N'Glomangioma', CAST(337.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 892, N'Glomus tumour', CAST(336.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 891, N'Glomangiosarcoma', CAST(335.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 890, N'Phaeochromocytoma, malignant  ', CAST(334.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 889, N'Phaeochromocytoma NOS  ', CAST(333.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 888, N'Extra-adrenal paraganglioma, malignant', CAST(332.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 887, N'Extra-adrenal paraganglioma NOS', CAST(331.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 886, N'Carotid body tumour  ', CAST(330.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 885, N'Aortic body tumour  ', CAST(329.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 884, N'Glomus jugulare tumour  ', CAST(328.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 883, N'Gangliocytic paraganglioma  ', CAST(327.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 882, N'Parasympathetic paraganglioma', CAST(326.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 881, N'Sympathetic paraganglioma', CAST(325.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 880, N'Paraganglioma, malignant', CAST(324.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 879, N'Paraganglioma NOS', CAST(323.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 878, N'Paragangliomas and glomus tumours', CAST(322.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 877, N'Adrenal rest tumour', CAST(321.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 876, N'Lipid cell tumour of ovary  ', CAST(320.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 875, N'Hilus cell tumour  ', CAST(319.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 874, N'Leydig cell tumour, malignant  ', CAST(318.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 873, N'Leydig cell tumour NOS  ', CAST(317.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 872, N'Leydig cell tumour, benign  ', CAST(316.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 871, N'Sertoli cell tumour with lipid storage  ', CAST(315.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 870, N'Sertoli cell carcinoma  ', CAST(314.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 869, N'Sertoli cell tumour NOS', CAST(313.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 868, N'Gynandroblastoma  ', CAST(312.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 867, N'Sertoli-Leydig cell tumour', CAST(311.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 866, N'Androblastoma, malignant', CAST(310.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 865, N'Androblastoma NOS', CAST(309.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 864, N'Androblastoma, benign', CAST(308.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 863, N'Sex cord tumour with annular tubules  ', CAST(307.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 862, N'Juvenile granulosa cell tumour  ', CAST(306.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 861, N'Granulosa cell-theca cell tumour  ', CAST(305.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 860, N'Granulosa cell tumour, malignant  ', CAST(304.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 859, N'Granulosa cell tumour NOS  ', CAST(303.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 858, N'Luteoma NOS  ', CAST(302.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 857, N'Sclerosing stromal tumour  ', CAST(301.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 856, N'Thecoma, luteinized  ', CAST(300.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 855, N'Thecoma, malignant  ', CAST(299.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 854, N'Thecoma NOS  ', CAST(298.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 853, N'Sex cord-stromal tumour', CAST(297.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 852, N'Specialized gonadal neoplasms', CAST(296.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 851, N'Thymoma, malignant  ', CAST(295.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 850, N'Thymoma, benign  ', CAST(294.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 849, N'Adenocarcinoma with apocrine metaplasia', CAST(293.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 848, N'Adenocarcinoma with spindle cell metaplasia', CAST(292.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 846, N'Adenocarcinoma with squamous metaplasia', CAST(290.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 845, N'Epithelial-myoepithelial carcinoma', CAST(289.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 844, N'Adenolymphoma  ', CAST(288.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 843, N'Adenosquamous carcinoma', CAST(287.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 842, N'Complex epithelial neoplasms', CAST(286.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 841, N'Acinar cell carcinoma', CAST(285.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 840, N'Acinar cell tumour', CAST(284.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 839, N'Acinar cell adenoma', CAST(283.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 838, N'Acinar cell neoplasms', CAST(282.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 837, N'Pagets disease and intraductal carcinoma of breast', CAST(281.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 836, N'Pagets disease, extramammary  ', CAST(280.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 834, N'Pagets disease, mammary  ', CAST(278.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 833, N'Inflammatory carcinoma  ', CAST(277.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 832, N'Infiltrating duct and lobular carcinoma  ', CAST(276.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 830, N'Infiltrating ductular carcinoma  ', CAST(274.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 829, N'Lobular carcinoma NOS  ', CAST(273.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 828, N'Lobular carcinoma in situ  ', CAST(272.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 827, N'Medullary carcinoma with lymphoid stroma  ', CAST(271.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 826, N'Medullary carcinoma with amyloid stroma  ', CAST(270.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 825, N'Medullary carcinoma NOS', CAST(269.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 824, N'Adenoma of nipple  ', CAST(268.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 823, N'Intraductal papillomatosis NOS', CAST(267.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 822, N'Intracystic carcinoma NOS', CAST(266.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 821, N'Noninfiltrating intracystic carcinoma', CAST(265.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 820, N'Intracystic papillary adenoma', CAST(264.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 819, N'Intraductal papillary adenocarcinoma with invasion', CAST(263.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 817, N'Intraductal papilloma', CAST(261.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 816, N'Juvenile carcinoma of breast  ', CAST(260.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 815, N'Comedocarcinoma NOS  ', CAST(259.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 814, N'Comedocarcinoma, noninfiltrating  ', CAST(258.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 813, N'Infiltrating duct carcinoma  ', CAST(257.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 812, N'Intraductal carcinoma, noninfiltrating NOS', CAST(256.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 811, N'Ductal, lobular and medullary neoplasms', CAST(255.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 810, N'Metastatic signet ring cell carcinoma', CAST(254.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 809, N'Signet ring cell carcinoma', CAST(253.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 808, N'Mucin-producing adenocarcinoma', CAST(252.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 807, N'Pseudomyxoma peritonei  ', CAST(251.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 806, N'Mucinous adenocarcinoma', CAST(250.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 805, N'Mucinous adenoma', CAST(249.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 803, N'Mucinous cystadenoma, borderline malignancy  ', CAST(247.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 802, N'Papillary mucinous cystadenocarcinoma  ', CAST(246.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 801, N'Papillary mucinous cystadenoma NOS  ', CAST(245.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 800, N'Mucinous cystadenocarcinoma NOS  ', CAST(244.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 799, N'Mucinous cystadenoma NOS  ', CAST(243.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 797, N'Serous surface papillary carcinoma  ', CAST(241.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 796, N'Serous surface papilloma  ', CAST(240.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 795, N'Papillary serous cystadenocarcinoma  ', CAST(239.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 794, N'Papillary serous cystadenoma NOS  ', CAST(238.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 793, N'Papillary cystic tumour  ', CAST(237.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 792, N'Papillary cystadenoma, borderline malignancy  ', CAST(236.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 791, N'Papillary cystadenocarcinoma NOS  ', CAST(235.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 790, N'Papillary cystadenoma NOS  ', CAST(234.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 789, N'Serous cystadenoma, borderline malignancy  ', CAST(233.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 788, N'Serous cystadenocarcinoma NOS  ', CAST(232.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 787, N'Serous cystadenoma NOS  ', CAST(231.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 786, N'Cystadenocarcinoma NOS', CAST(230.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 785, N'Cystadenoma NOS', CAST(229.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 784, N'Cystic, mucinous and serous neoplasms', CAST(228.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 783, N'Mucoepidermoid carcinoma', CAST(227.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 782, N'Mucoepidermoid tumour', CAST(226.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 781, N'Mucoepidermoid neoplasms', CAST(225.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 780, N'Ceruminous adenocarcinoma  ', CAST(224.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 779, N'Ceruminous adenoma  ', CAST(223.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 778, N'Sebaceous adenocarcinoma  ', CAST(222.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 777, N'Sebaceous adenoma  ', CAST(221.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 776, N'Eccrine papillary adenoma  ', CAST(220.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 775, N'Syringoma NOS  ', CAST(219.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 774, N'Papillary syringadenoma  ', CAST(218.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 773, N'Papillary hidradenoma  ', CAST(217.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 772, N'Hidrocystoma  ', CAST(216.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 771, N'Eccrine spiradenoma  ', CAST(215.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 770, N'Eccrine acrospiroma  ', CAST(214.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 769, N'Apocrine adenocarcinoma', CAST(213.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 768, N'Apocrine adenoma', CAST(212.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 767, N'Sweat gland adenocarcinoma  ', CAST(211.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 766, N'Sweat gland tumour NOS  ', CAST(210.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 765, N'Sweat gland adenoma  ', CAST(209.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 764, N'Skin appendage carcinoma  ', CAST(208.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 763, N'Skin appendage adenoma  ', CAST(207.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 762, N'Adnexal and skin appendage neoplasms', CAST(206.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 761, N'Endometrioid adenofibroma, malignant  ', CAST(205.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 760, N'Endometrioid adenofibroma, borderline malignancy  ', CAST(204.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 759, N'Endometrioid adenofibroma NOS  ', CAST(203.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 758, N'Endometrioid carcinoma  ', CAST(202.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 757, N'Endometrioid adenoma, borderline malignancy  ', CAST(201.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 756, N'Endometrioid adenoma NOS  ', CAST(200.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 755, N'Adrenal cortical adenoma, mixed cell  ', CAST(199.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 754, N'Adrenal cortical adenoma, glomerulosa cell  ', CAST(198.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 753, N'Adrenal cortical adenoma, clear cell  ', CAST(197.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 751, N'Adrenal cortical adenoma, compact cell  ', CAST(195.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 750, N'Adrenal cortical carcinoma  ', CAST(194.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 749, N'Adrenal cortical adenoma NOS  ', CAST(193.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 748, N'Juxtaglomerular tumour  ', CAST(192.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 747, N'Multiple endocrine adenomas', CAST(191.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 746, N'Nonencapsulated sclerosing carcinoma  ', CAST(190.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 745, N'Papillary carcinoma, follicular variant  ', CAST(189.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 744, N'Macrofollicular adenoma  ', CAST(188.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 743, N'Microfollicular adenoma  ', CAST(187.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 742, N'Follicular adenocarcinoma, trabecular  ', CAST(186.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 741, N'Follicular adenocarcinoma, well differentiated  ', CAST(185.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 740, N'Follicular adenocarcinoma NOS  ', CAST(184.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 739, N'Follicular adenoma  ', CAST(183.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 738, N'Lipoadenoma', CAST(182.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 737, N'Mixed cell adenocarcinoma', CAST(181.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 736, N'Mixed cell adenoma', CAST(180.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 735, N'Water-clear cell adenocarcinoma  ', CAST(179.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 734, N'Water-clear cell adenoma  ', CAST(178.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 733, N'Chief cell adenoma  ', CAST(177.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 732, N'Granular cell carcinoma', CAST(176.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 731, N'Glycogen-rich carcinoma  ', CAST(175.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 730, N'Lipid-rich carcinoma  ', CAST(174.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 729, N'Clear cell adenofibroma', CAST(173.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 728, N'Renal cell carcinoma  ', CAST(172.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 727, N'Hypernephroid tumour', CAST(171.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 726, N'Clear cell adenocarcinoma NOS', CAST(170.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 725, N'Clear cell adenoma', CAST(169.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 724, N'Basophil carcinoma  ', CAST(168.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 723, N'Basophil adenoma  ', CAST(167.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 722, N'Oxyphilic adenocarcinoma', CAST(166.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 721, N'Oxyphilic adenoma', CAST(165.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 720, N'Mixed acidophil-basophil carcinoma  ', CAST(164.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 719, N'Mixed acidophil-basophil adenoma  ', CAST(163.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 718, N'Acidophil carcinoma  ', CAST(162.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 717, N'Acidophil adenoma  ', CAST(161.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 716, N'Prolactinoma  ', CAST(160.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 715, N'Chromophobe carcinoma  ', CAST(159.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 714, N'Chromophobe adenoma  ', CAST(158.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 713, N'Adenocarcinoma in tubulovillous adenoma', CAST(157.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 712, N'Adenocarcinoma in situ in tubulovillous adenoma', CAST(156.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 711, N'Tubulovillous adenoma NOS', CAST(155.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 710, N'Villous adenocarcinoma', CAST(154.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 709, N'Adenocarcinoma in villous adenoma', CAST(153.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 708, N'Adenocarcinoma in situ in villous adenoma', CAST(152.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 707, N'Villous adenoma NOS', CAST(151.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 706, N'Papillary adenocarcinoma NOS', CAST(150.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 705, N'Papillary adenoma NOS', CAST(149.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 704, N'Alveolar adenocarcinoma  ', CAST(148.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 703, N'Alveolar adenoma  ', CAST(147.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 702, N'Bronchiolo-alveolar adenocarcinoma  ', CAST(146.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 701, N'Pulmonary adenomatosis  ', CAST(145.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 700, N'Apudoma', CAST(144.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 699, N'Merkel cell carcinoma  ', CAST(143.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 698, N'Neuroendocrine carcinoma', CAST(142.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 697, N'Adenocarcinoid tumour', CAST(141.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 696, N'Composite carcinoid', CAST(140.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 695, N'Goblet cell carcinoid  ', CAST(139.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 694, N'Carcinoid tumour, argentaffin, malignant', CAST(138.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 693, N'Carcinoid tumour, argentaffin NOS', CAST(137.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 692, N'Carcinoid tumour NOS  ', CAST(136.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 691, N'Carcinoid tumour NOS, of appendix  ', CAST(135.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 690, N'Carcinoma simplex', CAST(134.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 689, N'Solid carcinoma NOS', CAST(133.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 688, N'Adenocarcinoma in multiple adenomatous polyps', CAST(132.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 687, N'Multiple adenomatous polyps', CAST(131.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 686, N'Adenocarcinoma in adenomatous polyposis coli  ', CAST(130.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 685, N'Adenomatous polyposis coli  ', CAST(129.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 684, N'Tubular adenocarcinoma', CAST(128.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 683, N'Tubular adenoma NOS', CAST(127.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 682, N'Adenocarcinoma in adenomatous polyp', CAST(126.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 681, N'Adenocarcinoma in situ in adenomatous polyp', CAST(125.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 680, N'Adenomatous polyp NOS', CAST(124.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 679, N'Microcystic adenoma  ', CAST(123.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 678, N'Cribriform carcinoma', CAST(122.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 677, N'Adenoid cystic carcinoma', CAST(121.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 676, N'Eccrine dermal cylindroma  ', CAST(120.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 675, N'Embryonal adenoma', CAST(119.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 674, N'Trabecular adenocarcinoma', CAST(118.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 673, N'Trabecular adenoma', CAST(117.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 671, N'Hepatocellular carcinoma, fibrolamellar  ', CAST(115.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 670, N'Hepatocellular carcinoma NOS  ', CAST(114.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 669, N'Liver cell adenoma  ', CAST(113.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 668, N'Klatskins tumour  ', CAST(112.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 667, N'Bile duct cystadenocarcinoma', CAST(111.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 666, N'Bile duct cystadenoma', CAST(110.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 665, N'Cholangiocarcinoma  ', CAST(109.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 664, N'Bile duct adenoma  ', CAST(108.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 663, N'Vipoma', CAST(107.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 662, N'Mixed islet cell and exocrine adenocarcinoma  ', CAST(106.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 661, N'Gastrinoma, malignant', CAST(105.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 660, N'Gastrinoma NOS', CAST(104.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 659, N'Glucagonoma, malignant  ', CAST(103.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 658, N'Glucagonoma NOS  ', CAST(102.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 657, N'Insulinoma, malignant  ', CAST(101.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 656, N'Insulinoma NOS  ', CAST(100.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 655, N'Islet cell carcinoma  ', CAST(99.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 654, N'Islet cell adenoma  ', CAST(98.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 653, N'Basal cell adenocarcinoma  ', CAST(97.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 652, N'Basal cell adenoma  ', CAST(96.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 651, N'Monomorphic adenoma', CAST(95.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 650, N'Carcinoma, diffuse type  ', CAST(94.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 649, N'Adenocarcinoma, intestinal type  ', CAST(93.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 648, N'Superficial spreading adenocarcinoma', CAST(92.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 647, N'Linitis plastica  ', CAST(91.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 646, N'Scirrhous adenocarcinoma', CAST(90.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 645, N'Adenocarcinoma, metastatic NOS', CAST(89.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 644, N'Adenocarcinoma NOS', CAST(88.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 643, N'Adenocarcinoma in situ NOS', CAST(87.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 642, N'Bronchial adenoma NOS  ', CAST(86.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 641, N'Adenoma NOS', CAST(85.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 640, N'Adenomas and adenocarcinomas', CAST(84.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 639, N'Papillary transitional cell carcinoma', CAST(83.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 638, N'Cloacogenic carcinoma  ', CAST(82.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 637, N'Basaloid carcinoma  ', CAST(81.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 636, N'Transitional cell carcinoma, spindle cell', CAST(80.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 635, N'Schneiderian carcinoma', CAST(79.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 634, N'Transitional cell papilloma, inverted', CAST(78.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 633, N'Schneiderian papilloma', CAST(77.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 632, N'Transitional cell carcinoma NOS', CAST(76.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 631, N'Transitional cell carcinoma in situ', CAST(75.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 630, N'Urothelial papilloma', CAST(74.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 629, N'Transitional cell papilloma NOS', CAST(73.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 628, N'Transitional cell papillomas and carcinomas', CAST(72.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 627, N'Pilomatrix carcinoma  ', CAST(71.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 626, N'Pilomatrixoma NOS  ', CAST(70.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 625, N'Tricholemmoma  ', CAST(69.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 624, N'Trichofolliculoma  ', CAST(68.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 623, N'Trichoepithelioma  ', CAST(67.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 622, N'Intraepidermal epithelioma of Jadassohn  ', CAST(66.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 621, N'Metatypical carcinoma  ', CAST(65.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 620, N'Basosquamous carcinoma  ', CAST(64.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 619, N'Basal cell carcinoma, fibroepithelial  ', CAST(63.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 618, N'Basal cell carcinoma, morphoea  ', CAST(62.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 617, N'Multicentric basal cell carcinoma  ', CAST(61.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 616, N'Basal cell carcinoma NOS  ', CAST(60.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 615, N'Basal cell tumour  ', CAST(59.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 614, N'Basal cell neoplasms', CAST(58.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 613, N'Lymphoepithelial carcinoma', CAST(57.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 612, N'Bowens disease', CAST(56.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 611, N'Queyrats erythroplasia  ', CAST(55.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 609, N'Squamous cell carcinoma, microinvasive  ', CAST(53.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 607, N'Adenoid squamous cell carcinoma', CAST(51.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 606, N'Squamous cell carcinoma, spindle cell', CAST(50.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 603, N'Squamous cell carcinoma, keratinizing NOS', CAST(47.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 602, N'Squamous cell carcinoma, metastatic NOS', CAST(46.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 601, N'Squamous cell carcinoma NOS', CAST(45.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 600, N'Squamous cell carcinoma in situ NOS', CAST(44.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 599, N'Papillomatosis NOS', CAST(43.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 598, N'Inverted papilloma', CAST(42.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 597, N'Papillary squamous cell carcinoma', CAST(41.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 596, N'Squamous cell papilloma', CAST(40.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 595, N'Verrucous carcinoma NOS', CAST(39.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 594, N'Verrucous papilloma', CAST(38.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 593, N'Papillary carcinoma NOS', CAST(37.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 592, N'Papillary carcinoma in situ', CAST(36.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 591, N'Papilloma NOS  ', CAST(35.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 590, N'Squamous cell neoplasms', CAST(34.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 589, N'Small cell-large cell carcinoma  ', CAST(33.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 588, N'Small cell carcinoma, intermediate cell  ', CAST(32.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 587, N'Small cell carcinoma, fusiform cell  ', CAST(31.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 586, N'Oat cell carcinoma  ', CAST(30.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 585, N'Small cell carcinoma NOS', CAST(29.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 584, N'Tumorlet', CAST(28.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 583, N'Polygonal cell carcinoma', CAST(27.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 582, N'Pseudosarcomatous carcinoma', CAST(26.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 581, N'Spindle cell carcinoma', CAST(25.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 580, N'Giant cell carcinoma', CAST(24.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 579, N'Giant cell and spindle cell carcinoma', CAST(23.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 578, N'Pleomorphic carcinoma', CAST(22.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 577, N'Carcinoma, anaplastic NOS', CAST(21.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 576, N'Carcinoma, undifferentiated NOS', CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 575, N'Large cell carcinoma NOS', CAST(19.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 574, N'Epithelioma, malignant', CAST(18.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 573, N'Epithelioma, benign', CAST(17.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 572, N'Carcinoma, metastatic NOS', CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 571, N'Carcinoma NOS', CAST(15.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 570, N'Carcinoma in situ NOS', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 569, N'Epithelial tumour, benign', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 568, N'Epithelial neoplasms NOS', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 567, N'Malignant tumour, fusiform cell type', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 566, N'Malignant tumour, giant cell type', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 565, N'Malignant tumour, small cell type', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 564, N'Tumour cells, malignant', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 562, N'Tumour cells, benign', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 561, N'Neoplasm, metastatic', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 560, N'Neoplasm, malignant', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 559, N'Neoplasm, uncertain whether benign or malignant', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 558, N'Neoplasm, benign', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (89, 557, N'Neoplasms NOS', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (47, 556, N'Any other PEP regimens for Children', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (47, 555, N'ABC + 3TC + LPV/r (Paed PEP)', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (47, 554, N'AZT + 3TC + ATV/r (Adult PEP)', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (47, 553, N'Any other PEP regimens for Adults', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (47, 552, N'TDF + 3TC + ATV/r (Adult PEP)', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (47, 551, N'AZT + 3TC + ATV/r (Adult PEP)', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 542, N'Child', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (94, 550, N'Bad()Missed 9', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (94, 549, N'Fair(Missed4-8/month)', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (94, 548, N'Good(Missed<3/month)', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (95, 547, N'TransferredOut', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (95, 546, N'Died', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (95, 545, N'Discontinued', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (95, 544, N'Lost To Follow Up', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (95, 543, N'Completed', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (88, 460, N'Vaginal discharge', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (88, 459, N'Urethral discharge', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (88, 458, N'Ulceration', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (88, 419, N'Discharge', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (88, 457, N'Bleeding', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (87, 456, N'Neck stiffness', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (87, 455, N'Limb Weakness', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (87, 454, N'Kernings positive', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (87, 453, N'Confused', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (87, 452, N'Brisk Reflexes', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (87, 451, N'Bulging Anterior fontanelle', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (87, 450, N'Altered Sensation', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (86, 449, N'Tenderness', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (86, 448, N'Splenomegaly', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (86, 447, N'Mass', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (86, 446, N'Hepatomegaly', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (86, 445, N'Distension', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (85, 444, N'Rub', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (85, 443, N'Murmur', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (85, 442, N'Irregular rhythm', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (85, 441, N'Elevated blood pressure', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (84, 440, N'Wheezes', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (84, 439, N'Respiratory distress', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (84, 438, N'Reduced Breath sounds', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (84, 437, N'Dullness', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (84, 436, N'Crackles', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (84, 435, N'Bronchial breathing', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 375, N'Vertigo ', CAST(25.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 408, N'Ulcers', CAST(24.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 434, N'Toothache', CAST(23.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 433, N'Tinnitus ', CAST(22.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 432, N'Thrush', CAST(21.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 407, N'Sores', CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 370, N'Sore Throat ', CAST(19.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 431, N'Snoring ', CAST(18.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 430, N'Sinus Problems ', CAST(17.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 429, N'Post Nasal Drip ', CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 428, N'Pain ', CAST(15.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 427, N'Nosebleed ', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 426, N'Nasal Discharge', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 425, N'Masses', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 405, N'Kaposis sarcoma', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 424, N'Hoarsness', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 343, N'Hearing Loss ', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 423, N'Hairy cell leukoplakia', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 422, N'gingival bleeding', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 421, N'Frequent Colds ', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 420, N'Erythema', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 419, N'Discharge ', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 418, N'Dental carries', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 417, N'Change in hearing', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (83, 416, N'Apnea ', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 415, N'Redness ', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 414, N'Photophobia ', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 413, N'Irritation ', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 335, N'Eye Pain ', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 412, N'Excessive Tearing ', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 411, N'Double Vision ', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 410, N'Change in Vision ', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (82, 409, N'Visual Changes', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 408, N'Ulcers', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 407, N'Sores', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 406, N'Skin Eruptions/Rashes', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 405, N'Kaposis Sarcoma', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 404, N'Itching', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 403, N'Hair Loss', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 402, N'Growths/Swellings', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (81, 401, N'Abscess', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (77, 541, N'Continue current treatment', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 120, N'Oral thrush', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 117, N'Pallor', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 119, N'Oedema', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 538, N'Lymph nodes inguinal', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 537, N'Lymph nodes axillary', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 536, N'Lethargic', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 118, N'Jaundice', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 535, N'Finger Clubbing', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 534, N'Dehydration', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 533, N'Cyanosis', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (93, 50, N'None', CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 363, N'Rash', CAST(21.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 532, N'Myalgia', CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 531, N'Musculoskeletal pain', CAST(19.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 530, N'Mental status change', CAST(18.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 404, N'Itching', CAST(17.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 393, N'Hypertension', CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 529, N'Hives', CAST(15.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 528, N'Hepatotoxicity', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 342, N'Headache', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 527, N'GI upset', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 526, N'Flushing', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 338, N'Fever', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 525, N'Dystonia', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 524, N'Diarrhea', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 327, N'Cough', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 523, N'Bronchospasm', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 522, N'Arrhythmia', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 521, N'Angioedema', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 520, N'Anaphylaxis', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 519, N'Anaemia', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (92, 518, N'Unknown', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 517, N'Ragweed', CAST(57.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 516, N'Pollen', CAST(56.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 515, N'Mold', CAST(55.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 514, N'Latex', CAST(54.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 513, N'Dust', CAST(53.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 512, N'Bee stings', CAST(52.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 511, N'Adhesive tape', CAST(51.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 510, N'Wheat', CAST(50.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 509, N'Strawberries', CAST(49.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 508, N'Soy', CAST(48.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 507, N'Shellfish', CAST(47.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 506, N'Peanuts', CAST(46.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 505, N'Milk protein', CAST(45.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 504, N'Fish', CAST(44.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 503, N'Eggs', CAST(43.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 502, N'Dairy food', CAST(42.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 501, N'Chocolate', CAST(41.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 500, N'Caffeine', CAST(40.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 499, N'Beef', CAST(39.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 498, N'Zidovudine', CAST(38.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 497, N'Tetracyline', CAST(37.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 496, N'Tenofovir', CAST(36.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 495, N'Sulfonamides', CAST(35.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 494, N'Stavudine', CAST(34.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 493, N'Statins', CAST(33.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 492, N'Rifampin', CAST(32.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 491, N'Quinidine', CAST(31.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 490, N'Pyrazinamide', CAST(30.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 489, N'Procainamide', CAST(29.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 488, N'Phenytoin', CAST(28.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 487, N'Phenolphthaleins', CAST(27.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 486, N'Penicillins', CAST(26.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 485, N'Penicillamine', CAST(25.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 484, N'Non-steroidal anti-inflammatory drugs', CAST(24.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 483, N'Nitrofurans', CAST(23.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 482, N'Nevirapine', CAST(22.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 481, N'Morphine', CAST(21.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 480, N'Lopinavir/ritonavir', CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 479, N'Isoniazid', CAST(19.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 478, N'Hydralazine', CAST(18.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 477, N'Heparins', CAST(17.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 476, N'Griseofulvin', CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 475, N'Ethambutol', CAST(15.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 474, N'Erythromycins', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 473, N'Efavirenz', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 472, N'Didanosine', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 471, N'Codeine', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 470, N'Choloroquine', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 469, N'Cephalosporins', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 468, N'Carbamazepine', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 467, N'Atazanavir', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 466, N'Aspirin', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 465, N'ARBs (angiotensin II receptor blockers)', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 464, N'Aminoglycosides', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 463, N'Allopurinol', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 462, N'ACE inhibitors', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (91, 461, N'Abacavir', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 400, N'Thyroid disease', CAST(25.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 399, N'Sickle Cell Anemia', CAST(24.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 398, N'Osteoporosis', CAST(23.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 397, N'Obesity', CAST(22.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 396, N'Multiple Sclerosis', CAST(21.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 395, N'Mental illness', CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 394, N'Hypothyroidism', CAST(19.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 393, N'Hypertension', CAST(18.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 392, N'Hyperlipidaemia', CAST(17.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 391, N'Heart Disease', CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 390, N'Glaucoma', CAST(15.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 389, N'Epilepsy', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 388, N'Endometriosis', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 387, N'Deafness and hearing impairment', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 386, N'Cystic Fibrosis', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 385, N'Chronic renal failure', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 384, N'Chronic Obstructive Pulmonary Disease (COPD)', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 383, N'Chronic Kidney Disease', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 382, N'Chronic hepatitis', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 381, N'Cardiovascular diseases', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 380, N'Asthma', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 379, N'Arthritis', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 378, N'Alzheimers Disease and other Dementias', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 377, N'Weight loss', CAST(62.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 376, N'Vomiting', CAST(61.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 375, N'Vertigo', CAST(60.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 374, N'Urinary symptoms Pain/frequency/Urgency', CAST(59.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 373, N'Tremors', CAST(58.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 372, N'Swollen legs', CAST(57.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 371, N'Sweating-excessive', CAST(56.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 370, N'Sore Throat', CAST(55.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 369, N'Sleep disturbance', CAST(54.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 368, N'Shoulder pain', CAST(53.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 367, N'Scrotal pain', CAST(52.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 366, N'Runny/blocked nose', CAST(51.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 365, N'Ringing/Buzzing ears', CAST(50.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 364, N'Red eye', CAST(49.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 363, N'Rash', CAST(48.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 362, N'Poor Vision', CAST(47.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 361, N'Pelvic pain', CAST(46.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 360, N'Pain when swallowing', CAST(45.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 359, N'Numbness', CAST(44.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 358, N'Night Sweats', CAST(43.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 357, N'Neck pain', CAST(41.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 356, N'Nausea', CAST(40.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 355, N'Muscle pain', CAST(39.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 354, N'Muscle cramps', CAST(38.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 353, N'Mouth ulcers', CAST(37.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 352, N'Mouth pain/burning', CAST(36.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 351, N'Mental status, acute change (coma, lethargy)', CAST(35.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 350, N'Memory loss', CAST(34.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 349, N'Lymphadenopathy', CAST(33.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 348, N'Loss of appetite', CAST(32.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 347, N'Leg pain', CAST(31.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 346, N'Joint Pain', CAST(30.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 345, N'Itchiness/Pruritus', CAST(29.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 344, N'Hypotension/Shock', CAST(28.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 343, N'Hearing loss', CAST(27.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 342, N'Headache', CAST(26.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 341, N'Genital skin lesion/Ulcer', CAST(25.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 340, N'Genital Discharge', CAST(24.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 339, N'Flank pain', CAST(23.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 338, N'Fever', CAST(22.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 337, N'Fatigue/weakness', CAST(21.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 336, N'Facial pain', CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 335, N'Eye pain', CAST(19.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 334, N'Epigastric Pain', CAST(18.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 333, N'Ear pain', CAST(17.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 332, N'Dizziness', CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 331, N'Difficulty in swallowing', CAST(15.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 330, N'Difficult in breathing', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 329, N'Diarrhoea', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 328, N'Crying infant', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 327, N'Cough', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 326, N'Convulsions/Seizure', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 325, N'Confusion/Delirium', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 324, N'Cold/Chills', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 323, N'Chest pain', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 322, N'Breast pain', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 321, N'Bloody Urine', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 320, N'Back pain', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 319, N'Anxiety, depression', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 318, N'Abnormal uterine bleeding', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (90, 317, N'Abdominal pain', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (3, 316, N'Enrollment', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 315, N'Genito-urinary', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 314, N'CNS', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 313, N'Abdomen', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 312, N'CVS', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 311, N'Chest', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 310, N'ENT', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 309, N'Eyes', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (80, 308, N'Skin', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (77, 307, N'Start Treatment', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (78, 49, N'PMTCT', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (78, 302, N'ART', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (77, 301, N'Drug Switches', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 222, N'PMTCT Regimens', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (74, 284, N'Consent To Send SMS', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (74, 285, N'Consent To Home Visit', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (73, 283, N'All drugs stopped', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (73, 280, N'Medicine causing AE substituted/withdrawn', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (73, 278, N'Dose reduced', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (73, 281, N'Medicine not changed', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (28, 109, N'Severe', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (28, 108, N'Moderate', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (28, 107, N'Mild', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (28, 110, N'Fatal', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (28, 518, N'Unknown', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (72, 544, N'LostToFollowUp', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (72, 263, N'Transfer Out', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (72, 262, N'Death', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (72, 264, N'HIV Negative', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (72, 265, N'Confirmed HIV Negative', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (71, 261, N'NULL', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (71, 260, N'NULL', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (71, 259, N'NULL', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (70, 258, N'MoH 257 GREENCARD', CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (68, 257, N'Standard Care', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 254, N'Partner', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 252, N'Sibling', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 250, N'Spouse', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 1442, N'Co-Wife', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 1441, N'Mother', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 1440, N'Father', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (69, 25, N'Other', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (56, 249, N'Tested Positive', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (57, 249, N'Tested Positive', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (56, 248, N'Tested Negative', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (57, 248, N'Tested Negative', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (57, 247, N'Never Tested', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (102, 47, N'PrEP', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (102, 49, N'PMTCT', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (102, 48, N'PEP', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (103, 266, N'PCR', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (103, 267, N'Rapid Test', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (100, 1443, N'Positive', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (100, 1444, N'Negative', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (101, 1445, N'Stable', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (101, 1446, N'UnStable', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (56, 247, N'Never Tested', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (56, 518, N'Unknown', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (65, 246, N'FluVaccine', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (66, 245, N'HBV', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (68, 240, N'Express Care', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (68, 239, N'Community Based Dispensing', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (67, 238, N'Pharmacy Refill', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (67, 237, N'Treatment Preparation', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (67, 236, N'Lab Tests', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (67, 235, N'Follow Up', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (55, 234, N'ANC Registration Number', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (55, 233, N'TB Registration Number', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (55, 232, N'PMTCT Number', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (55, 231, N'HEI Registration Number', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (55, 230, N'Patient Number', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (55, 229, N'CCC Registration Number', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (54, 228, N'Previously Missed', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (54, 227, N'Care Ended', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (54, 225, N'Met', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (54, 224, N'Missed', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (54, 223, N'Pending', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 221, N'Paeds Thirdline Regimen', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 220, N'Paeds Secondline Regimen', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 219, N'Paeds FirstLine Regimen', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 218, N'Adult FirstLine Regimen', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 217, N'Adult Secondline Regimen', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 216, N'Adult Thirdline Regimen', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (46, 215, N'TDF (PrEP)', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (46, 214, N'TDF + 3TC (PrEP)', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (46, 213, N'TDF + FTC (PrEP)', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (45, 212, N'Any other PMTCT regimens for Infants', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (45, 211, N'AZT liquid BID for 12 weeks', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (45, 210, N'AZT liquid BID + NVP', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (45, 209, N'AZT liquid BID + NVP liquid', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (45, 208, N'NVP', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 207, N'PM1X', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 206, N'PM11', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 205, N'PM10', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 204, N'PM9', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 203, N'PM7', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 202, N'PM6', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 201, N'PM5', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 200, N'PM4', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (44, 199, N'PM3', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 198, N'Any other 3rd line Paediatric regimens', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 197, N'DTG', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 196, N'DTG + DRV + RTV', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 195, N'DTG + ETV', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 194, N'DTG + DRV + RTV + ETV', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 193, N'DRV + RTV', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 192, N'ETV + DRV + RTV', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 191, N'ETV + other backbone ARVs', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 190, N'RAL + other backbone ARVs', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 189, N'RAL + DRV + RTV', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 188, N'RAL + ETV', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (49, 187, N'RAL + DRV + RTV + ETV', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (47, 186, N'Any other 2nd line Paediatric regimens', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (46, 185, N'ABC + 3TC + ATV/r', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (45, 184, N'ABC + 3TC + LPV/r', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (43, 182, N'AZT + 3TC + LPV/r', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 181, N'TDF + 3TC + ATV/r', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 180, N'TDF + 3TC + LPV/r', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 179, N'TDF + 3TC + EFV', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 178, N'TDF + 3TC + NVP (children > 35kg)', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 177, N'ABC + 3TC + RAL', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 176, N'ABC + 3TC + ATV/r', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 175, N'ABC + 3TC + LPV/r', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 174, N'ABC + 3TC + EFV', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 173, N'ABC + 3TC + NVP', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 172, N'AZT + 3TC + RAL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 171, N'AZT + 3TC + ATV/r', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 170, N'AZT + 3TC + LPV/r', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 169, N'AZT + 3TC + EFV', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (42, 168, N'AZT + 3TC + NVP', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 167, N'AT2X', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 166, N'AT4D', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 165, N'AT4C', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 164, N'AT4B', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 163, N'AT4A', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 162, N'AT3A', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 161, N'AT2C', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 160, N'AT2B', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 159, N'AT1G', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 158, N'AT1F', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 157, N'AT1E', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (41, 156, N'RAL + DRV + RTV + ETV', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (40, 155, N'Any other 2nd line Adult regimens', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (40, 154, N'ABC + 3TC + ATV/r', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (40, 153, N'ABC + 3TC + LPV/r', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (40, 152, N'TDF + 3TC + ATV/r', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (40, 151, N'TDF + 3TC + LPV/r', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (40, 150, N'AZT + 3TC + ATV/r', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (40, 149, N'AZT + 3TC + LPV/r', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 148, N'ABC + 3TC + DTG', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 147, N'ABC + 3TC + EFV', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 146, N'ABC + 3TC + NVP', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 145, N'TDF + FTC + ATV/r', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 144, N'TDF + 3TC + RAL', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 143, N'TDF + 3TC + LPV/r', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 142, N'TDF + 3TC + DTG', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 141, N'TDF + 3TC + ATV/r', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 140, N'TDF + 3TC + EFV', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 139, N'TDF + 3TC + NVP', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 138, N'AZT + 3TC + DTG', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 137, N'AZT + 3TC + EFV', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (39, 136, N'AZT + 3TC + NVP', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (11, 135, N'', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (38, 135, N'Stage4', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (11, 134, N'', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (38, 134, N'Stage3', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (11, 133, N'', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (38, 133, N'Stage2', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (11, 132, N'', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (38, 132, N'Stage1', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (37, 131, N'Penta', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (59, 131, N'NULL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (37, 130, N'PCV', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (59, 130, N'NULL', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (37, 129, N'Measles', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (59, 129, N'NULL', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (37, 128, N'PV', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (59, 128, N'NULL', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (37, 127, N'BCG', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (59, 127, N'NULL', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 126, N'Cancer', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (36, 125, N'Diabetes', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (14, 124, N'Laboratory', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (14, 123, N'Pharmacy', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (14, 122, N'Clinical', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (32, 121, N'PhysicalExamination', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (31, 120, N'Oral thrush', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (31, 119, N'Oedema', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (31, 118, N'Jaundice', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (31, 117, N'Pallor', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (30, 116, N'Currently Pregnant', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (30, 115, N'Not Sexually Active now', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (30, 114, N'Thinks can’t get pregnant', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (30, 113, N'Wants to get pregnant', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (29, 112, N'Treatment Supporter', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (29, 111, N'Self', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (25, 106, N'Not Applicable', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (27, 106, N'Not Applicable', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (18, 105, N'NULL', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (25, 105, N'No', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (26, 105, N'No', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (27, 105, N'No', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (18, 104, N'NULL', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (25, 104, N'Yes', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (26, 104, N'Yes', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (27, 104, N'Yes', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (75, 87, N'Clinical treatment failure', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (75, 88, N'Immunological failure', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (75, 89, N'Virological failure', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (75, 90, N'New drug available', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (75, 91, N'Drug out of stock', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (75, 92, N'Other Reason', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (22, 92, N'Other Reason', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (22, 93, N'Toxicity', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (22, 91, N'Drug Out of Stock', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (22, 90, N'New Drug Available', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (22, 99, N'New TB', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (22, 98, N'Risk Of Pregnancy', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (22, 97, N'Pregnancy', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (21, 96, N'Changing to Adult Regimen', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (21, 95, N'Drug Interruptions', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (21, 94, N'Pill Burden', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (21, 93, N'Toxicity', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (23, 86, N'Recently Miscarriage', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (23, 85, N'Recently Induced Abortion', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (23, 84, N'Not Pregnant', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (23, 82, N'Pregnant', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (23, 83, N'Not Sure', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (33, 77, N'STI Screening', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (33, 76, N'Partner Testing', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (33, 75, N'Disclosure to Sex Partner', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (33, 74, N'Substance Abuse', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (33, 73, N'Condom Distribution', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (33, 72, N'Adherence Counselling', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (34, 71, N'Poor', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (34, 69, N'Inadequate', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (35, 69, N'Inadequate', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (35, 71, N'Poor', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (34, 70, N'Fair', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (35, 70, N'Fair', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (34, 68, N'Good', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (35, 68, N'Good', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (10, 67, N'People who Inject with Drugs', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (10, 66, N'Female Sex Worker', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (10, 65, N'Men having Sex with Men', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (9, 64, N'Key Population', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (9, 63, N'General Population', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 62, N'NULL', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 61, N'NULL', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 60, N'NULL', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 59, N'NULL', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 58, N'NULL', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 57, N'NULL', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (61, 55, N'PV 3', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (62, 55, N'Measles 3', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (63, 55, N'PCV 3', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (64, 55, N'Penta 3', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (61, 54, N'PV 2', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (62, 54, N'Measles 2', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (63, 54, N'PCV 2', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (64, 54, N'Penta 2', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (60, 53, N'BCG', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (61, 53, N'PV 1', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (62, 53, N'Measles 1', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (63, 53, N'PCV 1', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (64, 53, N'Penta 1', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (17, 52, N'Female', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (17, 51, N'Male', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (73, 45, N'Other', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (58, 44, N'Suspected Drug Ressistance', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (58, 43, N'Routine', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (58, 42, N'Baseline', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (12, 35, N'Overweight/Obese', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (12, 34, N'Moderate Acute Malnutrition', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (12, 33, N'Severe Acute Malnutrition', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (12, 32, N'Normal', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (4, 31, N'TBRx', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (4, 30, N'INH', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (4, 29, N'NoTB', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (4, 28, N'PrTB', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 25, N'Other', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (58, 25, N'Other', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 24, N'Self-test', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 23, N'CCC', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 21, N'IPD-Child', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (77, 299, N'Drug Interruptions', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 20, N'TB Clinic', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 19, N'MCH', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 18, N'OPD', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 17, N'VCT site', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 16, N'HBTC', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 15, N'Undecided', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 14, N'Vasectomy', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 13, N'Tubal Ligation /Female Sterilization', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 12, N'Fertility Awareness Method', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 11, N'Diaphragm/Cervical Cap', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 10, N'Lactational Amenorrhea Method', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 9, N'Intra Uterine Device', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 8, N'Implant', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 7, N'Injectable', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 6, N'Oral Contraceptive Pills', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 5, N'Emergency Contraceptive Pills', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (1, 4, N'Condoms', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (19, 3, N'Wants Family Planning', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (19, 2, N'No Family Planning', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (19, 1, N'Family Planning', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (96, 518, N'Unknown', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (97, 216, N'Adult Thirdline Regimen', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (97, 217, N'Adult Secondline Regimen', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (97, 218, N'Adult FirstLine Regimen', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (97, 222, N'PMTCT Regimens', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (98, 219, N'Paeds FirstLine Regimen', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (98, 220, N'Paeds Secondline Regimen', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (98, 221, N'Paeds Thirdline Regimen', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (77, 1438, N'Drug Substitutions', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (77, 106, N'N/A', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (79, 306, N'Post Natal', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (79, 305, N'During Labour', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (79, 304, N'During Pregnancy', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (99, 268, N'Spontaneous abortion', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (99, 269, N'STILLBIRTH', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (99, 270, N'Term birth of newborn', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (99, 271, N'Preterm Delivery (Maternal Condition)', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (99, 272, N'Therapeutic abortion procedure', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (99, 273, N'Liveborn, (Single, Twin, or Multiple)', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (99, 518, N'Unknown', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (79, 304, N'During Pregnancy', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (79, 305, N'During Labour', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (79, 306, N'Post Natal', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 518, N'Unknown', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (8, 1437, N'Widowed', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (2, 22, N'IPD-Adult', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (105, 1447, N'FT = Fast Track', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (105, 1448, N'CADH = Community ART Distribution - HCW Led', CAST(1.01 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (105, 1449, N'CADP = Community ART Distribution - Peer Led', CAST(1.02 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (105, 1450, N'FADG = Facility ART Distribution Group', CAST(1.02 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (106, 1451, N'Recovering/Resolving', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (106, 1452, N'Recoverd/Resolved', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (106, 1453, N'Requires or Prolongs hospitalization', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (106, 1454, N'Caused a congenital anomaly', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (106, 1455, N'Requires intervention to prevent permanent damage', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (106, 1456, N'Died due to ADR', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (106, 1457, N'Died not due to ADR', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1458, N'Abnormal dreams or nightmares (Frightening or unpleasant dreams)', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1459, N'Anxiety', CAST(1.01 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1460, N'Confusion/abnormal thinking', CAST(1.02 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1461, N'Depression/mood changes (frequently feeling very low)', CAST(1.03 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1462, N'Dizziness/spinning sensation/vertigo', CAST(1.04 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1463, N'Fatigue/tiredness/weakness', CAST(1.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1464, N'Insomnia (lacking sleep at night)/sleep problems', CAST(1.06 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1465, N'Poor concentration/ memory problems', CAST(1.07 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1466, N'Burning and tingling in limbs/ Paresthesia/painful neuropathy', CAST(1.08 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1467, N'Suicide ideation (thoughts on ending the life)', CAST(1.09 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1468, N'Skin rash/hypersensitivity reaction', CAST(1.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1469, N'Abdominal discomfort/abdominal pain', CAST(1.11 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1470, N'Nausea/vomiting', CAST(1.12 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 329, N'Diarrhoea', CAST(1.13 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 118, N'Jaundice', CAST(1.14 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1471, N'Fat changes/lipodystrophy/lipohypertrophy', CAST(1.15 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1472, N'Gynaecomastia', CAST(1.16 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 342, N'Headache', CAST(1.17 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1473, N'Anaemia/pancytopenia', CAST(1.18 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1474, N'Renal failure/renal insufficiency', CAST(1.19 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (107, 1475, N'Other Specify', CAST(1.20 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1476, N'registration-encounter', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1477, N'triage-encounter', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1478, N'ccc-encounter', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1479, N'pmtct-encounter', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1480, N'tb-encounter', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1481, N'lab-encounter', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1482, N'Pharmacy-encounter', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 290, N'PrEP Regimens', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (53, 291, N'PEP Regimens', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 1483, N'Maternity', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 19, N'MCH', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 1484, N'PITC', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 1485, N'Outreach', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 17, N'VCT', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 1486, N'ANC', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 21, N'IPD-Child', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 22, N'IPD-Adult', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 23, N'CCC', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 18, N'OPD', CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 16, N'HBTC', CAST(11.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 1487, N'PeD', CAST(12.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 1488, N'Mobile Outreach', CAST(13.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 49, N'PMTCT', CAST(14.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 20, N'TB', CAST(15.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (109, 25, N'Other', CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (110, 1494, N'D: Deaf/Hearing impaired', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (110, 1495, N'B: Blind/Visually impaired', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (110, 1496, N'M: Mentally Challenged', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (110, 1497, N'P: Physically Challenged', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (110, 25, N'Other', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (111, 1498, N'I: Individual', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (111, 1499, N'C: Couple (includes polygamous)', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (112, 1500, N'HP: Health Facility Patients', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (112, 1501, N'NP: Non-Patients', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (112, 1502, N'VI: Integrated VCT sites', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (112, 1503, N'VS: Stand-alone VCT sites', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (112, 1504, N'HB: Home-based', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (112, 1505, N'MO: Mobile and Outreach', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (113, 1506, N'Declined', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (113, 1507, N'Positive IPV Outcome', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (113, 1508, N'Fear losing partner', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (114, 1444, N'Negative', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (114, 1443, N'Positive', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (114, 1509, N'Invalid', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (115, 1510, N'Determine', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (115, 1511, N'First Response', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (115, 25, N'Other', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (116, 1444, N'Negative', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (116, 1443, N'Positive', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (116, 1439, N'Inconclusive', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (131, 1512, N'Adolescent Girls and Young Women', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (131, 1513, N'Fisher Folk', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (131, 1514, N'Male Sex Worker', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (131, 25, N'Other', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (131, 1515, N'Prisoner', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (131, 1516, N'Truck Driver', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (108, 1517, N'Hts-encounter', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (117, 1518, N'Contacted', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (117, 1519, N'Contacted and Linked', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (117, 1520, N'Not Contacted', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (118, 1521, N'Phone', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (118, 1522, N'Physical', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (119, 104, N'Yes', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (119, 105, N'No', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (119, 106, N'N/A', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (120, 1522, N'Physical', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (120, 1523, N'Emotional', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (120, 1524, N'Sexual', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (120, 1525, N'No IPV', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (120, 1526, N'NA-CHILD', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (121, 104, N'Yes', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (121, 105, N'No', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (121, 1506, N'Declined', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (122, 111, N'S', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (122, 1527, N'P', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (122, 1528, N'Sexual Partner (SP)', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (122, 1529, N'Injectable Drug User (IDU)', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (122, 1530, N'Child - C', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (123, 1443, N'Positive', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (123, 1444, N'Negative', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (123, 518, N'Unknown', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (124, 1531, N'Con: Contract Referral', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (124, 1532, N'D: Dual Referral', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (124, 1533, N'Cr: Passive Referral', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (124, 1534, N'Pr: Provider Referral', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (74, 1535, N'ConsentToBeTested', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (74, 1536, N'ConsentToListPartners', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1537, N'PnsPhysicallyHurt', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1538, N'PnsThreatenedHurt', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1539, N'PnsForcedSexual', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1540, N'IPVOutcome', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1541, N'PnsRelationship', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1542, N'LivingWithClient', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1543, N'HIVStatus', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1544, N'PNSApproach', CAST(8.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (125, 1545, N'EligibleTesting', CAST(9.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (126, 1518, N'Contacted', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (126, 1520, N'Not Contacted', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (127, 1518, N'Contacted', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (127, 1520, N'Not Contacted', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (128, 1546, N'CCCEnrollment', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (128, 1547, N'HIVTesting', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (128, 1548, N'Nutritional', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (128, 1549, N'Counselling', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (129, 1443, N'Positive', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (129, 1444, N'Negative', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (129, 518, N'Unknown', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (129, 1550, N'HIV Exposed Infant', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (130, 1551, N'ScreeningHivStatus', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (130, 1545, N'EligibleTesting', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (132, 1553, N'Family', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (132, 254, N'Partner', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (132, 1554, N'Enrolment', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (133, 67, N'IDU: Intravenous drug users', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (133, 274, N'SW: Sex worker', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (133, 65, N'MSM: Men who have sex with men', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (133, 25, N'O: Others', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (133, 1552, N'NA: Not Applicable', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (134, 28, N'PrTB: Presumed TB', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (134, 1556, N'NS: No Signs', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (134, 1555, N'ND: Not Done', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (134, 31, N'TBRx: On TB treatment', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 62, N'Divorced', CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 61, N'Separated', CAST(2.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 60, N'Married Polygamous', CAST(3.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 58, N'Single', CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 57, N'Married Monogamous', CAST(5.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 1437, N'Widowed', CAST(6.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 25, N'Other', CAST(7.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[LookupMasterItem] ([LookupMasterId], [LookupItemId], [DisplayName], [OrdRank]) VALUES (135, 1552, N'Not Applicable', CAST(8.00 AS Decimal(5, 2)))
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LookupItem_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupItem] ADD  CONSTRAINT [DF_LookupItem_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LookupMaster_DeleteFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LookupMaster] ADD  CONSTRAINT [DF_LookupMaster_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
END
GO



/*Additional Lookups*/


IF NOT EXISTS(SELECT * FROM LookupItem WHERE [Name] = 'Married')
BEGIN
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag)
	VALUES
	('Married','Married', 0);

	INSERT INTO LookupMasterItem(LookupMasterId, LookupItemId, OrdRank)
	VALUES
	(8
	, (SELECT Id FROM LookupItem WHERE [Name] = 'Married')
	,7);

END
GO
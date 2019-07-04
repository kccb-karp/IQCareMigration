
IF NOT EXISTS(Select * FROM sys.tables WHERE name = N'PatientDrugDispense')
BEGIN

CREATE TABLE [dbo].PatientDrugDispense(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientDrugPrescriptionId] INT NOT NULL,
	[PatientId] INT NOT NULL,
	[PatientMasterVisitId] INT NOT NULL,
	[ClinicalDrugId] INT NOT NULL,
	[Dose] decimal(18,1) NOT NULL,
	[DrugFrequencyId] INT NOT NULL,
	[Duration] INT NOT NULL,
	[PrescribedQuantity] decimal(18,1) NOT NULL, 
	[PrescriptionComment] varchar(500) NULL,
	[DispensedQuantity] decimal(18,1) NULL, 
	[DispenseDate] datetime NULL,
	[DispensedBy] INT NULL,
	[DrugBatchId] INT NULL,
	[CreateDate] datetime NOT NULL,
	[UpdateDate] datetime NULL,
	[DeleteFlag] INT NOT NULL
 CONSTRAINT [PK_PatientDrugDispense] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].PatientDrugDispense WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDispense_PatientDrugPrescription_Id] FOREIGN KEY([PatientDrugPrescriptionId]) REFERENCES [dbo].[PatientDrugPrescription] ([Id]);
ALTER TABLE [dbo].PatientDrugDispense CHECK CONSTRAINT [FK_PatientDrugDispense_PatientDrugPrescription_Id];

ALTER TABLE [dbo].PatientDrugDispense WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDispense_Patient_Id] FOREIGN KEY([PatientId]) REFERENCES [dbo].[Patient] ([Id]);
ALTER TABLE [dbo].PatientDrugDispense CHECK CONSTRAINT [FK_PatientDrugDispense_Patient_Id];

ALTER TABLE [dbo].PatientDrugDispense WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDispense_PatientMasterVisit_Id] FOREIGN KEY([PatientMasterVisitId]) REFERENCES [dbo].[PatientMasterVisit] ([Id]);
ALTER TABLE [dbo].PatientDrugDispense CHECK CONSTRAINT [FK_PatientDrugDispense_PatientMasterVisit_Id];

ALTER TABLE [dbo].PatientDrugDispense WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDispense_ClinicalDrug_Id] FOREIGN KEY([ClinicalDrugId]) REFERENCES [dbo].[ClinicalDrug] ([Id]);
ALTER TABLE [dbo].PatientDrugDispense CHECK CONSTRAINT [FK_PatientDrugDispense_ClinicalDrug_Id];

ALTER TABLE [dbo].PatientDrugDispense WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDispense_DrugFrequency_Id] FOREIGN KEY([DrugFrequencyId]) REFERENCES [dbo].[DrugFrequency] ([Id]);
ALTER TABLE [dbo].PatientDrugDispense CHECK CONSTRAINT [FK_PatientDrugDispense_DrugFrequency_Id];

ALTER TABLE [dbo].PatientDrugDispense WITH CHECK ADD  CONSTRAINT [FK_PatientDrugDispense_DrugBatch_Id] FOREIGN KEY([DrugBatchId]) REFERENCES [dbo].[DrugBatch] ([Id]);
ALTER TABLE [dbo].PatientDrugDispense CHECK CONSTRAINT [FK_PatientDrugDispense_DrugBatch_Id];

END
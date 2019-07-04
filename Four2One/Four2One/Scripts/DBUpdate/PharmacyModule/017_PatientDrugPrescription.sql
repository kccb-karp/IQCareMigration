IF NOT EXISTS(Select * FROM sys.tables WHERE name = N'PatientDrugPrescription')
BEGIN

CREATE TABLE [dbo].PatientDrugPrescription(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] INT NOT NULL,
	[PatientMasterVisitId] INT NOT NULL,
	[PrescriptionDate] datetime NOT NULL,
	[TreatmentProgramId] INT NULL,
	[CreatedBy] INT NOT NULL,
	[CreateDate] datetime NOT NULL,
	[UpdateDate] datetime NULL,
	[DeleteFlag] INT NOT NULL
 CONSTRAINT [PK_PatientDrugPrescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].PatientDrugPrescription WITH CHECK ADD  CONSTRAINT [FK_PatientDrugPrescription_Patient_Id] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id]);

ALTER TABLE [dbo].PatientDrugPrescription CHECK CONSTRAINT [FK_PatientDrugPrescription_Patient_Id];

ALTER TABLE [dbo].PatientDrugPrescription WITH CHECK ADD  CONSTRAINT [FK_PatientDrugPrescription_PatientMasterVisit_Id] FOREIGN KEY([PatientMasterVisitId])
REFERENCES [dbo].[PatientMasterVisit] ([Id]);

ALTER TABLE [dbo].PatientDrugPrescription CHECK CONSTRAINT [FK_PatientDrugPrescription_PatientMasterVisit_Id];

END
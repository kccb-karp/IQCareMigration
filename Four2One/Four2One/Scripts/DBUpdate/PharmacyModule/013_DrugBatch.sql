
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugBatch')
BEGIN

CREATE TABLE dbo.DrugBatch(
	Id int IDENTITY(1,1) NOT NULL,
	BatchNumber nvarchar(100) NOT NULL,
	ClinicalDrugId int NOT NULL,
	DrugPackagingId int not null,
	ExpiryDate datetime not null,
	DeleteFlag int not null
	CONSTRAINT [PK_DrugBatch] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[DrugBatch] ADD  CONSTRAINT [DF_DrugBatch_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag];

ALTER TABLE [dbo].DrugBatch WITH CHECK ADD  CONSTRAINT [FK_DrugBatch_ClinicalDrug_Id] 
FOREIGN KEY(ClinicalDrugId)
REFERENCES [dbo].ClinicalDrug ([Id]);

ALTER TABLE [dbo].DrugPackaging CHECK CONSTRAINT [FK_DrugPackaging_ClinicalDrug_Id];

ALTER TABLE [dbo].DrugBatch WITH CHECK ADD  CONSTRAINT [FK_DrugBatch_DrugPackaging_Id] 
FOREIGN KEY(DrugPackagingId)
REFERENCES [dbo].DrugPackaging ([Id]);

ALTER TABLE [dbo].DrugBatch CHECK CONSTRAINT [FK_DrugBatch_DrugPackaging_Id];

END

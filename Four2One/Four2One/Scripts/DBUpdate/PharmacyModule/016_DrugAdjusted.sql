IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugAdjusted')
BEGIN

CREATE TABLE dbo.DrugAdjusted(
	Id int IDENTITY(1,1) NOT NULL,
	DrugBatchId int NOT NULL,
	DateAdjusted datetime not null,
	DrugStoreId int null,
	DrugAdjustmentReasonId int not null,
	Quantity int not null,
	UserId int not null,
	DeleteFlag int not null,
	CreateDate datetime not null
	CONSTRAINT [PK_DrugAdjusted] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].DrugAdjusted WITH CHECK ADD  CONSTRAINT [FK_DrugAdjusted_DrugBatch_Id] 
FOREIGN KEY(DrugBatchId)
REFERENCES [dbo].DrugBatch ([Id]);

ALTER TABLE [dbo].DrugAdjusted CHECK CONSTRAINT [FK_DrugAdjusted_DrugBatch_Id];

ALTER TABLE [dbo].DrugAdjusted WITH CHECK ADD  CONSTRAINT [FK_DrugAdjusted_DrugAdjustmentReason_Id] 
FOREIGN KEY(DrugAdjustmentReasonId)
REFERENCES [dbo].DrugAdjustmentReason ([Id]);

ALTER TABLE [dbo].DrugAdjusted CHECK CONSTRAINT [FK_DrugAdjusted_DrugAdjustmentReason_Id];

ALTER TABLE [dbo].DrugAdjusted WITH CHECK ADD  CONSTRAINT [FK_DrugAdjusted_DrugStore_Id] 
FOREIGN KEY(DrugStoreId)
REFERENCES [dbo].DrugStore ([Id]);

ALTER TABLE [dbo].DrugAdjusted CHECK CONSTRAINT [FK_DrugAdjusted_DrugStore_Id];

END
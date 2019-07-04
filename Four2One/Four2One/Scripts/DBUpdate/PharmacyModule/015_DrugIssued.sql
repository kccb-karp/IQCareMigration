IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugIssued')
BEGIN

CREATE TABLE dbo.DrugIssued(
	Id int IDENTITY(1,1) NOT NULL,
	DrugBatchId int NOT NULL,
	DateIssued datetime not null,
	DrugDestinationId int not null,
	Quantity int not null,
	UserId int not null,
	DeleteFlag int not null,
	CreateDate datetime not null
	CONSTRAINT [PK_DrugIssued] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].DrugIssued WITH CHECK ADD  CONSTRAINT [FK_DrugIssued_DrugBatch_Id] 
FOREIGN KEY(DrugBatchId)
REFERENCES [dbo].DrugBatch ([Id]);

ALTER TABLE [dbo].DrugIssued CHECK CONSTRAINT [FK_DrugIssued_DrugBatch_Id];

ALTER TABLE [dbo].DrugIssued WITH CHECK ADD  CONSTRAINT [FK_DrugIssued_DrugDestination_Id] 
FOREIGN KEY(DrugDestinationId)
REFERENCES [dbo].DrugDestination ([Id]);

ALTER TABLE [dbo].DrugIssued CHECK CONSTRAINT [FK_DrugIssued_DrugDestination_Id];

END

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugReceived')
BEGIN

CREATE TABLE dbo.DrugReceived(
	Id int IDENTITY(1,1) NOT NULL,
	DrugBatchId int NOT NULL,
	DateReceived datetime not null,
	DrugSourceId int not null,
	Quantity int not null,
	UserId int not null,
	DeleteFlag int not null,
	CreateDate datetime not null
	CONSTRAINT [PK_DrugReceived] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].DrugReceived WITH CHECK ADD  CONSTRAINT [FK_DrugReceived_DrugBatch_Id] 
FOREIGN KEY(DrugBatchId)
REFERENCES [dbo].DrugBatch ([Id]);

ALTER TABLE [dbo].DrugReceived CHECK CONSTRAINT [FK_DrugReceived_DrugBatch_Id];

ALTER TABLE [dbo].DrugReceived WITH CHECK ADD  CONSTRAINT [FK_DrugReceived_DrugSource_Id] 
FOREIGN KEY(DrugSourceId)
REFERENCES [dbo].DrugSource ([Id]);

ALTER TABLE [dbo].DrugReceived CHECK CONSTRAINT [FK_DrugReceived_DrugSource_Id];

END
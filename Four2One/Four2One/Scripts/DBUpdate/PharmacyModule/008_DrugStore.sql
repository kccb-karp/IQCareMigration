IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugStore')
BEGIN

CREATE TABLE dbo.DrugStore(
	Id int IDENTITY(1,1) NOT NULL,
	DrugStoreName varchar(100) not null,
	DeleteFlag int not null,
	CreateDate datetime not null
	CONSTRAINT [PK_DrugStore] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

IF NOT EXISTS(select * from DrugStore WHERE DrugStoreName = 'Dispensing Store')
INSERT INTO DrugStore (DrugStoreName, DeleteFlag, CreateDate)
VALUES
('Dispensing Store',0,getdate());

IF NOT EXISTS(select * from DrugStore WHERE DrugStoreName = 'Main Store')
INSERT INTO DrugStore (DrugStoreName, DeleteFlag, CreateDate)
VALUES
('Main Store',0,getdate());
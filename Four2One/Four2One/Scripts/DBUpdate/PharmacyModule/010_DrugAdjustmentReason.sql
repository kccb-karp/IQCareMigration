IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugAdjustmentReason')
BEGIN

CREATE TABLE dbo.DrugAdjustmentReason(
	Id int IDENTITY(1,1) NOT NULL,
	AdjustmentReasonCode nvarchar(100) NOT NULL,
	AdjustmentReasonName nvarchar(100) not null,
	NetEffect BIT NOT NULL
	CONSTRAINT [PK_DrugAdjustmentReason] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END


IF NOT EXISTS(SELECT * FROM DrugAdjustmentReason WHERE AdjustmentReasonCode = 'DAMAGED')
INSERT INTO DrugAdjustmentReason(AdjustmentReasonCode, AdjustmentReasonName, NetEffect)
VALUES
('DAMAGED','DAMAGED DRUGS', 0);

IF NOT EXISTS(SELECT * FROM DrugAdjustmentReason WHERE AdjustmentReasonCode = 'LOST')
INSERT INTO DrugAdjustmentReason(AdjustmentReasonCode, AdjustmentReasonName, NetEffect)
VALUES
('LOST','LOST DRUGS', 0);
IF NOT EXISTS(Select * FROM sys.tables WHERE name = N'DrugFrequency')
BEGIN

CREATE TABLE [dbo].DrugFrequency(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	FrequencyCode [nvarchar](50) NOT NULL,
	FrequencyDescription [nvarchar](100) NOT NULL,
	Multiplier INT NOT NULL,
 CONSTRAINT [PK_DrugFrequency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

IF NOT EXISTS(Select * FROM DrugFrequency WHERE FrequencyCode = N'OD')
INSERT INTO DrugFrequency (FrequencyCode, FrequencyDescription, Multiplier)
VALUES
('OD','Once a day',1);

IF NOT EXISTS(Select * FROM DrugFrequency WHERE FrequencyCode = N'BID')
INSERT INTO DrugFrequency (FrequencyCode, FrequencyDescription, Multiplier)
VALUES
('BID','Twice a day',2);

IF NOT EXISTS(Select * FROM DrugFrequency WHERE FrequencyCode = N'TID')
INSERT INTO DrugFrequency (FrequencyCode, FrequencyDescription, Multiplier)
VALUES
('TID','Three times a day',3);

IF NOT EXISTS(Select * FROM DrugFrequency WHERE FrequencyCode = N'AS DIRECTED')
INSERT INTO DrugFrequency (FrequencyCode, FrequencyDescription, Multiplier)
VALUES
('AS DIRECTED','As directed',0);



IF NOT EXISTS(Select * FROM sys.tables WHERE name = N'DoseFormGroup')
BEGIN

CREATE TABLE [dbo].[DoseFormGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoseForm] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DoseFormGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

IF NOT EXISTS(Select * FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet')
INSERT INTO DoseFormGroup (DoseForm)
VALUES
('Oral Tablet');

IF NOT EXISTS(Select * FROM DoseFormGroup WHERE DoseForm = N'Oral Capsule')
INSERT INTO DoseFormGroup (DoseForm)
VALUES
('Oral Capsule');

IF NOT EXISTS(Select * FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid')
INSERT INTO DoseFormGroup (DoseForm)
VALUES
('Oral Liquid');

IF NOT EXISTS(Select * FROM DoseFormGroup WHERE DoseForm = N'Satchet')
INSERT INTO DoseFormGroup (DoseForm)
VALUES
('Satchet');

IF NOT EXISTS(Select * FROM DoseFormGroup WHERE DoseForm = N'Packet')
INSERT INTO DoseFormGroup (DoseForm)
VALUES
('Packet');

IF NOT EXISTS(Select * FROM DoseFormGroup WHERE DoseForm = N'Vial')
INSERT INTO DoseFormGroup (DoseForm)
VALUES
('Vial');






IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'PatientTracing')
BEGIN

CREATE TABLE [dbo].PatientTracing(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] INT NOT NULL,
	[TracingDate] datetime NOT NULL,
	[TracingProcessID] INT NOT NULL,
	[Reached] INT NOT NULL,
	[ReasonMissedID] INT NULL,
	[ActionTakenID] INT NULL,
	[ReasonMissedText] VARCHAR(1000) NULL,
	[ActionTakenText] VARCHAR(1000) NULL,
	[DateRescheduled] datetime NULL,
	[CreatedBy] INT NOT NULL,
	[CreateDate] datetime NOT NULL,
	[UpdateDate] datetime NULL,
	[DeleteFlag] INT NOT NULL
 CONSTRAINT [PK_PatientTracing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].PatientTracing WITH CHECK ADD  CONSTRAINT [FK_PatientTracing_Patient_Id] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id]);

ALTER TABLE [dbo].PatientTracing CHECK CONSTRAINT [FK_PatientTracing_Patient_Id];
END
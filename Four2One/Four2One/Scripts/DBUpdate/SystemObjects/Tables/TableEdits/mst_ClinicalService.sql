IF NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[mst_ClinicalService]') AND type in (N'U'))
BEGIN

	CREATE TABLE [dbo].[mst_ClinicalService](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[ModuleId] [int] NOT NULL,
		[Name] [varchar](50) NOT NULL,
		[Description] [varchar](250) NOT NULL,
		[DeleteFlag] [bit] NOT NULL,
		[Active] [bit] NULL,
		[DeletedBy] [int] NULL,
		[DeleteDate] [datetime] NULL,
	 CONSTRAINT [PK_mst_ClinicalService] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF
	, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END

ALTER TABLE [dbo].[mst_ClinicalService] 
ADD  CONSTRAINT [DF_mst_ClinicalService_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
GO

ALTER TABLE [dbo].[mst_ClinicalService] ADD  DEFAULT ((1)) FOR [Active]
GO



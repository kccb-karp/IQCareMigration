

/****** Object:  View [dbo].[lnk_parameterresult]    Script Date: 8/31/2018 12:24:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[lnk_parameterresult]
AS
Select	Id As 'ResultID',
		ParameterId,
		Value As 'Result',
		1 As 'UserID',
		Null As 'CreateDate',
		Null As 'UpdateDate',
		DeleteFlag
From dbo.dtl_LabTestParameterResultOption


GO



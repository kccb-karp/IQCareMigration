
/****** Object:  View [dbo].[lnk_TestParameter]    Script Date: 8/31/2018 12:23:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[lnk_TestParameter]
AS
Select	Id As 'SubTestID',
		ParameterName As 'SubTestName',
		LabTestId As 'TestID',
		0 As 'ControlID',
		0 As 'SerialNumber',
		DeleteFlag,
		UserId,
		CreateDate,
		UpdateDate,
		Null As 'LoincCode',
		Null
		As 'Sequence'
From dbo.Mst_LabTestParameter


GO



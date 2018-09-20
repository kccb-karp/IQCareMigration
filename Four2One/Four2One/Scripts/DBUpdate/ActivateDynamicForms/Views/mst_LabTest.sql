
/****** Object:  View [dbo].[mst_LabTest]    Script Date: 8/31/2018 12:25:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[mst_LabTest]
AS
Select	Id As LabTestID,
		Name As LabName,
		DepartmentId As LabDepartmentID,
		1 As LabTypeID,
		1 As Sequence,
		ltm.DeleteFlag,
		ltm.Active,
		1 As UserID,
		ltm.CreateDate,
		null UpdateDate,
		ltm.IsGroup,
		'Text' DataType
From dbo.mst_LabTestMaster ltm



GO



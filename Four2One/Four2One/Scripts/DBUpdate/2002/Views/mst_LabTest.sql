IF EXISTS (Select * from sys.views where name = N'mst_LabTest')
DROP VIEW [dbo].mst_LabTest
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



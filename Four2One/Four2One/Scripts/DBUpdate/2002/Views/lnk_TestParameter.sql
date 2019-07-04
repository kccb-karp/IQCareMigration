IF EXISTS (Select * from sys.views where name = N'lnk_TestParameter')
DROP VIEW [dbo].lnk_TestParameter
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



IF EXISTS (Select * from sys.views where name = N'lnk_parameterresult')
DROP VIEW [dbo].lnk_parameterresult
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



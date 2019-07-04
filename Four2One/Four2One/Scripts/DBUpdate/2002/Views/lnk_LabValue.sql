IF EXISTS (Select * from sys.views where name = N'lnk_LabValue')
DROP VIEW [dbo].lnk_LabValue
GO



CREATE VIEW [dbo].[lnk_LabValue]
AS
Select	Id
		,ParameterId	As 'SubTestID'
		,MinBoundary	As 'MinBoundaryValue'
		,MaxBoundary	As 'MaxBoundaryValue'
		,MinNormalRange
		,MaxNormalRange
		,Null			As 'TextNormalRange'
		,1				As 'UserID'
		,Null			
		As 'CreateDate'
		,Null			As 'UpdateDate'
		,DefaultUnit
		,UnitId
		,DeleteFlag
From dbo.dtl_LabTestParameterConfig



GO



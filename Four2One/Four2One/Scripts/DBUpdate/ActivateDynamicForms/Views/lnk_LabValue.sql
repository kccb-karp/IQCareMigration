
/****** Object:  View [dbo].[lnk_LabValue]    Script Date: 8/31/2018 12:22:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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



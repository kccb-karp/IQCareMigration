
/****** Object:  View [dbo].[ord_PatientLabOrder]    Script Date: 8/31/2018 12:26:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[ord_PatientLabOrder]
AS
Select	Id As LabID,
		Null As OldLabID,
		Ptn_Pk,
		LocationId,
		OrderedBy As OrderedbyName,
		OrderDate As OrderedbyDate,
		(
			Select Top (1)
				ResultBy
			From dbo.dtl_LabOrderTest
			Where (LabOrderId = lo.Id) And ResultBy Is Not Null
		)
		As ReportedbyName,
		(
			Select Top (1)
				ResultDate
			From dbo.dtl_LabOrderTest As R
			Where (LabOrderId = lo.Id) And R.ResultDate Is Not Null
		)
		As ReportedbyDate,
		Null As CheckedbyName,
		Null As CheckedbyDate,
		PreClinicLabDate,
		DeleteFlag,
		UserId,
		CreateDate,
		UpdateDate,
		VisitId,
		Null As LabPeriod,
		OrderNumber As LabNumber
From dbo.ord_LabOrder As lo

GO



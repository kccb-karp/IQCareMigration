
IF EXISTS (Select * from sys.views where name = N'dtl_PatientLabResults')
DROP VIEW [dbo].[dtl_PatientLabResults]
GO




CREATE VIEW [dbo].[dtl_PatientLabResults]
AS
Select	lr.LabOrderId As 'LabID',
		lo.LocationId,
		lr.LabTestId,
		lr.ParameterId,
		lr.ResultValue As 'TestResults',
		lr.ResultText As 'TestResults1',
		lr.ResultOptionId As 'TestResultId',
		1 As 'Financed',
		lr.ResultUnitId As 'Units',
		lr.UserId,
		lr.CreateDate,
		lo.UpdateDate,
		Null As 'TabId',
		d.TestNotes As 'RequestNotes',
		D.ResultNotes,
		D.ResultBy,
		D.ResultDate
From dbo.dtl_LabOrderTestResult As lr
Inner Join dbo.ord_LabOrder As lo On lr.LabOrderId = lo.Id
Inner Join dbo.dtl_LabOrderTest As d On lr.LabOrderTestId = d.Id


GO



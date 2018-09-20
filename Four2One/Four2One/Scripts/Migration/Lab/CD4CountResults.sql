﻿IF EXISTS(Select name from sys.tables WHERE name = N'tmp_CD4')
DROP TABLE tmp_CD4
GO

WITH LabResults AS (select 
a.LabID
, d.VisitId
, d.Ptn_pk
, b.LabName
, c.name Units
, case when a.TestResultId = 0 then null else a.TestResultId end TestResults_Code
, a.TestResults TestResults_Numeric
, case when a.TestResults1 = '' THEN NULL ELSE a.TestResults1 END TestResults_Text
, d.ReportedbyDate 
, e.N
from 
dtl_PatientLabResults_Old a 
inner join Mst_LabTest_Old b ON a.LabTestID = b.LabTestID
left join mst_Decode c on a.Units = c.Id
inner join ord_PatientLabOrder_Old d on a.LabID = d.LabID
inner join (select LabID, COUNT(LabID)N 
FROM dtl_PatientLabResults_Old
GROUP BY LabID) e ON a.LabID = e.LabID
where coalesce(CAST(case when a.TestResultId = 0 then null else a.TestResultId end as VARCHAR(100))
, CAST(a.TestResults AS VARCHAR(100))
, case when a.TestResults1 = '' THEN NULL ELSE a.TestResults1 END)
IS NOT NULL)



, CD4CountResults AS 
(Select distinct a.* FROM LabResults a
WHERE a.LabName = 'CD4' and (a.Units is null or a.Units = 'c/mm^3'))



, CD4CountOrders AS (
select a.Id LabOrderId
, a.Ptn_Pk
, a.VisitId
, a.PatientId
, a.PatientMasterVisitId
, b.Id LabOrderTestId
, c.Id LabOrderTestResultId
 from 
ord_LabOrder a INNER JOIN dtl_LabOrderTest b ON a.Id = b.LabOrderId
INNER JOIN dtl_LabOrderTestResult c ON b.Id = c.LabOrderTestId
where c.LabTestId = 1 and c.ParameterId = 1)


select a.*, b.TestResults_Numeric , b.ReportedbyDate, b.N
INTO tmp_CD4
from CD4CountOrders a INNER JOIN CD4CountResults b 
ON a.Ptn_Pk = b.Ptn_pk
AND a.VisitId = b.VisitId


UPDATE dtl_LabOrderTestResult
SET ResultValue = B.TestResults_Numeric
, DetectionLimit = 0
FROM dtl_LabOrderTestResult A 
INNER JOIN tmp_CD4 B ON A.Id = B.LabOrderTestResultId
GO

UPDATE PatientLabTracker
SET Results = 'Complete'
, ResultValues = B.TestResults_Numeric
, ResultDate = B.ReportedbyDate
FROM PatientLabTracker A INNER JOIN tmp_CD4 B ON A.LabOrderTestId = B.LabOrderTestId
GO

UPDATE dtl_LabOrderTest
SET ResultBy = 1
, ResultDate = B.ReportedbyDate
, ResultStatus = 'Received'
FROM dtl_LabOrderTest A  INNER JOIN tmp_CD4 B ON A.Id = B.LabOrderTestId
GO

UPDATE ord_LabOrder
SET OrderStatus = CASE WHEN B.N = 1 THEN 'Complete' ELSE 'Partially Completed' END
FROM ord_LabOrder A INNER JOIN tmp_CD4 B ON A.Id = B.LabOrderId
GO

IF EXISTS(Select name from sys.tables WHERE name = N'tmp_CD4')
DROP TABLE tmp_CD4
GO
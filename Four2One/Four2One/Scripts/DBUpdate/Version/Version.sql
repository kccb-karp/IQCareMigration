UPDATE AppAdmin
SET
	AppVer='Ver 1.0.0.7 Kenya HMIS',
	DBVer='Ver 1.0.0.7 Kenya HMIS',
	RelDate='16-Aug-2018',
	VersionName='Ver 1.0.0.7 Kenya HMIS'
GO

UPDATE mst_Module SET Status = 1
WHERE  ModuleName IN ('HIVCARE-STATICFORM')
GO

--UPDATE mst_Facility 
--set PaperLess = 0 
--, PMSCM = 0
--Where DeleteFlag = 0
--GO
If Not Exists(Select * from sys.columns where Name = N'FacilityID' AND Object_ID = Object_ID(N'lnk_GroupFeatures'))
BEGIN
ALTER  TABLE lnk_GroupFeatures ADD FacilityID INT CONSTRAINT DF_DEFAULT_FacilityID DEFAULT 0 NOT NULL;
END

If Not Exists(Select * from sys.columns where Name = N'ModuleID' AND Object_ID = Object_ID(N'lnk_GroupFeatures'))
BEGIN
ALTER  TABLE lnk_GroupFeatures ADD ModuleID INT CONSTRAINT DF_DEFAULT_ModuleID DEFAULT 0 NOT NULL;
END

If Not Exists(Select * from sys.columns where Name = N'TabID' AND Object_ID = Object_ID(N'lnk_GroupFeatures'))
BEGIN
ALTER  TABLE lnk_GroupFeatures ADD TabID INT CONSTRAINT DF_DEFAULT_TabID DEFAULT 0 NOT NULL;
END

If Not Exists(Select * from sys.columns where Name = N'FeatureName' AND Object_ID = Object_ID(N'lnk_GroupFeatures'))
BEGIN
ALTER  TABLE lnk_GroupFeatures ADD FeatureName varchar(150) CONSTRAINT DF_DEFAULT_FeatureName DEFAULT '' NOT NULL;
END

GO

insert into lnk_GroupFeatures (
FacilityID
, ModuleID
, FeatureID
, GroupID
, FeatureName
, TabID
, FunctionID
, CreateDate)
select 
facilityID = (select top 1 FacilityID from mst_Facility where DeleteFlag = 0)
, ModuleId = (select top 1 moduleid from mst_module where ModuleName = 'Pharmacy Module')
, featureid = (select top 1 featureid from mst_Feature where FeatureName = 'Pharmacy Module')
, GroupID
, 'Pharmacy Module'
, 0
, 1
, getdate()

from mst_Groups where DeleteFlag = 0;
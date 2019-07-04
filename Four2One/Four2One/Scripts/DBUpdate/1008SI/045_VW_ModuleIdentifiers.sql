IF EXISTS(select * FROM sys.views where name like  'VW_ModuleIdentifiers')
BEGIN
DROP VIEW dbo.VW_ModuleIdentifiers;
END
GO


CREATE VIEW [dbo].[VW_ModuleIdentifiers]
AS
SELECT        
mm.ModuleID
, mm.ModuleName
, mpi.ID AS FieldId
, mpi.FieldName
, mpi.FieldType
, mpi.Label AS FieldLabel
, mpi.AutoPopulateNumber
, mm.DeleteFlag
, mi.RequiredFlag
, mm.CanEnroll
, mm.DisplayName
FROM dbo.mst_module AS mm INNER JOIN
dbo.lnk_PatientModuleIdentifier AS mi ON mm.ModuleID = mi.ModuleID INNER JOIN
dbo.mst_PatientIdentifier AS mpi ON mpi.ID = mi.FieldID
WHERE (mm.DeleteFlag = 0) OR
(mm.DeleteFlag IS NULL);
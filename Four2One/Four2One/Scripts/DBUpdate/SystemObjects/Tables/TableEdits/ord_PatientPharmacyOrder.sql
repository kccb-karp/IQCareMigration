IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'PatientMasterVisitId'
	AND Object_ID = OBJECT_ID(N'ord_PatientPharmacyOrder'))
    BEGIN
        ALTER TABLE ord_PatientPharmacyOrder ADD PatientMasterVisitId INT NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'PatientId'
AND Object_ID = OBJECT_ID(N'ord_PatientPharmacyOrder'))
    BEGIN
        ALTER TABLE ord_PatientPharmacyOrder ADD PatientId INT NULL;
    END;
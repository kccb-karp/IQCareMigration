If Not Exists (Select * From sys.columns Where Name = N'TreatmentPlan' And Object_ID = Object_id(N'Ord_PatientPharmacyOrder'))    
Begin
	ALTER TABLE Ord_PatientPharmacyOrder
	ADD TreatmentPlan int;
End
Go

If Not Exists (Select * From sys.columns Where Name = N'NotDispensedNote' And Object_ID = Object_id(N'Ord_PatientPharmacyOrder'))    
Begin
	ALTER TABLE Ord_PatientPharmacyOrder
	ADD NotDispensedNote varchar(8000);
End
Go

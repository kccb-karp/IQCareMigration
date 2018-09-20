 If Not Exists (Select * From sys.columns Where Name = N'MorningDose' And Object_ID = Object_id(N'Dtl_PatientPharmacyOrder'))    
Begin
  ALTER TABLE Dtl_PatientPharmacyOrder
	ADD MorningDose decimal(10,2);
End
Go


 If Not Exists (Select * From sys.columns Where Name = N'MiddayDose' And Object_ID = Object_id(N'Dtl_PatientPharmacyOrder'))    
Begin
  ALTER TABLE Dtl_PatientPharmacyOrder
	ADD MiddayDose decimal(10,2);
End
Go


 If Not Exists (Select * From sys.columns Where Name = N'EveningDose' And Object_ID = Object_id(N'Dtl_PatientPharmacyOrder'))    
Begin
  ALTER TABLE Dtl_PatientPharmacyOrder
	ADD EveningDose decimal(10,2);
End
Go


 If Not Exists (Select * From sys.columns Where Name = N'NightDose' And Object_ID = Object_id(N'Dtl_PatientPharmacyOrder'))    
Begin
  ALTER TABLE Dtl_PatientPharmacyOrder
	ADD NightDose decimal(10,2);
End
Go


 If Not Exists (Select * From sys.columns Where Name = N'comments' And Object_ID = Object_id(N'Dtl_PatientPharmacyOrder'))    
Begin
  ALTER TABLE Dtl_PatientPharmacyOrder
	ADD Comments varchar(500);
End
Go



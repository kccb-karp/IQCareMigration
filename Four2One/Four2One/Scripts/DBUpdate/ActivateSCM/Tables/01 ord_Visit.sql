If Not Exists (Select * From sys.columns Where Name = N'PatientClassification' And Object_ID = Object_id(N'Ord_Visit'))    
Begin
	ALTER TABLE Ord_Visit
	ADD PatientClassification int,
	IsEnrolDifferenciatedCare bit,
	ARTRefillModel int;

End
Go

If Not Exists (Select * From sys.columns Where Name = N'IsEnrolDifferenciatedCare' And Object_ID = Object_id(N'Ord_Visit'))    
Begin
	ALTER TABLE Ord_Visit
	ADD IsEnrolDifferenciatedCare bit;

End
Go

If Not Exists (Select * From sys.columns Where Name = N'ARTRefillModel' And Object_ID = Object_id(N'Ord_Visit'))    
Begin
	ALTER TABLE Ord_Visit
	ADD ARTRefillModel int;

End
Go
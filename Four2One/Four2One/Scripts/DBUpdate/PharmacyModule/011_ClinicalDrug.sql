IF NOT EXISTS(Select * FROM sys.tables WHERE name = N'ClinicalDrug')
BEGIN

CREATE TABLE [dbo].ClinicalDrug(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [nvarchar](500) NOT NULL,
	[RxCui] INT NULL,
	[DoseFormGroupId] INT NOT NULL
 CONSTRAINT [PK_ClinicalDrug] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].ClinicalDrug WITH CHECK ADD  CONSTRAINT [FK_ClinicalDrug_DoseFormGroup_Id] FOREIGN KEY([DoseFormGroupId])
REFERENCES [dbo].[DoseFormGroup] ([Id]);

ALTER TABLE [dbo].ClinicalDrug CHECK CONSTRAINT [FK_ClinicalDrug_DoseFormGroup_Id]
END

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Abacavir (ABC) 300mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Abacavir (ABC) 300mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Abacavir/Lamivudine (ABC/3TC) 600/300mg FDC Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Abacavir/Lamivudine (ABC/3TC) 600/300mg FDC Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Atazanavir/Ritonavir (ATV/r) 300/100mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Atazanavir/Ritonavir (ATV/r) 300/100mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Darunavir (DRV) 600mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Darunavir (DRV) 600mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Dolutegravir(DTG) 50mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Dolutegravir(DTG) 50mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Efavirenz (EFV) 400mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Efavirenz (EFV) 400mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Efavirenz (EFV) 600mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Efavirenz (EFV) 600mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Etravirine (ETV) 200mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Etravirine (ETV) 200mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Lamivudine (3TC) 150mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Lamivudine (3TC) 150mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Lopinavir/ritonavir (LPV/r) 200/50mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Lopinavir/ritonavir (LPV/r) 200/50mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Nevirapine (NVP) 200mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Nevirapine (NVP) 200mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Raltegravir (RAL) 400mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Raltegravir (RAL) 400mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ritonavir (RTV) 100mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Ritonavir (RTV) 100mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Tenofovir (TDF) 300mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Tenofovir (TDF) 300mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Tenofovir/Emtricitabine (TDF/FTC) FDC (300/200mg) Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Tenofovir/Emtricitabine (TDF/FTC) FDC (300/200mg) Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Tenofovir/Lamivudine (TDF/3TC) FDC (300/300mg) Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Tenofovir/Lamivudine (TDF/3TC) FDC (300/300mg) Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Tenofovir/Lamivudine/Dolutegravir (TDF/3TC/DTG) FDC (300/300/50mg) FDC Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Tenofovir/Lamivudine/Dolutegravir (TDF/3TC/DTG) FDC (300/300/50mg) FDC Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/400mg) FDC Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/400mg) FDC Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/600mg) FDC Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/600mg) FDC Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Zidovudine (AZT) 300mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Zidovudine (AZT) 300mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Zidovudine/Lamivudine (AZT/3TC) FDC (300/150mg) Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Zidovudine/Lamivudine (AZT/3TC) FDC (300/150mg) Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (300/150/200mg) Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (300/150/200mg) Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Abacavir/Lamivudine (ABC/3TC) 120mg/60mg FDC Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Abacavir/Lamivudine (ABC/3TC) 120mg/60mg FDC Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Abacavir/Lamivudine (ABC/3TC) 60mg/30mg FDC Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Abacavir/Lamivudine (ABC/3TC) 60mg/30mg FDC Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Atazanavir (ATV) 100mg Caps') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Atazanavir (ATV) 100mg Caps',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Capsule'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Darunavir (DRV) 150mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Darunavir (DRV) 150mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Darunavir (DRV) 75mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Darunavir (DRV) 75mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Efavirenz (EFV) 200mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Efavirenz (EFV) 200mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Etravirine (ETV) 100mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Etravirine (ETV) 100mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Etravirine (ETV) 25mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Etravirine (ETV) 25mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Lopinavir/ritonavir (LPV/r) 100/25mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Lopinavir/ritonavir (LPV/r) 100/25mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Lopinavir/ritonavir (LPV/r) 40/10mg Caps') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Lopinavir/ritonavir (LPV/r) 40/10mg Caps',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Capsule'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Raltegravir (RAL) 100mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Raltegravir (RAL) 100mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Raltegravir (RAL) 25mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Raltegravir (RAL) 25mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Zidovudine/Lamivudine (AZT/3TC) FDC (60/30mg) Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Zidovudine/Lamivudine (AZT/3TC) FDC (60/30mg) Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (60/30/50mg) Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (60/30/50mg) Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Acyclovir 400mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Acyclovir 400mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Cotrimoxazole 960mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Cotrimoxazole 960mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Dapsone 100mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Dapsone 100mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Fluconazole 200mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Fluconazole 200mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Fluconazole 50mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Fluconazole 50mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ethambutol 400mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Ethambutol 400mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Isoniazid (H) 100mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Isoniazid (H) 100mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Isoniazid (H) 300mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Isoniazid (H) 300mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Pyrazinamide 500mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Pyrazinamide 500mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Pyridoxine 25mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Pyridoxine 25mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Pyridoxine 50mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Pyridoxine 50mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));
IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Rifabutin 150mg Tabs') INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) VALUES ('Rifabutin 150mg Tabs',(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));



IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Darunavir (DRV) Suspension 100mg/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Darunavir (DRV) Suspension 100mg/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Lamivudine (3TC) Liquid 10mg/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Lamivudine (3TC) Liquid 10mg/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Lopinavir/ritonavir (LPV/r) Liquid 80/20mg/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Lopinavir/ritonavir (LPV/r) Liquid 80/20mg/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Nevirapine (NVP) Suspension 10mg/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Nevirapine (NVP) Suspension 10mg/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ritonavir Liquid 80mg/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ritonavir Liquid 80mg/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Zidovudine (AZT) Liquid 10mg/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Zidovudine (AZT) Liquid 10mg/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Cotrimoxazole Suspension 240mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Cotrimoxazole Suspension 240mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Isoniazid (H) 10mg/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Isoniazid (H) 10mg/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));



IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Albendazole Suspension 100mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Albendazole Suspension 100mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Albendazole 400mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Albendazole 400mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Amoxicillin Trihydrate Powder for Suspension 125mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Amoxicillin Trihydrate Powder for Suspension 125mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Amoxicillin 500mg Capsules') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Amoxicillin 500mg Capsules'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Capsule'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Amoxicillin 250mg Capsules') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Amoxicillin 250mg Capsules'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Capsule'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Artemether/Lumefantrine 20mg/120mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Artemether/Lumefantrine 20mg/120mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Chlorpheniramine Syrup 2mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Chlorpheniramine Syrup 2mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Chlorpheniramine 4mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Chlorpheniramine 4mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Erythromycin Dry Powder for Suspension 125mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Erythromycin Dry Powder for Suspension 125mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Erythromycin 250mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Erythromycin 250mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Erythromycin 500mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Erythromycin 500mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ibuprofen Suspension 100mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ibuprofen Suspension 100mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ibuprofen 400mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ibuprofen 400mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ibuprofen 200mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ibuprofen 200mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Metronidazole Suspension 200mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Metronidazole Suspension 200mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Metronidazole 200mg Tablets') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Metronidazole 200mg Tablets'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Metronidazole 400mg Tablets') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Metronidazole 400mg Tablets'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Nystatin Oral Drops 100,000 IU/ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Nystatin Oral Drops 100,000 IU/ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));


IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Paracetamol Suspension 120mg/5ml') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Paracetamol Suspension 120mg/5ml'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Liquid'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Paracetamol 500mg Tablets') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Paracetamol 500mg Tablets'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ferrous Sulphate 200mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ferrous Sulphate 200mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Folic Acid 5mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Folic Acid 5mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Zinc Sulphate 20mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Zinc Sulphate 20mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Oral Rehydration Salts (ORS) for 500ml Solution Satchet') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Oral Rehydration Salts (ORS) for 500ml Solution Satchet'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Satchet'));

IF NOT EXISTS(Select * FROM ClinicalDrug 
WHERE DrugName = N'Oral Rehydration Salts (ORS) + Zinc Tablets 500ml/20mg (4 Sachets/10 Tabs)') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Oral Rehydration Salts (ORS) + Zinc Tablets 500ml/20mg (4 Sachets/10 Tabs)'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Packet'));


IF NOT EXISTS(Select * FROM ClinicalDrug 
WHERE DrugName = N'Amphotericin B 50mg IV Injection') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Amphotericin B 50mg IV Injection'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Vial'));


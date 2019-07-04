--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Rifampicin/Isoniazid/Pyrazinamide/Ethambutol (RHZE) 150/75/400/275mg FDC Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Rifampicin/Isoniazid/Pyrazinamide/Ethambutol (RHZE) 150/75/400/275mg FDC Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Pyrazinamide/Ethambutol (RHZE) 150/75/400/275mg FDC Tabs') 
AND UnitPackSize = 168) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Pyrazinamide/Ethambutol (RHZE) 150/75/400/275mg FDC Tabs')
, 168
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Rifampicin/Isoniazid/Ethambutol (RHE) 150/75/275mg FDC Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Rifampicin/Isoniazid/Ethambutol (RHE) 150/75/275mg FDC Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Ethambutol (RHE) 150/75/275mg FDC Tabs') 
AND UnitPackSize = 672) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Ethambutol (RHE) 150/75/275mg FDC Tabs')
, 672
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Rifampicin/Isoniazid (RH) 150/75mg FDC Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Rifampicin/Isoniazid (RH) 150/75mg FDC Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid (RH) 150/75mg FDC Tabs') 
AND UnitPackSize = 336) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid (RH) 150/75mg FDC Tabs')
, 336
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ethambutol/Isoniazid (EH) 400/150mg FDC Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ethambutol/Isoniazid (EH) 400/150mg FDC Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ethambutol/Isoniazid (EH) 400/150mg FDC Tabs') 
AND UnitPackSize = 504) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ethambutol/Isoniazid (EH) 400/150mg FDC Tabs')
, 504
, NULL
);

--/////

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ethambutol 400mg Tabs') 
AND UnitPackSize = 672) 
INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity)  
VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Ethambutol 400mg Tabs')
, 672
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ethambutol 400mg Tabs') 
AND UnitPackSize = 100) 
INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity)  
VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Ethambutol 400mg Tabs')
, 100
, NULL
);

--/////

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Pyrazinamide 500mg Tabs') 
AND UnitPackSize = 672) 
INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity)  
VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Pyrazinamide 500mg Tabs')
, 672
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Pyrazinamide 500mg Tabs') 
AND UnitPackSize = 100) 
INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity)  
VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Pyrazinamide 500mg Tabs')
, 100
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Rifampicin/Isoniazid/Pyrazinamide (RHZ) 75/50/150mg FDC Dispersible Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Rifampicin/Isoniazid/Pyrazinamide (RHZ) 75/50/150mg FDC Dispersible Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Pyrazinamide (RHZ) 75/50/150mg FDC Dispersible Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Pyrazinamide (RHZ) 75/50/150mg FDC Dispersible Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Pyrazinamide (RHZ) 75/50/150mg FDC Dispersible Tabs') 
AND UnitPackSize = 84) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid/Pyrazinamide (RHZ) 75/50/150mg FDC Dispersible Tabs')
, 84
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Rifampicin/Isoniazid (RH) 75/50mg FDC Dispersible Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Rifampicin/Isoniazid (RH) 75/50mg FDC Dispersible Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid (RH) 75/50mg FDC Dispersible Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid (RH) 75/50mg FDC Dispersible Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid (RH) 75/50mg FDC Dispersible Tabs') 
AND UnitPackSize = 84) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Rifampicin/Isoniazid (RH) 75/50mg FDC Dispersible Tabs')
, 84
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ethambutol 100mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ethambutol 100mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ethambutol 100mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ethambutol 100mg Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ethambutol 100mg Tabs') 
AND UnitPackSize = 500) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ethambutol 100mg Tabs')
, 500
, NULL
);



--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ofloxacin 200mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ofloxacin 200mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ofloxacin 200mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ofloxacin 200mg Tabs')
, 100
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ofloxacin 400mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ofloxacin 400mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ofloxacin 400mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ofloxacin 400mg Tabs')
, 100
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Levofloxacin 250mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Levofloxacin 250mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Levofloxacin 250mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Levofloxacin 250mg Tabs')
, 100
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Levofloxacin 500mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Levofloxacin 500mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Levofloxacin 500mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Levofloxacin 500mg Tabs')
, 100
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Moxifloxacin 400mg Tabs ') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Moxifloxacin 400mg Tabs '
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Moxifloxacin 400mg Tabs ') 
AND UnitPackSize = 5) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Moxifloxacin 400mg Tabs ')
, 5
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Ethionamide 250mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Ethionamide 250mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ethionamide 250mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ethionamide 250mg Tabs')
, 100
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Prothonamide 250mg Tabs') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Prothonamide 250mg Tabs'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Tablet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Prothonamide 250mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Prothonamide 250mg Tabs')
, 100
, NULL
);

--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Cycloserine 250mg Caps') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Cycloserine 250mg Caps'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Capsule'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Cycloserine 250mg Caps') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Cycloserine 250mg Caps')
, 100
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'P-aminosalicylic Acid (PAS) 4g Enteric-Coated Delayed-Release Granules in Sachets') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('P-aminosalicylic Acid (PAS) 4g Enteric-Coated Delayed-Release Granules in Sachets'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Satchet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'P-aminosalicylic Acid (PAS) 4g Enteric-Coated Delayed-Release Granules in Sachets') 
AND UnitPackSize = 30) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'P-aminosalicylic Acid (PAS) 4g Enteric-Coated Delayed-Release Granules in Sachets')
, 30
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'P-aminosalicylate Sodium Salt Powder for Oral Solution 5.52g Sachets') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('P-aminosalicylate Sodium Salt Powder for Oral Solution 5.52g Sachets'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Satchet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'P-aminosalicylate Sodium Salt Powder for Oral Solution 5.52g Sachets') 
AND UnitPackSize = 25) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'P-aminosalicylate Sodium Salt Powder for Oral Solution 5.52g Sachets')
, 25
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'P-aminosalicylate Sodium Enteric-Coated Delayed-Release Granules 60% w/w, 9.2g Sachets') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('P-aminosalicylate Sodium Enteric-Coated Delayed-Release Granules 60% w/w, 9.2g Sachets'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Satchet'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'P-aminosalicylate Sodium Enteric-Coated Delayed-Release Granules 60% w/w, 9.2g Sachets') 
AND UnitPackSize = 30) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'P-aminosalicylate Sodium Enteric-Coated Delayed-Release Granules 60% w/w, 9.2g Sachets')
, 30
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Terizidone 250mg Caps') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Terizidone 250mg Caps'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Oral Capsule'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Terizidone 250mg Caps') 
AND UnitPackSize = 50) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Terizidone 250mg Caps')
, 50
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Capreomycin 1g Powder for Injection') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Capreomycin 1g Powder for Injection'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Vial'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Capreomycin 1g Powder for Injection') 
AND UnitPackSize = 1) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Capreomycin 1g Powder for Injection')
, 1
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Kanamycin 1g Solution for Injection (4ml)') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Kanamycin 1g Solution for Injection (4ml)'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Vial'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Kanamycin 1g Solution for Injection (4ml)') 
AND UnitPackSize = 1) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Kanamycin 1g Solution for Injection (4ml)')
, 1
, NULL
);


--///////

IF NOT EXISTS(Select * FROM ClinicalDrug WHERE DrugName = N'Amikacin 500mg Solution for Injection (2ml)') 
INSERT INTO ClinicalDrug (DrugName, DoseFormGroupId) 
VALUES 
('Amikacin 500mg Solution for Injection (2ml)'
,(SELECT Id FROM DoseFormGroup WHERE DoseForm = N'Vial'));

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Amikacin 500mg Solution for Injection (2ml)') 
AND UnitPackSize = 1) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amikacin 500mg Solution for Injection (2ml)')
, 1
, NULL
);
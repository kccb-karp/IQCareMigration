IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugPackaging')
BEGIN

CREATE TABLE dbo.DrugPackaging(
	Id int IDENTITY(1,1) NOT NULL,
	ClinicalDrugId int NOT NULL,
	UnitPackSize int not null,
	LiquidCapacity int null
	CONSTRAINT [PK_DrugPackaging] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].DrugPackaging WITH CHECK ADD  CONSTRAINT [FK_DrugPackaging_ClinicalDrug_Id] 
FOREIGN KEY(ClinicalDrugId)
REFERENCES [dbo].ClinicalDrug ([Id]);

ALTER TABLE [dbo].DrugPackaging CHECK CONSTRAINT [FK_DrugPackaging_ClinicalDrug_Id]
END


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Abacavir (ABC) 300mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Abacavir (ABC) 300mg Tabs'), 60);
--IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 600/300mg FDC Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 600/300mg FDC Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 600/300mg FDC Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 600/300mg FDC Tabs'), 30);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Atazanavir/Ritonavir (ATV/r) 300/100mg Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Atazanavir/Ritonavir (ATV/r) 300/100mg Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) 600mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) 600mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Dolutegravir(DTG) 50mg Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Dolutegravir(DTG) 50mg Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Efavirenz (EFV) 400mg Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Efavirenz (EFV) 400mg Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Efavirenz (EFV) 600mg Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Efavirenz (EFV) 600mg Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Etravirine (ETV) 200mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Etravirine (ETV) 200mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Lamivudine (3TC) 150mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Lamivudine (3TC) 150mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) 200/50mg Tabs') AND UnitPackSize = 120) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) 200/50mg Tabs'), 120);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Nevirapine (NVP) 200mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Nevirapine (NVP) 200mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Raltegravir (RAL) 400mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Raltegravir (RAL) 400mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ritonavir (RTV) 100mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Ritonavir (RTV) 100mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Tenofovir (TDF) 300mg Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Tenofovir (TDF) 300mg Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Emtricitabine (TDF/FTC) FDC (300/200mg) Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Emtricitabine (TDF/FTC) FDC (300/200mg) Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine (TDF/3TC) FDC (300/300mg) Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine (TDF/3TC) FDC (300/300mg) Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine/Dolutegravir (TDF/3TC/DTG) FDC (300/300/50mg) FDC Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine/Dolutegravir (TDF/3TC/DTG) FDC (300/300/50mg) FDC Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/400mg) FDC Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/400mg) FDC Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/600mg) FDC Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Tenofovir/Lamivudine/Efavirenz (TDF/3TC/EFV) FDC (300/300/600mg) FDC Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Zidovudine (AZT) 300mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Zidovudine (AZT) 300mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine (AZT/3TC) FDC (300/150mg) Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine (AZT/3TC) FDC (300/150mg) Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (300/150/200mg) Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (300/150/200mg) Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 120mg/60mg FDC Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 120mg/60mg FDC Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 60mg/30mg FDC Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Abacavir/Lamivudine (ABC/3TC) 60mg/30mg FDC Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Atazanavir (ATV) 100mg Caps') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Atazanavir (ATV) 100mg Caps'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) 150mg Tabs') AND UnitPackSize = 240) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) 150mg Tabs'), 240);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) 75mg Tabs') AND UnitPackSize = 480) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) 75mg Tabs'), 480);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Efavirenz (EFV) 200mg Tabs') AND UnitPackSize = 90) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Efavirenz (EFV) 200mg Tabs'), 90);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Etravirine (ETV) 100mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Etravirine (ETV) 100mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Etravirine (ETV) 25mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Etravirine (ETV) 25mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) 100/25mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) 100/25mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) 40/10mg Caps') AND UnitPackSize = 120) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) 40/10mg Caps'), 120);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Raltegravir (RAL) 100mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Raltegravir (RAL) 100mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Raltegravir (RAL) 25mg Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Raltegravir (RAL) 25mg Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine (AZT/3TC) FDC (60/30mg) Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine (AZT/3TC) FDC (60/30mg) Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (60/30/50mg) Tabs') AND UnitPackSize = 60) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Zidovudine/Lamivudine/Nevirapine (AZT/3TC/NVP) FDC (60/30/50mg) Tabs'), 60);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Acyclovir 400mg Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Acyclovir 400mg Tabs'), 30);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Cotrimoxazole 960mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Cotrimoxazole 960mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Dapsone 100mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Dapsone 100mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Fluconazole 200mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Fluconazole 200mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Fluconazole 50mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Fluconazole 50mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ethambutol 400mg Tabs') AND UnitPackSize = 28) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Ethambutol 400mg Tabs'), 28);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 100mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 100mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 300mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 300mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 300mg Tabs') AND UnitPackSize = 672) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 300mg Tabs'), 672);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Pyrazinamide 500mg Tabs') AND UnitPackSize = 28) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Pyrazinamide 500mg Tabs'), 28);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Pyridoxine 25mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Pyridoxine 25mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Pyridoxine 50mg Tabs') AND UnitPackSize = 100) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Pyridoxine 50mg Tabs'), 100);
IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = (SELECT Id FROM ClinicalDrug WHERE DrugName = 'Rifabutin 150mg Tabs') AND UnitPackSize = 30) INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize) VALUES ((SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Rifabutin 150mg Tabs'), 30);



IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) Suspension 100mg/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 200) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Darunavir (DRV) Suspension 100mg/ml')
, 1
, 200
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Lamivudine (3TC) Liquid 10mg/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 240) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Lamivudine (3TC) Liquid 10mg/ml')
, 1
, 240
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) Liquid 80/20mg/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 60) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Lopinavir/ritonavir (LPV/r) Liquid 80/20mg/ml')
, 1
, 60
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Nevirapine (NVP) Suspension 10mg/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 100) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Nevirapine (NVP) Suspension 10mg/ml')
, 1
, 100
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ritonavir Liquid 80mg/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 90) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Ritonavir Liquid 80mg/ml')
, 1
, 90
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Zidovudine (AZT) Liquid 10mg/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 240) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Zidovudine (AZT) Liquid 10mg/ml')
, 1
, 240
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Cotrimoxazole Suspension 240mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 100) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Cotrimoxazole Suspension 240mg/5ml')
, 1
, 100
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 10mg/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 120) 

INSERT INTO DrugPackaging (ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Isoniazid (H) 10mg/ml')
, 1
, 120
);

--OI Drugs


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Albendazole Suspension 100mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 20) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug WHERE DrugName = 'Albendazole Suspension 100mg/5ml')
, 1
, 20
);



IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Albendazole 400mg Tabs') 
AND UnitPackSize = 100) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Albendazole 400mg Tabs')
, 100
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Amoxicillin Trihydrate Powder for Suspension 125mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 100) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amoxicillin Trihydrate Powder for Suspension 125mg/5ml')
, 1
, 100
);




IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Amoxicillin 500mg Capsules') 
AND UnitPackSize = 500) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amoxicillin 500mg Capsules')
, 500
, NULL
);




IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Amoxicillin 500mg Capsules') 
AND UnitPackSize = 100) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amoxicillin 500mg Capsules')
, 100
, NULL
);




IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Amoxicillin 250mg Capsules') 
AND UnitPackSize = 1000) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amoxicillin 250mg Capsules')
, 1000
, NULL
);




IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Amoxicillin 250mg Capsules') 
AND UnitPackSize = 500) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amoxicillin 250mg Capsules')
, 500
, NULL
);




IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Amoxicillin 250mg Capsules') 
AND UnitPackSize = 100) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amoxicillin 250mg Capsules')
, 100
, NULL
);





IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Artemether/Lumefantrine 20mg/120mg Tabs') 
AND UnitPackSize = 24) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Artemether/Lumefantrine 20mg/120mg Tabs')
, 24
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Artemether/Lumefantrine 20mg/120mg Tabs') 
AND UnitPackSize = 12) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Artemether/Lumefantrine 20mg/120mg Tabs')
, 12
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Artemether/Lumefantrine 20mg/120mg Tabs') 
AND UnitPackSize = 6) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Artemether/Lumefantrine 20mg/120mg Tabs')
, 6
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Chlorpheniramine Syrup 2mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 60) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Chlorpheniramine Syrup 2mg/5ml')
, 1
, 60
);




IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Chlorpheniramine 4mg Tabs') 
AND UnitPackSize = 1000) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Chlorpheniramine 4mg Tabs')
, 1000
, NULL
);




IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Erythromycin Dry Powder for Suspension 125mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 100) 
INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Erythromycin Dry Powder for Suspension 125mg/5ml')
, 1
, 100
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Erythromycin 250mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Erythromycin 250mg Tabs')
, 100
, NULL
);



IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Erythromycin 250mg Tabs') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Erythromycin 250mg Tabs')
, 1000
, NULL
);



IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Erythromycin 500mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Erythromycin 500mg Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ibuprofen Suspension 100mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ibuprofen Suspension 100mg/5ml')
, 1
, 100
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ibuprofen 400mg Tabs') 
AND UnitPackSize = 500) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ibuprofen 400mg Tabs')
, 500
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ibuprofen 400mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ibuprofen 400mg Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ibuprofen 200mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ibuprofen 200mg Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Ibuprofen 200mg Tabs') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ibuprofen 200mg Tabs')
, 1000
, NULL
);



IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Metronidazole Suspension 200mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Metronidazole Suspension 200mg/5ml')
, 1
, 100
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Metronidazole 200mg Tablets') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Metronidazole 200mg Tablets')
, 1000
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Metronidazole 200mg Tablets') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Metronidazole 200mg Tablets')
, 100
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Metronidazole 400mg Tablets') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Metronidazole 400mg Tablets')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Metronidazole 400mg Tablets') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Metronidazole 400mg Tablets')
, 1000
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Nystatin Oral Drops 100,000 IU/ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 30) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Nystatin Oral Drops 100,000 IU/ml')
, 1
, 30
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Paracetamol Suspension 120mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Paracetamol Suspension 120mg/5ml')
, 1
, 100
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Paracetamol Suspension 120mg/5ml') 
AND UnitPackSize = 1
AND LiquidCapacity = 60) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Paracetamol Suspension 120mg/5ml')
, 1
, 60
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug WHERE DrugName = 'Paracetamol 500mg Tablets') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Paracetamol 500mg Tablets')
, 1000
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs') 
AND UnitPackSize = 30) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs')
, 30
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg + Folic Acid 400mcg Tabs')
, 1000
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg Tabs') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg Tabs')
, 1000
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Ferrous Sulphate 200mg Tabs')
, 100
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Folic Acid 5mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Folic Acid 5mg Tabs')
, 100
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Folic Acid 5mg Tabs') 
AND UnitPackSize = 1000) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Folic Acid 5mg Tabs')
, 1000
, NULL
);


IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Zinc Sulphate 20mg Tabs') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Zinc Sulphate 20mg Tabs')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Oral Rehydration Salts (ORS) for 500ml Solution Satchet') 
AND UnitPackSize = 100) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Oral Rehydration Salts (ORS) for 500ml Solution Satchet')
, 100
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Oral Rehydration Salts (ORS) + Zinc Tablets 500ml/20mg (4 Sachets/10 Tabs)') 
AND UnitPackSize = 1) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Oral Rehydration Salts (ORS) + Zinc Tablets 500ml/20mg (4 Sachets/10 Tabs)')
, 1
, NULL
);

IF NOT EXISTS(SELECT * FROM DrugPackaging WHERE ClinicalDrugID = 
(SELECT Id FROM ClinicalDrug 
WHERE DrugName = 'Amphotericin B 50mg IV Injection') 
AND UnitPackSize = 1) 

INSERT INTO DrugPackaging 
(ClinicalDrugID, UnitPackSize, LiquidCapacity) 
VALUES 
(
(SELECT Id  FROM ClinicalDrug 
WHERE DrugName = 'Amphotericin B 50mg IV Injection')
, 1
, NULL
);
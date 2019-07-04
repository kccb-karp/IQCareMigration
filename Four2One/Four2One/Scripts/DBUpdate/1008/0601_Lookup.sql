-- PMTCT LOOKUPS

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='pnc-encounter')
BEGIN
	INSERT INTO LookupItem (Name,DisplayName,DeleteFlag) VALUES('pnc-encounter','pnc-encounter',0);
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE ItemName='pnc-encounter' AND MasterName='EncounterType')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='EncounterType'),(SELECT top 1 Id FROM LookupItem WHERE Name='pnc-encounter'),'pnc-encounter',10)
END

------------MotherExamination
-- master
If Not Exists(Select 1 From LookupMaster where Name='MotherExamination') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('MotherExamination','MotherExamination',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Breast') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Breast','Breast',0); End
If Not Exists(Select 1 From LookupItem where Name='Uterus') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Uterus','Uterus',0); End
If Not Exists(Select 1 From LookupItem where Name='Lochia') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Lochia','Lochia',0); End
If Not Exists(Select 1 From LookupItem where Name='PostPartumHaemorrhage') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('PostPartumHaemorrhage','PostPartumHaemorrhage',0); End
If Not Exists(Select 1 From LookupItem where Name='Episiotomy') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Episiotomy','Episiotomy',0); End
If Not Exists(Select 1 From LookupItem where Name='C_SectionSite') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('C_SectionSite','C_SectionSite',0); End
If Not Exists(Select 1 From LookupItem where Name='Fistula_Screening') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Fistula_Screening','Fistula_Screening',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Breast')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Breast'),'Breast',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Uterus')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Uterus'),'Uterus',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Lochia')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Lochia'),'Lochia',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='PostPartumHaemorrhage')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='PostPartumHaemorrhage'),'PostPartumHaemorrhage',4); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Episiotomy')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Episiotomy'),'Episiotomy',5); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='C_SectionSite')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='C_SectionSite'),'C_SectionSite',6); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Fistula_Screening')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='MotherExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Fistula_Screening'),'Fistula_Screening',7); end 


------------BabyExamination
-- master
If Not Exists(Select 1 From LookupMaster where Name='BabyExamination') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('BabyExamination','BabyExamination',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='babycondition') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('babycondition','babycondition',0); End
If Not Exists(Select 1 From LookupItem where Name='breastfeeding') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('breastfeeding','breastfeeding',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='BabyExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='babycondition')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='BabyExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='babycondition'),'babycondition',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='BabyExamination') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='breastfeeding')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='BabyExamination'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='breastfeeding'),'breastfeeding',2); end 

------------PNCBreast
-- master
If Not Exists(Select 1 From LookupMaster where Name='Breast') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Breast','Breast',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Normal') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Normal','Normal',0); End
If Not Exists(Select 1 From LookupItem where Name='Cracked') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Cracked','Cracked',0); End
If Not Exists(Select 1 From LookupItem where Name='Engorged') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Engorged','Engorged',0); End
If Not Exists(Select 1 From LookupItem where Name='Mastitis') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Mastitis','Mastitis',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal'),'Normal',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Cracked')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Cracked'),'Cracked',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Engorged')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Engorged'),'Engorged',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Mastitis')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Breast'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Mastitis'),'Mastitis',4); end 


------------PNCUterus
-- master
If Not Exists(Select 1 From LookupMaster where Name='Uterus') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Uterus','Uterus',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Contracted') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Contracted','Contracted',0); End
If Not Exists(Select 1 From LookupItem where Name='Not Contracted') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Not Contracted','Not Contracted',0); End
If Not Exists(Select 1 From LookupItem where Name='Other') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Other','Other',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Uterus') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Contracted')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Uterus'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Contracted'),'Contracted',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Uterus') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Not Contracted')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Uterus'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Not Contracted'),'Not Contracted',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Uterus') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Other')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Uterus'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Other'),'Other',3); end 


------------PNCLochia
-- master
If Not Exists(Select 1 From LookupMaster where Name='Lochia') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Lochia','Lochia',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Foul smelling') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Foul smelling','Foul smelling',0); End
If Not Exists(Select 1 From LookupItem where Name='Excessive') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Excessive','Excessive',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Lochia') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Lochia'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal'),'Normal',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Lochia') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Foul smelling')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Lochia'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Foul smelling'),'Foul smelling',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Lochia') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Excessive')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Lochia'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Excessive'),'Excessive',3); end 


------------PNCPostpartum haemorrhage						
-- master
If Not Exists(Select 1 From LookupMaster where Name='PostPartumHaemorrhage') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('PostPartumHaemorrhage','PostPartumHaemorrhage',0); End

-- LookupMasterItem
/*If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PostPartumHaemorrhage') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Contracted')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PostPartumHaemorrhage'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Contracted'),'Contracted',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PostPartumHaemorrhage') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Not Contracted')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PostPartumHaemorrhage'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Not Contracted'),'Not Contracted',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PostPartumHaemorrhage') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Other')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PostPartumHaemorrhage'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Other'),'Other',3); end 
*/

------------PNCEpisiotomy
-- master
If Not Exists(Select 1 From LookupMaster where Name='Episiotomy') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Episiotomy','Episiotomy',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Repaired') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Repaired','Repaired',0); End
If Not Exists(Select 1 From LookupItem where Name='Gaping') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Gaping','Gaping',0); End
If Not Exists(Select 1 From LookupItem where Name='Infected') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Infected','Infected',0); End
If Not Exists(Select 1 From LookupItem where Name='Healed') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Healed','Healed',0); End
If Not Exists(Select 1 From LookupItem where Name='N/A') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('N/A','N/A',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Repaired')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Repaired'),'Repaired',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Gaping')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Gaping'),'Gaping',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infected')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infected'),'Infected',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Healed')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Healed'),'Healed',4); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Episiotomy'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'N/A',5); end 



------------PNCC-Section Site
-- master
If Not Exists(Select 1 From LookupMaster where Name='C_SectionSite') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('C_SectionSite','C_SectionSite',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Bleeding') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Bleeding','Bleeding',0); End
-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal'),'Normal',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Bleeding')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Bleeding'),'Bleeding',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infected')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infected'),'Infected',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Gaping')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Gaping'),'Gaping',4); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='C_SectionSite'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'N/A',5); end 



------------PNC Fistula Screening				
-- master
If Not Exists(Select 1 From LookupMaster where Name='Fistula_Screening') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Fistula_Screening','Fistula_Screening',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='None') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('None','None',0); End
If Not Exists(Select 1 From LookupItem where Name='Rectovaginal Fistula') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Rectovaginal Fistula','Rectovaginal Fistula',0); End
If Not Exists(Select 1 From LookupItem where Name='Vesicovaginal Fistula') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Vesicovaginal Fistula','Vesicovaginal Fistula',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='None')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='None'),'None',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Rectovaginal Fistula')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Rectovaginal Fistula'),'Rectovaginal Fistula',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Vesicovaginal Fistula')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Vesicovaginal Fistula'),'Vesicovaginal Fistula',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Fistula_Screening'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'N/A',4); end 


------------PNC Baby Condition			
-- master
If Not Exists(Select 1 From LookupMaster where Name='Baby_Condition') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Baby_Condition','Baby_Condition',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Well') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Well','Well',0); End
If Not Exists(Select 1 From LookupItem where Name='Unwell') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Unwell','Unwell',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Baby_Condition') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Well')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Baby_Condition'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Well'),'Well',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Baby_Condition') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Unwell')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Baby_Condition'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Unwell'),'Unwell',2); end 


------------PNC Infant Drug		
-- master
If Not Exists(Select 1 From LookupMaster where Name='Infant_Drug') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Infant_Drug','Infant_Drug',0); End


-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Infant_Drug') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Zidovudine')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Infant_Drug'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Zidovudine'),'Zidovudine (AZT)',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='Infant_Drug') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Nevirapine')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Infant_Drug'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Nevirapine'),'Nevirapine (NVP)',2); end 

------------PNC Infant Drug Start or Continue	
-- master
If Not Exists(Select 1 From LookupMaster where Name='InfantDrugs_StartContinue') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('InfantDrugs_StartContinue','InfantDrugs_StartContinue',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Start') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Start','Start',0); End
If Not Exists(Select 1 From LookupItem where Name='Continue') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Continue','Continue',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='InfantDrugs_StartContinue') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Start')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='InfantDrugs_StartContinue'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Start'),'Start',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='InfantDrugs_StartContinue') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Continue')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='InfantDrugs_StartContinue'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Continue'),'Continue',2); end 


------------PNC Final HIV Result for Partner	
-- master
If Not Exists(Select 1 From LookupMaster where Name='FinalPartnerHivResult') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('FinalPartnerHivResult','FinalPartnerHivResult',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Positive') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Positive','Positive',0); End
If Not Exists(Select 1 From LookupItem where Name='Negative') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Negative','Negative',0); End
If Not Exists(Select 1 From LookupItem where Name='Known Positive') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Known Positive','Known Positive',0); End
If Not Exists(Select 1 From LookupItem where Name='N/A') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('N/A','N/A',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Positive')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Positive'),'Positive',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Negative')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Negative'),'Negative',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Known Positive')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Known Positive'),'Known Positive',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='FinalPartnerHivResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'N/A',4); end 


------------PNC Cervical Cancer Screening	
-- master
If Not Exists(Select 1 From LookupMaster where Name='CacxMethod') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('CacxMethod','CacxMethod',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Pap Smear') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Pap Smear','Pap Smear',0); End
If Not Exists(Select 1 From LookupItem where Name='VIA') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('VIA','VIA',0); End
If Not Exists(Select 1 From LookupItem where Name='VILI') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('VILI','VILI',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Pap Smear')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Pap Smear'),'Pap Smear',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='VIA')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='VIA'),'VIA',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='VILI')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='VILI'),'VILI',3); end 


------------PNC Cervical Cancer Screening Results
-- master
If Not Exists(Select 1 From LookupMaster where Name='CacxResult') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('CacxResult','CacxResult',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Normal') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Normal','Normal',0); End
If Not Exists(Select 1 From LookupItem where Name='Suspected') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Suspected','Suspected',0); End
If Not Exists(Select 1 From LookupItem where Name='Confirmed') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Confirmed','Confirmed',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal'),'Normal',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Suspected')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Suspected'),'Suspected',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Confirmed')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Confirmed'),'Confirmed',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'N/A',4); end 


------------PNC Visit Type
-- master
If Not Exists(Select 1 From LookupMaster where Name='PNCVisitType') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('PNCVisitType','PNCVisitType',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Initial PNC Visit') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Initial PNC Visit','Initial PNC Visit',0); End
If Not Exists(Select 1 From LookupItem where Name='Follow Up PNC Visit') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Follow Up PNC Visit','Follow Up PNC Visit',0); End
-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PNCVisitType') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Initial PNC Visit')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PNCVisitType'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Initial PNC Visit'),'Initial PNC Visit',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PNCVisitType') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Follow Up PNC Visit')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PNCVisitType'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Follow Up PNC Visit'),'Follow Up PNC Visit',2); end 


------------PncDrugAdministration
-- master
If Not Exists(Select 1 From LookupMaster where Name='PncDrugAdministration') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('PncDrugAdministration','PncDrugAdministration',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Started HAART in PNC') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Started HAART in PNC','Started HAART in PNC',0); End
If Not Exists(Select 1 From LookupItem where Name='Haematinics given') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Haematinics given','Haematinics given',0); End
If Not Exists(Select 1 From LookupItem where Name='Infant_Drug') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Infant_Drug','Infant_Drug',0); End
If Not Exists(Select 1 From LookupItem where Name='Infant_Start_Continue') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Infant_Start_Continue','Infant_Start_Continue',0); End

-- LookupMasterItem
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Started HAART in PNC')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Started HAART in PNC'),'Started HAART in PNC',1); end
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Haematinics given')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Haematinics given'),'Haematinics given',2); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infant_Drug')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infant_Drug'),'Infant_Drug',3); end 
If Not Exists(Select 1 From LookupMasterItem where LookupMasterId=(SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration') and LookupItemId=(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infant_Start_Continue')) Begin Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PncDrugAdministration'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infant_Start_Continue'),'Infant_Start_Continue',4); end 




IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='ANCVisitType')
BEGIN
INSERT INTO LookupMaster(Name,DisplayName,DeleteFlag)VALUES('ANCVisitType','ANCVisitType',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Follow Up ANC visit')
BEGIN 
INSERT INTO LookupItem(Name,DeleteFlag,DisplayName)VALUES('Follow Up ANC visit',0,'Follow Up ANC visit')
END
IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Initial ANC Visit')
BEGIN
INSERT INTO LookupItem(Name,DeleteFlag,DisplayName)VALUES('Initial ANC Visit',0,'Initial ANC Visit')
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='ANCVisitType' AND ItemName='Follow Up ANC visit')
BEGIN
INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank)VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='ANCVisitType'),(SELECT top 1 Id FROM LookupItem WHERE Name='Follow Up ANC visit'),'Follow Up ANC visit',2)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='ANCVisitType' AND ItemName='Initial ANC Visit')
BEGIN
INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank)VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='ANCVisitType'),(SELECT top 1 Id FROM LookupItem WHERE Name='Initial ANC Visit'),'Initial ANC Visit',1)
END

-------CacxMethod
IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='CaCxMethod')
BEGIN
	INSERT INTO LookupItem (Name,DisplayName,DeleteFlag) VALUES('CaCxMethod','CaCxMethod',0)
END
-- master
	-- lookupitem
	If Not Exists(Select 1 From LookupItem where Name='Pap Smear') 
	Begin 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Pap Smear','Pap Smear',0);
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('VIA','VIA',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('VILI','VILI',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Not Done','Not Done',0); 

	-- LookupMasterItem
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Pap Smear'),'Pap Smear',1)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='VIA'),'VIA',2)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='VILI'),'VILI',3)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxMethod'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Not Done'),'Not Done',4);
	END
---------CacxResult
-- master
If Not Exists(Select 1 From LookupMaster where Name='CacxResult') 
Begin 
	INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('CacxResult','Cacx Result',0); 
	-- lookupitem
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Normal','Normal',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Suspected','Suspected',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Confirmed','Confirmed',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('N/A','N/A',0); 


	-- LookupMasterItem
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Normal'),'Normal',1);
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Suspected'),'Suspected',2);
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Confirmed'),'Confirmed',3);
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CacxResult'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'N/A',4);
	END
--------Preventive Service
-- master
If Not Exists(Select 1 From LookupMaster where Name='PreventiveService') 
Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('PreventiveService','Preventive Service',0); 
	-- lookupitem
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('TT1','Tetanus Toxoid 1',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('TT2','Tetanus Toxoid 2',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('TT3','Tetanus Toxoid 3',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('TT4','Tetanus Toxoid 4',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('TT5','Tetanus Toxoid 5',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('IPTp1','Malaria Prophylaxis (IPTp1)',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('IPTp2','Malaria Prophylaxis (IPTp2)',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('IPTp3','Malaria Prophylaxis (IPTp3)',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Dewormed','Dewormed',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Vitamins','Vitamins',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Calcium','Calcium',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Iron','Iron',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Folate','Folate',0); 

	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('TreatedNet','Insecticide Treated Net',0); 
	INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('AntenatalExercise','Antenatal Exercise',0); 

	-- LookupMasterItem
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='TT1'),'Tetanus Toxoid 1',1)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='TT2'),'Tetanus Toxoid 2',2)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='TT3'),'Tetanus Toxoid 3',3)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='TT4'),'Tetanus Toxoid 4',4)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='TT5'),'Tetanus Toxoid 5',5)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='IPTp1'),'Malaria Prophylaxis (IPTp1)',6)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='IPTp2'),'Malaria Prophylaxis (IPTp2)',7)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='IPTp3'),'Malaria Prophylaxis (IPTp3)',8)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Dewormed'),'Dewormed',9)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Vitamins'),'Vitamins',10)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Calcium'),'Calcium',11)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Iron'),'Iron',12)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Folate'),'Folate',13)
	END
	-- Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='TreatedNet'),'Insecticide Treated Net',14)
	-- Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PreventiveService'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='AntenatalExercise'),'Antenatal Exercise',15)


------------Counselling Services
-- master
If Not Exists(Select 1 From LookupMaster where Name='Counselled On') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Counselled On','Counselled On',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Birth Plans') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Birth Plans','Birth Plans',0); End
If Not Exists(Select 1 From LookupItem where Name='Danger Signs') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Danger Signs','Danger Signs',0); End
If Not Exists(Select 1 From LookupItem where Name='Family Planning') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Family Planning','Family Planning',0); End
If Not Exists(Select 1 From LookupItem where Name='HIV') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('HIV','HIV',0); End
If Not Exists(Select 1 From LookupItem where Name='Supplemental Feeding') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Supplemental Feeding','Supplemental Feeding',0); End
If Not Exists(Select 1 From LookupItem where Name='Breast Care') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Breast Care','Breast Care',0); End
If Not Exists(Select 1 From LookupItem where Name='Infant Feeding') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Infant Feeding','Infant Feeding',0); End
If Not Exists(Select 1 From LookupItem where Name='Insecticide Treated Nets') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Insecticide Treated Nets','Insecticide Treated Nets',0); End

-- LookupMasterItem
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Birth Plans'),'Birth Plans',1)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Danger Signs'),'Danger Signs',2)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Family Planning'),'Family Planning',3)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='HIV'),'HIV',4)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Supplemental Feeding'),'Supplemental Feeding',5)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Breast Care'),'Breast Care',6)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Infant Feeding'),'Infant Feeding',7)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Counselled On'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Insecticide Treated Nets'),'Insecticide Treated Nets',8)

------------On ARV before 1st ANC Visit
-- master
If Not Exists(Select 1 From LookupMaster where Name='ARV before 1st ANCVisit') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('ARV before 1st ANCVisit','ARV before 1st ANCVisit',0); End

-- lookupitem
If Not Exists(Select 1 From LookupItem where Name='Yes') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('Yes','Known Positive',0); End
If Not Exists(Select 1 From LookupItem where Name='No') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('No','No',0); End
If Not Exists(Select 1 From LookupItem where Name='N/A') Begin INSERT INTO LookupItem (Name, DisplayName, DeleteFlag) VALUES ('N/A','Not Applicable',0); End

-- LookupMasterItem
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='ARV before 1st ANCVisit'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Yes'),'Yes',1)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='ARV before 1st ANCVisit'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='No'),'No',2)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='ARV before 1st ANCVisit'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'NA',3)

------------Started HAART in ANC
-- master
If Not Exists(Select 1 From LookupMaster where Name='Started HAART in ANC') 
Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('Started HAART in ANC'
,'Started HAART in ANC',0); End

-- LookupMasterItem
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Started HAART in ANC'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Yes'),'Yes',1)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Started HAART in ANC'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='No'),'No',2)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='Started HAART in ANC'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'NA',3)

------------CTX in ANC
-- master
If Not Exists(Select 1 From LookupMaster where Name='CTX in ANC') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('CTX in ANC','CTX in ANC',0); End
-- LookupMasterItem
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CTX in ANC'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Yes'),'Yes',1)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CTX in ANC'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='No'),'No',2)
Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='CTX in ANC'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'NA',3)

------------AZT for Baby
-- master
If Not Exists(Select 1 From LookupMaster where Name='AZT for Baby') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('AZT for Baby','AZT for Baby',0); End
-- LookupMasterItem
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='AZT for Baby'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Yes'),'Yes',1)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='AZT for Baby'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='No'),'No',2)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='AZT for Baby'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'NA',3)
------------NVP for Baby
-- master
If Not Exists(Select 1 From LookupMaster where Name='NVP for Baby') Begin INSERT INTO LookupMaster (Name, DisplayName, DeleteFlag) VALUES ('NVP for Baby','NVP for Baby',0); End
-- LookupMasterItem
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='NVP for Baby'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Yes'),'Yes',1)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='NVP for Baby'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='No'),'No',2)
	Insert Into LookupMasterItem(LookupMasterId ,LookupItemId,DisplayName, OrdRank)VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='NVP for Baby'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='N/A'),'NA',3)
-----TB Screening for PMTCT
-- lookupMaster
IF NOT EXISTS(SELECT * FROM lookupMaster WHERE Name='TBScreeningPMTCT')
BEGIN
	INSERT INTO LookupMaster(Name,DisplayName,DeleteFlag) VALUES('TBScreeningPMTCT','TBScreeningPMTCT',0)	
END

-- lookupItem
IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='No TB')
BEGIN
  INSERT INTO LookupItem(Name,DisplayName,DeleteFlag) VALUES('No TB','Negative TB screen',0)
END


IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='INH')
BEGIN
  INSERT INTO LookupItem(Name,DisplayName,DeleteFlag) VALUES('INH','Client was screened negative & started INH',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Not Done')
BEGIN
  INSERT INTO LookupItem(Name,DisplayName,DeleteFlag) VALUES('Not Done','Not Done',0)
END

-- lookupItemMaster
IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='TBScreeningPMTCT' AND ItemName='PrTB')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank)VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='TBScreeningPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='PrTB'),'PrTB: Presumed TB',1);
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='TBScreeningPMTCT' AND ItemName='No TB')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank)VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='TBScreeningPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='No TB'),'NoTB:Negative TB screen',2);
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='TBScreeningPMTCT' AND ItemName='INH')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank)VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='TBScreeningPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='INH'),'INH:Client was screened negative & started INH',3);

END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='TBScreeningPMTCT' AND ItemName='TBRx')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank)VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='TBScreeningPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='TBRx'),'TBRx: Client On TB treatment',4);

END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='TBScreeningPMTCT' AND ItemName='Not Done')
BEGIN
 INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank)VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='TBScreeningPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='Not Done'),'Not Done',5);
END
-----PMTCT Referrals
IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='pmtctReferrals')
BEGIN 
  INSERT INTO LookupMaster(name,DisplayName,DeleteFlag) VALUES('pmtctReferrals','pmtctReferrals',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem l WHERE Name ='Another Health Facility')
BEGIN
	INSERT INTO LookupItem(Name,DisplayName,DeleteFlag) VALUES('Another Health Facility','Another Health Facility',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Community Unit')
BEGIN
	INSERT INTO LookupItem(Name,DisplayName,DeleteFlag) VALUES('Community Unit','Community Unit',0)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='pmtctReferrals' AND ItemName='Another Health Facility')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='pmtctReferrals'),(SELECT top 1 Id FROM LookupItem WHERE Name='Another Health Facility'),'Another Health Facility',1)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='pmtctReferrals' AND ItemName='Community Unit')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='pmtctReferrals'),(SELECT top 1 Id FROM LookupItem WHERE Name='Community Unit'),'Community Unit',2)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='pmtctReferrals' AND ItemName='N/A')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='pmtctReferrals'),(SELECT top 1 Id FROM LookupItem WHERE Name='N/A'),'N/A',3)
END

---Breast Exam

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Breast Exam')
BEGIN 
  INSERT INTO LookupItem(Name,DisplayName,DeleteFlag)VALUES('Breast Exam','Breast Exam',0)
END

---Treated Syphilis
IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Treated Syphilis')
BEGIN 
  INSERT INTO LookupItem(Name,DisplayName,DeleteFlag)VALUES('Treated Syphilis','Treated Syphilis',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='On ARV before 1st ANC Visit')
BEGIN
	INSERT INTO LookupItem (Name,DisplayName,DeleteFlag) VALUES('On ARV before 1st ANC Visit','On ARV before 1st ANC Visit',0)
END
IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Started HAART in Service Point')
BEGIN
	INSERT INTO LookupItem (Name,DisplayName,DeleteFlag) VALUES('Started HAART in Service Point','Started HAART in Service Point',0)
END
IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Cotrimoxazole')
BEGIN
	INSERT INTO LookupItem (Name,DisplayName,DeleteFlag) VALUES('Cotrimoxazole','Cotrimoxazole',0)
END
IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='AZT for Baby')
BEGIN
	INSERT INTO LookupItem (Name,DisplayName,DeleteFlag) VALUES('AZT for Baby','AZT for Baby',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='NVP for Baby')
BEGIN
	INSERT INTO LookupItem (Name,DisplayName,DeleteFlag) VALUES('NVP for Baby','NVP for Baby',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Known Positive')
BEGIN
INSERT INTO LookupItem(name,DisplayName,DeleteFlag) VALUES('Known Positive','Known Positive',0)
END

IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='HIVFinalResultsPMTCT')
BEGIN
INSERT INTO LookupMaster(Name,DisplayName,DeleteFlag) VALUES('HIVFinalResultsPMTCT','HIVFinalResultsPMTCT',0)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='HIVFinalResultsPMTCT' AND ItemName='Positive')
BEGIN
INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='HIVFinalResultsPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='Positive'),'Positive',1)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='HIVFinalResultsPMTCT' AND ItemName='Negative')
BEGIN
INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='HIVFinalResultsPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='Negative'),'Negative',2)
END


IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='HIVFinalResultsPMTCT' AND ItemName='Known Positive')
BEGIN
INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='HIVFinalResultsPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='Known Positive'),'Known Positive',3)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='HIVFinalResultsPMTCT' AND ItemName='N/A')
BEGIN
INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT top 1 Id FROM LookupMaster WHERE Name='HIVFinalResultsPMTCT'),(SELECT top 1 Id FROM LookupItem WHERE Name='N/A'),'Positive',4)
END

IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='PMTCTHIVTests')
BEGIN 
  INSERT INTO LookupMaster(Name,DisplayName,DeleteFlag)VALUES('PMTCTHIVTests','PMTCTHIVTests',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='HIV Test-1')
BEGIN
	INSERT INTO LookupItem(name,DisplayName,DeleteFlag) VALUES('HIV Test-1','HIV Test-1',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='HIV Test-2')
BEGIN
	INSERT INTO LookupItem(name,DisplayName,DeleteFlag) VALUES('HIV Test-2','HIV Test-2',0)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='PMTCTHIVTests' AND ItemName='HIV Test-1')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PMTCTHIVTests'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='HIV Test-1'),'HIV Test-1',1)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='PMTCTHIVTests' AND ItemName='HIV Test-2')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PMTCTHIVTests'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='HIV Test-2'),'HIV Test-2',2)
END

IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='PMTCTHIVTestVisit')
BEGIN 
  INSERT INTO LookupMaster(Name,DisplayName,DeleteFlag)VALUES('PMTCTHIVTestVisit','PMTCTHIVTestVisit',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Initial')
BEGIN
	INSERT INTO LookupItem(name,DisplayName,DeleteFlag) VALUES('Initial','Initial',0)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Retest')
BEGIN
	INSERT INTO LookupItem(name,DisplayName,DeleteFlag) VALUES('Retest','Retest',0)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='PMTCTHIVTestVisit' AND ItemName='Initial')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PMTCTHIVTestVisit'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Initial'),'Initial',1)
END

IF NOT EXISTS(SELECT * FROM LookupItemView WHERE MasterName='PMTCTHIVTestVisit' AND ItemName='Retest')
BEGIN
	INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) VALUES((SELECT TOP 1 Id FROM LookupMaster WHERE Name='PMTCTHIVTestVisit'),(SELECT TOP 1 Id FROM LookupItem WHERE Name='Retest'),'Retest',2)
END
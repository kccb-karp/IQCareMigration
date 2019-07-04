IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='MissedAppointmentReasons')
BEGIN 
	INSERT INTO LookupMaster(Name,DisplayName) VALUES('MissedAppointmentReasons','Missed Appointment Reasons')  
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='WorkClinicDayConflict')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('WorkClinicDayConflict','Work/Clinic Day Conflict')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='WorkClinicDayConflict')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='WorkClinicDayConflict' ),'Work/Clinic Day Conflict'
  ,1)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='VerySick')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('VerySick','Very Sick')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='VerySick')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='VerySick' ),'Very Sick'
  ,2)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Forgot')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('Forgot','Forgot')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='Forgot')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='Forgot' ),'Forgot'
  ,3)
END


IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Travelled')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('Travelled','Travelled')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='Travelled')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='Travelled' ),'Travelled'
  ,4)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='HadEnoughDrugs')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('HadEnoughDrugs','Had Enough Drugs')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='HadEnoughDrugs')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='HadEnoughDrugs' ),'Had Enough Drugs'
  ,5)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='SelfTransferredOut')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('SelfTransferredOut','Self-Transferred Out')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='SelfTransferredOut')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='SelfTransferredOut' ),'Self-Transferred Out'
  ,6)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='ClinicalReasons')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('ClinicalReasons','Clinical Reasons')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='ClinicalReasons')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='ClinicalReasons' ),'Clinical Reasons'
  ,7)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Other')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('Other','Other')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentReasons' AND v.ItemName='Other')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentReasons')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='Other' ),'Other'
  ,8)
END
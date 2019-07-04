IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='MissedAppointmentActionTaken')
BEGIN 
	INSERT INTO LookupMaster(Name,DisplayName) VALUES('MissedAppointmentActionTaken','Missed Appointment ActionTaken')  
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='RescheduledAppointment')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('RescheduledAppointment','Re-scheduled Appointment')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentActionTaken' AND v.ItemName='RescheduledAppointment')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentActionTaken')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='RescheduledAppointment' ),'Re-scheduled Appointment'
  ,1)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='ContinuedFollowUp')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('ContinuedFollowUp','Continued Follow-Up')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentActionTaken' AND v.ItemName='ContinuedFollowUp')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentActionTaken')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='ContinuedFollowUp' ),'Continued Follow-Up'
  ,2)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='ReferredForSupportServices')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('ReferredForSupportServices','Referred for Support Services')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentActionTaken' AND v.ItemName='ReferredForSupportServices')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentActionTaken')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='ReferredForSupportServices' ),'Referred for Support Services'
  ,3)
END


IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='Other')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('Other','Other (specify in comments)')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='MissedAppointmentActionTaken' AND v.ItemName='Other')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='MissedAppointmentActionTaken')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='Other' ),'Other (specify in comments)'
  ,4)
END



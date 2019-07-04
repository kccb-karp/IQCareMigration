IF NOT EXISTS(SELECT * FROM LookupMaster WHERE Name='TracingProcessOptions')
BEGIN 
	INSERT INTO LookupMaster(Name,DisplayName) VALUES('TracingProcessOptions','Tracing Process Options')  
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='CallPatient')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('CallPatient','Call Patient')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='TracingProcessOptions' AND v.ItemName='CallPatient')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='TracingProcessOptions')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='CallPatient' ),'Call Patient'
  ,1)
END



IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='CallGuardian')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('CallGuardian','Call Guardian')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='TracingProcessOptions' AND v.ItemName='CallGuardian')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='TracingProcessOptions')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='CallGuardian' ),'Call Guardian'
  ,2)
END

IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='CallHCW')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('CallHCW','Call HCW')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='TracingProcessOptions' AND v.ItemName='CallHCW')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='TracingProcessOptions')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='CallHCW' ),'Call HCW'
  ,3)
END


IF NOT EXISTS(SELECT * FROM LookupItem WHERE Name='PhysicalTracing')
BEGIN 
	INSERT INTO LookupItem(Name,DisplayName) VALUES('PhysicalTracing','Physical Tracing')  
END

IF NOT EXISTS(SELECT * FROM LookupItemView v WHERE v.MasterName='TracingProcessOptions' AND v.ItemName='PhysicalTracing')
BEGIN
  INSERT INTO LookupMasterItem(LookupMasterId,LookupItemId,DisplayName,OrdRank) 
  VALUES((SELECT top 1 l.Id FROM LookupMaster l WHERE l.Name='TracingProcessOptions')
  ,(SELECT top 1 i.Id FROM LookupItem i WHERE i.Name='PhysicalTracing' ),'Physical Tracing'
  ,4)
END

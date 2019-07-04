
IF EXiSTS (select * from mst_control where  Name like '%Text SingleLine%')
BEGIN
UPDATE mst_control set ReferenceId='TXT_SINGLE_LINE' where  Name='Text SingleLine'
END

IF EXiSTS (select * from mst_control where  Name like '%DecimalTextBox%')
BEGIN
UPDATE mst_control set ReferenceId='DECIMAL_TXT' where  Name='DecimalTextBox'
END



IF EXiSTS (select * from mst_control where  Name like '%Numeric%')
BEGIN
UPDATE mst_control set ReferenceId='NUMERIC_TXT' where  Name='Numeric'
END



IF EXiSTS (select * from mst_control where  Name like '%Select List%')
BEGIN
UPDATE mst_control set ReferenceId='SELECT_LIST' where  Name='Select List';
update mst_control set LookupTable='Mst_ModDecode' where Name='Select List'
END




IF EXiSTS (select * from mst_control where  Name like '%Date%')
BEGIN
UPDATE mst_control set ReferenceId='DATE_TXT' where  Name='Date'
END



IF EXiSTS (select * from mst_control where  Name like '%Yes No%')
BEGIN
UPDATE mst_control set ReferenceId='YES_NO' where  Name='Yes No';
update mst_control set LookupTable='Mst_YesNo' where  Name='Yes No';
END


IF EXiSTS (select * from mst_control where  Name like '%CheckBox%')
BEGIN
UPDATE mst_control set ReferenceId='CHECK_BOX' where  Name='CheckBox'
END


IF EXiSTS (select * from mst_control where  Name like '%Text MulitLine%')
BEGIN
UPDATE mst_control set ReferenceId='TXT_MULTILINE' where  Name='Text MulitLine'
END



IF EXiSTS (select * from mst_control where  Name like '%Multi Select %')
BEGIN
UPDATE mst_control set ReferenceId='SELECT_LIST_MULTI' where  Name='Multi Select'
END



IF EXiSTS (select * from mst_control where  Name like '%Regimen%')
BEGIN
UPDATE mst_control set ReferenceId='REGIMEN' where  Name='Regimen'
END




IF EXiSTS (select * from mst_control where  Name like '%Drug Selection%')
BEGIN
UPDATE mst_control set ReferenceId='DRUG_FIELD' where  Name='Drug Selection'
END




IF EXiSTS (select * from mst_control where  Name like '%Lab Selection%')
BEGIN
UPDATE mst_control set ReferenceId='LAB_FIELD' where  Name='Lab Selection'
END



IF EXiSTS (select * from mst_control where  Name like '%PlaceHolder%')
BEGIN
UPDATE mst_control set ReferenceId='PLACE_HOLDER' where  Name='PlaceHolder'
END



IF EXiSTS (select * from mst_control where  Name like '%Time%')
BEGIN
UPDATE mst_control set ReferenceId='TIME_FIELD' where  Name='Time'
END






IF EXiSTS (select * from mst_control where  Name like '%Disease/Symptom%')
BEGIN
UPDATE mst_control set ReferenceId='DISEASE_SYMPTOM' where  Name='Disease/Symptom'
END




IF EXiSTS (select * from mst_control where  Name like '%ICD10%')
BEGIN
UPDATE mst_control set ReferenceId='ICD10_FIELD' where  Name='ICD10'
END


IF EXiSTS (select * from mst_control where  Name like '%System auto generated%')
BEGIN
UPDATE mst_control set ReferenceId='SYS_AUTOINCREMENT_FIELD' where  Name='System auto generated'
END




IF EXiSTS (select * from mst_control where  Name like '%BMI%')
BEGIN
UPDATE mst_control set ReferenceId='BMI_FIELD' where  Name='BMI'
END




IF EXiSTS (select * from mst_control where  Name like '%Text MultiLine Large%')
BEGIN
UPDATE mst_control set ReferenceId='TXT_MULTILINE_LARGE' where Name='Text MultiLine Large'
END




IF EXiSTS (select * from mst_control where  Name like '%Instruction Panel%')
BEGIN
UPDATE mst_control set ReferenceId='INSTRUCTIONS' where Name='Instruction Panel'
END





IF EXiSTS (select * from mst_control where  Name like '%Next Appointment%')
BEGIN
UPDATE mst_control set ReferenceId='NEXT_APPOINTMENT' where Name='Next Appointment'
END



IF EXiSTS (select * from mst_control where  Name like '%Select List TextBox%')
BEGIN
UPDATE mst_control set ReferenceId='SELECTLIST_TEXTBOX' where Name='Select List TextBox'

UPDATE mst_control SET LookupTable='Mst_ModDecode' where Name='Select List TextBox'
END



IF EXiSTS (select * from mst_control where  Name like '%Encrypted Field%')
BEGIN
UPDATE mst_control set ReferenceId='ENCRYPT_FIELD' where Name='Encrypted Field'
END



IF EXiSTS (select * from mst_control where  Name like '%Encrypted Field%')
BEGIN
UPDATE mst_control set ReferenceId='ENCRYPT_FIELD' where Name='Encrypted Field'
END


IF EXISTS(select * from mst_control  where Name like '%Button%')
BEGIN
UPDATE mst_control set ReferenceId='BUTTON' where Name='Button'
END




IF EXISTS(select * from mst_control  where Name like '%Drug List%')
BEGIN
UPDATE mst_control set ReferenceId='' where Name='Drug List'
END























































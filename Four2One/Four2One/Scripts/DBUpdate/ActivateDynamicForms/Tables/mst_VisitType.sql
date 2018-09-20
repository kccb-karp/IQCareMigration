IF EXISTS(select  * from mst_VisitType where VisitName='TB Module- Enrollment')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Enrollment'),Custom=0
where VisitName='TB Module- Enrollment'
END

IF EXISTS(select  * from mst_VisitType where VisitName='T B - Enrollment')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Enrollment'),Custom=0
where VisitName='TB - Enrollment'
END


IF EXISTS(select  * from mst_VisitType where VisitName='TB Patient Profile')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='TB Patient Profile'
END

IF EXISTS(select  * from mst_VisitType where VisitName='TB Initial and Continuation Phase')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='TB Initial and Continuation Phase'
END




IF EXISTS(select  * from mst_VisitType where VisitName='Intensive Case Finding')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='Intensive Case Finding'
END



IF EXISTS(select  * from mst_VisitType where VisitName='HEI Form')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='HEI Form'
END


IF EXISTS(select  * from mst_VisitType where VisitName='HEI Follow Up Card')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='HEI Follow Up Card'
END


IF EXISTS(select  * from mst_VisitType where VisitName='HEI Part II')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='HEI Part II'
END


IF EXISTS(select  * from mst_VisitType where VisitName='ANC Maternity and Postnatal - Enrollment')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Enrollment'),Custom=0
where VisitName='ANC Maternity and Postnatal - Enrollment'
END



IF EXISTS(select  * from mst_VisitType where VisitName='ANC Register MOH 405')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='ANC Register MOH 405'
END


IF EXISTS(select  * from mst_VisitType where VisitName='Cervical Cancer Case Finding - Enrollment')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Enrollment'),Custom=0
where VisitName='Cervical Cancer Case Finding - Enrollment'
END



IF EXISTS(select  * from mst_VisitType where VisitName='Cervical Cancer Screening Form')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='Cervical Cancer Screening Form'
END



IF EXISTS(select  * from mst_VisitType where VisitName='Maternal and Exposed Infant I')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='Maternal and Exposed Infant I'
END




IF EXISTS(select  * from mst_VisitType where VisitName='Maternal and Exposed Infant II')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='Maternal and Exposed Infant II'
END



IF EXISTS(select  * from mst_VisitType where VisitName='Maternal and Exposed Infant III')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Consultation'),Custom=1
where VisitName='Maternal and Exposed Infant III'
END




IF EXISTS(select  * from mst_VisitType where VisitName='TB Enrollment')
BEGIN
update mst_VisitType set CategoryId =(Select D.ID From mst_Decode D Inner Join mst_Code C On C.CodeID=D.CodeID 
And C.Name='Form Category' and  D.Name='Enrollment'),Custom=0
where VisitName='TB Enrollment'
END
IF EXISTS (select  * from mst_Feature where FeatureName='Pharmacy')
BEGIN
update mst_Feature set ReferenceId='PHARMACY'  where FeatureName='Pharmacy'
END

IF EXISTS (select  * from mst_Feature where FeatureName='Laboratory')
BEGIN
update mst_Feature set ReferenceId='LABORATORY'  where FeatureName='Laboratory'
END




IF EXISTS (select  * from mst_Feature where FeatureName='Configure Custom Fields')
BEGIN
update mst_Feature set ReferenceId='CONFIG_CUSTOM_FIELD'  where FeatureName='Configure Custom Fields'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Laboratory Configuration')
BEGIN
update mst_Feature set ReferenceId='MANAGE_LABORATORY'  where FeatureName='Laboratory Configuration'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Patient Registration')
BEGIN
update mst_Feature set ReferenceId='PATIENT_REGISTRATION'  where FeatureName='Patient Registration'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Initial and Follow up Visits')
BEGIN
update mst_Feature set ReferenceId='CCC_INITIAL_FOLLOWUP'  where FeatureName='Initial and Follow up Visits'
END


IF EXISTS (select  * from mst_Feature where FeatureName='ART History')
BEGIN
update mst_Feature set ReferenceId='ART_HISTORY'  where FeatureName='ART History'
END

IF EXISTS (select  * from mst_Feature where FeatureName='ART Therapy')
BEGIN
update mst_Feature set ReferenceId='ART_THERAPY'  where FeatureName='ART Therapy'
END


IF EXISTS (select  * from mst_Feature where FeatureName='Service Request')
BEGIN
update mst_Feature set ReferenceId='SERVICE_REQUEST'  where FeatureName='Service Request'
END




IF EXISTS (select  * from mst_Feature where FeatureName='Billables')
BEGIN
update mst_Feature set ReferenceId='BILLABLES_MANAGE'  where FeatureName='Billables'
END


IF EXISTS (select  * from mst_Feature where FeatureName='BillingType')
BEGIN
update mst_Feature set ReferenceId='BILLING_TYPE'  where FeatureName='BillingType'
END

IF EXISTS (select  * from mst_Feature where FeatureName='Client Billing')
BEGIN
update mst_Feature set ReferenceId='CLIENT_BILLING'  where FeatureName='Client Billing'
END


IF EXISTS (select  * from mst_Feature where FeatureName='Billing')
BEGIN
update mst_Feature set ReferenceId='BILLING_MODULE'  where FeatureName='Billing'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Billing Configuration')
BEGIN
update mst_Feature set ReferenceId='BILLING_CONFIGURATION'  where FeatureName='Billing Configuration'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Billing Reports')
BEGIN
update mst_Feature set ReferenceId='BILLING_REPORTS'  where FeatureName='Billing Reports'
END




IF EXISTS (select  * from mst_Feature where FeatureName='Billing Quick Panel')
BEGIN
update mst_Feature set ReferenceId='BILL_QUICK_PANEL'  where FeatureName='Billing Quick Panel'
END



IF EXISTS (select  * from mst_Feature where FeatureName='BillingChequePayment')
BEGIN
update mst_Feature set ReferenceId='BILL_CHEQUE_PAYMENT'  where FeatureName='BillingChequePayment'
END




IF EXISTS (select  * from mst_Feature where FeatureName='BillingInsurancePayment')
BEGIN
update mst_Feature set ReferenceId='BILL_INSURANCE_PAYMENT'  where FeatureName='BillingInsurancePayment'
END





IF EXISTS (select  * from mst_Feature where FeatureName='Bill Write Off')
BEGIN
update mst_Feature set ReferenceId='BILL_WRITE_OFF'  where FeatureName='Bill Write Off'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Billing - Return deposit')
BEGIN
update mst_Feature set ReferenceId='RETURN_DEPOSIT'  where FeatureName='Billing - Return deposit'
END


IF EXISTS (select  * from mst_Feature where FeatureName='BillingReceivePayment')
BEGIN
update mst_Feature set ReferenceId='BILL_RECEIVE_PAYMENT'  where FeatureName='BillingReceivePayment'
END


IF EXISTS (select  * from mst_Feature where FeatureName='Billing Credit Knock Off')
BEGIN
update mst_Feature set ReferenceId='BILLING_KNOCKOFF'  where FeatureName='Billing Credit Knock Off'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Waiting List')
BEGIN
update mst_Feature set ReferenceId='WAITING_LIST_MANAGE'  where FeatureName='Waiting List'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Consumables Issuance')
BEGIN
update mst_Feature set ReferenceId='CONSUMABLES_ISSUANCE'  where FeatureName='Consumables Issuance'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Patient Ward Admission')
BEGIN
update mst_Feature set ReferenceId='WARD_ADMIT'  where FeatureName='Patient Ward Admission'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Update Patient Ward Admission')
BEGIN
update mst_Feature set ReferenceId='WARD_ADMISSION_MODIFY'  where FeatureName='Update Patient Ward Admission'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Discharge from ward')
BEGIN
update mst_Feature set ReferenceId='WARD_DISCHARGE'  where FeatureName='Discharge from ward'
END


IF EXISTS (select  * from mst_Feature where FeatureName='Manage Clinical Services')
BEGIN
update mst_Feature set ReferenceId='MANAGE_CLINICALSERIVICES'  where FeatureName='Manage Clinical Services'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Laboratory Test Results')
BEGIN
update mst_Feature set ReferenceId='LABORATORY_RESULT'  where FeatureName='Laboratory Test Results'
END

IF EXISTS (select  * from mst_Feature where FeatureName='Laboratory Module')
BEGIN
update mst_Feature set ReferenceId='LABORATORY_MODULE'  where FeatureName='Laboratory Module'
END

IF EXISTS (select  * from mst_Feature where FeatureName='Admission Wards')
BEGIN
update mst_Feature set ReferenceId='MANAGE_ADMISSION_WARDS'  where FeatureName='Admission Wards'
END


IF EXISTS (select  * from mst_Feature where FeatureName='Setup Database Backup')
BEGIN
update mst_Feature set ReferenceId='SETUP_DATABASE_BACKUP'  where FeatureName='Setup Database Backup'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Restore Database')
BEGIN
update mst_Feature set ReferenceId='RESTORE_DATABASE'  where FeatureName='Restore Database'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Configure Custom Lists')
BEGIN
update mst_Feature set ReferenceId='CONFIG_CUSTOM_LIST'  where FeatureName='Configure Custom Lists'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Billing Reversal Approval')
BEGIN
update mst_Feature set ReferenceId='BILL_REVERSAL_APPROVAL'  where FeatureName='Billing Reversal Approval'
END



IF EXISTS (select  * from mst_Feature where FeatureName='Intensive Case Finding')
BEGIN
update mst_Feature set ReferenceId='ICF'  where FeatureName='Intensive Case Finding'
END

IF EXISTS (select  * from mst_Feature where FeatureName='CareEnd_PMTCT')
BEGIN
update mst_Feature set ReferenceId='PMTCT_CAREEND'  where FeatureName='CareEnd_PMTCT'
END




IF EXISTS (select  * from mst_Feature where FeatureName='NCD Initial Encounter')
BEGIN
update mst_Feature set ReferenceId='NCD Initial Encounter'  where FeatureName='NCD Initial Encounter'
END




IF EXISTS (select  * from mst_Feature where FeatureName='NCD Follow Up')
BEGIN
update mst_Feature set ReferenceId='NCD_Follow_Up'  where FeatureName='NCD Follow Up'
END



IF EXISTS (select  * from mst_Feature where FeatureName='CareEnd_CCC Patient Card MoH 257')
BEGIN
update mst_Feature set ReferenceId='CCC_CAREEND'  where FeatureName='CareEnd_CCC Patient Card MoH 257'
END
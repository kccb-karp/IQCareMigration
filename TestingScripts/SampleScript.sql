Select Ptn_pk, COUNT(Distinct VisitDate) Visits
FROM V4ClinicalEncounters
GROUP BY PatientID 



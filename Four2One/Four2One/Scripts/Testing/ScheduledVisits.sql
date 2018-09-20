---Script to chek migration of scheduled Vists
WITH V4VisitScheduled AS
  (SELECT a.Ptn_Pk,
          cast(c.VisitDate AS date)VisitDate,
          b.Scheduled
   FROM IQCareV4.dbo.CCCPatientsBeingMigrated a
   INNER JOIN dtl_PatientARTEncounter b ON a.ptn_pk=b.Ptn_Pk
   INNER JOIN ord_Visit c ON b.Ptn_Pk=c.Ptn_Pk
   AND b.Visit_Id=c.Visit_Id
   WHERE (c.DeleteFlag=0
          OR c.DeleteFlag IS NULL)) ,
     V1VisitScheduled AS
  (SELECT b.ptn_pk,
          cast(a.Visitdate AS date)Visitdate,
          a.VisitScheduled
   FROM PatientMasterVisit a
   INNER JOIN Patient b ON a.PatientId=b.Id
   INNER JOIN CCCEncountersBeingMigrated c ON b.ptn_pk = c.ptn_pk
   AND CAST(a.VisitDate AS date) = c.VisitDate
   WHERE a.VisitType = 0) ,
     LineList As
  (SELECT a.Ptn_pk , CASE
                         WHEN a.Scheduled !=b.VisitScheduled
                              OR (a.Scheduled IS NOT NULL
                                  AND b.VisitScheduled IS NULL) THEN 1
                         ELSE 0
                     END AS DoesNotMatch
   FROM V4VisitScheduled a
   LEFT JOIN V1VisitScheduled b ON a.ptn_pk=b.ptn_pk
   AND a.VisitDate=b.Visitdate)


SELECT 'Scheduled Visits' DataElement ,
                          count(Ptn_pk)Total ,
                          sum(DoesNotMatch)DoesNotMatch
FROM LineList
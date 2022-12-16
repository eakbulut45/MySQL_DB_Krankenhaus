-- 1- Gesucht sind alle Patienten, die männlich sind. Geben Sie Patientenname, Geburtsdatum und Blutgruppe aus, sortiert Patientenname nach .
SELECT
    CONCAT(p.vorname,' ',p.nachname) AS 'Patientenname',
    p.geburtsdatum AS 'Geburtsdatum',
    p.blutgruppe AS'Blutgruppe'
FROM
    krankenhaus.patient p
WHERE 
    p.geschlecht = 'M'
ORDER BY CONCAT(p.vorname,' ',p.nachname)
    ;
    
-- 2- Welche Arzt haben als Fachgebiet Augenheilkunde oder Allgemeinmedizin?

SELECT
    CONCAT(a.vorname,' ',a.nachname) AS 'Arztname',
    a.fachgebiet
    
FROM
    krankenhaus.arzt a
WHERE 
    a.fachgebiet = 'Augenheilkunde' OR  a.fachgebiet = 'Allgemeinmedizin'
    ;
    
-- 3- Wie viele Patienten hat Dr. Frau Müller?

SELECT
    COUNT(*) AS 'Anzahl der Patienten von Frau Müller'
FROM
    krankenhaus.arzt a
    JOIN krankenhaus.arzt_has_patient ahp ON a.idarzt = ahp.arzt_idarzt
WHERE a.nachname = 'Müller' AND a.vorname = 'Steffi'
    ;
    
-- 4-  Welches ist das niedrigste/höchste Gehalt von einem Arzt?

SELECT
     MAX(gehalt) AS 'höchste Gehalt',
     MIN(gehalt) AS 'niedrigste Gehalt'
FROM 
     krankenhaus.arzt a
     ;
     
-- 5- Welche Artz hat OP und mit welchen Patienten. Geben Sie  Artzname, Patientname und OP-Datum aus.

SELECT 
	CONCAT(a.vorname,' ',a.nachname) AS 'Arztname',
    CONCAT(p.vorname,' ',p.nachname) AS 'Patientenname',
	o.datum
FROM
    krankenhaus.arzt a
    JOIN krankenhaus.op o ON a.idarzt = o.arzt_idarzt
    JOIN krankenhaus.patient p ON o.patient_idpatient = p.idpatient
  ;  
  
-- 6- Welches Zimmer hat die höchste Bettenzahl?

SELECT
     MAX(bettenzahl) AS 'höchste Bettenzahl'
FROM 
     krankenhaus.zimmer 
     ;
-- 7- Welche Patienten bekommen Parol?
    
SELECT
     CONCAT(p.vorname,' ',p.nachname) AS 'Patientenname',
     m.name AS 'Medikamente Name'
FROM
    krankenhaus.patient p
    JOIN krankenhaus.medikamente_has_patient mhp ON p.idpatient = mhp.patient_idpatient
    JOIN krankenhaus.medikamente m ON mhp.medikamente_idmedikamente = m.idmedikamente
WHERE 
   m.name = 'Parol'
    ;  
-- 8- Welche Patienten, die operiert werden, haben 'B Rh-' oder 'AB Rh+' Blutgruppe?
    
SELECT 
	CONCAT(p.vorname,' ',p.nachname) AS 'Patientenname',
    p.blutgruppe
FROM
    krankenhaus.arzt a
    JOIN krankenhaus.op o ON a.idarzt = o.arzt_idarzt
    JOIN krankenhaus.patient p ON o.patient_idpatient = p.idpatient
WHERE 
    p.blutgruppe = 'B Rh-' OR  p.blutgruppe = 'AB Rh+'
  ;  
  
-- 9- Welche Patienten bleiben Zimmer Nummer 102, sortiert nach vorname.

SELECT
*
FROM
    krankenhaus.zimmer z
    JOIN krankenhaus.patient p ON z.idzimmer = p.zimmer_idzimmer
WHERE z.zimmer_nummer = 'Z-102'
ORDER BY p.vorname
;

-- 10- Welche Krankenschwester betreut welche Patient?

SELECT
     GROUP_CONCAT(DISTINCT CONCAT(p.vorname,' ',p.nachname) SEPARATOR ' | ') AS 'Name der Patienten',
	 GROUP_CONCAT(DISTINCT CONCAT(k.vorname,' ',k.nachname) SEPARATOR ' | ') AS 'Name der Krankenschwestern',
     z.zimmer_nummer
FROM
    krankenhaus.krankenschwester k
    JOIN krankenhaus.zimmer_has_krankenschwester zhk ON k.idkrankenschwester = zhk.krankenschwester_idkrankenschwester
    JOIN krankenhaus.zimmer z ON zhk.zimmer_idzimmer = z.idzimmer
	JOIN krankenhaus.patient p ON z.idzimmer = p.zimmer_idzimmer
    GROUP BY z.zimmer_nummer


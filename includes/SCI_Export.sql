SELECT
  patient.id AS pid,
  patient,
  CASE WHEN patient.gender='Male' THEN 'Herr' ELSE 'Frau' END || ' ' || COALESCE(patient.last_name, '') || ' ' || COALESCE(patient.first_name, '') AS patient_name,
  patient.four_letter_code,
    
  ((cast(response AS json))->>'Datum') as datum,
  TO_DATE(((cast(response AS json))->>'Datum'), 'YYYY-MM-DD HH24:MI:SS')  as datum_date,
  SUBSTRING(((cast(response AS json))->>'Datum'),12,5) AS datum_time,
  SUBSTRING(((cast(response AS json))->>'Datum'),1,4)::integer AS datum_year,
  EXTRACT(WEEK FROM TO_DATE(((cast(response AS json))->>'Datum'), 'YYYY-MM-DD HH24:MI:SS')) AS datum_week,
  ((cast(response AS json))->>'ESCIBelastung[ESCIB1]') as escibelastung_escib1,
  ((cast(response AS json))->>'ESCIBelastung[ESCIB2]') as escibelastung_escib2,
  ((cast(response AS json))->>'ESCIBelastung[ESCIB3]') as escibelastung_escib3,
  ((cast(response AS json))->>'ESCIBelastung[ESCIB4]') as escibelastung_escib4,
  ((cast(response AS json))->>'ESCIBelastung[ESCIB5]') as escibelastung_escib5,
  ((cast(response AS json))->>'ESCIBelastung[ESCIB6]') as escibelastung_escib6,
  ((cast(response AS json))->>'ESCIBelastung[ESCIB7]') as escibelastung_escib7,
  ((cast(response AS json))->>'ESCICoping[ESCIC1]') as escicoping_escic01,
  ((cast(response AS json))->>'ESCICoping[ESCIC2]') as escicoping_escic02,
  ((cast(response AS json))->>'ESCICoping[ESCIC3]') as escicoping_escic03,
  ((cast(response AS json))->>'ESCICoping[ESCIC4]') as escicoping_escic04,
  ((cast(response AS json))->>'ESCICoping[ESCIC5]') as escicoping_escic05,
  ((cast(response AS json))->>'ESCICoping[ESCIC6]') as escicoping_escic06,
  ((cast(response AS json))->>'ESCICoping[ESCIC7]') as escicoping_escic07,
  ((cast(response AS json))->>'ESCICoping[ESCIC8]') as escicoping_escic08,
  ((cast(response AS json))->>'ESCICoping[ESCIC90]') as escicoping_escic09,
  ((cast(response AS json))->>'ESCICoping[ESCIC10]') as escicoping_escic10,
  ((cast(response AS json))->>'ESCICoping[ESCIC11]') as escicoping_escic11,
  ((cast(response AS json))->>'ESCICoping[ESCIC12]') as escicoping_escic12,
  ((cast(response AS json))->>'ESCICoping[ESCIC13]') as escicoping_escic13,
  ((cast(response AS json))->>'ESCICoping[ESCIC14]') as escicoping_escic14,
  ((cast(response AS json))->>'ESCICoping[ESCIC15]') as escicoping_escic15,
  ((cast(response AS json))->>'ESCICoping[ESCIC16]') as escicoping_escic16,
  ((cast(response AS json))->>'ESCICoping[ESCIC17]') as escicoping_escic17,
  ((cast(response AS json))->>'ESCICoping[ESCIC18]') as escicoping_escic18,
  ((cast(response AS json))->>'ESCICoping[ESCIC19]') as escicoping_escic19,
  ((cast(response AS json))->>'ESCICoping[ESCIC20]') as escicoping_escic20,
  ((cast(response AS json))->>'ESCIOverstaining[ESCIO1]') as escioverstaining_escio1,
  ((cast(response AS json))->>'ESCIOverstaining[ESCIO2]') as escioverstaining_escio2,
  ((cast(response AS json))->>'ESCIOverstaining[ESCIO3]') as escioverstaining_escio3,
  ((cast(response AS json))->>'ESCIOverstaining[ESCIO4]') as escioverstaining_escio4,
  ((cast(response AS json))->>'ESCIOverstaining[ESCIO5]') as escioverstaining_escio5,
  ((cast(response AS json))->>'ESCIOverstaining[ESCIO6]') as escioverstaining_escio6,
  ((cast(response AS json))->>'ESCIOverstaining[ESCIO7]') as escioverstaining_escio7,
  ((cast(response AS json))->>'ESCISymptome[ESCIS1]') as escisymptome_escis01,
  ((cast(response AS json))->>'ESCISymptome[ESCIS2]') as escisymptome_escis02,
  ((cast(response AS json))->>'ESCISymptome[ESCIS3]') as escisymptome_escis03,
  ((cast(response AS json))->>'ESCISymptome[ESCIS4]') as escisymptome_escis04,
  ((cast(response AS json))->>'ESCISymptome[ESCIS5]') as escisymptome_escis05,
  ((cast(response AS json))->>'ESCISymptome[ESCIS6]') as escisymptome_escis06,
  ((cast(response AS json))->>'ESCISymptome[ESCIS7]') as escisymptome_escis07,
  ((cast(response AS json))->>'ESCISymptome[ESCIS8]') as escisymptome_escis08,
  ((cast(response AS json))->>'ESCISymptome[ESCIS9]') as escisymptome_escis09,
  ((cast(response AS json))->>'ESCISymptome[ESCI10]') as escisymptome_escis10,
  ((cast(response AS json))->>'ESCISymptome[ESCI11]') as escisymptome_escis11,
  ((cast(response AS json))->>'ESCISymptome[ESCI12]') as escisymptome_escis12,
  ((cast(response AS json))->>'ESCISymptome[ESCI13]') as escisymptome_escis13,
  ((cast(response AS json))->>'ESCIUnsicherheit[ESCIU1]') as esciunsicherheit_esciu1,
  ((cast(response AS json))->>'ESCIUnsicherheit[ESCIU2]') as esciunsicherheit_esciu2,
  ((cast(response AS json))->>'ESCIUnsicherheit[ESCIU3]') as esciunsicherheit_esciu3,
  ((cast(response AS json))->>'ESCIUnsicherheit[ESCIU4]') as esciunsicherheit_esciu4,
  ((cast(response AS json))->>'ESCIUnsicherheit[ESCIU5]') as esciunsicherheit_esciu5,
  ((cast(response AS json))->>'ESCIUnsicherheit[ESCIU6]') as esciunsicherheit_esciu6,
  ((cast(response AS json))->>'ESCIUnsicherheit[ESCIU7]') as esciunsicherheit_esciu7,
  ((cast(response AS json))->>'Erhebungszeitpunkt') as erhebungszeitpunkt,
  ((cast(response AS json))->>'FID') as fid,
  ((cast(response AS json))->>'PID') as pid,
  ((cast(response AS json))->>'andererZeitpunkt') as andererzeitpunkt,
  ((cast(response AS json))->>'datestamp') as datestamp,
  TO_DATE(((cast(response AS json))->>'datestamp'), 'YYYY-MM-DD HH24:MI:SS')  as datestamp_date,
  SUBSTRING(((cast(response AS json))->>'datestamp'),12,5) AS datestamp_time,
  SUBSTRING(((cast(response AS json))->>'datestamp'),1,4)::integer AS datestamp_year,
  EXTRACT(WEEK FROM TO_DATE(((cast(response AS json))->>'datestamp'), 'YYYY-MM-DD HH24:MI:SS')) AS datestamp_week,
  ((cast(response AS json))->>'id') as id,
  ((cast(response AS json))->>'lastpage') as lastpage,
  ((cast(response AS json))->>'optinomixHASH') as optinomixhash,
  ((cast(response AS json))->>'startdate') as startdate,
  TO_DATE(((cast(response AS json))->>'startdate'), 'YYYY-MM-DD HH24:MI:SS')  as startdate_date,
  SUBSTRING(((cast(response AS json))->>'startdate'),12,5) AS startdate_time,
  SUBSTRING(((cast(response AS json))->>'startdate'),1,4)::integer AS startdate_year,
  EXTRACT(WEEK FROM TO_DATE(((cast(response AS json))->>'startdate'), 'YYYY-MM-DD HH24:MI:SS')) AS startdate_week,
  ((cast(response AS json))->>'startlanguage') as startlanguage,
  ((cast(response AS json))->>'submitdate') as submitdate,
  TO_DATE(((cast(response AS json))->>'submitdate'), 'YYYY-MM-DD HH24:MI:SS')  as submitdate_date,
  SUBSTRING(((cast(response AS json))->>'submitdate'),12,5) AS submitdate_time,
  SUBSTRING(((cast(response AS json))->>'submitdate'),1,4)::integer AS submitdate_year,
  EXTRACT(WEEK FROM TO_DATE(((cast(response AS json))->>'submitdate'), 'YYYY-MM-DD HH24:MI:SS')) AS submitdate_week,

  random_hash,
  scheduled,
  filled,
  module,
  survey_response.id AS survey_response_id  

FROM survey_response 
INNER JOIN patient ON(survey_response.patient = patient.id) 

WHERE module = 'com.optinomic.apps.sci';



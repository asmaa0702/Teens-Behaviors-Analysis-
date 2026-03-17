USE chess
--Q1: avg Sleep_Hours according to gender ( هل السلوكيات ممكن تختلف حسب الجنس؟)
SELECT Gender
, ROUND(AVG(CAST(Sleep_Hours AS float)),2) AS Sleep_Hours
, ROUND(AVG(CAST(Exercise_Hours AS float)),2) AS Exercise_Hours
, ROUND(AVG(CAST(Addiction_Level AS float)),2) AS Addiction_Level
, ROUND(AVG(CAST(Daily_Usage_Hours AS float)),2) AS Daily_Usage_Hours
FROM teen_phone_addiction
where Gender!='other'
GROUP BY Gender;
--====================================================================================
--Q2: هل متوسط ساعات التعلم واللعب والسوشيال ميديا متكافئة مع الغرض عند استخدامات الهاتف؟
SELECT
Phone_Usage_Purpose,
count(Phone_Usage_Purpose) AS Phone_Usage_Purpose,
 ROUND(AVG(CAST(Time_on_Social_Media AS float)),2) AS Time_on_Social_Media,
 ROUND(AVG(CAST(Time_on_Gaming AS float)),2) AS Time_on_Gaming,
 ROUND(AVG(CAST(Time_on_Education AS float)),2) AS Time_on_Education
FROM teen_phone_addiction
GROUP BY Phone_Usage_Purpose;
--=====================================================================================
--Q3: هل المعدل الدراسي بيتأثر سواء بنت او ولد؟
SELECT Gender,
COUNT(Gender) As number,
ROUND(AVG(CAST(Academic_Performance AS float)),2) AS Academic_Performance
FROM teen_phone_addiction
where Gender!='other'
GROUP BY Gender;
--=====================================================================================
--Q4: هل متوسط التواصل مع الاهل بيختلف من جنس لآخر؟ وهل ده له علاقة بالاكتئاب والقلق؟
SELECT Gender,
COUNT(Gender) As number_without,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Gender!='other' AND Depression_Level<=5 AND Anxiety_Level<=5
GROUP BY Gender;
--
SELECT Gender,
COUNT(Gender) As number_with_Anxiety,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Gender!='other' AND Anxiety_Level>=5 AND Depression_Level<=5
GROUP BY Gender;
--
SELECT Gender,
COUNT(Gender) As number_with_Depression,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Gender!='other' AND Depression_Level>=5 AND Anxiety_Level<=5
GROUP BY Gender;
--
SELECT Gender,
COUNT(Gender) As number_with_both,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Gender!='other' AND Depression_Level>=5 AND Anxiety_Level>=5
GROUP BY Gender;
--====================================================================================
--Q5: هل متوسط الوقت في التعلم بيختلف مع زيادة القلق والاكتئاب بالنسب للجنسين؟
SELECT Gender,
COUNT(Gender) As number_without,
 ROUND(AVG(CAST(Time_on_Education AS float)),2) AS Time_on_Education,
 ROUND(AVG(CAST(Time_on_Social_Media AS float)),2) AS Time_on_Social_Media,
 ROUND(AVG(CAST(Time_on_Gaming AS float)),2) AS Time_on_Gaming
FROM teen_phone_addiction
where Gender!='other' AND Depression_Level<=5 AND Anxiety_Level<=5
GROUP BY Gender;
--
SELECT Gender,
COUNT(Gender) As number_with_Anxiety,
   ROUND(AVG(CAST(Time_on_Education AS float)),2) AS Time_on_Education,
   ROUND(AVG(CAST(Time_on_Social_Media AS float)),2) AS Time_on_Social_Media,
   ROUND(AVG(CAST(Time_on_Gaming AS float)),2) AS Time_on_Gaming
 FROM teen_phone_addiction
where Gender!='other' AND Anxiety_Level>=5 AND Depression_Level<=5
GROUP BY Gender;
--
SELECT Gender,
COUNT(Gender) As number_with_Depression,
   ROUND(AVG(CAST(Time_on_Education AS float)),2) AS Time_on_Education,
   ROUND(AVG(CAST(Time_on_Social_Media AS float)),2) AS Time_on_Social_Media,
   ROUND(AVG(CAST(Time_on_Gaming AS float)),2) AS Time_on_Gaming
 FROM teen_phone_addiction
where Gender!='other' AND Depression_Level>=5 AND Anxiety_Level<=5
GROUP BY Gender;
--
SELECT Gender,
COUNT(Gender) As number_with_both,
   ROUND(AVG(CAST(Time_on_Education AS float)),2) AS Time_on_Education,
   ROUND(AVG(CAST(Time_on_Social_Media AS float)),2) AS Time_on_Social_Media,
   ROUND(AVG(CAST(Time_on_Gaming AS float)),2) AS Time_on_Gaming
 FROM teen_phone_addiction
where Gender!='other' AND Depression_Level>=5 AND Anxiety_Level>=5
GROUP BY Gender;
--====================================================================================
--Q6: هل السن بيأثر على سبب استخدام الفون؟
SELECT Age,
COUNT(Age) As number,
   ROUND(AVG(CAST(Time_on_Education AS float)),2) AS Time_on_Education,
   ROUND(AVG(CAST(Time_on_Social_Media AS float)),2) AS Time_on_Social_Media,
   ROUND(AVG(CAST(Time_on_Gaming AS float)),2) AS Time_on_Gaming
 FROM teen_phone_addiction
 GROUP BY Age
 ORDER BY Age;
--====================================================================================
--Q7: هل السلوكيات ممكن تختلف حسب العمر؟
 SELECT Age,
 COUNT(Age) As number,
 ROUND(AVG(CAST(Sleep_Hours AS float)),2) AS Sleep_Hours,
 ROUND(AVG(CAST(Exercise_Hours AS float)),2) AS Exercise_Hours,
 ROUND(AVG(CAST(Addiction_Level AS float)),2) AS Addiction_Level,
 ROUND(AVG(CAST(Daily_Usage_Hours AS float)),2) AS Daily_Usage_Hours
FROM teen_phone_addiction
GROUP BY Age
 ORDER BY Age;
--====================================================================================
--Q8: هل متوسط التواصل مع الاهل بيختلف من عمر لآخر؟ وهل ده له علاقة بالاكتئاب والقلق؟
SELECT Age,
COUNT(Age) As number_without,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Depression_Level<=5 AND Anxiety_Level<=5
GROUP BY Age
ORDER BY Age;
--
SELECT Age,
COUNT(Age) As number_with_Anxiety,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Anxiety_Level>=5 AND Depression_Level<=5
GROUP BY Age
ORDER BY Age;
--
SELECT Age,
COUNT(Age) As number_with_Depression,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Depression_Level>=5 AND Anxiety_Level<=5
GROUP BY Age
ORDER BY Age;
--
SELECT Age,
COUNT(Age) As number_with_both,
ROUND(AVG(CAST(Family_Communication AS float)),2) AS Family_Communication
FROM teen_phone_addiction
where Depression_Level>=5 AND Anxiety_Level>=5
GROUP BY Age
ORDER BY Age;
--====================================================================================
--Q9: هل المعدل الدراسي بيتأثر بالسن؟
SELECT Age,
COUNT(Age) As number,
ROUND(AVG(CAST(Academic_Performance AS float)),2) AS Academic_Performance
FROM teen_phone_addiction
GROUP BY Age
ORDER BY Age;
--====================================================================================
--Q10: هل استخدام الهاتف قبل النوم بيأثر على النوم والتحصيل؟
SELECT 
   CASE 
      WHEN Screen_Time_Before_Bed <= 30 THEN '0-30 mins'
      WHEN Screen_Time_Before_Bed BETWEEN 31 AND 60 THEN '31-60 mins'
      WHEN Screen_Time_Before_Bed BETWEEN 61 AND 120 THEN '61-120 mins'
      ELSE '>120 mins'
   END AS Screen_Time_Category,
   ROUND(AVG(CAST(Sleep_Hours AS float)),2) AS Avg_Sleep_Hours,
   ROUND(AVG(CAST(Academic_Performance AS float)),2) AS Avg_Academic_Performance
FROM teen_phone_addiction
GROUP BY 
   CASE 
      WHEN Screen_Time_Before_Bed <= 30 THEN '0-30 mins'
      WHEN Screen_Time_Before_Bed BETWEEN 31 AND 60 THEN '31-60 mins'
      WHEN Screen_Time_Before_Bed BETWEEN 61 AND 120 THEN '61-120 mins'
      ELSE '>120 mins'
   END;
--====================================================================================
--Q11: هل كثرة فحص الهاتف مرتبطة بالإدمان والقلق والاكتئاب؟
SELECT 
   CASE 
      WHEN Phone_Checks_Per_Day < 20 THEN 'Low'
      WHEN Phone_Checks_Per_Day BETWEEN 20 AND 50 THEN 'Medium'
      ELSE 'High'
   END AS Checks_Category,
   ROUND(AVG(CAST(Addiction_Level AS float)),2) AS Avg_Addiction,
   ROUND(AVG(CAST(Anxiety_Level AS float)),2) AS Avg_Anxiety,
   ROUND(AVG(CAST(Depression_Level AS float)),2) AS Avg_Depression
FROM teen_phone_addiction
GROUP BY 
   CASE 
      WHEN Phone_Checks_Per_Day < 20 THEN 'Low'
      WHEN Phone_Checks_Per_Day BETWEEN 20 AND 50 THEN 'Medium'
      ELSE 'High'
   END;
--====================================================================================
--Q12: هل الرقابة الأبوية بتقلل الاستخدام وتحسن الدراسة؟
SELECT
  CASE WHEN Parental_Control = 1 THEN 'Control' ELSE 'No Control' END AS Control_Level,
  ROUND(AVG(CAST(Daily_Usage_Hours AS float)), 2) AS Avg_Daily_Usage,
  ROUND(AVG(CAST(Academic_Performance AS float)), 2) AS Avg_Academic
FROM teen_phone_addiction
GROUP BY
  CASE WHEN Parental_Control = 1 THEN 'Control' ELSE 'No Control' END;
--====================================================================================
--Q13: هل استخدام نهاية الأسبوع بيأثر على التمرين والتواصل الاجتماعي؟
SELECT 
   CASE 
      WHEN Weekend_Usage_Hours < 5 THEN 'Low Usage'
      WHEN Weekend_Usage_Hours BETWEEN 5 AND 10 THEN 'Medium Usage'
      ELSE 'High Usage'
   END AS Weekend_Usage_Category,
   ROUND(AVG(CAST(Exercise_Hours AS float)),2) AS Avg_Exercise,
   ROUND(AVG(CAST(Social_Interactions AS float)),2) AS Avg_Social
FROM teen_phone_addiction
GROUP BY 
   CASE 
      WHEN Weekend_Usage_Hours < 5 THEN 'Low Usage'
      WHEN Weekend_Usage_Hours BETWEEN 5 AND 10 THEN 'Medium Usage'
      ELSE 'High Usage'
   END;
--====================================================================================
--Q14: هل الغرض من استخدام الهاتف مرتبط بالحالة النفسية والتواصل الأسري؟
SELECT 
   Phone_Usage_Purpose,
   ROUND(AVG(CAST(Self_Esteem AS float)),2) AS Avg_SelfEsteem,
   ROUND(AVG(CAST(Depression_Level AS float)),2) AS Avg_Depression,
   ROUND(AVG(CAST(Anxiety_Level AS float)),2) AS Avg_Anxiety,
   ROUND(AVG(CAST(Family_Communication AS float)),2) AS Avg_Family_Comm
FROM teen_phone_addiction
GROUP BY Phone_Usage_Purpose;
--====================================================================================
--Q15: هل التوازن بين التعليم والترفيه بيأثر على تقدير الذات والأداء الأكاديمي؟
SELECT 
   Age,
   ROUND(AVG(CAST(Time_on_Education AS float)),2) AS Avg_Education,
   ROUND(AVG(CAST(Time_on_Gaming AS float)),2) AS Avg_Gaming,
   ROUND(AVG(CAST(Time_on_Social_Media AS float)),2) AS Avg_Social,
   ROUND(AVG(CAST(Self_Esteem AS float)),2) AS Avg_SelfEsteem,
   ROUND(AVG(CAST(Academic_Performance AS float)),2) AS Avg_Academic
FROM teen_phone_addiction
GROUP BY Age
ORDER BY Age;

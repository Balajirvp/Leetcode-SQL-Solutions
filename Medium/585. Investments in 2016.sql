-- Solution 1: (472 ms, 0 B)

WITH TEMP AS 
(
   SELECT LAT, LON, COUNT(*) AS CNT
   FROM INSURANCE
   GROUP BY 1,2
   HAVING CNT = 1
), TEMP1 AS
(
   SELECT TIV_2015, COUNT(*) AS CNT
   FROM INSURANCE
   GROUP BY 1
   HAVING CNT > 1
)

SELECT ROUND(SUM(TIV_2016),2) AS TIV_2016
FROM INSURANCE A 
WHERE TIV_2015 IN (SELECT TIV_2015 FROM TEMP1) AND LAT IN (SELECT LAT FROM TEMP) AND LON IN (SELECT LON FROM TEMP);
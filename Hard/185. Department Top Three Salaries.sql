-- Solution 1: (754 ms,	0 B)

SELECT DEPARTMENT, NAME AS EMPLOYEE, SALARY
FROM
(
    SELECT A.*, DENSE_RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS ROW_NUM
    FROM
    (
        SELECT A.*, B.NAME AS DEPARTMENT
        FROM EMPLOYEE A
        LEFT JOIN DEPARTMENT B
        ON A.DEPARTMENTID = B.ID
    ) A 
) A    
WHERE ROW_NUM <= 3;
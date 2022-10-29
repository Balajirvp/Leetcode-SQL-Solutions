-- Solution 1: (449 ms, 0 B)

SELECT DISTINCT ACCOUNT_ID 
FROM
(
    SELECT A.*, CASE WHEN NEXT_LOGIN >= LOGIN AND NEXT_LOGIN <= LOGOUT AND IP_ADDRESS != NEXT_IP_ADDRESS
                     THEN 1 ELSE 0 END AS FLAG
    FROM
    (
        SELECT A.*, LEAD(IP_ADDRESS) OVER (PARTITION BY ACCOUNT_ID ORDER BY LOGIN) AS NEXT_IP_ADDRESS,
                    LEAD(LOGIN) OVER (PARTITION BY ACCOUNT_ID ORDER BY LOGIN) AS NEXT_LOGIN
        FROM LOGINFO A
    ) A
    WHERE NEXT_LOGIN IS NOT NULL
) A
WHERE FLAG = 1;

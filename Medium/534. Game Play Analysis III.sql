-- Solution 1: (1049 ms, 0 B)

SELECT PLAYER_ID, EVENT_DATE, GAMES_PLAYED_SO_FAR
FROM
(
    SELECT PLAYER_ID, EVENT_DATE, GAMES_PLAYED, 
           SUM(GAMES_PLAYED) OVER (PARTITION BY PLAYER_ID ORDER BY EVENT_DATE ROWS UNBOUNDED PRECEDING) AS GAMES_PLAYED_SO_FAR
    FROM ACTIVITY
) A ;
SELECT hackers.HACKER_ID,hackers.NAME
FROM HACKERS
JOIN(
    SELECT HACKER_ID,COUNT(DIFF.CHALLENGE_ID) as CNT
    FROM SUBMISSIONS
    JOIN(
        SELECT Challenges.CHALLENGE_ID,Difficulty.SCORE AS MAX_SCORE
        FROM Challenges
        JOIN difficulty
        ON Challenges.DIFFICULTY_LEVEL=difficulty.DIFFICULTY_LEVEL
    ) AS DIFF
    ON SUBMISSIONS.CHALLENGE_ID=DIFF.CHALLENGE_ID
    AND SUBMISSIONS.SCORE=DIFF.MAX_SCORE
    GROUP BY HACKER_ID
)   AS HAHA
ON HAHA.HACKER_ID=hackers.HACKER_ID
AND HAHA.CNT>1
ORDER BY HAHA.CNT DESC,HAHA.HACKER_ID ASC 
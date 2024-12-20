SELECT WANDS.ID,WANDS_PROPERTY.AGE,WANDS.COINS_NEEDED,WANDS.POWER
FROM WANDS
JOIN WANDS_PROPERTY
ON WANDS.CODE=WANDS_PROPERTY.CODE
WHERE WANDS_PROPERTY.IS_EVIL=0
AND WANDS.COINS_NEEDED = (
    SELECT MIN(W1.COINS_NEEDED)
    FROM WANDS AS W1
    WHERE W1.POWER = WANDS.POWER AND W1.CODE = WANDS.CODE
)
GROUP BY WANDS.ID,WANDS_PROPERTY.AGE,WANDS.COINS_NEEDED,WANDS.POWER
ORDER BY WANDS.POWER DESC,WANDS_PROPERTY.AGE DESC

SELECT rslt2.id, rslt2.age, rslt2.coins_needed, rslt2.power
FROM
(
    SELECT age, a.power, MIN(coins_needed) AS min_coins
    FROM wands a, 
         wands_property b 
    WHERE a.code =b.code
    AND  is_evil = 0 
    GROUP BY age, a.power
)rslt1,
(
    SELECT id, age, a.power,coins_needed
    FROM wands a, 
         wands_property b 
    WHERE a.code =b.code
    AND  is_evil = 0 
)rslt2
WHERE rslt1.age = rslt2.age
AND   rslt1.power = rslt2.power
AND   rslt1.min_coins = rslt2.coins_needed 
ORDER BY rslt2.power DESC , rslt2.age DESC
SELECT *
FROM
(
    SELECT  hacker_id, NAME,SUM(score2) AS score3
    FROM 
    (

        SELECT a.hacker_id, a.name, b.challenge_id,MAX(score) AS score2
        FROM hackers a, 
             submissions b
        WHERE a.hacker_id = b.hacker_id 
        GROUP BY a.hacker_id, a.name, b.challenge_id
    )ref1
    GROUP BY  hacker_id, NAME
)rslt1
WHERE score3 > 0 
ORDER BY score3 DESC, hacker_id ASC
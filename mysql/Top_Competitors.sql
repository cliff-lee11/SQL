
    SELECT CONCAT(rslt2.hacker_id,"  ",rslt2.name) AS result  
    FROM 
    (
        SELECT ref2.name, ref2.hacker_id, COUNT(*)AS cnt 
        FROM
        (
            SELECT a.score AS fscore,b.*
            FROM difficulty a,
                 challenges b 
            WHERE a.difficulty_level = b.difficulty_level
        )ref1,
        (  
           SELECT c.name , d.*
           FROM hackers c, 
                submissions d
           WHERE c.hacker_id = d.hacker_id 
        )ref2
        WHERE ref1.challenge_id = ref2.challenge_id
        AND   ref1.fscore = ref2.score 
        GROUP BY ref2.name, ref2.hacker_id

    )rslt2
    WHERE cnt > 1 
    GROUP BY NAME, hacker_id, cnt
    ORDER BY cnt DESC , rslt2.hacker_id

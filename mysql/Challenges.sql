    
SELECT ref2.hacker_id, ref2.name, ref2.chall_cnt
FROM 
(
    SELECT  MAX(chall_cnt) AS getCnt
    FROM
    (
        SELECT a.hacker_id, a.name, COUNT(*) AS chall_cnt
        FROM hackers a, 
             challenges b 
        WHERE a.hacker_id = b.hacker_id 
        GROUP BY a.hacker_id, a.name 
    )ref1_1
    
    UNION 
    
        
    SELECT  chall_cnt
    FROM
    (
        SELECT a.hacker_id, a.name, COUNT(*) AS chall_cnt
        FROM hackers a, 
             challenges b 
        WHERE a.hacker_id = b.hacker_id 
        GROUP BY a.hacker_id, a.name 
    )ref1_1
    GROUP BY chall_cnt 
    HAVING COUNT(chall_cnt) = 1
    
)ref1,
(
    SELECT a.hacker_id, a.name, COUNT(*) AS chall_cnt
    FROM hackers a, 
         challenges b 
    WHERE a.hacker_id = b.hacker_id 
    GROUP BY a.hacker_id, a.name 
    
)ref2
WHERE ref1.getCnt = ref2.chall_cnt 
ORDER BY ref2.chall_cnt DESC , ref2.hacker_id ASC 


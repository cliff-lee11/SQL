SELECT ref1.name
FROM 
(
    SELECT a.id, a.name, b.salary
    FROM students a,
         packages b 
    WHERE a.id = b.id 
)ref1,
(
    SELECT a.id, a.friend_id, b.salary AS f_salary
    FROM friends a,
         packages b 
    WHERE a.friend_id = b.id 
    
)ref2
WHERE ref1.id = ref2.id
AND   ref1.salary < ref2.f_salary
ORDER BY ref2.f_salary 

     
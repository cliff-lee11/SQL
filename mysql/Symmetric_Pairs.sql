
SELECT  DISTINCT X,Y
FROM 
(
    SELECT X,Y 
    FROM Functions
)ref1,
(
    SELECT X2,Y2, IF(cnt > 1,IF(X2=y2,1,0),IF(X2=Y2,0,1))AS d
    FROM
    (
        SELECT X AS X2,Y AS Y2 , COUNT(*)AS cnt 
        FROM Functions
        GROUP BY X,Y 
    )rslt1
    HAVING  d > 0 
    
)ref2
WHERE ref1.X = ref2.Y2
AND   ref2.X2 = ref1.Y
AND   ref1.X <= ref2.X2
ORDER BY ref1.X
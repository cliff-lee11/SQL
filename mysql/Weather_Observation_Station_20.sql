
SET @num = 0; 

SELECT ROUND(SUM(lat_n),4)
FROM 
(
    
    SELECT CEIL(cnt/2) AS med
    FROM
    (
        SELECT COUNT(*) AS cnt 
        FROM station
    )rslt1
    UNION 
    
    SELECT IF(cnt%2=0,FLOOR(cnt/2),0) AS med
    FROM
    (
        SELECT COUNT(*) AS cnt 
        FROM station
    )rslt2
)ref1,
(   
   SELECT @num:=@num+1 AS seq,lat_n
   FROM station
   ORDER BY lat_n
   
)ref2 
WHERE med = seq

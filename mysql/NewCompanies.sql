SELECT ref1.company_code, ref1.founder, lCnt, SCnt, MCnt, ECnt
FROM 
(
	SELECT DISTINCT *
	FROM company 
)ref1,
(
	
    SELECT DISTINCT company_code, COUNT(*) AS lCnt
    FROM 
    ( SELECT DISTINCT * 
	  FROM Lead_Manager
	)rr1
     GROUP BY company_code
)ref2, 
(
    SELECT DISTINCT company_code, COUNT(*) AS SCnt
    FROM 
    (
		SELECT DISTINCT * 
		FROM Senior_Manager	
	)rr2
	GROUP BY company_code
)ref3,
(
    SELECT DISTINCT company_code, COUNT(*) AS MCnt
    FROM 
    (
		SELECT DISTINCT * 
		FROM Manager 
	)rr3
    GROUP BY company_code
    
)ref4,
(
    SELECT DISTINCT company_code, COUNT(*) AS ECnt
    FROM
    (
		SELECT DISTINCT * 
		FROM Employee
	)rr4
    GROUP BY company_code
    
)ref5
WHERE ref1.company_code = ref2.company_code
AND   ref1.company_code = ref3.company_code
AND   ref1.company_code = ref4.company_code
AND   ref1.company_code = ref5.company_code
ORDER BY ref1.company_code



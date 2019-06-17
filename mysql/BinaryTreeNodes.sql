# IF(p IS NULL AND n2 IS NULL,'Leaf',IF(n = n2,'Root','Inner')) AS expl


SELECT *
FROM 
(
	SELECT n, 'Leaf' AS expl
	FROM
	(
		SELECT n
		FROM BinaryTreeNodes
	)a LEFT JOIN 
	(
		SELECT p, n AS n2 
		FROM BinaryTreeNodes
		WHERE p IS NOT NULL
	)b 
	ON n = p 
	WHERE p IS NULL
	 
	
	UNION 

  	SELECT DISTINCT n, 'Inner' AS expl
	FROM
	(
		SELECT n
		FROM BinaryTreeNodes
		WHERE p IS NOT NULL
	)a LEFT JOIN 
	(
		SELECT p, n AS n2 
		FROM BinaryTreeNodes
		WHERE p IS NOT NULL
	)b 
	ON n = p 
	WHERE p IS NOT NULL
	
	UNION

   SELECT n , 'Root' AS expl
   FROM BinaryTreeNodes
   WHERE p  IS NULL 
)rslt1
ORDER BY n 

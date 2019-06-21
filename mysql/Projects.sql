SET @grpnum:=0;

SELECT MIN(start_date) AS start_date, MAX(end_date) AS end_date
FROM
(

	SELECT * 
	FROM 
	(
		SELECT ref1.start_date AS start_date, ref1.end_date AS end_date, ref2.end_date AS  bf_start_date,
			   IF(ref1.start_date = ref2.end_date,@grpnum,@grpnum:=@grpnum+1) AS grp
		FROM 
		( 
		   SELECT  @rownum:=@rownum+1 AS seq, start_date, end_date 
		   FROM projects ,
				(SELECT @rownum:=0) TMP
		   ORDER BY start_date, end_date
		)ref1 LEFT JOIN 
		( 
		   SELECT  @rownum2:=@rownum2+1 AS seq, start_date, end_date 
		   FROM projects ,
				(SELECT @rownum2:=0) TMP
		   ORDER BY start_date, end_date
		)ref2

		ON  ref1.seq-1 = ref2.seq
	)ref3 
)rslt
GROUP BY grp 
ORDER BY COUNT(*) ASC, start_date ASC
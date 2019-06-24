SET @cont := 0;

SELECT rslt4.submission_date, uniqueCnt,hac.hacker_id, hac.name
FROM 
(
	SELECT rslt3.submission_date, COUNT(ex2) AS uniqueCnt
	FROM
	(
		SELECT rslt1.submission_date, rslt1.hacker_id,  rslt1.exist, 
			   IF( rslt2.exist IS NULL, @cont:=0, IF(rslt2.exist =0, @cont:=0, IF(rslt1.exist=0,@count:=0,@cont:=@cont+1))) AS ex2
		FROM 
		(
			SELECT ref2.submission_date,hacker_id,IF( INSTR(hlist, hacker_id) > 0,1,0) AS exist
			FROM 
			(
				SELECT submission_date,GROUP_CONCAT(hacker_id SEPARATOR '|') AS hlist
				FROM
				(
					SELECT DISTINCT submission_date , hacker_id
					FROM submissions
					#WHERE submission_date <> ( SELECT MIN(submission_date) FROM submissions)
				)ref1
				GROUP BY submission_date
			)ref2,
			(
				SELECT DISTINCT hacker_id  
				FROM submissions 
				WHERE submission_date = ( SELECT MIN(submission_date) FROM submissions)
			)ref3
			ORDER BY hacker_id , submission_date
		)rslt1 LEFT JOIN 
		(
			SELECT ref2.submission_date,hacker_id,IF( INSTR(hlist, hacker_id) > 0,1,0) AS exist
			FROM 
			(
				SELECT submission_date,GROUP_CONCAT(hacker_id SEPARATOR '|') AS hlist
				FROM
				(
					SELECT DISTINCT submission_date  , hacker_id
					FROM submissions
					#WHERE submission_date <> ( SELECT MIN(submission_date) FROM submissions)
				)ref1
				GROUP BY submission_date
			)ref2,
			(
				SELECT DISTINCT hacker_id  
				FROM submissions 
				WHERE submission_date = ( SELECT MIN(submission_date) FROM submissions)
			)ref3
			ORDER BY hacker_id , submission_date
		)rslt2 
		ON rslt1.submission_date-1 = rslt2.submission_date
		AND rslt1.hacker_id = rslt2.hacker_id 
	)rslt3
	WHERE submission_date - (SELECT MIN(submission_date) FROM submissions) = ex2 
	#AND submission_date - (SELECT MIN(submission_date) FROM submissions) > 0 
	GROUP BY submission_date
)rslt4,
(

	SELECT MAX(submission_date)AS submission_date, MIN(hacker_id) AS hacker_id 
	FROM
	(
		SELECT ref11.submission_date, ref11.hacker_id
		FROM 
		(
			SELECT submission_date, hacker_id, COUNT(*) AS cnt 
			FROM submissions 
			GROUP BY submission_date, hacker_id
		)ref11,
		(

			SELECT MAX(submission_date) AS submission_date , MAX(cnt) AS mcnt
			FROM
			(
				SELECT submission_date, COUNT(*) AS cnt 
				FROM submissions 
				GROUP BY submission_date, hacker_id
			)ref12
			GROUP BY submission_date
			
		)ref13
		WHERE ref11.cnt = ref13.mcnt 
		AND   ref11.submission_date = ref13.submission_date
	)ref14
	GROUP BY submission_date

)rslt15,
hackers hac 
WHERE rslt4.submission_date = rslt15.submission_date
AND   rslt15.hacker_id = hac.hacker_id
ORDER BY rslt4.submission_date
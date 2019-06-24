SELECT rslt.contest_id, rslt.hacker_id, rslt.name, SUM(sum_total_submissions) AS sum_total_submissions,
	   SUM(sum_total_accepted_submissions) AS sum_total_accepted_submissions, 
	   SUM(sum_total_views) AS sum_total_views, SUM(sum_total_unique_views) AS sum_total_unique_views 
FROM
(
	SELECT ref3.contest_id AS contest_id, ref3.hacker_id AS hacker_id, ref3.name AS `name`,
		   IF(ref4.sum_total_submissions IS NULL,0,ref4.sum_total_submissions) AS sum_total_submissions, 
		   IF(ref4.sum_total_accepted_submissions IS NULL,0, ref4.sum_total_accepted_submissions) AS sum_total_accepted_submissions,
		   ref3.sum_total_views AS sum_total_views, ref3.sum_total_unique_views AS sum_total_unique_views
		   
	FROM 
	(
		SELECT ref1.contest_id, ref1.hacker_id, ref1.name, ref1.challenge_id ,
			   IF(ref2.sum_total_views IS NULL,0,ref2.sum_total_views) AS sum_total_views, 
			   IF(ref2.sum_total_unique_views IS NULL,0,ref2.sum_total_unique_views) AS sum_total_unique_views
		FROM 
		(
			SELECT a.contest_id, a.hacker_id, a.name, b.college_id,c.challenge_id 
			FROM contests a, 
				 colleges b, 
				 challenges c
			WHERE a.contest_id = b.contest_id
			AND   b.college_id = c.college_id 
		)ref1 LEFT JOIN 
		(
			SELECT challenge_id, SUM(total_views) AS sum_total_views, SUM(total_unique_views) AS sum_total_unique_views
			FROM  view_stats 
			GROUP BY challenge_id
		)ref2 
		ON ref1.challenge_id = ref2.challenge_id
		
	)ref3 LEFT JOIN 
	(
		SELECT challenge_id , SUM(total_submissions) AS sum_total_submissions, SUM(total_accepted_submissions) AS sum_total_accepted_submissions
		FROM  submission_stats
		GROUP BY challenge_id
	)ref4
	ON  ref3.challenge_id = ref4.challenge_id
)rslt
GROUP BY rslt.contest_id, rslt.hacker_id, rslt.name
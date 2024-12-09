SELECT 
    c.contest_id, 
    c.hacker_id, 
    c.name, 
    SUM(vs.total_views) AS total_views_sum,
    SUM(vs.total_unique_views) AS total_unique_views_sum,
    SUM(ss.total_submissions) AS total_submissions_sum,
    SUM(ss.total_accepted_submissions) AS total_accepted_submissions_sum
FROM 
    Contests c
JOIN 
    Colleges col ON c.contest_id = col.contest_id
JOIN 
    Challenges ch ON col.college_id = ch.college_id
LEFT JOIN 
    View_Stats vs ON ch.challenge_id = vs.challenge_id
LEFT JOIN 
    Submission_Stats ss ON ch.challenge_id = ss.challenge_id
GROUP BY 
    c.contest_id, c.hacker_id, c.name
HAVING 
    SUM(vs.total_views) + SUM(vs.total_unique_views) + SUM(ss.total_submissions) + SUM(ss.total_accepted_submissions) > 0
ORDER BY 
    c.contest_id;

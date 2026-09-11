/* Query 1: What are the top paying Data Analyst jobs?
Find the top 16 highest paying Data Analyst jobs available remotely.
Remove job postings with missing salary (no way to know if they are top paying).
This will be useful when we later investigate optimal skills.
Try different job titles and locations. */
CREATE TABLE top_paying_jobs AS
SELECT job_id, job_title, name AS company, job_schedule_type, 
    salary_year_avg, job_posted_date
--set of company_id is same between both datasets so we can use any JOIN 
FROM job_postings_fact FULL JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE job_title_short='Data Analyst' AND job_location='Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 16;

SELECT *
FROM top_paying_jobs;

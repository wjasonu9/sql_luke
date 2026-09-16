/* What skills are required for the top paying remote Data Analyst jobs?
Start with top_paying_jobs created in query 1.
Add the skills required for those jobs.
This helps job seekers know what skills to develop that align with top salaries. */
--Safe to use COUNT(*) because the skills tables have no NULLs
--all JOIN types are equivalent
CREATE TEMP TABLE top_sk AS
SELECT job_id, skills, type
FROM skills_job_dim FULL JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_id IN (SELECT job_id
    FROM top_paying_jobs);

--CREATE TEMP TABLE skf AS
SELECT skills, COUNT(*)*5 AS sk_freq -- % of jobs (out of 20)
FROM top_sk
GROUP BY skills
--HAVING sk_freq>16
ORDER BY sk_freq DESC;

/* Code should work even if we insert NULLs:
INSERT INTO top_sk VALUES (99305,NULL,NULL), (226942,NULL,NULL); --, (226942,'bob',NULL) */

CREATE TEMP TABLE top_sk_grp AS
SELECT job_id, COUNT(skills) AS n_sk,
    ARRAY_TO_STRING(ARRAY_AGG(skills),',') as sk_list
FROM top_sk
GROUP BY job_id;

/* Use LEFT JOIN in case some jobs have no associated skills
(interestingly the case for the top 2 top paying).
Do not use FULL JOIN since the vast majority of skills do not correspond to a top paying job
*/
CREATE TEMP TABLE top_paying_jobs_skills AS
WITH top_pay_job AS (
SELECT job_id, job_title, company, salary_year_avg
FROM top_paying_jobs)
SELECT top_pay_job.*, COALESCE(n_sk,0) AS n_sk,
    COALESCE(sk_list,'') AS sk_list -- (no skills listed)
FROM top_pay_job LEFT JOIN top_sk_grp
    ON top_pay_job.job_id=top_sk_grp.job_id
ORDER BY salary_year_avg DESC; --may be redundant but still a best practice

SELECT *
FROM top_paying_job_skills;
-- COPY top_paying_job_skills TO '/tmp/top_paying_job_skills.csv' DELIMITER ',' CSV HEADER;

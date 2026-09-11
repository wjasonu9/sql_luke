--Just write January's code. Have AI repeat for the other 11 months and save code for all 12 months into a new file
CREATE TABLE jobs_month01 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=1;

CREATE TABLE jobs_month02 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=2;

CREATE TABLE jobs_month03 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=3;

CREATE TABLE jobs_month04 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=4;

CREATE TABLE jobs_month05 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=5;

CREATE TABLE jobs_month06 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=6;

CREATE TABLE jobs_month07 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=7;

CREATE TABLE jobs_month08 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=8;

CREATE TABLE jobs_month09 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=9;

CREATE TABLE jobs_month10 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=10;

CREATE TABLE jobs_month11 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=11;

CREATE TABLE jobs_month12 AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date)=12;
--Data analyst project 
--Q1 A: 1793 rows, can also find columns by tabing down to columns on the left
SELECT COUNT(*)
FROM data_analyst_jobs;

--Q2 A: ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Q3 A: Tennessee: 21, Tennessee or Kentucky:27, could have used count here,
--or not if you want to see the rows
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT title
FROM data_analyst_jobs
WHERE location = 'TN'
OR location ='KY';

--Q4 A: 3, check that star rating is numeric
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE star_rating >'4'
AND location = 'TN';

--Q5 A:151, since its a count, dont need to specify 
--the review_count column, would have got the same 
--answer selecting * (same with the above Q)
SELECT COUNT (review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN '500' AND '1000';

--class ex Q5, got 1 less?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count > 500 AND review_count < 1000;

--Q6 A: NE Nebraska
SELECT location AS state, ROUND(AVG (star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--Q7 A: 881
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--Q8 A:230
SELECT COUNT (DISTINCT title) 
FROM data_analyst_jobs
WHERE location = 'CA';

--Q9 A: 41 companies, (40 excluding the null value)
--dont need quotes for numbers, just text
SELECT company, ROUND(AVG(star_rating),2)
FROM data_analyst_jobs
WHERE review_count > '5000'
AND company IS NOT NULL
GROUP BY company;

SELECT COUNT(DISTINCT company), ROUND(AVG(star_rating),2)
FROM data_analyst_jobs
WHERE review_count > '5000'
AND company IS NOT NULL;

--Q10 A: company with highest star rating- General Motors
-- rating:4.19, maybe shouldnt round here, because it makes
-- it so you cant see the top value, which is GM
SELECT company, ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > '5000'
GROUP BY company
ORDER BY avg_star_rating DESC;

--Q11 A: 774
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--Q12 A: got 4 returns, all have Tableau in name
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';

--BONUS 
--A: 1. Internet and Software - 62, 2. Banks and Financial Services - 61, 
--3. Consulting and Business Services - 57, 4.Health Care - 52

--looking at domain
SELECT title, domain, days_since_posting, skill
FROM data_analyst_jobs
LIMIT 20;

SELECT title, domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND days_since_posting > '21'
AND domain IS NOT NULL;

--look for SQL in skill instead of title
SELECT COUNT(title) AS number_of_jobs, domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND days_since_posting > '21'
AND domain IS NOT NULL
GROUP BY domain
ORDER BY number_of_jobs DESC
LIMIT 4;
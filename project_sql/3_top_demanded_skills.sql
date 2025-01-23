
/*

Question: What are the most in-demand skills for Business analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a Business analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
providing insights into the most valuable skills for job seekers.
    
*/

SELECT
    skills,
    count(*) AS number_of_jobs
    
FROM
    job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
GROUP BY skills_job_dim.skill_id , skills
ORDER BY number_of_jobs DESC
LIMIT 5


/*

Here's the breakdown of the most demanded skills for Business analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

[
  {
    "skills": "sql",
    "number_of_jobs": "17372"
  },
  {
    "skills": "excel",
    "number_of_jobs": "17134"
  },
  {
    "skills": "tableau",
    "number_of_jobs": "9324"
  },
  {
    "skills": "power bi",
    "number_of_jobs": "9251"
  },
  {
    "skills": "python",
    "number_of_jobs": "8097"
  }
]

*/

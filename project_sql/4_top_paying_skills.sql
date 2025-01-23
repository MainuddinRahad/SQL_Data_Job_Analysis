

/*

Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Business Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve

*/

SELECT
    skills,
    round(avg(salary_year_avg),0) AS yearly_average_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg is NOT NULL
GROUP BY 
    skills
ORDER BY 
    yearly_average_salary DESC
LIMIT 20;


/*

Here's a breakdown of the results for top paying skills for Business Analysts:

[
  {
    "skills": "chef",
    "yearly_average_salary": "220000"
  },
  {
    "skills": "numpy",
    "yearly_average_salary": "157500"
  },
  {
    "skills": "ruby",
    "yearly_average_salary": "150000"
  },
  {
    "skills": "hadoop",
    "yearly_average_salary": "139201"
  },
  {
    "skills": "julia",
    "yearly_average_salary": "136100"
  },
  {
    "skills": "airflow",
    "yearly_average_salary": "135410"
  },
  {
    "skills": "phoenix",
    "yearly_average_salary": "135248"
  },
  {
    "skills": "electron",
    "yearly_average_salary": "131000"
  },
  {
    "skills": "c",
    "yearly_average_salary": "123329"
  },
  {
    "skills": "pytorch",
    "yearly_average_salary": "120333"
  },
  {
    "skills": "tensorflow",
    "yearly_average_salary": "120333"
  },
  {
    "skills": "matplotlib",
    "yearly_average_salary": "120000"
  },
  {
    "skills": "matlab",
    "yearly_average_salary": "120000"
  },
  {
    "skills": "seaborn",
    "yearly_average_salary": "120000"
  },
  {
    "skills": "scikit-learn",
    "yearly_average_salary": "120000"
  },
  {
    "skills": "nosql",
    "yearly_average_salary": "119330"
  },
  {
    "skills": "mongodb",
    "yearly_average_salary": "118667"
  },
  {
    "skills": "snowflake",
    "yearly_average_salary": "112543"
  },
  {
    "skills": "looker",
    "yearly_average_salary": "110581"
  },
  {
    "skills": "pandas",
    "yearly_average_salary": "110558"
  }
]

*/

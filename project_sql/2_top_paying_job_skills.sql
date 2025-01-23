
/*

Question: What skills are required for the top-paying Business analyst jobs?
- Use the top 10 highest-paying Business Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
  helping job seekers understand which skills to develop that align with top salaries.

*/

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
        LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Business Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg is NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10

)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
    INNER JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;


/*

Here's the breakdown of the most demanded skills for Business analysts in 2023, based on job postings:

    - SQL is leading with a bold count of 5.
    - Python follows closely with a bold count of 5.
    - Tableau is also highly sought after, with a bold count of 4.
    - Excel is also highly sought after, with a bold count of 4.

Other skills like Looker, R, SAS , Chef , GCP and BigQuery show varying degrees of demand.

[
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "company_name": "Noom",
    "salary_year_avg": "220000.0",
    "skills": "sql"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "company_name": "Noom",
    "salary_year_avg": "220000.0",
    "skills": "python"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "company_name": "Noom",
    "salary_year_avg": "220000.0",
    "skills": "excel"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "company_name": "Noom",
    "salary_year_avg": "220000.0",
    "skills": "tableau"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "company_name": "Noom",
    "salary_year_avg": "220000.0",
    "skills": "looker"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "company_name": "Noom",
    "salary_year_avg": "220000.0",
    "skills": "chef"
  },
  {
    "job_id": 112859,
    "job_title": "Manager II, Applied Science - Marketplace Dynamics",
    "company_name": "Uber",
    "salary_year_avg": "214500.0",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "company_name": "Harnham",
    "salary_year_avg": "190000.0",
    "skills": "sql"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "company_name": "Harnham",
    "salary_year_avg": "190000.0",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "company_name": "Harnham",
    "salary_year_avg": "190000.0",
    "skills": "r"
  },
  {
    "job_id": 416185,
    "job_title": "Staff Revenue Operations Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "170500.0",
    "skills": "excel"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "company_name": "CyberCoders",
    "salary_year_avg": "162500.0",
    "skills": "sql"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "company_name": "CyberCoders",
    "salary_year_avg": "162500.0",
    "skills": "python"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "company_name": "CyberCoders",
    "salary_year_avg": "162500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "company_name": "CyberCoders",
    "salary_year_avg": "162500.0",
    "skills": "gcp"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "company_name": "CyberCoders",
    "salary_year_avg": "162500.0",
    "skills": "looker"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "company_name": "CyberCoders",
    "salary_year_avg": "162500.0",
    "skills": "word"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "company_name": "CyberCoders",
    "salary_year_avg": "162500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "excel"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "sql"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "python"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "r"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "sas"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "phoenix"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "excel"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "company_name": "USAA",
    "salary_year_avg": "138640.0",
    "skills": "sas"
  },
  {
    "job_id": 661103,
    "job_title": "Marketing Analytics Manager",
    "company_name": "Get It Recruit - Marketing",
    "salary_year_avg": "134550.0",
    "skills": "tableau"
  }
]

*/



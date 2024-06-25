Select*
FROM Salary_Dataset_with_Extra_Featu$;

1. What is the average salary by job title?
SELECT [Job Title], AVG(Salary) AS average_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Title];

2.Which companies have the most reported salaries top 10?

SELECT TOP 10[Company Name], SUM([Salaries Reported]) as total_salaries_reported
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]; 


With top_companies AS(
SELECT [Company Name],
SUM([Salaries Reported]) as total_salaries
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name])

SELECT TOP 10[Company Name]
FROM top_companies
ORDER BY total_salaries DESC; 

3. What is the average rating by company?
SELECT [Company Name], AVG(Rating) as average_rating
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]; 

4. What is the salary distribution by location?

SELECT [LOCATION],
(SUM(Salary)/(SELECT SUM(Salary) FROM Salary_Dataset_with_Extra_Featu$)*100) as perc_salary 
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Location];

5. What is the distribution of employment statuses?
SELECT [Employment Status],
(SUM(Salary)/(SELECT SUM(Salary) FROM Salary_Dataset_with_Extra_Featu$)*100) as perc_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Employment Status]; 

6. Which job titles have the highest average ratings?
SELECT TOP 20 [Job Title], AVG(Rating) as average_rating
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Title]
ORDER BY average_rating DESC;

7. Which companies offer the highest average salaries?

SELECT TOP 20 [Company Name], AVG(salary) as average_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]
ORDER BY average_salary desc; 

8. What is the distribution of different job roles?
SELECT [Job Roles], 
(SUM(Salary)/(SELECT SUM(Salary) FROM Salary_Dataset_with_Extra_Featu$)*100) as percent_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Roles]; 

9. What are the most common job titles?
SELECT TOP 10[Job Title], COUNT([JOb TITLE]) as count_jt
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Title]
ORDER BY count_jt DESC; 

10. What is the average salary by employment status?
SELECT [Employment Status], AVG(Salary) as average_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Employment Status]; 

11. What is the average salary by location and employment status?
SELECT [Location], [Employment Status], AVG(Salary) as Average_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Location], [Employment Status];


12. Which job titles have the most salaries reported?
SELECT TOP 10 [Job Title], SUM([Salaries Reported]) as total_salaries 
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Title]
ORDER BY total_salaries desc;

13. Which companies have the most employee ratings?
SELECT TOP 10 [Company Name], COUNT(Rating) as count_rating
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]
ORDER BY count_rating desc;


14. What is the average rating by location?
SELECT [Location], AVG(Rating) as average_rating 
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Location];

15. What is the salary variation within a company?
WITH Salary_Variation_Comp AS(
SELECT [Company Name], 
MAX(Salary) as highest_salary,
MIN(Salary) as lowest_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name])

SELECT [Company Name], (highest_salary - lowest_salary) as Salary_Variation
FROM Salary_Variation_Comp
ORDER BY Salary_Variation DESC; 



16. What is the average salary by job title and location?
SELECT [Job Title], [Location], AVG(Salary) as average_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Title], [Location];

17. What are the top job titles by location?
SELECT COUNT([Job Title]) as count_of_job_titles, [Location]
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Location]
ORDER BY count_of_job_titles desc;



18. What is the employment status distribution by location?
SELECT [Location], [Employment Status]
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Location], [Employment Status]
Order by [Location];

19. What is the median salary by job title?
WITH MED_SALARY AS (
SELECT [Job Title],
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY [Salary]) OVER (PARTITION BY [Job Title]) AS median_salary
FROM Salary_Dataset_with_Extra_Featu$)

SELECT [Job Title], median_salary
FROM MED_SALARY;


20. What is the count of job titles by company?
SELECT [Company Name], COUNT([Job Title]) as count_job_title
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]
ORDER BY count_job_title DESC; 

21. What are the highest and lowest salaries by company?
WITH HIGHEST_LOWEST AS(
SELECT [Company Name], 
MAX(Salary) as Highest_salary,
MIN(Salary) as Lowest_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name])

SELECT [Company Name], Highest_salary, Lowest_salary
FROM  HIGHEST_LOWEST;  

22. What is the average salary by company size (based on the number of reported salaries)?
SELECT [Company Name], AVG(Salary) AS Average_salary, SUM([Salaries Reported]) as salaries_reported
FROM  Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]
Order by salaries_reported desc;

23. Which job titles have the highest variation in salary?
SELECT TOP 20 [Job Title], MAX(Salary) as highest_Salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Title]
ORDER BY highest_salary DESC; 

24. Which companies have the most diverse job titles?
SELECT TOP 20 [Company Name], COUNT(DISTINCT [Job Title]) as distinct_job_titles
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]
ORDER BY distinct_job_titles desc; 

25. What is the average salary by job role?1
SELECT [Job Roles], AVG(Salary) as average_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Roles];

26. Which companies have the highest employee turnover rates? (percentage of employees)
SELECT [Company Name],
(SUM([Salaries Reported])/(SELECT SUM([Salaries Reported]) FROM Salary_Dataset_with_Extra_Featu$)*100) AS Employee_Turnover 
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]
ORDER BY Employee_Turnover DESC; 

27. What is the average rating by job role?
SELECT [Job Roles], AVG(Rating) as average_rating 
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Roles]
ORDER BY average_rating DESC; 


28. What is the rating distribution by location? (percent by location)
SELECT [Location],
(AVG(Rating)/(SELECT AVG(Rating) FROM Salary_Dataset_with_Extra_Featu$)*100) as rating_distribution
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Location]; 


29. Average Salary by Job Title

SELECT [Job Title],
AVG(Salary) as average_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Job Title];


CTE QUESTIONS
What is the running total of salaries for each job title?
With Running_Total_RT AS(
SELECT [Job Title], 
Sum(Salary) OVER (PARTITION BY [Job Title] Order by [Salary] ROWS Between Unbounded Preceding and Current Row) AS running_total
FROM Salary_Dataset_with_Extra_Featu$)

SELECT [Job Title], running_total
FROM Running_Total_RT; 


30. What are the top 3 highest salaries for each job title?

WITH Top_ranked_salaries AS (
SELECT [Job Title], Salary,
ROW_NUMBER() OVER (PARTITION BY [Job Title] ORDER BY [Salary] DESC) AS Ranked_salary
FROM Salary_Dataset_with_Extra_Featu$)

SELECT [Job Title], Salary
FROM Top_ranked_salaries
WHERE Ranked_salary<=3
ORDER BY [Job Title]; 




31. What percentage of the total salary is contributed by each company?
SELECT [Company Name], 
(Sum(Salary)/(Select Sum(Salary) FROM Salary_Dataset_with_Extra_Featu$)*100) as percent_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name]; 




32. What are the highest and lowest salaries by company?

WITH High_low AS(
SELECT [Company Name], 
MAX(Salary) AS highest_salary,
MIN(Salary) AS lowest_salary
FROM Salary_Dataset_with_Extra_Featu$
GROUP BY [Company Name])

SELECT [Company name], highest_salary, lowest_salary
FROM High_low; 








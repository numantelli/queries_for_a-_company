--Who are the people whose job title is programmer? 

SELECT first_name, last_name FROM employees
WHERE job_id IN (SELECT job_id FROM jobs WHERE job_title = 'Programmer')


--Make a list of name, surname, phone number, email and department id for employees who are working in marketing

SELECT first_name, last_name, phone_number, email, department_id 
FROM employees 
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'Marketing')


--What are employees' names who are working in Toronto ?

SELECT first_name, last_name FROM employees 
WHERE department_id IN (SELECT department_id FROM departments 
WHERE location_id IN (SELECT location_id FROM locations WHERE city = 'Toronto'))


--Which countries are in region 1 and 2?

SELECT city FROM locations 
WHERE country_id IN (SELECT country_id FROM countries WHERE region_id IN (1,2))


--Who are working in location 2400 ?

SELECT first_name, last_name FROM employees 
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = '2400')


--Who are working in the departments which are located in Europe?

SELECT first_name, last_name FROM employees 
WHERE department_id IN (SELECT department_id FROM departments 
WHERE location_id IN (SELECT location_id FROM locations 
WHERE country_id IN (SELECT country_id FROM countries 
WHERE region_id IN (SELECT region_id FROM regions WHERE region_name = 'Europe'))))


--Which countries are in region Europe and Asia?
SELECT country_name FROM countries
WHERE region_id IN (SELECT region_id FROM regions 
WHERE region_name IN ('Europe', 'Asia'))



--Which job has the biggest difference between lowest and highest salaries ? 

SELECT job_title, max_salary-min_salary as salary_difference FROM jobs
ORDER BY salary_difference DESC
LIMIT 1



--Who are those whose salaries are less min salary after %15 of interest? 

SELECT first_name, last_name, salary, salary*1.15 as new_salary 
FROM employees 
WHERE salary*1.15 < 17000
ORDER BY new_salary









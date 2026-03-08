SHOW DATABASES; 
USE world;
---Question 1 --
select countrycode, count(*) AS totalcities
from city
group by countrycode;

---Question 2--
SELECT Continent, COUNT(*) AS TotalCountries
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30;

---Question 3--
SELECT Region, SUM(Population) AS TotalPopulation
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;

---Question 4--
SELECT Continent, AVG(GNP) AS AvgGNP
FROM Country
GROUP BY Continent
ORDER BY AvgGNP DESC
LIMIT 5;

---Question 5--
SELECT c.Continent, COUNT(cl.Language) AS TotalLanguages
FROM Country c
JOIN CountryLanguage cl
ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

--Question 6--
SELECT Continent,
       MAX(GNP) AS MaxGNP,
       MIN(GNP) AS MinGNP
FROM Country
GROUP BY Continent;

--Question 7--
SELECT c.Name, AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

--Question 8--
SELECT c.Continent, AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

--Question 9--
SELECT Continent,
       SUM(Population) AS TotalPopulation,
       AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;

--Question 10--
SELECT Continent,
       AVG(LifeExpectancy) AS AvgLifeExpectancy,
       SUM(Population) AS TotalPopulation
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExpectancy DESC

       --Q11--
SELECT name
FROM employee
WHERE emp_id NOT IN (
SELECT emp_id
FROM sales
);
--or --
SELECT name
FROM employee e
WHERE NOT EXISTS (
SELECT 1
FROM sales s
WHERE e.emp_id = s.emp_id
);

--Q12--
SELECT department_name
FROM department
WHERE department_id IN (
    SELECT department_id
    FROM employee
    GROUP BY department_id
    HAVING AVG(salary) > 55000
);

--Q13--
SELECT department_name
FROM department
WHERE department_id IN (
    SELECT department_id
    FROM employee
    WHERE emp_id IN (
	SELECT emp_id
	FROM sales
	GROUP BY emp_id
	HAVING SUM(sale_amount) > 10000)
);

--Q14--
SELECT name
FROM employee
WHERE emp_id = (
SELECT emp_id
FROM sales
WHERE sale_amount = (
SELECT MAX(sale_amount)
FROM sales
WHERE sale_amount < (
SELECT MAX(sale_amount)
FROM sales))
);

--Q15--
SELECT name
FROM employee
WHERE salary > (
    SELECT MAX(sale_amount)
    FROM sales
);


LIMIT 3;





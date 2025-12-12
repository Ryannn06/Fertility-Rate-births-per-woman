-- top 10 years with highest average fertility rate
SELECT 
    year,
    ROUND(AVG(fertility_rate)::NUMERIC, 2) AS average_fertility_rate
FROM fertility_rate
GROUP BY year
ORDER BY average_fertility_rate DESC
LIMIT 10;

-- top 10 years with lowest average fertility rate
SELECT 
    year,
    ROUND(AVG(fertility_rate)::NUMERIC, 2) AS average_fertility_rate   
FROM fertility_rate
GROUP BY year  
ORDER BY average_fertility_rate ASC
LIMIT 10;
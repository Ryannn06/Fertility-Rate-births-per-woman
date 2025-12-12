-- average fertility rate by country
SELECT 
    country,
    ROUND(AVG(fertility_rate)::NUMERIC, 2) AS average_fertility_rate
FROM fertility_rate
GROUP BY country
ORDER BY average_fertility_rate DESC
LIMIT 10;

-- top 10 countries with highest fertility rate in the most recent year in the dataset
SELECT country, year, fertility_rate
FROM fertility_rate
WHERE year = (
    SELECT MAX(year) FROM fertility_rate
)
ORDER BY fertility_rate DESC
LIMIT 10;

-- countries with above average fertility rate
WITH group_country AS (
    SELECT
        country,
        AVG(fertility_rate)::NUMERIC as avg_fertility_rate
    FROM fertility_rate
    GROUP BY country
)
SELECT *
FROM group_country
WHERE avg_fertility_rate > (
    SELECT AVG(fertility_rate)::NUMERIC FROM fertility_rate
)
ORDER BY avg_fertility_rate DESC;

-- countries with below average fertility rate
WITH group_country AS (
    SELECT
        country,
        AVG(fertility_rate)::NUMERIC as avg_fertility_rate
    FROM fertility_rate
    GROUP BY country
)
SELECT *
FROM group_country
WHERE avg_fertility_rate < (
    SELECT AVG(fertility_rate)::NUMERIC FROM fertility_rate
)
ORDER BY avg_fertility_rate ASC;
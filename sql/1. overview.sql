-- Active: 1761546932084@@localhost@5432@fertility_rate_db
SELECT *
FROM fertility_rate
LIMIT 10;

-- number of total records and countries
SELECT 
    COUNT(*) as total_records,
    COUNT(DISTINCT country) AS number_of_countries
FROM fertility_rate;

-- number of years
SELECT 
    MIN(year) AS min_year,
    MAX(year) AS max_year
FROM fertility_rate;

-- min, max, avg fertility rate
SELECT 
    ROUND(MIN(fertility_rate)::NUMERIC,2) AS min_fertility_rate,
    ROUND(MAX(fertility_rate)::NUMERIC,2) AS max_fertility_rate,
    ROUND(AVG(fertility_rate)::NUMERIC, 2) AS avg_fertility_rate
FROM fertility_rate;


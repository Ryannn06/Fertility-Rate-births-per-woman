CREATE OR REPLACE VIEW growth_rate AS
SELECT
    *,
    COALESCE(
        ROUND(
            (fertility_rate::NUMERIC  - LAG(fertility_rate) OVER(PARTITION BY country ORDER BY year ASC)::NUMERIC) 
            / NULLIF(LAG(fertility_rate) OVER(PARTITION BY country ORDER BY year ASC)::NUMERIC , 0)* 100, 
            2
    ),0
    ) AS growth_rate_percentage
FROM fertility_rate;

-- To query the growth rate view for 
SELECT
    country,
    year,
    growth_rate_percentage
FROM growth_rate
WHERE country = 'Philippines'
ORDER BY year DESC;

-- growth rate of fertility rate by year (average across countries)
SELECT
    year,
    AVG(growth_rate_percentage) AS avg_growth_rate_percentage
FROM growth_rate
GROUP BY year
ORDER BY year DESC;
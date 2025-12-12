SELECT
    *,
    SUM(fertility_rate) OVER(PARTITION BY country ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_fertility_rate
FROM fertility_rate
WHERE country = 'Philippines';
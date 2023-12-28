SELECT YEAR(CAST(joindate AS DATE)) AS jaar, MONTHNAME(CAST(joindate AS DATE)) AS maand, COUNT(id) AS aantal
FROM mhl_suppliers
GROUP BY YEAR(CAST(joindate AS DATE)), MONTH(CAST(joindate AS DATE))
ORDER BY YEAR(CAST(joindate AS DATE)), MONTH(CAST(joindate AS DATE))
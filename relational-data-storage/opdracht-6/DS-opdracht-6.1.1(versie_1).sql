SELECT year AS jaar, months, COUNT(DISTINCT(supplier_ID)) AS 'aantal leveranciers', SUM(hitcount) AS 'totaal aantal hits'
FROM mhl_hitcount
GROUP BY year, month
ORDER BY year DESC, month
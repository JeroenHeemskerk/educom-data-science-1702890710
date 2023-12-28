SELECT CONCAT(DAY(CAST(joindate AS DATE)), '-', MONTH(CAST(joindate AS DATE)), '-', YEAR(CAST(joindate AS DATE))) AS joindate, id
FROM mhl_suppliers
WHERE CAST(joindate AS DATE) > LAST_DAY(CAST(joindate AS DATE)) - 7
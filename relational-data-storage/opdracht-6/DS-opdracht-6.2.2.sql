SELECT id, joindate, DATEDIFF(CURRENT_DATE, CAST(joindate AS DATE)) as dagen_lid
FROM mhl_suppliers
ORDER BY DATEDIFF(CURRENT_DATE, CAST(joindate AS DATE))
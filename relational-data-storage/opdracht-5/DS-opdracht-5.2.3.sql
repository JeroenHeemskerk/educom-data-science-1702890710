SELECT mhl_hitcount.year, SUM(IF(CASE mhl_hitcount.month WHEN '1' THEN 1 WHEN '2' THEN 1 WHEN '3' THEN 1 ELSE NULL END, mhl_hitcount.hitcount, 0)) AS 'eerste kwartaal', 
SUM(IF(CASE mhl_hitcount.month WHEN '4' THEN 1 WHEN '5' THEN 1 WHEN '6' THEN 1 ELSE NULL END, mhl_hitcount.hitcount, 0)) AS 'tweede kwartaal',
SUM(IF(CASE mhl_hitcount.month WHEN '7' THEN 1 WHEN '8' THEN 1 WHEN '9' THEN 1 ELSE NULL END, mhl_hitcount.hitcount, 0)) AS 'derde kwartaal',
SUM(IF(CASE mhl_hitcount.month WHEN '10' THEN 1 WHEN '11' THEN 1 WHEN '12' THEN 1 ELSE NULL END, mhl_hitcount.hitcount, 0)) AS 'vierde kwartaal',
SUM(mhl_hitcount.hitcount) AS 'totaal'
FROM mhl_suppliers
JOIN mhl_hitcount ON mhl_hitcount.supplier_ID = mhl_suppliers.id
GROUP BY mhl_hitcount.year
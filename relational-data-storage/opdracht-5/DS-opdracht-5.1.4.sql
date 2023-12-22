SELECT name, SUM(hitcount), COUNT(month), SUM(hitcount)/COUNT(month)
FROM mhl_hitcount
JOIN mhl_suppliers ON mhl_suppliers.id = mhl_hitcount.supplier_ID
GROUP BY supplier_ID
ORDER BY SUM(hitcount) DESC
SELECT mhl_cities.name, COUNT(case mhl_membertypes.name when 'Gold' then 1 else null end), 
COUNT(case mhl_membertypes.name when 'Silver' then 1 else null end),
COUNT(case mhl_membertypes.name when 'Bronze' then 1 else null end),
COUNT(case mhl_membertypes.name when 'Gold' then null when 'Silver' then null when 'Bronze' then null else 1 end)
FROM mhl_suppliers
JOIN mhl_cities ON mhl_cities.id = mhl_suppliers.city_ID
JOIN mhl_membertypes ON mhl_membertypes.id = mhl_suppliers.membertype
GROUP BY mhl_cities.name
ORDER BY COUNT(case mhl_membertypes.name when 'Gold' then 1 else null end) DESC,
COUNT(case mhl_membertypes.name when 'Silver' then 1 else null end) DESC,
COUNT(case mhl_membertypes.name when 'Bronze' then 1 else null end) DESC
SELECT mhl_hitcount.hitcount, mhl_suppliers.name, mhl_cities.name, mhl_communes.name, mhl_districts.name
FROM mhl_suppliers
JOIN mhl_hitcount ON mhl_hitcount.supplier_ID = mhl_suppliers.id
JOIN mhl_cities ON mhl_cities.id = mhl_suppliers.city_ID
JOIN mhl_communes ON mhl_communes.id = mhl_cities.commune_ID
JOIN mhl_districts ON mhl_districts.id = mhl_communes.district_ID
WHERE mhl_hitcount.year = 2014 AND mhl_hitcount.month = 1 AND mhl_districts.name IN ('Zeeland', 'Noord-Brabant', 'Limburg')
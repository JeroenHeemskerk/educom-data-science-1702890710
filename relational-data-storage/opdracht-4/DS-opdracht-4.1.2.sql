SELECT mhl_suppliers.name, straat, huisnr, postcode, mhl_cities.name
FROM mhl_suppliers
INNER JOIN mhl_cities ON mhl_cities.id = mhl_suppliers.city_ID
INNER JOIN mhl_communes ON mhl_communes.id = mhl_cities.commune_ID
WHERE mhl_communes.name = 'Steenwijkerland'
SELECT mhl_suppliers.name, straat, huisnr, postcode
FROM mhl_suppliers
INNER JOIN mhl_cities ON mhl_cities.id = mhl_suppliers.city_ID
WHERE mhl_cities.name = "Amsterdam" 
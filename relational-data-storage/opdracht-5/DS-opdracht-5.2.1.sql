SELECT mhl_suppliers.name AS leverancier, IFNULL(mhl_contacts.name, 'tav de directie') AS aanhef, 
IF(ISNULL(mhl_suppliers.p_address) OR mhl_suppliers.p_address = '', CONCAT(mhl_suppliers.straat, ' ', mhl_suppliers.huisnr), mhl_suppliers.p_address) AS adres, 
IF(ISNULL(mhl_suppliers.p_address) OR mhl_suppliers.p_address = '', mhl_suppliers.postcode, mhl_suppliers.p_postcode) AS postcode, 
IF(ISNULL(mhl_suppliers.p_address) OR mhl_suppliers.p_address = '', city1.name, city2.name)
FROM mhl_suppliers
LEFT JOIN mhl_contacts ON mhl_contacts.supplier_ID = mhl_suppliers.id
LEFT JOIN mhl_cities city1 ON city1.id = mhl_suppliers.city_ID
LEFT JOIN mhl_communes commune1 ON commune1.id = city1.commune_ID
LEFT JOIN mhl_districts district1 ON district1.id = commune1.district_ID
LEFT JOIN mhl_cities city2 ON city2.id = mhl_suppliers.p_city_ID
LEFT JOIN mhl_communes commune2 ON commune2.id = city2.commune_ID
LEFT JOIN mhl_districts district2 ON district2.id = commune2.district_ID
WHERE NOT (mhl_suppliers.straat = '' AND mhl_suppliers.p_address = '') AND NOT (mhl_suppliers.postcode = '' AND mhl_suppliers.p_postcode = '')
ORDER BY IF(ISNULL(mhl_suppliers.p_address) OR mhl_suppliers.p_address = '', district1.name, district2.id), IF(ISNULL(mhl_suppliers.p_address), city1.name, city2.name), mhl_suppliers.name

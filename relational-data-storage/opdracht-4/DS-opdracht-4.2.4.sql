SELECT DISTINCT mhl_suppliers.name, mhl_propertytypes.name, IFNULL(mhl_yn_properties.content, 'NOT SET'), mhl_cities.name
FROM mhl_suppliers
CROSS JOIN mhl_propertytypes
LEFT JOIN mhl_yn_properties ON mhl_yn_properties.supplier_ID = mhl_suppliers.id AND mhl_yn_properties.propertytype_ID = mhl_propertytypes.id
JOIN mhl_cities ON mhl_cities.id = mhl_suppliers.city_ID
WHERE mhl_cities.name = 'amsterdam' AND mhl_propertytypes.proptype = 'A'
ORDER BY mhl_suppliers.name
SELECT mhl_suppliers.name, straat, huisnr, postcode
FROM mhl_suppliers
INNER JOIN mhl_yn_properties ON mhl_yn_properties.supplier_ID = mhl_suppliers.id
INNER JOIN mhl_propertytypes ON mhl_propertytypes.id = mhl_yn_properties.propertytype_ID
WHERE mhl_propertytypes.name IN ('specialistische leverancier', 'ook voor particulieren') 
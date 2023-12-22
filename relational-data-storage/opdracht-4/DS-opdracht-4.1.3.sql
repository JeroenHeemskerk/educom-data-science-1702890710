SELECT T1.name, T2.name, mhl_suppliers.name, straat, huisnr, postcode
FROM mhl_suppliers
INNER JOIN mhl_cities ON mhl_cities.id = mhl_suppliers.city_ID
INNER JOIN mhl_suppliers_mhl_rubriek_view ON mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID = mhl_suppliers.id
INNER JOIN mhl_rubrieken T1 ON T1.id = mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID
LEFT JOIN mhl_rubrieken T2 ON T2.id = T1.parent
WHERE mhl_cities.name = "Amsterdam"  AND T1.name = "drank" OR mhl_cities.name = "Amsterdam" AND T2.name = "drank"
ORDER BY T1.name, mhl_suppliers.name
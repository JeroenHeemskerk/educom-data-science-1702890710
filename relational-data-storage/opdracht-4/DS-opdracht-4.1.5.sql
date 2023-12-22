SELECT mhl_suppliers.name, straat, huisnr, postcode, pc_lat_long.lat, pc_lat_long.lng
FROM mhl_suppliers
INNER JOIN pc_lat_long ON pc_lat_long.pc6 = mhl_suppliers.postcode
ORDER BY pc_lat_long.lat DESC
LIMIT 5
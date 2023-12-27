SELECT mhl_suppliers.name, ifnull(v_directie.contact, 'tav de directie'), v_verzendlijst.adres, v_verzendlijst.postcode, v_verzendlijst.city
FROM mhl_suppliers
LEFT JOIN v_directie ON v_directie.ID = mhl_suppliers.id
LEFT JOIN v_verzendlijst ON v_verzendlijst.ID = mhl_suppliers.id
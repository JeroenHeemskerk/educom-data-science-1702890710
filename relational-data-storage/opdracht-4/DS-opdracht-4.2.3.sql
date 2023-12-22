SELECT IFNULL(C2.ID, C1.ID) AS ID, IFNULL(C1.name, C2.name) AS hoofdrubriek, IF(NOT ISNULL(C1.name), C2.name, '') AS subrubriek
FROM mhl_rubrieken C1
RIGHT JOIN mhl_rubrieken C2 ON C2.parent = C1.id
ORDER BY hoofdrubriek, subrubriek
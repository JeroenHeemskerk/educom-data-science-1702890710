SELECT C1.name, C2.name, C1.id, C2.id, C1.commune_ID, C2.commune_ID
FROM mhl_cities C1
LEFT JOIN mhl_cities C2 ON C1.name = C2.name
LEFT JOIN mhl_communes C3 ON C3.id = C1.commune_ID
LEFT JOIN mhl_communes C4 ON C4.id = C2.commune_ID
WHERE C1.name = C2.name AND C1.id < C2.id AND NOT C1.commune_ID = 0 AND NOT C2.commune_ID = 0
ORDER BY C1.name
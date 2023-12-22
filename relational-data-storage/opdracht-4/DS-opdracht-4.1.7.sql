SELECT C1.name, C2.name, C1.id, C2.id, C1.commune_ID, C2.commune_ID
FROM mhl_cities C1
JOIN mhl_cities C2 ON C1.name = C2.name
WHERE C1.name = C2.name AND C1.id < C2.id
ORDER BY C1.name
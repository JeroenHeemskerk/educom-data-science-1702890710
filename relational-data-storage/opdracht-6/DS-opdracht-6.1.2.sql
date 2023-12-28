CREATE OR REPLACE VIEW gemeenteHitcount
AS
SELECT SUM(hitcount)/COUNT(hitcount) AS gemiddelde, commune_id AS gemeente_id, mhl_communes.name AS gemeente
FROM mhl_hitcount
RIGHT JOIN mhl_suppliers ON mhl_suppliers.id = mhl_hitcount.supplier_ID
JOIN mhl_cities ON mhl_cities.id = city_ID
JOIN mhl_communes ON mhl_communes.id = commune_ID
WHERE commune_id IN (
	SELECT id FROM mhl_communes WHERE district_id IN (
		SELECT id FROM mhl_districts WHERE country_ID IN (
			SELECT id FROM mhl_countries WHERE name = 'Nederland'
		)
	)
)
GROUP BY commune_ID;

SELECT gemeente, mhl_suppliers.name AS leverancier, SUM(hitcount), gemiddelde
FROM mhl_suppliers
JOIN mhl_cities ON mhl_cities.id = mhl_suppliers.city_ID
JOIN gemeenteHitcount ON gemeenteHitcount.gemeente_id = commune_ID
JOIN mhl_hitcount ON mhl_hitcount.supplier_ID = mhl_suppliers.id
GROUP BY mhl_suppliers.id
ORDER BY gemeente, SUM(hitcount) - gemiddelde DESC

SELECT 
CONCAT(IF((
	SELECT DISTINCT parent 
    FROM mhl_rubrieken 
    WHERE id = mhl_rubriek_view_id) = '',
'',  CONCAT((
	SELECT DISTINCT name 
    FROM mhl_rubrieken 
    WHERE id IN (
		SELECT parent 
        FROM mhl_rubrieken 
        WHERE id = mhl_rubriek_view_id)),
	' - ')), mhl_rubrieken.name) AS name,  
SUM(hitcount) AS total 
FROM mhl_suppliers_mhl_rubriek_view 
JOIN mhl_rubrieken ON mhl_rubrieken.id = mhl_rubriek_view_ID 
JOIN mhl_suppliers ON mhl_suppliers.id = mhl_suppliers_ID
JOIN mhl_hitcount ON supplier_ID = mhl_suppliers.id
GROUP BY mhl_rubriek_view_ID 
ORDER BY 
CONCAT(IF((
	SELECT DISTINCT parent 
    FROM mhl_rubrieken 
    WHERE id = mhl_rubriek_view_id) = '',
'',  CONCAT((
	SELECT DISTINCT name 
    FROM mhl_rubrieken 
    WHERE id IN (
		SELECT parent 
        FROM mhl_rubrieken 
        WHERE id = mhl_rubriek_view_id)),
	' - ')), mhl_rubrieken.name)

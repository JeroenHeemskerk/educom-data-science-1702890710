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
COUNT(DISTINCT(mhl_suppliers_ID)) AS numsup 
FROM mhl_suppliers_mhl_rubriek_view 
JOIN mhl_rubrieken ON mhl_rubrieken.id = mhl_rubriek_view_ID 
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

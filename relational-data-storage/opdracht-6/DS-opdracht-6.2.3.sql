SELECT case WEEKDAY(CAST(joindate AS DATE))
	when '0' then 'monday'
    when '1' then 'tuesday'
    when '2' then 'wednesday'
    when '3' then 'thursday'
    when '4' then 'friday'
    when '5' then 'saturday'
    when '6' then 'sunday'
	end AS day, COUNT(joindate) as joindate
FROM mhl_suppliers
GROUP BY WEEKDAY(CAST(joindate AS DATE))
ORDER BY WEEKDAY(CAST(joindate AS DATE))
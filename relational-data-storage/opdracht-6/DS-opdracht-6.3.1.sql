SELECT name,
IF((ASCII(name) > 64 AND ASCII(name) < 91) OR (ASCII(name) > 96 AND ASCII(name) < 123), 
CONCAT(UPPER(SUBSTRING(name, 1, 1)), SUBSTRING(name, 2, LENGTH(name))), 
CONCAT(SUBSTRING(name, 1, IF(name LIKE '% %', POSITION(' ' IN name), LENGTH(name))), 
IF(name LIKE '% %', UPPER(SUBSTRING(name, POSITION(' ' IN name) + 1, 1)), ''), 
IF(name LIKE '% %', SUBSTRING(name, POSITION(' ' IN name) + 2), ''))) AS nice_name
FROM mhl_cities
ORDER BY name
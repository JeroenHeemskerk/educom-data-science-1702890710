SELECT name, 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, '&iuml;', 'ï'), '&egrave;', 'è'), '&euml;', 'ë'), '&eacute;', 'é'), '&ouml;', 'ö'), '&Uuml;', 'ü') AS nice_name
FROM mhl_suppliers
WHERE NOT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, '&iuml;', 'ï'), '&egrave;', 'è'), '&euml;', 'ë'), '&eacute;', 'é'), '&ouml;', 'ö'), '&Uuml;', 'ü') = name
LIMIT 25
SELECT name, straat, postcode, huisnr FROM mhl_suppliers WHERE name LIKE '%&%' AND name NOT LIKE '%& %' and name NOT LIKE '%&_ %' 
and name NOT LIKE '%&__ %' and name  NOT LIKE '%&___ %'
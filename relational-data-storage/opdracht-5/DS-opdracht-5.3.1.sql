CREATE VIEW v_directie
AS
SELECT mhl_contacts.supplier_ID as ID, mhl_contacts.name as contact, mhl_contacts.contacttype AS functie, mhl_departments.name as department
FROM mhl_suppliers
JOIN mhl_contacts ON mhl_contacts.supplier_ID = mhl_suppliers.id
JOIN mhl_departments ON mhl_departments.id = mhl_contacts.department
WHERE mhl_departments.name = 'Directie' OR mhl_contacts.contacttype LIKE '%directeur%'
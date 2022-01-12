SELECT companyname,contactname
FROM customers
WHERE contactname LIKE 'D%';

SELECT companyname
FROM suppliers
WHERE companyname LIKE '_or%';

SELECT companyname
FROM customers
WHERE companyname LIKE '%er';

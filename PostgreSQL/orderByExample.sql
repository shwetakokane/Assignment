SELECT DISTINCT(country)
FROM customers;

SELECT DISTINCT(country)
FROM suppliers
ORDER BY country ASC;

SELECT DISTINCT(country)
FROM suppliers
ORDER BY country DESC;

SELECT DISTINCT country,city
FROM suppliers
ORDER BY country ASC,city ASC;

SELECT productname,unitprice
FROM products
ORDER BY unitprice DESC, productname ASC;

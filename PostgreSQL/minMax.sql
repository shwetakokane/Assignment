SELECT MIN(orderdate)
FROM orders
WHERE shipcountry='Italy';

SELECT MAX(shippeddate)
FROM orders
WHERE shipcountry='Canada';

SELECT MAX(shippeddate-orderdate)
FROM orders
WHERE shipcountry='France';

SELECT AVG(freight)
FROM orders
WHERE shipcountry='Brazil';

SELECT SUM(quantity)
FROM order_details
WHERE productid=14;

SELECT AVG(quantity)
FROM order_details
WHERE productid=35;

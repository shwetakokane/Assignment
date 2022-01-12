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

SELECT MIN(orderdate)
FROM orders
WHERE shipcountry='Italy';

SELECT MAX(shippeddate)
FROM orders
WHERE shipcountry='Canada';

SELECT MAX(shippeddate-orderdate)
FROM orders
WHERE shipcountry='France';

SELECT AVG(freight)
FROM orders
WHERE shipcountry='Brazil';

SELECT SUM(quantity)
FROM order_details
WHERE productid=14;

SELECT AVG(quantity)
FROM order_details
WHERE productid=35;

SELECT companyname,contactname
FROM customers
WHERE contactname LIKE 'D%';

SELECT companyname
FROM suppliers
WHERE companyname LIKE '_or%';

SELECT companyname
FROM customers
WHERE companyname LIKE '%er';

SELECT unitprice*quantity AS TotalSpent
FROM order_details;

-- this won't work
SELECT unitprice*quantity AS TotalSpent
FROM order_details
WHERE TotalSpent > 10;

-- this one will
SELECT unitprice*quantity AS TotalSpent
FROM order_details
ORDER BY TotalSpent DESC;

SELECT unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory DESC;

SELECT productid,unitprice*quantity AS TotalCost
FROM order_details
ORDER BY TotalCost DESC
LIMIT 3;

SELECT productname,unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory ASC
LIMIT 2;

SELECT count(*)
FROM customers
WHERE region IS NULL;

SELECT count(*)
FROM suppliers
WHERE region IS NOT NULL;

SELECT count(*)
FROM orders
WHERE shipregion IS NULL;

SELECT companyname, orderdate, shipcountry
FROM orders
JOIN customers ON customers.customerid=orders.customerid;

SELECT firstname, lastname, orderdate
FROM orders
JOIN employees ON employees.employeeid=orders.employeeid;

--Grabbing information from multiple tables
SELECT companyname, productname, categoryname, orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid=products.categoryid
WHERE categoryname= 'Seafood' AND
	  order_details.unitprice*quantity >=500;

--LEFT join
SELECT companyname, orderid
FROM customers 
LEFT JOIN orders ON orders.customerid=customers.customerid
WHERE orderid is null;

SELECT productname, orderid
FROM products 
LEFT JOIN order_details ON products.productid=order_details.productid;

SELECT productname, orderid
FROM products 
LEFT JOIN order_details ON products.productid=order_details.productid
WHERE orderid is null;

--Right Joins
SELECT companyname, orderid 
FROM orders 
RIGHT JOIN customers ON customers.customerid=orders.customerid;
WHERE orderid IS NULL;

SELECT companyname, customercustomerdemo.customerid
FROM customercustomerdemo
RIGHT JOIN customers ON customers.customerid=customercustomerdemo.customerid;

--Full JOIN
SELECT companyname, orderid
FROM customers
FULL JOIN orders ON customers.customerid=orders.customerid;

SELECT productname, categoryname
FROM products 
FULL JOIN categories ON categories.categoryid=products.categoryid;

--SELF JOINS
SELECT c1.companyname AS CustomerName1, c2.companyname AS CustomerName2, c1.city
FROM customers AS c1
JOIN customers AS c2 ON c1.city=c2.city
ORDER BY c1.city;

SELECT c1.companyname AS CustomerName1, c2.companyname AS CustomerName2, c1.city
FROM customers AS c1
JOIN customers AS c2 ON c1.city=c2.city
WHERE c1.customerid <> c2.customerid
ORDER BY c1.city;

SELECT s1.companyname AS SupplierName1,
       s2.companyname AS SupplierName2, s1.country
FROM suppliers s1
JOIN suppliers s2 ON s1.country=s2.country 
WHERE s1.supplierid <> s2.supplierid
ORDER BY s1.country;
	   
--USING 
SELECT *
FROM orders
JOIN order_details USING (orderid)
JOIN products USING (productid);

--NATURAL
SELECT * 
FROM orders 
NATURAL JOIN order_details;

SELECT * 
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details;

SELECT COUNT(*)
FROM products
NATURAL JOIN order_details;

SELECT COUNT(*)
FROM products
JOIN order_details USING (productid);

SELECT country, COUNT(*)
FROM customers 
GROUP BY country
ORDER BY COUNT(*) DESC;

SELECT country
FROM customers 
WHERE country LIKE 'Mexico%';

SELECT country
FROM customers 
WHERE country='Mexico';
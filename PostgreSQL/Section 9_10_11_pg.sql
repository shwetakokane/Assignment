SELECT categoryname,productname,SUM(od.unitprice*quantity)
FROM categories
NATURAL JOIN products
NATURAL JOIN order_details AS od
GROUP BY GROUPING SETS  ((categoryname),(categoryname,productname))
ORDER BY categoryname, productname;

SELECT c.companyname AS buyer,s.companyname AS supplier,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN suppliers  AS s USING (supplierid)
GROUP BY GROUPING SETS ((buyer),(buyer,supplier))
ORDER BY buyer,supplier;

SELECT companyname,categoryname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  AS s USING (categoryid)
GROUP BY GROUPING SETS ((companyname),(companyname,categoryname))
ORDER BY companyname,categoryname NULLS FIRST;


SELECT categoryname,COUNT(*)
FROM categories 
JOIN products ON products.categoryid=categories.categoryid
GROUP BY categoryname 
ORDER BY COUNT(*) DESC

SELECT productname, ROUND(AVG(quantity))
FROM products 
JOIN order_details ON products.productid=order_details.productid
GROUP BY productname
ORDER BY AVG(quantity) DESC

SELECT country, COUNT(*)
FROM suppliers
GROUP BY country
ORDER BY COUNT(*) DESC

SELECT productname,SUM(order_details.unitprice*quantity)
FROM products 
JOIN order_details ON products.productid=order_details.productid
JOIN orders ON orders.orderid=order_details.orderid
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY productname
ORDER BY SUM (order_details.unitprice*quantity) DESC

SELECT productname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM products
JOIN order_details USING (productid)
GROUP BY productname
HAVING SUM(quantity * order_details.unitprice) < 2000
ORDER BY AmountBought ASC

SELECT companyname, SUM(quantity*order_details.unitprice) AS AmountBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
WHERE orderdate BETWEEN '1997-01-01' AND '1997-06-30'
GROUP BY companyname
HAVING SUM(quantity*order_details.unitprice) > 5000
ORDER BY AmountBought DESC

SELECT categoryname, productname, SUM(od.unitprice*quantity)
FROM categories
NATURAL JOIN products 
NATURAL JOIN order_details AS od
GROUP BY GROUPING SETS ((categoryname),(categoryname, productname))
ORDER BY categoryname, productname

SELECT c.companyname AS buyer, s.companyname AS supplier, SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders 
Natural JOIN order_details as od 
JOIN products USING (productid)
JOIN suppliers AS s USING (supplierid)
GROUP BY GROUPING SETs ((buyer),(buyer, supplier))
ORDER BY buyer, supplier

SELECT companyname, categoryname, SUM(od.unitprice*quantity)
FROM customers AS c 
NATURAL JOIN orders 
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories AS s USING (categoryid)
GROUP BY GROUPING SETS ((companyname),(companyname, categoryname))
ORDER BY companyname, categoryname NULLS FIRST

--RoLLUP
SELECT c.companyname, categoryname, productname, SUM(od.unitprice*quantity)
FROm customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories USING (categoryid)
GROUP BY ROLLUP (companyname, categoryname, productname)
ORDER BY companyname, categoryname, productname

SELECT s.companyname AS supplier, c.companyname AS buyer, productname, SUM(od.unitprice * quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY ROLLUP(supplier, buyer, productname)
ORDER BY supplier, buyer, productname

--ROLLUPS ON STEROIDS(CUBE)

SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  USING (categoryid)
GROUP BY CUBE (companyname, categoryname, productname);

SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY CUBE(supplier, buyer, productname);

SELECT companyname, categoryname, productname, SUM(od.unitprice*quantity)
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories USING (categoryid)
GROUP BY CUBE (companyname, categoryname, productname)

SELECT s.companyname AS supplier, c.companyname as buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY CUBE (supplier, buyer, products.productname)
ORDER BY supplier NULLS FIRST, buyer NULLS FIRST, productname NULLS FIRST

--UNION--
SELECT companyname
FROM customers
UNION 
SELECT companyname
FROM suppliers

SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers

SELECT country
FROM customers
UNION 
SELECT country
FROM suppliers
ORDER BY country DESC

SELECT companyname
FROM customers
UNION
SELECT companyname
FROM suppliers;

SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country ASC;

SELECT country
FROM customers
UNION ALL
SELECT country
FROM suppliers
ORDER BY country ASC;


--Subquery using EXISTS
SELECT companyname,contactname
FROM customers
WHERE EXISTS (SELECT customerid FROM orders
              WHERE customerid=customers.customerid AND
               orderdate BETWEEN '1997-04-01' AND '1997-04-30');

 SELECT companyname,contactname
 FROM customers
 WHERE NOT EXISTS (SELECT customerid FROM orders
               WHERE customerid=customers.customerid AND
                orderdate BETWEEN '1997-04-01' AND '1997-04-30');

SELECT productname
FROM products
WHERE NOT EXISTS (SELECT orders.orderid FROM orders
                  JOIN order_details ON orders.orderid=order_details.orderid
              WHERE order_details.productid=products.productid AND
                  orderdate BETWEEN '1997-04-01' AND '1997-04-30');

SELECT companyname
FROM suppliers
WHERE EXISTS (SELECT productid FROM products
             	WHERE products.supplierid=products.supplierid AND
               	unitprice > 200);

SELECT companyname
FROM suppliers
WHERE  NOT EXISTS (SELECT products.productid FROM products
                  JOIN order_details ON products.productid=order_details.productid
                  JOIN orders ON order_details.orderid=orders.orderid
             	WHERE suppliers.supplierid=products.supplierid AND
                  orderdate BETWEEN '1996-12-01' AND '1996-12-31' );
                               
--Intersect
SELECT country FROM customers 
INTERSECT
SELECT country FROM suppliers

SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers;

SELECT COUNT(*) FROM
(SELECT country FROM customers
INTERSECT ALL
SELECT country FROM suppliers) AS same_country;

SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers
ORDER BY country ASC;

SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;

--INTERSECt ALL
SELECT COUNT(*) FROM 
(SELECT country FROM customers 
INTERSECT ALL
SELECT country FROM suppliers) AS together

SELECT city FROM customers 
INTERSECT
SELECT city FROM suppliers

SELECT COUNT(*) FROM
(SELECT city FROM customers 
INTERSECT ALL
SELECT city FROM suppliers)AS together

--EXCEPT

SELECT country FROM customers
EXCEPT
SELECT country FROM suppliers;

SELECT COUNT(*) FROM
(SELECT country FROM customers
EXCEPT ALL
SELECT country FROM suppliers) AS same_country;

SELECT city FROM suppliers
EXCEPT
SELECT city FROM customers;

SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers
ORDER BY city DESC;

SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;


SELECT country FROM customers
EXCEPT
SELECT country FROM suppliers

SELECT COUNT(*) FROM 
(SELECT country FROM customers
EXCEPT ALL
SELECT country FROM suppliers) as lonely_customers

SELECT city FROM suppliers
EXCEPT
SELECT city FROM customers 

SELECT COUNT(*) FROM
(SELECT city FROM customers
EXCEPT ALL
SELECT city FROM suppliers) as lonely_customers

------------------
SELECT companyname 
FROM customers
WHERE EXISTS (SELECT customerid FROM orders 
			  WHERE orders.customerid=customers.customerid AND 
			  orderdate BETWEEN '1997-04-01' AND '1997-04-30')

SELECT companyname 
FROM customers
WHERE NOT EXISTS (SELECT customerid FROM orders 
			  WHERE orders.customerid=customers.customerid AND 
			  orderdate BETWEEN '1997-04-01' AND '1997-04-30')

SELECT productname 
FROM products 
WHERE NOT EXISTS (SELECT productid FROM order_details
				  JOIN orders ON orders.orderid=order_details.orderid
			  WHERE order_details.productid=products.productid AND 
			  orderdate BETWEEN '1997-04-01' AND '1997-04-30')

SELECT companyname
FROM suppliers
WHERE EXISTS (SELECT productid FROM products
			 WHERE products.supplierid=suppliers.supplierid AND unitprice > 200)

SELECT companyname
FROM suppliers
WHERE EXISTS (SELECT products.productid FROM products
			  JOIN order_details ON order_details.productid=products.productid 
			  JOIN orders ON orders.orderid=order_details.orderid
			 WHERE products.supplierid=suppliers.supplierid AND 
			  orderdate BETWEEN '1996-12-01' AND '1996-12-31')

SELECT companyname
FROM suppliers
WHERE NOT EXISTS (SELECT products.productid FROM products
			  JOIN order_details ON order_details.productid=products.productid 
			  JOIN orders ON orders.orderid=order_details.orderid
			 WHERE products.supplierid=suppliers.supplierid AND 
			  orderdate BETWEEN '1996-12-01' AND '1996-12-31')

--ANY and ALL
SELECT companyname
FROM customers
WHERE  customerid = ANY (SELECT customerid FROM orders
                         JOIN order_details ON orders.orderid=order_details.orderid
                         WHERE quantity > 50);

SELECT companyname
FROM suppliers
WHERE  supplierid = ANY (SELECT products.supplierid FROM order_details
                        JOIN products ON products.productid=order_details.productid
                        WHERE quantity = 1);

SELECT DISTINCT productname
FROM products
JOIN order_details ON products.productid=order_details.productid
WHERE  order_details.unitprice*quantity > ALL
	(SELECT AVG(order_details.unitprice*quantity)
             FROM order_details
             GROUP BY productid);

 SELECT DISTINCT companyname
 FROM customers
 JOIN orders ON orders.customerid=customers.customerid
 JOIN order_details ON orders.orderid=order_details.orderid
 WHERE  order_details.unitprice*quantity > ALL
 	(SELECT AVG(order_details.unitprice*quantity)
              FROM order_details
             JOIN orders ON orders.orderid=order_details.orderid
             GROUP BY orders.customerid);


SELECT companyname
FROM customers 
WHERE customerid = ANY(SELECT customerid FROM orders
					  JOIN order_details ON orders.orderid=order_details.orderid
					  WHERE quantity > 50);

SELECT companyname
FROM suppliers
WHERE supplierid = ANY (SELECT products.supplierid FROM order_details 
					   JOIN products ON products.productid=order_details.productid
					   WHERE quantity = 1)

--ALL
SELECT DISTINCT productname 
FROM products
JOIN order_details ON products.productid=order_details.productid
WHERE order_details.unitprice * quantity > ALL
	(SELECT AVG(order_details.unitprice * quantity)
	  FROM order_details
		GROUP BY productid)
	
SELECT DISTINCT companyname  
FROM customers
JOIN orders ON orders.customerid=customers.customerid
JOIN order_details ON orders.orderid=order_details.orderid
WHERE order_details.unitprice * quantity > ALL
	(SELECT AVG(order_details.unitprice * quantity)
	  FROM order_details
	 	JOIN orders ON orders.orderid = order_details.orderid
		GROUP BY orders.customerid)
	
--IN USING SUBQUERY--
SELECT companyname
FROM customers 
WHERE country IN (SELECT country FROM suppliers)

SELECT companyname
FROM suppliers 
WHERE city IN (SELECT city FROM customers)

SELECT companyname
FROM customers
WHERE country IN (SELECT DISTINCT country
                                    FROM suppliers);

SELECT companyname
FROM suppliers
WHERE city IN (SELECT DISTINCT city
                  FROM customers);






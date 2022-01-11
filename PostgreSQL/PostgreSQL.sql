SELECT DISTINCT region
FROM suppliers;

SELECT COUNT(*)
FROM products;

SELECT COUNT(*)
FROM orders;

SELECT COUNT (DISTINCT productid)
FROM order_details;

SELECT customerid, shippeddate-orderdate 
FROM orders;
SELECT orderid, unitprice*quantity 
FROM order_details;

SELECT reportsto, COUNT(employeeid)
FROM employees;

SELECT reportsto,COUNT(employeeid)
FROM public.employees
WHERE reportsto IS NOT NULL
GROUP BY reportsto HAVING COUNT(*)>3;

SELECT reportsto, COUNT(employeeid)
 FROM public.employees
 where reportsto is not null and count(employeeid)>3
   GROUP BY reportsto;

SELECT reportsto, COUNT(employeeid)
 FROM public.employees
 where reportsto is not null
   GROUP BY reportsto
   HAVING COUNT(employeeid)>3;

SELECT region,COUNT(customerid) 
from public.customers
WHERE region is not null;

SELECT region, COUNT(region) 
from public.customers
WHERE region is not null
GROUP BY region;

SELECT companyname
FROM suppliers
WHERE city='Berlin';

SELECT customername, contactname 
FROM customers
WHERE country='Mexico';

SELECT COUNT(*)
FROM order_details
Where quantity>20

SELECT COUNT(*)
FROM orders
Where freight>=250;

SELECT COUNT(*)
FROM orders
WHERE orderdate >= '1998-01-01';

SELECT COUNT(*)
FROM orders
WHERE shippeddate < '1997-07-05';

SELECT COUNT(*)
FROM orders
WHERE shipcountry = 'Germany'AND freight >100;

SELECT DISTINCT(customerid)
FROM orders
WHERE shipcountry = 'Brazil'AND shipvia = 2; 

SELECT COUNT(*)
FROM customers
WHERE country = 'USA'OR country = 'Canada';

SELECT COUNT(*)
FROM suppliers
WHERE country = 'Germany'OR country = 'Spain';

SELECT COUNT(*)
FROM orders
WHERE shipcountry = 'USA'OR shipcountry = 'Brazil';

SELECT supplierid,COUNT(productid)
FROM products
GROUP BY supplierid
ORDER BY supplierid;

SELECT Country,region, Count(customerid)
FROM customers 
GROUP BY country, region
ORDER BY country, region;


-- NO. OF EMPLOYEES REPORTING TO fULLER AND bUCHMAN
SELECT COUNT(employeeid)
FROM employees
WHERE reportsto = '2' AND reportsto = '5';


-- REPORTSTO AND COUNT OF EMPLOYEES
SELECT employees.reportsto,COUNT(employeeid)
FROM employees
GROUP BY reportsto;
 
SELECT companyname 
FROM suppliers
WHERE city='Berlin';

SELECT * FROM employees;


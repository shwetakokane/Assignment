--1
SELECT name,weight,productnumber
FROM production.product
ORDER BY weight ASC;

--2
SELECT *
FROM purchasing.productvendor
WHERE productid=407
ORDER BY averageleadtime ASC;

--3
SELECT *
FROM sales.salesorderdetail
WHERE productid=799
ORDER BY orderqty DESC;

--4
SELECT MAX(discountpct)
FROM sales.specialoffer;

--5
SELECT MIN(sickleavehours)
FROM humanresources.employee;

--6
SELECT MAX(rejectedqty)
FROM purchasing.purchaseorderdetail;

--7
SELECT AVG(rate)
FROM humanresources.employeepayhistory;

--8
SELECT AVG(standardcost)
FROM production.productcosthistory
WHERE productid=738;

--9
SELECT SUM(scrappedqty)
FROM production.workorder
WHERE productid = 529;

--10
SELECT name
FROM purchasing.vendor
WHERE name LIKE 'G%';

--11
SELECT name
FROM purchasing.vendor
WHERE name LIKE '%Bike%';

--12
SELECT firstname
FROM person.person
WHERE firstname LIKE '_t%';

--13
SELECT *
FROM person.emailaddress
LIMIT 20;

--14
SELECT *
FROM production.productcategory
LIMIT 2;

--15
SELECT COUNT(*)
FROM production.product
WHERE weight IS NULL;

--16
SELECT COUNT(*)
FROM person.person
WHERE additionalcontactinfo IS NOT NULL;

--Practice 
--01

-- this is spelling out the ON
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity AS be ON be.businessentityid=ph.businessentityid
JOIN person.person AS pe ON pe.businessentityid=be.businessentityid
JOIN person.phonenumbertype AS pnt ON pnt.phonenumbertypeid=ph.phonenumbertypeid
ORDER BY ph.businessentityid DESC;

--this is with USING
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity USING (businessentityid)
JOIN person.person USING (businessentityid)
JOIN person.phonenumbertype USING (phonenumbertypeid)
ORDER BY ph.businessentityid DESC;


--02
SELECT pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
ORDER BY pm.name ASC;

--03
SELECT p.name,pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
JOIN production.product AS p USING (productmodelid)
ORDER BY pm.name ASC;

--04
SELECT name, rating, comments
FROM production.product
LEFT JOIN production.productreview USING (productid)
ORDER BY rating ASC;

--05
SELECT p.name,orderqty,scrappedqty
FROM production.workorder
RIGHT JOIN production.product AS p USING (productid)
ORDER BY p.productid ASC;

--sort every employee on the basis of hireddate recently joined firdt
SELECT businessentityid, jobtitle , hiredate, gender
FROM humanresources.employee
ORDER BY hiredate DESC;

--sort the employee data based on recently hiredate and 
--job title
SELECT businessentityid, jobtitle , hiredate, gender
FROM humanresources.employee
ORDER BY jobtitle ASC,hiredate DESC;

--Display the count of employee joint on every join date
SELECT hiredate, COUNT(hiredate)
FROM humanresources.employee
GROUP BY hiredate
ORDER BY COUNT(hiredate);

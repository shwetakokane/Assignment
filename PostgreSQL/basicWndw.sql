SELECT categoryname,productname,unitprice,
AVG(unitprice) OVER (PARTITION BY categoryname)
FROM products
JOIN categories ON categories.categoryid=products.categoryid

SELECT productname,quantity,
AVG(quantity) OVER (PARTITION BY order_details.productid)
FROM products
JOIN order_details on order_details.productid = products.productid
WHERE productname='Alice Mutton'

SELECT productname,orderid,quantity,
AVG(quantity) OVER (PARTITION BY order_details.productid) AS average
FROM products
JOIN order_details on products.productid=order_details.productid

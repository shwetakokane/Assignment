SELECT productid,unitprice*quantity AS TotalCost
FROM order_details
ORDER BY TotalCost DESC
LIMIT 3;

SELECT productname,unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory ASC
LIMIT 2;

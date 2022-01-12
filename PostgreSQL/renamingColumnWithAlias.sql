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

#Query 1
SELECT OrderID, OrderDate, TotalAmount
FROM Orders
WHERE TotalAmount > 7 AND OrderDate >= '2026-04-03';

#Query 2
SELECT COUNT(*) AS `Total Customers`
FROM Customers;


#Query 3
SELECT Category, AVG(Price) AS Average_Price
FROM Products
GROUP BY Category
HAVING AVG(Price) > 3;

#Query 4
SELECT ProductName, Price
FROM Products
WHERE Price > (
  SELECT AVG(Price)
  FROM Products
);

#Query 5
SELECT c.FirstName, c.LastName, o.OrderID, o.TotalAmount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;
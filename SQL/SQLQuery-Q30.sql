SELECT *
FROM Customers
 LEFT JOIN Orders
	ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL
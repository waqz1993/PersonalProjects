SELECT *
FROM Orders
SELECT Customers.CustomerID
	, Orders.CustomerID
FROM Customers
	LEFT JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
		AND Orders.EmployeeID = 4
WHERE Orders.CustomerID IS NULL
ORDER BY Customers.CustomerID
	
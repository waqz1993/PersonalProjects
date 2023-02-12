SELECT OrderID
FROM Orders
WHERE OrderDate > '20151231'
	AND OrderDate <= '20160101'
	AND ShipCountry = 'France'
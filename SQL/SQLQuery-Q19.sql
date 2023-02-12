SELECT OrderID
	, CONVERT(DATE, OrderDate) AS OrderDate
	, CompanyName AS Shipper
FROM Orders
	JOIN Shippers
		ON Orders.ShipVia = Shippers.ShipperID
WHERE OrderID < 10270
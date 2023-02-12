SELECT 
	TOP 3 ShipCountry
	, AVG(freight) AS AverageFreight
FROM Orders
WHERE 
	OrderDate >= DATEADD(YEAR, -1, (SELECT MAX(OrderDate) FROM Orders))
GROUP BY ShipCountry
ORDER BY AverageFreight DESC;
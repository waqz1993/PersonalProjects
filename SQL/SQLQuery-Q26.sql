SELECT 
	TOP 3 ShipCountry
	, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate >= '20150101'
	AND OrderDate < '20160101'
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
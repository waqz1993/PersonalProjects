WITH OrdersCountry AS (
	SELECT ShipCountry
		, CustomerID
		, OrderID
		, OrderDate = CONVERT(DATE, OrderDate)
		, RANK() OVER (PARTITION BY ShipCountry ORDER BY OrderDate) AS Ranking
	FROM Orders
)
SELECT ShipCountry
	, CustomerID
	, OrderID
	, OrderDate
FROM OrdersCountry
WHERE Ranking = 1
ORDER BY ShipCountry
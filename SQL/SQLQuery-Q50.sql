WITH Orders2016 AS (
	SELECT Customers.CustomerID
		, Customers.CompanyName
		, TotalOrderAmount = SUM (Quantity*UnitPrice)
	FROM Customers
		JOIN Orders
			ON Customers.CustomerID = Orders.CustomerID
		JOIN OrderDetails
			ON Orders.OrderID = OrderDetails.OrderID
	WHERE OrderDate >= '20160101'
		AND OrderDate < '20170101'
	GROUP BY Customers.CustomerID
		, Customers.CompanyName
)
, CustomerGrouping AS (
	SELECT *
		, CustomerGroup = CASE 
			WHEN TotalOrderAmount >= 0 AND TotalOrderAmount < 1000 THEN 'LOW'
			WHEN TotalOrderAmount >= 1000 AND TotalOrderAmount < 5000 THEN 'MIDDLE'
			WHEN TotalOrderAmount >= 5000 AND TotalOrderAmount < 10000 THEN 'HIGH'
			WHEN TotalOrderAmount >= 10000 THEN 'VERY HIGH'
		END 
	FROM Orders2016
)
SELECT CustomerGroup
	, TotalInGroup = COUNT (*)
	, PercentageInGroup = COUNT(*)*1.0/(SELECT COUNT(*) FROM CustomerGrouping)
FROM CustomerGrouping
GROUP BY CustomerGroup
ORDER BY TotalInGroup DESC

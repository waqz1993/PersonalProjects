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
			WHEN TotalOrderAmount BETWEEN 0 AND 1000 THEN 'Low'
			WHEN TotalOrderAmount BETWEEN 1001 AND 5000 THEN 'Medium'
			WHEN TotalOrderAmount >= 5000 AND TotalOrderAmount < 10000 THEN 'HIGH'
			WHEN TotalOrderAmount >= 10000 THEN 'Very High'
		END
	FROM Orders2016
)
SELECT *
FROM CustomerGrouping
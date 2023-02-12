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
SELECT CustomerID
	, CompanyName
	, TotalOrderAmount
	, CustomerGroupName
FROM Orders2016
	JOIN CustomerGroupThresholds
		ON Orders2016.TotalOrderAmount 
			BETWEEN CustomerGroupThresholds.RangeBottom AND CustomerGroupThresholds.RangeTop

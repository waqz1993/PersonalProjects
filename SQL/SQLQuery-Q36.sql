SELECT TOP 10
	OrderID
	, TotalOrderDetails = COUNT(*)
FROM OrderDetails
GROUP BY OrderID
ORDER BY TotalOrderDetails DESC
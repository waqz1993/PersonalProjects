; WITH CTE1 AS (
	SELECT OrderID
	FROM OrderDetails 
	WHERE Quantity >= 60
	GROUP BY OrderID
		, Quantity
	HAVING COUNT(OrderID) > 1
	)
SELECT *
FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM CTE1)
ORDER BY OrderID
	, Quantity

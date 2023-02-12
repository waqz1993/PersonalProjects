WITH LateOrders AS (
	SELECT EmployeeID
		, TotalOrders = COUNT(*)
	FROM Orders
	WHERE RequiredDate <= ShippedDate
	GROUP BY EmployeeID
)
, AllOrders AS (
	SELECT EmployeeID
		, TotalOrders = COUNT(*)
	FROM Orders
	GROUP BY EmployeeID
)
 , ToRound AS (
SELECT Employees.EmployeeID
	, Employees.LastName
	, AllOrders = AllOrders.TotalOrders
	, LateOrders = CASE 
		WHEN LateOrders.TotalOrders IS NULL THEN 0
		ELSE LateOrders	.TotalOrders
	END
	, PercentLateOrders = CASE 
		WHEN LateOrders.TotalOrders*1.00/AllOrders.TotalOrders IS NULL THEN 0
		ELSE LateOrders.TotalOrders*1.00/AllOrders.TotalOrders
	END
FROM Employees
	JOIN AllOrders
		ON Employees.EmployeeID = AllOrders.EmployeeID
	LEFT JOIN LateOrders
		ON LateOrders.EmployeeID = Employees.EmployeeID  
)
SELECT EmployeeID
	, LastName
	, AllOrders
	, LateOrders
	, ROUND(PercentLateOrders, 2) AS PercentLateOrders
FROM ToRound
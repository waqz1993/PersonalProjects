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
SELECT Employees.EmployeeID
	, Employees.LastName
	, AllOrders = AllOrders.TotalOrders
	, LateOrders = LateOrders.TotalOrders
FROM Employees
	JOIN AllOrders
		ON Employees.EmployeeID = AllOrders.EmployeeID
	LEFT JOIN LateOrders
		ON LateOrders.EmployeeID = Employees.EmployeeID  
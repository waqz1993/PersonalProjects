WITH LateOrders AS (
	SELECT OrderID
	, OrderDate = CONVERT(DATE, OrderDate)
	, RequiredDate = CONVERT(DATE, RequiredDate)
	, ShippedDate = CONVERT (DATE, ShippedDate)
	FROM Orders
	WHERE RequiredDate <= ShippedDate
	)
SELECT Employees.EmployeeID
	, Employees.LastName
	, COUNT(*) AS TotalLateOrders
FROM LateOrders
	LEFT JOIN Orders 
		ON LateOrders.OrderID = Orders.OrderID
	LEFT JOIN Employees
		ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
	, Employees.LastName
ORDER BY TotalLateOrders DESC
	
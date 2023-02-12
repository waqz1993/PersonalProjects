SELECT Employees.EmployeeID
	, Employees.LastName
	, Orders.OrderID
	, Products.ProductName
	, OrderDetails.Quantity
FROM Employees
	JOIN Orders
		ON Employees.EmployeeID = Orders.EmployeeID
	JOIN OrderDetails
		ON Orders.OrderID = OrderDetails.OrderID
	JOIN Products
		ON OrderDetails.ProductID = Products.ProductID
ORDER BY 
	Orders.OrderID
	, Products.ProductID
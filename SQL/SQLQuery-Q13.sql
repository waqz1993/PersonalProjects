SELECT OrderID
	, ProductID
	, UnitPrice
	, Quantity
	, TotalPrice = UnitPrice * Quantity
FROM OrderDetails
ORDER BY OrderID
	, ProductID
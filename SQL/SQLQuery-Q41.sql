SELECT OrderID
	, OrderDate = CONVERT(DATE, OrderDate)
	, RequiredDate = CONVERT(DATE, RequiredDate)
	, ShippedDate = CONVERT (DATE, ShippedDate)
FROM Orders
WHERE RequiredDate <= ShippedDate
ORDER BY OrderID
	
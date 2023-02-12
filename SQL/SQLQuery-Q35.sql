SELECT EmployeeID
  , OrderID
  , OrderDate
FROM Orders o
WHERE OrderDate = EOMONTH(OrderDate)
ORDER BY EmployeeID
	, OrderDate

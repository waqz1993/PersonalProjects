SELECT
  InitialOrder.CustomerID
  , InitialOrder.OrderID AS InitialOrder_ID
  , InitialOrder_Date = CONVERT(DATE, InitialOrder.OrderDate)
  , NextOrder.OrderID AS NextOrder_ID
  , NextDate_Date = CONVERT(DATE, NextOrder.OrderDate)
  , DaysBetweenOrders = DATEDIFF(DD, InitialOrder.OrderDate, NextOrder.OrderDate)
FROM Orders InitialOrder
	INNER JOIN Orders NextOrder
		ON InitialOrder.CustomerID = NextOrder.CustomerID
WHERE InitialOrder.OrderID < NextOrder.OrderID
	AND (NextOrder.OrderDate - InitialOrder.OrderDate) <= 5
ORDER BY InitialOrder.CustomerID
	, InitialOrder.OrderID
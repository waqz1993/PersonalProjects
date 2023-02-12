SELECT OrderID
FROM OrderDetails od
WHERE Quantity >= 60
GROUP BY OrderID
	, Quantity
HAVING COUNT(OrderID) > 1
ORDER BY OrderID
--ORDERID > 1X WITH QUANTITY >60
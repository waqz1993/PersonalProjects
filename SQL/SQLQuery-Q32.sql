SELECT c.CustomerID
	, c.CompanyName
	, o.OrderID
	, TotalOrderAmount = SUM(Quantity*UnitPrice)
FROM Customers c
	JOIN Orders o
		ON c.CustomerID = o.CustomerID
	JOIN OrderDetails od
		ON o.OrderID = od.OrderID
WHERE 
	OrderDate >= '20160101'
	AND OrderDate < '20170101'
GROUP BY C.CustomerID
	, c.CompanyName
	, o.OrderID
HAVING SUM(Quantity*UnitPrice) > 10000
ORDER BY TotalOrderAmount DESC
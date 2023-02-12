SELECT c.CustomerID
	, c.CompanyName
	, TotalWithoutDiscount = SUM(Quantity*UnitPrice)
	, TotalWithDiscount = SUM(Quantity*UnitPrice*(1-Discount))
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
HAVING SUM(Quantity*UnitPrice*(1-Discount)) > 15000
ORDER BY TotalWithDiscount DESC
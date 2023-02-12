SELECT od.OrderID
	, od.ProductID
	, od.UnitPrice
	, od.Quantity
	, od.Discount
FROM OrderDetails od
INNER JOIN (
  SELECT
    DISTINCT OrderID
  FROM
    OrderDetails
  WHERE
    Quantity >= 60
  GROUP BY
    OrderID
	, Quantity
  HAVING COUNT(*) > 1
  ) potential_problem on potential_problem.orderid = od.orderid
ORDER BY OrderID
	, ProductID
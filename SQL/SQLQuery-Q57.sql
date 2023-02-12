WITH Customer_Date AS (
	SELECT CustomerID
    , OrderID AS InitialOrder_ID
    , OrderDate = CONVERT(DATE, OrderDate)
    , NextOrderDate = CONVERT (
		DATE, 
			LEAD(OrderDate, 1)
				OVER (PARTITION BY CustomerID ORDER BY CustomerID, OrderDate)
	)
  FROM
    Orders
)
SELECT
  *,
  DaysBetweenOrders = DATEDIFF(dd, OrderDate, NextOrderDate)
FROM
	Customer_Date
WHERE
  DATEDIFF(dd, OrderDate, NextOrderDate) <= 5
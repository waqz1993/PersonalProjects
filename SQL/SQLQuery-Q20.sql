SELECT CategoryName
	, COUNT(CategoryName) AS TotalProducts
FROM Products
	JOIN Categories
		ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC
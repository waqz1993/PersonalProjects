WITH Countries AS (
	SELECT Country
	FROM Customers
	UNION
	SELECT Country
	FROM Suppliers
) , SupplierCountry AS (
	SELECT DISTINCT Country
	FROM Suppliers
) , CustomerCountry AS (
	SELECT DISTINCT Country
	FROM Customers
)
SELECT SupplierCountry.Country
	, CustomerCountry.Country
FROM Countries 
	LEFT JOIN SupplierCountry 
		ON Countries.Country = SupplierCountry.Country
	LEFT JOIN CustomerCountry
		ON Countries.Country = CustomerCountry.Country
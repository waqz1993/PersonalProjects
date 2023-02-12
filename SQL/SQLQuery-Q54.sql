WITH SupplierCountriesCount AS (
	SELECT Country
	, Total = COUNT (*) FROM Suppliers 
	GROUP BY Country
)
, CustomerCountriesCount AS (
	SELECT Country
	, Total = COUNT (*) FROM Customers 
	GROUP BY Country
)
SELECT Country = ISNULL(SupplierCountriesCount.Country, CustomerCountriesCount.Country)
	, TotalSuppliers = ISNULL(SupplierCountriesCount.Total, 0)
	, TotalCustomers = ISNULL(CustomerCountriesCount.Total, 0)
FROM SupplierCountriesCount
	FULL OUTER JOIN CustomerCountriesCount
		ON SupplierCountriesCount.Country = CustomerCountriesCount.Country

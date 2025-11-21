
-- 6. Get all sales information for a specific dealer for a specific date range
SELECT *
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1 
  AND s.sale_date BETWEEN '2025-01-01' AND '2026-01-01';

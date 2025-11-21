-- TEST SQL DATABASE
USE cardealershipdatabase;
-- 1. Get all dealerships
SELECT * FROM dealerships;

-- 2. Find all vehicles for a specific dealership
SELECT v.*
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;  

-- 3. Find a car by VIN
SELECT v.*
FROM vehicles v
WHERE VIN = "B2C3D4E5F6G7H8I9J";


-- 4. Find the dealership where a certain car is located, by VIN
SELECT d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON i.dealership_id = d.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.VIN =  "B2C3D4E5F6G7H8I9J";

-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT d.name, d.address, d.phone, v.*
FROM dealerships d
JOIN inventory i ON i.dealership_id = d.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.vehicleType= "SUV";

-- 6. Get all sales information for a specific dealer for a specific date range
SELECT *
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1
  AND s.sale_date BETWEEN '2025-01-01' AND '2026-01-01';


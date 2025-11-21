-- 4. Find the dealership where a certain car is located, by VIN
SELECT d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON i.dealership_id = d.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.VIN =  "B2C3D4E5F6G7H8I9J";


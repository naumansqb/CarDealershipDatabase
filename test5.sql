-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT d.name, d.address, d.phone, v.*
FROM dealerships d
JOIN inventory i ON i.dealership_id = d.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.vehicleType= "SUV";

SELECT d.name, d.address, d.phone, v.*
FROM dealerships d
JOIN inventory i ON i.dealership_id = d.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.color = 'Red'
  AND v.make = 'Nissan'
  AND v.model = 'Altima';

-- The Car Dealership Database 

DROP database IF EXISTS CarDealershipDatabase;

CREATE DATABASE CarDealershipDatabase;

USE CarDealershipDatabase;


DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_contracts;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL
);

CREATE TABLE vehicles(
	VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR (50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    `year` INT NOT NULL,
    sold BOOLEAN DEFAULT 0,
    color VARCHAR(50) NOT NULL,
    vehicleType VARCHAR(50) NOT NULL,
    odometer INT NOT NULL,
    price DOUBLE NOT NULL
);

CREATE TABLE inventory(
    dealership_id INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);


CREATE TABLE sales_contracts(
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    sale_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts(
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    lease_start DATE NOT NULL,
    lease_end DATE NOT NULL,
    monthly_payment DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Prime Motors', '123 Auto Row', '555-212-1212'),
('City Trucks', '45 Industrial Blvd', '555-434-3434'),
('Luxury Imports', '789 Prestige Ave', '555-565-5656');

INSERT INTO vehicles (VIN, make, model, year, sold, color, vehicleType, odometer, price) VALUES
('A1B2C3D4E5F6G7H8I', 'Toyota', 'RAV4', 2023, 0, 'Silver', 'SUV', 12000, 31000.00),
('B2C3D4E5F6G7H8I9J', 'Honda', 'Accord', 2022, 0, 'Blue', 'Sedan', 22000, 27000.00),
('C3D4E5F6G7H8I9J0K', 'Ford', 'Explorer', 2024, 0, 'White', 'SUV', 3000, 42000.00),
('D4E5F6G7H8I9J0K1L', 'Chevy', 'Malibu', 2021, 0, 'Black', 'Sedan', 45000, 19000.00),
('E5F6G7H8I9J0K1L2M', 'Nissan', 'Altima', 2023, 0, 'Red', 'Sedan', 5000, 26000.00),
('F6G7H8I9J0K1L2M3N', 'Jeep', 'Wrangler', 2024, 0, 'Green', 'SUV', 800, 48000.00),
('G7H8I9J0K1L2M3N4O', 'Tesla', 'Model 3', 2022, 0, 'White', 'Electric', 15000, 39999.00),
('H8I9J0K1L2M3N4O5P', 'Subaru', 'Outback', 2023, 0, 'Gray', 'Wagon', 10000, 33000.00),
('I9J0K1L2M3N4O5P6Q', 'Hyundai', 'Tucson', 2024, 0, 'Black', 'SUV', 1200, 29000.00),
('J0K1L2M3N4O5P6Q7R', 'Kia', 'Sorento', 2023, 0, 'Blue', 'SUV', 8000, 34000.00);


INSERT INTO inventory (dealership_id, VIN) VALUES
(1, 'A1B2C3D4E5F6G7H8I'),
(1, 'B2C3D4E5F6G7H8I9J'),
(1, 'C3D4E5F6G7H8I9J0K'),

(2, 'D4E5F6G7H8I9J0K1L'),
(2, 'E5F6G7H8I9J0K1L2M'),
(2, 'F6G7H8I9J0K1L2M3N'),

(3, 'G7H8I9J0K1L2M3N4O'),
(3, 'H8I9J0K1L2M3N4O5P'),
(3, 'I9J0K1L2M3N4O5P6Q'),
(3, 'J0K1L2M3N4O5P6Q7R');


INSERT INTO sales_contracts (VIN, sale_date, price) VALUES
('A1B2C3D4E5F6G7H8I', '2025-10-15', 31000.00),  
('D4E5F6G7H8I9J0K1L', '2025-09-20', 18500.00);   


INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment) VALUES
('G7H8I9J0K1L2M3N4O', '2025-11-01', '2028-11-01', 750.00), 
('I9J0K1L2M3N4O5P6Q', '2025-08-01', '2028-08-01', 520.00); 
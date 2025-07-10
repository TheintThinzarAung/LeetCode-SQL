WITH tavolume AS (
  SELECT 
    product_id, 
    Width * Length * Height AS volume
  FROM 
    Products
)
SELECT 
  w.name AS warehouse_name, 
  SUM(w.units * v.volume) AS volume
FROM 
  tavolume v
  JOIN Warehouse w ON v.product_id = w.product_id
GROUP BY 
  w.name;































-- Create Warehouse table
CREATE TABLE Warehouse (
  name VARCHAR(255),
  product_id INT,
  units INT,
  PRIMARY KEY (name, product_id)
);

-- Create Products table
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  Width INT,
  Length INT,
  Height INT
);

-- Insert values into Warehouse table
INSERT INTO Warehouse (name, product_id, units) VALUES
('LCHouse1', 1, 1),
('LCHouse1', 2, 10),
('LCHouse1', 3, 5),
('LCHouse2', 1, 2),
('LCHouse2', 2, 2),
('LCHouse3', 4, 1);

-- Insert values into Products table
INSERT INTO Products (product_id, product_name, Width, Length, Height) VALUES
(1, 'LC-TV', 5, 50, 40),
(2, 'LC-KeyChain', 5, 5, 5),
(3, 'LC-Phone', 2, 10, 10),
(4, 'LC-T-Shirt', 4, 10, 20);


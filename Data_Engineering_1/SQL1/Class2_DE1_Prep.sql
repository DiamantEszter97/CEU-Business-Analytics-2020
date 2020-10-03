CREATE SCHEMA Sacramento
DROP SCHEMA Sacramento_estate_transactions;
USE Sacramento
CREATE TABLE Transactions
(id INTEGER NOT NULL,
street VARCHAR(255),
city VARCHAR(255),
zip INTEGER NOT NULL,
state VARCHAR(255),
beds INTEGER NOT NULL,
bath INTEGER NOT NULL,
sq_ft INTEGER NOT NULL,
type1 VARCHAR(16),
sale_date DATE NOT NULL,
price INTEGER NOT NULL,
latitude INTEGER NOT NULL,
longitude INTEGER NOT NULL, PRIMARY KEY (id));
LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sacramentorealestatetransactions.csv' 
INTO TABLE Transactions 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(street,transactions city, zip, state, beds, bath, sq_ft, type1, sale_date, price, latitude, longitude)
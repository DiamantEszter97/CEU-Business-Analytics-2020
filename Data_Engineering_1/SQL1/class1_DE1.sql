CREATE SCHEMA firstdb;
create schema FIRSTDB;
DROP SCHEMA firstdb;
DROP SCHEMA IF EXISTS firstdb;
CREATE SCHEMA firstdb;
USE firstdb;
DROP SCHEMA firstdb;
CREATE SCHEMA firstdb;
USE firstdb;
CREATE TABLE birdstrikes
(id INTEGER NOT NULL,
aircraft VARCHAR(32),
flight_date DATE NOT NULL,
damage VARCHAR(16) NOT NULL,
airline VARCHAR(255) NOT NULL,
state VARCHAR(255),
phase_of_flight VARCHAR(32),
reported_date DATE,
bird_size VARCHAR(16),
cost INTEGER NOT NULL,
speed INTEGER,
PRIMARY KEY(id));
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/birdstrikes_small.csv' 
INTO TABLE birdstrikes 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(id, aircraft, flight_date, damage, airline, state, phase_of_flight, @v_reported_date, bird_size, cost, @v_speed)
SET
reported_date = nullif(@v_reported_date, ''),
speed = nullif(@v_speed, '');

USE firstdb;
SHOW TABLES;

CREATE TABLE new_birdstrikes LIKE birdstrikes; 
SHOW TABLES;
DESCRIBE new_birdstrikes;
SELECT * FROM new_birdstrikes;

DROP TABLE IF EXISTS new_birdstrikes;

CREATE TABLE employee (id INTEGER NOT NULL, employee_name VARCHAR(255) NOT NULL, PRIMARY KEY(id));
DESCRIBE employee;

INSERT INTO employee (id,employee_name) VALUES(1,'Student1');
INSERT INTO employee (id,employee_name) VALUES(2,'Student2');
INSERT INTO employee (id,employee_name) VALUES(3,'Student3');
SELECT * FROM employee;

UPDATE employee SET employee_name='Arnold Schwarzenegger' WHERE id = '1';

UPDATE employee SET employee_name='The Other Arnold' WHERE id = '2';

DELETE FROM employee WHERE id = 3;

TRUNCATE employee;

SELECT * FROM employee;

CREATE USER 'diamanteszter'@'%' IDENTIFIED BY 'diamanteszter';
GRANT ALL ON birdstrikes.employee TO 'diamanteszter'@'%';
GRANT SELECT (state) ON firstdb.birdstrikes TO 'diamanteszter'@'%';
DROP USER 'diamanteszter'@'%';

DESCRIBE birdstrikes;

SELECT *, speed/2 AS halfspeed FROM birdstrikes;

SELECT * FROM birdstrikes LIMIT 10;
SELECT * FROM birdstrikes LIMIT 10,1;

SELECT state FROM birdstrikes LIMIT 144,1;

SELECT state, cost FROM birdstrikes ORDER BY cost;
SELECT state, cost FROM birdstrikes ORDER BY state, cost ASC;
SELECT state, cost FROM birdstrikes ORDER BY cost DESC;

SELECT flight_date FROM birdstrikes ORDER BY flight_date DESC;

SELECT DISTINCT damage FROM birdstrikes;
SELECT DISTINCT airline, damage FROM birdstrikes;

SELECT distinct cost FROM birdstrikes ORDER BY cost desc LIMIT 49,1;

SELECT * FROM birdstrikes WHERE state = 'Alabama';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'A%';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'ALA%';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'NORTH _A%';
SELECT DISTINCT state FROM birdstrikes WHERE state NOT LIKE 'a%' ORDER BY state;

SELECT * FROM birdstrikes WHERE state = 'Alabama' AND bird_size = 'Small';

SELECT * FROM birdstrikes WHERE state = 'Alabama' OR state = 'Missouri';
SELECT * FROM birdstrikes WHERE state IN ('Alabama', 'Missouri','New York','Alaska');
SELECT DISTINCT(state) FROM birdstrikes WHERE LENGTH(state) = 5;


SELECT ROUND(SQRT(speed/2) * 10) AS synthetic_speed FROM birdstrikes;
SELECT * FROM birdstrikes where cost BETWEEN 20 AND 40;

SELECT * FROM birdstrike where state IS NOT NULL AND bird_size IS NOT NULL; ????
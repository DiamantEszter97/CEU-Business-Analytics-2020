use firstdb;

-- Exercise1: What state figures in the 145th line of our database?
select state from birdstrikes limit 144,1;
-- Tennessee


-- Exercise2: What is flight_date of the latest birdstrike in this database?
select flight_date, damage from birdstrikes where damage = 'caused damage' order by flight_date desc;
-- 2000-04-17


-- Exercise3: What was the cost of the 50th most expensive damage?
select distinct damage, cost from birdstrikes order by cost desc limit 49,1;
-- 5345

-- Exercise4: What state figures in the 2nd record, if you filter out all records which have no state and no bird_size specified?
select state from birdstrikes where state is not null and state != '' and bird_size is not null and bird_size != '' limit 1,1;
-- Colorado


-- Exercise5:  How many days elapsed between the current date and the flights happening in week 52, for incidents from Colorado? (Hint: use NOW, DATEDIFF, WEEKOFYEAR)
select flight_date, weekofyear(flight_date) as weeks, datediff(day, flight_date, now()) as diff from birdstrikes where weeks = 52;
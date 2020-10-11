use firstdb;

-- Exercise1: Do the same with speed. If speed is NULL or speed < 100 create a "LOW SPEED" category, otherwise, mark as "HIGH SPEED". Use IF instead of CASE!
select id, airline, speed, if((speed <100 or speed is null), 'low speed', 'high speed') as speed_category from birdstrikes order by speed_category;

-- Exercise2: How many distinct 'aircraft' we have in the database?
select count(distinct(aircraft)) from birdstrikes;
-- 3

-- Exercise3: What was the lowest speed of aircrafts starting with 'H'
select min(speed), aircraft from birdstrikes where aircraft like 'H%';
-- Helicopter

-- Exercise4: Which phase_of_flight has the least of incidents?
select sum(cost) as sumcost, phase_of_flight from birdstrikes group by phase_of_flight  order by sumcost asc;
-- taxi

-- Exercise5: What is the rounded highest average cost by phase_of_flight?
select round(avg(cost)) as avgcost, phase_of_flight from birdstrikes group by phase_of_flight order by avgcost desc;
-- climb

-- Exercise6: What the highest AVG speed of the states with names less than 5 characters?
select avg(speed) as avgspeed, state from birdstrikes group by state having length(state) <= 5 order by avgspeed desc;
-- 2862,5



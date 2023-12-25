USE md_water_services;

-- Total Population in Maji Ndogo
SELECT
	Sum(number_of_people_served) as total_pop
FROM water_source;

-- Identifying the types of water sources
SELECT  Distinct type_of_water_source as water_source_type
FROM water_source;

-- Identifying the queue times
SELECT *
FROM visits
ORDER BY time_in_queue desc
LIMIT 10;

-- location with longest queue time
SELECT
v.location_id,
location_type,
province_name,
town_name,
v.source_id,
type_of_water_source,
number_of_people_served,
time_in_queue
FROM visits as v
JOIN water_source as ws
on v.source_id = ws.source_id
JOIN location as l
on v.location_id = l.location_id
WHERE time_in_queue > 500
ORDER BY time_in_queue desc
Limit 10;

-- assessing the quality of water sources
SELECT *
FROM water_quality
WHERE visit_count = 2
AND subjective_quality_score = 10
LIMIT 5;

-- investigating pollution issues
SELECT *
FROM well_pollution
LIMIT 10;

-- adding employee email
SELECT
    REPLACE(employee_name, ' ', '.') AS new_employee_name,
    CONCAT(
        LOWER(REPLACE(employee_name, ' ', '.')), '@ndogowater.gov'
    ) AS new_email
FROM employee
LIMIT 10;

-- updating email column
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov');

-- cleaning the phone number column
SELECT
    LENGTH(phone_number) as old_length,
    TRIM(phone_number) as new_phone_number,
    LENGTH(TRIM(phone_number)) as new_length
FROM
    employee
LIMIT 10;

-- updating phone numbers
UPDATE employee
SET phone_number = TRIM(phone_number);

-- number of employees per town
SELECT
    town_name,
    COUNT(employee_name) AS employees_per_town
FROM employee
GROUP BY town_name;

-- number of records per town
SELECT
    town_name,
    COUNT(location_id) as records_per_town
FROM location
GROUP BY town_name 
LIMIT 10;

-- records per province
SELECT
    province_name,
    COUNT(location_id) as records_per_province
FROM location
GROUP BY province_name;

-- number of water sources per location type
SELECT
    location_type,
    COUNT(location_type) as num_of_sources
FROM location
GROUP BY location_type;

-- water source percentage share by location type
SELECT
    location_type,
    COUNT(location_type) as num_of_sources,
    ROUND((COUNT(location_type) / (SELECT COUNT(*) FROM location) * 100), 2) as pct_location_type
FROM location
GROUP BY location_type;

-- number of sources according to type
SELECT
    type_of_water_source,
    COUNT(type_of_water_source) as number_of_sources
FROM water_source
GROUP BY type_of_water_source;

-- total number of people served per water source
SELECT
    type_of_water_source,
    ROUND(sum(number_of_people_served)) as population_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY population_served DESC;

-- percentage of people per source
SELECT
    type_of_water_source,
    SUM(number_of_people_served) as people_served_by_source,
    ROUND((SUM(number_of_people_served) / (SELECT SUM(number_of_people_served) FROM water_source) * 100)) as percentage_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY percentage_served DESC;

-- total time taken for survey
SELECT
    DATEDIFF(MAX(time_of_record), MIN(time_of_record)) as total_time_of_survey
FROM visits;

-- average total queue times
SELECT AVG(NULLIF(time_in_queue, 0)) AS average_queue_time
FROM visits;

-- aggregate queue times by day and hour
SELECT
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
    -- Sunday
    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
            ELSE NULL
        END
    ), 0) AS Sunday,
    -- Monday
    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
            ELSE NULL
        END
    ), 0) AS Monday,
    -- Tuesday
    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
            ELSE NULL
        END
    ), 0) AS Tuesday,
    -- Wednesday
    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
            ELSE NULL
        END
    ), 0) AS Wednesday,
    -- Thursday
    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
            ELSE NULL
        END
    ), 0) AS Thursday,
    -- Friday
    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
            ELSE NULL
        END
    ), 0) AS Friday,
    -- Saturday
    ROUND(AVG(
        CASE
            WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
            ELSE NULL
        END
    ), 0) AS Saturday
FROM
    visits
WHERE
    time_in_queue != 0 -- this excludes other sources with 0 queue times
GROUP BY
    hour_of_day
ORDER BY
    hour_of_day;

-- Join locations and visits table
SELECT province_name, town_name, l.location_id, visit_count
FROM location as l
INNER JOIN visits
ON l.location_id = visits.location_id;

-- join water source table to previous joins 
SELECT 
	province_name, 
    town_name, 
    l.location_id, 
    visit_count, 
    type_of_water_source, 
    number_of_people_served
FROM location as l
INNER JOIN visits
ON l.location_id = visits.location_id
INNER JOIN water_source as ws
ON visits.source_id = ws.source_id;

-- Checking for multiple visits
SELECT 
	province_name, 
    town_name, 
    l.location_id, 
    visit_count, 
    type_of_water_source, 
    number_of_people_served
FROM location as l
INNER JOIN visits
ON l.location_id = visits.location_id
INNER JOIN water_source as ws
ON visits.source_id = ws.source_id
WHERE visits.location_id = 'AkHa00103';

-- querying locations where visit count = 1
SELECT 
	province_name, 
    town_name, 
    l.location_id, 
    visit_count, 
    type_of_water_source, 
    number_of_people_served
FROM location as l
INNER JOIN visits
ON l.location_id = visits.location_id
INNER JOIN water_source as ws
ON visits.source_id = ws.source_id
WHERE visits.visit_count = 1;

-- Adding location_type and time_in_queue columns
SELECT 
	province_name, 
    town_name, 
    type_of_water_source,
    location_type,
    number_of_people_served,
    time_in_queue
FROM location as l
INNER JOIN visits
ON l.location_id = visits.location_id
INNER JOIN water_source as ws
ON visits.source_id = ws.source_id
WHERE visits.visit_count = 1;

-- Joining well_pollution table
SELECT 
	province_name, 
    town_name, 
    type_of_water_source,
    location_type,
    number_of_people_served,
    time_in_queue,
    wp.results
FROM location as l
INNER JOIN visits
ON l.location_id = visits.location_id
INNER JOIN water_source as ws
ON visits.source_id = ws.source_id
LEFT JOIN well_pollution as wp
ON visits.source_id = wp.source_id
WHERE visits.visit_count = 1;

-- Creating a view
CREATE VIEW combined_analysis_table AS
SELECT 
    province_name,
    town_name,
    type_of_water_source as source_type,
    location_type,
    number_of_people_served as people_served,
    time_in_queue,
    wp.results
FROM
    location AS l
        INNER JOIN
    visits ON l.location_id = visits.location_id
        INNER JOIN
    water_source AS ws ON visits.source_id = ws.source_id
        LEFT JOIN
    well_pollution AS wp ON visits.source_id = wp.source_id
WHERE
    visits.visit_count = 1;
    
    -- Calculate the percentage of people served by each source type in each province
WITH province_totals AS (
  SELECT province_name, SUM(people_served) AS total_ppl_serv
  FROM combined_analysis_table
  GROUP BY province_name
  )
SELECT ct.province_name,
  ROUND((SUM(CASE WHEN source_type = 'river' THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS river,
  ROUND((SUM(CASE WHEN source_type = 'shared_tap' THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS shared_tap,
  ROUND((SUM(CASE WHEN source_type = 'tap_in_home' THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS tap_in_home,
  ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken' THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS tap_in_home_broken,
  ROUND((SUM(CASE WHEN source_type = 'well' THEN people_served ELSE 0 END) * 100.0 / pt.total_ppl_serv), 0) AS well
FROM combined_analysis_table ct
JOIN province_totals pt ON ct.province_name = pt.province_name
GROUP BY ct.province_name
ORDER BY ct.province_name;

-- Calculate the percentage of people served by each source type in each town
WITH town_totals AS (
  SELECT province_name, town_name, SUM(people_served) AS total_ppl_serv
  FROM combined_analysis_table
  GROUP BY province_name, town_name
)
SELECT ct.province_name, ct.town_name,
  ROUND((SUM(CASE WHEN source_type = 'river' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS river,
  ROUND((SUM(CASE WHEN source_type = 'shared_tap' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS shared_tap,
  ROUND((SUM(CASE WHEN source_type = 'tap_in_home' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home,
  ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home_broken,
  ROUND((SUM(CASE WHEN source_type = 'well' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS well
FROM combined_analysis_table ct
JOIN town_totals tt ON ct.province_name = tt.province_name AND ct.town_name = tt.town_name
GROUP BY ct.province_name, ct.town_name
ORDER BY ct.town_name;

-- Creating Temporary Table
 CREATE TEMPORARY TABLE town_aggregated_water_access
WITH town_totals AS (
  SELECT province_name, town_name, SUM(people_served) AS total_ppl_serv
  FROM combined_analysis_table
  GROUP BY province_name, town_name
  )
  SELECT ct.province_name, ct.town_name,
  ROUND((SUM(CASE WHEN source_type = 'river' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS river,
  ROUND((SUM(CASE WHEN source_type = 'shared_tap' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS shared_tap,
  ROUND((SUM(CASE WHEN source_type = 'tap_in_home' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home,
  ROUND((SUM(CASE WHEN source_type = 'tap_in_home_broken' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS tap_in_home_broken,
  ROUND((SUM(CASE WHEN source_type = 'well' THEN people_served ELSE 0 END) * 100.0 / tt.total_ppl_serv), 0) AS well
FROM combined_analysis_table ct
JOIN town_totals tt ON ct.province_name = tt.province_name AND ct.town_name = tt.town_name
GROUP BY ct.province_name, ct.town_name
ORDER BY ct.town_name;

--  which town has the highest ratio of people who have taps, but have no running water?
SELECT
province_name,
town_name,
ROUND(tap_in_home_broken / (tap_in_home_broken + tap_in_home) *
100,0) AS Pct_broken_taps
FROM
town_aggregated_water_access
ORDER BY Pct_broken_taps desc
LIMIT 10;
  
  -- Create Progress Report Table
  CREATE TABLE Project_progress (
Project_id SERIAL PRIMARY KEY,
source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
Address VARCHAR(50),
Town VARCHAR(30),
Province VARCHAR(30),
Source_type VARCHAR(50),
Improvement VARCHAR(50),
Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
Date_of_completion DATE,
Comments TEXT
);

--  Project Progress Query 
SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
well_pollution.results
FROM
water_source
LEFT JOIN
well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
visits ON water_source.source_id = visits.source_id
INNER JOIN
location ON location.location_id = visits.location_id;

--  filtering
SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
well_pollution.results
FROM
water_source
LEFT JOIN
well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
visits ON water_source.source_id = visits.source_id
INNER JOIN
location ON location.location_id = visits.location_id
WHERE visits.visit_count = 1
AND (results != 'clean'
	OR type_of_water_source IN ('tap_in_home_broken', 'river')
	OR (type_of_water_source = 'shared_tap' and time_in_queue > 30));
    
-- Query 15
SELECT
 l.address AS Address,
 l.town_name AS Town,
 l.province_name AS Province,
 ws.source_id AS Source_id,
 ws.type_of_water_source AS Source_type,
    CASE WHEN wp.results = "Contaminated: Biological" THEN "Install UV filter" 
    WHEN wp.results = "Contaminated: Chemical" THEN "Install RO filter" 
    WHEN ws.type_of_water_source = "river" THEN "Drill well"
    WHEN ws.type_of_water_source = "shared_tap" AND v.time_in_queue >= 30 THEN CONCAT("Install ", FLOOR(v.time_in_queue/30), " taps nearby")
    WHEN ws.type_of_water_source = "tap_in_home_broken" THEN "Diagnose local infrastructure" ELSE NULL END AS improvement
FROM
 md_water_services.water_source AS ws
LEFT JOIN
 md_water_services.well_pollution AS wp
ON
 ws.source_id = wp.source_id
INNER JOIN
 md_water_services.visits AS v
ON
 ws.source_id = v.source_id
INNER JOIN
 md_water_services.location AS l
ON
 l.location_id = v.location_id
WHERE
 v.visit_count = 1
    AND (wp.results != "Clean"
  OR ws.type_of_water_source IN ("river", "tap_in_home_broken")
        OR (ws.type_of_water_source = "shared_tap" AND v.time_in_queue >= 30));


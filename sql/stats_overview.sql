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
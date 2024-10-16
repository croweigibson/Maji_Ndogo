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
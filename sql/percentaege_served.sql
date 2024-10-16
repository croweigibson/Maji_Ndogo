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
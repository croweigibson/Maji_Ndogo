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
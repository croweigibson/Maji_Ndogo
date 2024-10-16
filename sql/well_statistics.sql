well statistics
SELECT
    SUM(CASE WHEN results = 'clean' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS clean_percentage,
    SUM(CASE WHEN results = 'Contaminated: Chemical' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS chem_contaminated_percentage,
    SUM(CASE WHEN results = 'Contaminated: Biological' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS bio_contaminated_percentage
FROM well_pollution
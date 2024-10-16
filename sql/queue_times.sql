
-- Identifying the queue times
SELECT *
FROM visits
ORDER BY time_in_queue desc
LIMIT 10;

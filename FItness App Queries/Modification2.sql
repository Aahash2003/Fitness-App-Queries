SET SQL_SAFE_UPDATES = 0;

UPDATE Exercise
SET targetMuscle = CASE 
                     WHEN duration < 15 THEN 'Quick Warm-Up'
                     WHEN duration BETWEEN 15 AND 30 THEN 'General Fitness'
                     WHEN duration > 30 THEN 'Intensive Training'
                   END;
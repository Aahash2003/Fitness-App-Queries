-- Delete workout and their component from a given user
DELETE FROM WorkoutComponent
WHERE workout_ID IN (
    SELECT workout_ID
    FROM Workout
    WHERE username = 'joban'
    AND date = '2023-10-25'
);

DELETE FROM Workout
WHERE username = 'joban'
AND date = '2023-10-25';
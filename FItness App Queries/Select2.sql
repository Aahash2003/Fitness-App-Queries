-- Selecting workout_ID, username, exerciseName, and the total duration of each exercise
SELECT Workout.workout_ID, Workout.username, Exercise.exerciseName, SUM(Exercise.duration) AS total_duration
FROM Workout
JOIN WorkoutComponent ON Workout.workout_ID = WorkoutComponent.workout_ID
JOIN Exercise ON WorkoutComponent.exerciseName = Exercise.exerciseName
GROUP BY Workout.workout_ID, Workout.username, Exercise.exerciseName;


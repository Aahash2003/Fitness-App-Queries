-- Retrieve the users who have achieved their fitness goals along with the details of their most recent progress entry
SELECT User.username, User.name, FitnessGoal.description AS goal_description, ProgressTracker.date, ProgressTracker.weight
FROM User
JOIN FitnessGoal ON User.username = FitnessGoal.username
LEFT JOIN ProgressTracker ON User.username = ProgressTracker.username
WHERE FitnessGoal.succeeded = 1
ORDER BY User.username, ProgressTracker.date DESC


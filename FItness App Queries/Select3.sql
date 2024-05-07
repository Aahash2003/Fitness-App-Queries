use fitnessdb;
-- List the users and their most recent progress entry:

SELECT User.username, User.name, ProgressTracker.date, ProgressTracker.weight
FROM User
LEFT JOIN ProgressTracker ON User.username = ProgressTracker.username
WHERE ProgressTracker.date = (
    SELECT MAX(date)
    FROM ProgressTracker
    WHERE ProgressTracker.username = User.username
);
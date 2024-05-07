-- Find the average weight and age of users who have set fitness goals:
SELECT AVG(User.weight) AS average_weight, AVG(User.age) AS average_age
FROM User
WHERE EXISTS (
    SELECT 1
    FROM FitnessGoal
    WHERE FitnessGoal.username = User.username
);
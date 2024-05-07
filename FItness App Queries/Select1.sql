-- Retrieve all goals and their corresponding user names
use fitnessdb;
SELECT FitnessGoal.goal_ID, FitnessGoal.description, FitnessGoal.username, User.name
FROM FitnessGoal
JOIN User ON FitnessGoal.username = User.username;

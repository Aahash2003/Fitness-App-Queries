-- Selecting the username, name, and BMI of every user for males and users over 18 years old
SELECT User.username, User.name, (User.weight / (User.height * User.height)) AS bmi
FROM User
WHERE User.gender = 'Mr.'
AND User.age >= 18

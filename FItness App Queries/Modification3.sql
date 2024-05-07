-- Increase for younger users
UPDATE CalorieIntake
SET calories = calories * 1.1
WHERE username IN (
    SELECT username FROM User WHERE age < 25
);

-- Decrease for older users
UPDATE CalorieIntake
SET calories = calories * 0.9
WHERE username IN (
    SELECT username FROM User WHERE age > 50
);

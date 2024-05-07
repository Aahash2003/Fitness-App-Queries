SET SQL_SAFE_UPDATES = 0;

-- Update for Underweight
UPDATE CalorieIntake
INNER JOIN (
    SELECT username, ((weight/2.205) / ((height/100) * (height/100))) AS bmi
    FROM User
) AS UserBMI ON CalorieIntake.username = UserBMI.username
SET calories = calories * 1.1  -- Assuming increasing calories for underweight
WHERE UserBMI.bmi < 18.5;

-- Update for Normal weight
UPDATE CalorieIntake
INNER JOIN (
    SELECT username, ((weight/2.205) / ((height/100) * (height/100))) AS bmi
    FROM User
) AS UserBMI ON CalorieIntake.username = UserBMI.username
SET calories = calories  -- Assuming maintaining calories for normal weight
WHERE UserBMI.bmi BETWEEN 18.5 AND 24.9;

-- Update for Overweight
UPDATE CalorieIntake
INNER JOIN (
   SELECT username, ((weight/2.205) / ((height/100) * (height/100))) AS bmi
    FROM User
) AS UserBMI ON CalorieIntake.username = UserBMI.username
SET calories = calories * 0.9  -- Assuming reducing calories for overweight
WHERE UserBMI.bmi BETWEEN 25 AND 29.9;

-- Update for Obese
UPDATE FitnessGoal
INNER JOIN (
    SELECT username, ((weight/2.205) / ((height/100) * (height/100))) AS bmi
    FROM User
) AS UserBMI ON FitnessGoal.username = UserBMI.username
SET FitnessGoal.description = 'Obese'
WHERE UserBMI.bmi >= 30;

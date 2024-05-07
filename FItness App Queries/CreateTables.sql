-- Create the database
CREATE DATABASE IF NOT EXISTS assignement3;

-- Use the created database
USE assignement3;

-- User Table
CREATE TABLE User (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    gender VARCHAR(255),
    age INT,
    height FLOAT,
    weight FLOAT
);

-- Fitness Goal Table
CREATE TABLE FitnessGoal (
    goal_ID INT NOT NULL PRIMARY KEY,
    `description` VARCHAR(255), -- Use backticks to escape reserved keyword
    weight INT,
    duration TIME,
    startDate DATE,
    endDate DATE,
    succeeded BOOLEAN,
    username VARCHAR(255),
    FOREIGN KEY (username) REFERENCES User(username)
);


-- ProgressTracker Table
CREATE TABLE ProgressTracker (
    progress_ID INT NOT NULL PRIMARY KEY,
    date DATE,
    weight FLOAT,
    macrosIntake VARCHAR(255), 
    username VARCHAR(255),
    FOREIGN KEY (username) REFERENCES User(username)
);

-- CalorieIntake Table
CREATE TABLE CalorieIntake (
    entryNo INT NOT NULL PRIMARY KEY,
    date DATE,
    calories FLOAT,
    carbsConsumed FLOAT,
    proteinConsumed FLOAT,
    fatsConsumed FLOAT,
    username VARCHAR(255),
    FOREIGN KEY (username) REFERENCES User(username)
);

-- Workout Table
CREATE TABLE Workout (
    workout_ID INT NOT NULL PRIMARY KEY,
    date DATE,
    username VARCHAR(255),
    FOREIGN KEY (username) REFERENCES User(username)
);

-- Exercise Table
CREATE TABLE Exercise (
    exerciseName VARCHAR(255) PRIMARY KEY,
    exerciseDescription VARCHAR(255),
    duration FLOAT,
    burnedCalories FLOAT,
    targetMuscle VARCHAR(255) 
);

-- WorkoutComponent Table
CREATE TABLE WorkoutComponent (
    reps INT,
    sets INT,
    workout_ID INT,
    exerciseName VARCHAR(255),
    PRIMARY KEY (workout_ID, exerciseName),
    FOREIGN KEY (workout_ID) REFERENCES Workout(workout_ID),
    FOREIGN KEY (exerciseName) REFERENCES Exercise(exerciseName)
);

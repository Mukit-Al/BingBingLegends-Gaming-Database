-- ============================================================================
-- Basic SQL Queries
-- ============================================================================
-- Purpose: Demonstrate fundamental SQL operations
-- Database: BingBingLegends
-- Author: Group Project (Bachelor's Degree)
-- Date: 2021
-- ============================================================================

USE BingBingLegends;
GO

-- ============================================================================
-- QUERY 1: Pattern Matching with LIKE
-- ============================================================================
-- Question: List the names of all heroes whose names contain the letter 'a' or 't'. 
-- Arrange the list alphabetically according to the names.
-- Author: Abdullah Al Mukit (TP063405)
-- ============================================================================

SELECT Hero_Name
FROM HeroInfo
WHERE Hero_Name LIKE '%a%' OR Hero_Name LIKE '%t%'
ORDER BY Hero_Name ASC;

-- Expected Output: List of hero names containing 'a' or 't', sorted alphabetically
-- Skills demonstrated: LIKE operator, OR condition, ORDER BY

-- ============================================================================
-- QUERY 2: Date Range Filtering
-- ============================================================================
-- Question: List the game ids, game times, and game dates for all games played 
-- between '01/03/2021' and '31/03/2021' in descending order of game dates.
-- Author: Saw Chiou Ming (TP063734)
-- ============================================================================

SELECT Game_ID, Game_Time, Game_Date
FROM Game
WHERE Game_Date BETWEEN '2021-03-01' AND '2021-03-31'
ORDER BY Game_Date DESC;

-- Expected Output: Games from March 2021, sorted by date (newest first)
-- Skills demonstrated: BETWEEN operator, date filtering, ORDER BY DESC

-- ============================================================================
-- QUERY 3: Simple Filtering
-- ============================================================================
-- Question: List the names and email addresses of all the players who have 
-- played at least 5 games.
-- Author: SM Rabeya Amin Ikra (TP058834)
-- ============================================================================

SELECT Player_Name, User_Email, Game_Played
FROM PlayerInfo
WHERE Game_Played >= 5
ORDER BY Player_Name ASC;

-- Expected Output: Active players with 5+ games, sorted by name
-- Skills demonstrated: WHERE clause with comparison operator, ORDER BY

-- ============================================================================
-- QUERY 4: Finding Maximum Values
-- ============================================================================
-- Question: List the names and battle points of all players with the highest 
-- battle points. Arrange the list alphabetically according to the names.
-- Author: GOH WEI SONG (TP063479)
-- ============================================================================

SELECT Player_Name, MAX(Battle_Points) AS 'Highest Battle Points'
FROM Player2
GROUP BY Player_Name
ORDER BY Player_Name ASC;

-- Expected Output: All players with their maximum battle points
-- Skills demonstrated: MAX aggregate function, GROUP BY

PRINT 'Basic queries executed successfully.';

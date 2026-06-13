-- ============================================================================
-- Advanced SQL Queries
-- ============================================================================
-- Purpose: Demonstrate complex SQL operations with JOINs and subqueries
-- Database: BingBingLegends
-- Author: Group Project (Bachelor's Degree)
-- Date: 2021
-- ============================================================================

USE BingBingLegends;
GO

-- ============================================================================
-- QUERY 1: Multi-table JOIN with Filtering
-- ============================================================================
-- Question: List the details of players who own any heroes with "Charge" specialty.
-- Author: Abdullah Al Mukit (TP063405)
-- ============================================================================

SELECT 
    HeroInfo.Hero_Name, 
    HeroInfo.Hero_Speciality, 
    Hero2.Hero_ID, 
    Player_Hero.Player_ID, 
    Player2.Player_Name
FROM HeroInfo 
JOIN Hero2 ON HeroInfo.Hero_Name = Hero2.Hero_Name
JOIN Player_Hero ON Hero2.Hero_ID = Player_Hero.Hero_ID
JOIN Player2 ON Player_Hero.Player_ID = Player2.PlayerID
WHERE HeroInfo.Hero_Speciality = 'Charge';

-- Expected Output: Players who own heroes with 'Charge' specialty
-- Skills demonstrated: Multiple JOINs, WHERE filtering, table aliases

-- ============================================================================
-- QUERY 2: Three-table JOIN with Specific Condition
-- ============================================================================
-- Question: List the ids, names and levels of all heroes owned by the player 
-- named "John Alex".
-- Author: Abdullah Al Mukit (TP063405)
-- ============================================================================

SELECT 
    Player_Hero.Hero_ID,
    Hero2.Hero_Name, 
    Player_Hero.Level
FROM Player2 
JOIN Player_Hero ON Player2.PlayerID = Player_Hero.Player_ID
JOIN Hero2 ON Player_Hero.Hero_ID = Hero2.Hero_ID
WHERE Player2.Player_Name = 'John Alex';

-- Expected Output: Hero details for player John Alex
-- Skills demonstrated: Multiple JOINs, string matching in WHERE

-- ============================================================================
-- QUERY 3: Complex JOIN with Multiple Conditions
-- ============================================================================
-- Question: List the details of players who own any heroes whose levels are 
-- more than 3.
-- Author: Saw Chiou Ming (TP063734)
-- ============================================================================

SELECT 
    P.PlayerID, 
    PI.*
FROM Player2 P 
JOIN PlayerInfo PI ON P.Player_Name = PI.Player_Name
JOIN Player_Hero PH ON PH.Player_ID = P.PlayerID
JOIN Hero2 H ON H.Hero_ID = PH.Hero_ID
WHERE H.Current_Level > 3;

-- Expected Output: Player details for those owning high-level heroes
-- Skills demonstrated: Four-table JOIN, numeric comparison, table aliases

-- ============================================================================
-- QUERY 4: JOIN with Subquery (Aggregate Comparison)
-- ============================================================================
-- Question: List the ids and names of all heroes who have any skin priced 
-- (in battle points) higher than the average price of all skins, and show by how much.
-- Author: Saw Chiou Ming (TP063734)
-- ============================================================================

SELECT 
    H.Hero_ID, 
    H.Hero_Name, 
    SI.Skin_Cost
FROM SkinInfo SI 
JOIN Skin S ON SI.Skin_Name = S.Skin_Name
JOIN Skin_Hero SH ON S.Skin_ID = SH.Skin_ID
JOIN Hero2 H ON SH.Hero_ID = H.Hero_ID
WHERE SI.Skin_Cost > (SELECT AVG(Skin_Cost) FROM SkinInfo);

-- Expected Output: Heroes with expensive skins (above average)
-- Skills demonstrated: Subquery, aggregate functions, multiple JOINs

-- ============================================================================
-- QUERY 5: JOIN with COUNT and GROUP BY
-- ============================================================================
-- Question: List the hero ID, Hero name and Total Number of skins belonging 
-- to each hero.
-- Author: SM Rabeya Amin Ikra (TP058834)
-- ============================================================================

SELECT 
    H.Hero_ID,
    H.Hero_Name,
    COUNT(S.Skin_ID) AS 'TOTAL NUMBER OF SKINS'
FROM Hero2 H 
INNER JOIN Skin S ON H.Hero_ID = S.Hero_ID
GROUP BY H.Hero_ID, H.Hero_Name;

-- Expected Output: Each hero with their skin count
-- Skills demonstrated: INNER JOIN, COUNT aggregate, GROUP BY

-- ============================================================================
-- QUERY 6: LEFT JOIN for Finding Non-matching Records
-- ============================================================================
-- Question: List the details of all players who did not play any games.
-- Author: SM Rabeya Amin Ikra (TP058834)
-- ============================================================================

SELECT 
    T.*,
    P.Global_Level,
    P.Game_Played,
    P.User_Email,
    P.Username
FROM PlayerInfo P 
INNER JOIN Player2 T ON P.Player_Name = T.Player_Name
WHERE Game_Played = 0;

-- Expected Output: Inactive players with zero games
-- Skills demonstrated: INNER JOIN, filtering on zero values

PRINT 'Advanced queries executed successfully.';

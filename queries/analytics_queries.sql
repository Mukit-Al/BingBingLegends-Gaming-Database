-- ============================================================================
-- Analytics SQL Queries
-- ============================================================================
-- Purpose: Demonstrate data analysis and business intelligence queries
-- Database: BingBingLegends
-- Author: Group Project (Bachelor's Degree)
-- Date: 2021
-- ============================================================================

USE BingBingLegends;
GO

-- ============================================================================
-- QUERY 1: Time-based Analysis with Grouping
-- ============================================================================
-- Question: List the total number of games played in each mode on '15/3/2021'. 
-- Sort your answer in descending order of total number of games played.
-- Author: GOH WEI SONG (TP063479)
-- ============================================================================

SELECT 
    G.Game_Date,
    M.Mode_ID,
    COUNT(Game_ID) AS 'Total number of games played'
FROM Game_Mode2 M 
INNER JOIN Game G ON M.Mode_ID = G.Mode_ID
WHERE Game_Date = '2021-03-15'
GROUP BY M.Mode_ID, G.Game_Date
ORDER BY COUNT(Game_ID) DESC;

-- Expected Output: Game count per mode for March 15, 2021
-- Skills demonstrated: Date filtering, COUNT aggregate, GROUP BY, ORDER BY

-- ============================================================================
-- QUERY 2: Ranking Analysis with TOP
-- ============================================================================
-- Question: List the id and name of the most used hero in all games.
-- Author: GOH WEI SONG (TP063479)
-- ============================================================================

SELECT TOP 1 
    PH.Hero_ID,
    Hero_Name, 
    COUNT(Player_ID) AS 'HeroUsed'
FROM Player_Hero PH 
JOIN Hero2 H ON H.Hero_ID = PH.Hero_ID
GROUP BY PH.Hero_ID, Hero_Name
ORDER BY HeroUsed DESC;

-- Expected Output: Single most popular hero with usage count
-- Skills demonstrated: TOP clause, COUNT aggregate, GROUP BY, ORDER BY DESC

-- ============================================================================
-- ANALYTIC QUERY 3: Player Performance Analysis
-- ============================================================================
-- Purpose: Analyze player win rates across different game modes
-- This is an additional analytical query for business insights
-- ============================================================================

SELECT 
    P.Player_Name,
    M.Mode_Name,
    COUNT(G.Game_ID) AS Total_Games,
    SUM(CASE WHEN G.Game_Result = 'WIN' THEN 1 ELSE 0 END) AS Wins,
    SUM(CASE WHEN G.Game_Result = 'LOSE' THEN 1 ELSE 0 END) AS Losses,
    CAST(SUM(CASE WHEN G.Game_Result = 'WIN' THEN 1 ELSE 0 END) * 100.0 / 
         COUNT(G.Game_ID) AS DECIMAL(5,2)) AS Win_Rate_Percentage
FROM Player2 P
JOIN Player_Hero PH ON P.PlayerID = PH.Player_ID
JOIN Game G ON PH.Game_ID = G.Game_ID
JOIN Game_Mode2 M ON G.Mode_ID = M.Mode_ID
GROUP BY P.Player_Name, M.Mode_Name
HAVING COUNT(G.Game_ID) > 0
ORDER BY Win_Rate_Percentage DESC;

-- Expected Output: Player performance metrics by game mode
-- Skills demonstrated: CASE statements, complex aggregation, HAVING clause

-- ============================================================================
-- ANALYTIC QUERY 4: Hero Popularity Analysis
-- ============================================================================
-- Purpose: Identify most popular heroes based on player ownership
-- This is an additional analytical query for business insights
-- ============================================================================

SELECT 
    H.Hero_Name,
    HI.Hero_Role,
    HI.Hero_Speciality,
    COUNT(DISTINCT PH.Player_ID) AS Unique_Players,
    AVG(PH.Level) AS Average_Level,
    HI.Hero_Cost
FROM Hero2 H
JOIN HeroInfo HI ON H.Hero_Name = HI.Hero_Name
LEFT JOIN Player_Hero PH ON H.Hero_ID = PH.Hero_ID
GROUP BY H.Hero_Name, HI.Hero_Role, HI.Hero_Speciality, HI.Hero_Cost
ORDER BY Unique_Players DESC, Average_Level DESC;

-- Expected Output: Hero popularity metrics with ownership statistics
-- Skills demonstrated: LEFT JOIN, DISTINCT, AVG aggregate, multiple ORDER BY

-- ============================================================================
-- ANALYTIC QUERY 5: Revenue Analysis (Skin Sales)
-- ============================================================================
-- Purpose: Calculate potential revenue from skin sales
-- This is an additional analytical query for business insights
-- ============================================================================

SELECT 
    HI.Hero_Role,
    COUNT(DISTINCT S.Skin_ID) AS Total_Skins,
    AVG(SI.Skin_Cost) AS Average_Skin_Price,
    SUM(SI.Skin_Cost) AS Total_Potential_Revenue
FROM SkinInfo SI
JOIN Skin S ON SI.Skin_Name = S.Skin_Name
JOIN Hero2 H ON S.Hero_ID = H.Hero_ID
JOIN HeroInfo HI ON H.Hero_Name = HI.Hero_Name
GROUP BY HI.Hero_Role
ORDER BY Total_Potential_Revenue DESC;

-- Expected Output: Revenue potential analysis by hero role
-- Skills demonstrated: Multiple JOINs, aggregate functions, financial analysis

-- ============================================================================
-- ANALYTIC QUERY 6: Player Engagement Analysis
-- ============================================================================
-- Purpose: Analyze player engagement based on activity levels
-- This is an additional analytical query for business insights
-- ============================================================================

SELECT 
    CASE 
        WHEN P.Game_Played = 0 THEN 'Inactive'
        WHEN P.Game_Played BETWEEN 1 AND 10 THEN 'Low Activity'
        WHEN P.Game_Played BETWEEN 11 AND 50 THEN 'Medium Activity'
        WHEN P.Game_Played > 50 THEN 'High Activity'
    END AS Engagement_Level,
    COUNT(*) AS Player_Count,
    AVG(PI.Global_Level) AS Average_Global_Level,
    AVG(P2.Battle_Points) AS Average_Battle_Points
FROM PlayerInfo P
JOIN Player2 P2 ON P.Player_Name = P2.Player_Name
GROUP BY 
    CASE 
        WHEN P.Game_Played = 0 THEN 'Inactive'
        WHEN P.Game_Played BETWEEN 1 AND 10 THEN 'Low Activity'
        WHEN P.Game_Played BETWEEN 11 AND 50 THEN 'Medium Activity'
        WHEN P.Game_Played > 50 THEN 'High Activity'
    END
ORDER BY 
    CASE 
        WHEN P.Game_Played = 0 THEN 1
        WHEN P.Game_Played BETWEEN 1 AND 10 THEN 2
        WHEN P.Game_Played BETWEEN 11 AND 50 THEN 3
        WHEN P.Game_Played > 50 THEN 4
    END;

-- Expected Output: Player engagement segmentation with metrics
-- Skills demonstrated: Complex CASE statements, segmentation analysis

PRINT 'Analytics queries executed successfully.';

# Query Documentation

Detailed explanations of all SQL queries in the BingBingLegends database project, including business purpose, technical approach, and expected results.

## Table of Contents
- [Basic Queries](#basic-queries)
- [Advanced Queries](#advanced-queries)
- [Analytics Queries](#analytics-queries)

---

## Basic Queries

### Query 1: Hero Name Pattern Matching

**Purpose**: Find heroes whose names contain specific letters for search functionality.

**Business Context**: Players often search for heroes by partial name matches. This query supports autocomplete and search features in the game interface.

**SQL Query**:
```sql
SELECT Hero_Name
FROM HeroInfo
WHERE Hero_Name LIKE '%a%' OR Hero_Name LIKE '%t%'
ORDER BY Hero_Name ASC;
```

**Technical Details**:
- Uses `LIKE` operator with wildcards `%` for pattern matching
- `OR` condition to match either letter
- `ORDER BY ASC` for alphabetical sorting
- Demonstrates string pattern matching

**Expected Output**: Alphabetically sorted list of hero names containing 'a' or 't'

**Skills Demonstrated**: LIKE operator, wildcards, logical operators, sorting

---

### Query 2: Date Range Filtering

**Purpose**: Retrieve games played within a specific time period for analysis.

**Business Context**: Game analysts need to examine game activity during specific periods to identify trends, events, or anomalies.

**SQL Query**:
```sql
SELECT Game_ID, Game_Time, Game_Date
FROM Game
WHERE Game_Date BETWEEN '2021-03-01' AND '2021-03-31'
ORDER BY Game_Date DESC;
```

**Technical Details**:
- Uses `BETWEEN` operator for inclusive range filtering
- Date format: 'YYYY-MM-DD' (ISO standard)
- `ORDER BY DESC` shows most recent games first
- Demonstrates date filtering and sorting

**Expected Output**: Games from March 2021, sorted by date (newest first)

**Skills Demonstrated**: BETWEEN operator, date filtering, ORDER BY DESC

---

### Query 3: Player Activity Filtering

**Purpose**: Identify active players based on game participation.

**Business Context**: Marketing and engagement teams need to identify active players for targeted campaigns and retention strategies.

**SQL Query**:
```sql
SELECT Player_Name, User_Email, Game_Played
FROM PlayerInfo
WHERE Game_Played >= 5
ORDER BY Player_Name ASC;
```

**Technical Details**:
- Uses comparison operator `>=` for threshold filtering
- Filters players with 5+ games played
- Alphabetical sorting for easy review
- Demonstrates basic WHERE clause usage

**Expected Output**: Active players with 5+ games, sorted by name

**Skills Demonstrated**: WHERE clause, comparison operators, ORDER BY

---

### Query 4: Maximum Value Analysis

**Purpose**: Find players with highest battle points for leaderboards.

**Business Context**: Leaderboards and competitive rankings require identifying top-performing players based on battle points.

**SQL Query**:
```sql
SELECT Player_Name, MAX(Battle_Points) AS 'Highest Battle Points'
FROM Player2
GROUP BY Player_Name
ORDER BY Player_Name ASC;
```

**Technical Details**:
- Uses `MAX()` aggregate function
- `GROUP BY` to aggregate by player
- Column alias for readable output
- Demonstrates aggregation and grouping

**Expected Output**: All players with their maximum battle points

**Skills Demonstrated**: MAX aggregate, GROUP BY, column aliases

---

## Advanced Queries

### Query 1: Multi-table JOIN with Specialty Filtering

**Purpose**: Find players who own heroes with specific specialties.

**Business Context**: Game balance analysts need to understand which players have access to heroes with particular abilities for matchmaking and balance adjustments.

**SQL Query**:
```sql
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
```

**Technical Details**:
- Four-table JOIN chain
- Joins: HeroInfo → Hero2 → Player_Hero → Player2
- Filters on hero specialty
- Demonstrates complex relationships and JOIN syntax

**Expected Output**: Players who own heroes with 'Charge' specialty

**Skills Demonstrated**: Multiple JOINs, WHERE filtering, table relationships

---

### Query 2: Player-Specific Hero Inventory

**Purpose**: Retrieve all heroes owned by a specific player with their levels.

**Business Context**: Player profiles need to display owned heroes and progression levels for user engagement and inventory management.

**SQL Query**:
```sql
SELECT 
    Player_Hero.Hero_ID,
    Hero2.Hero_Name, 
    Player_Hero.Level
FROM Player2 
JOIN Player_Hero ON Player2.PlayerID = Player_Hero.Player_ID
JOIN Hero2 ON Player_Hero.Hero_ID = Hero2.Hero_ID
WHERE Player2.Player_Name = 'John Alex';
```

**Technical Details**:
- Three-table JOIN for player-hero relationships
- String matching in WHERE clause
- Retrieves hero details and progression
- Demonstrates specific entity retrieval

**Expected Output**: Hero details for player John Alex

**Skills Demonstrated**: Multiple JOINs, string matching, specific filtering

---

### Query 3: High-Level Hero Ownership Analysis

**Purpose**: Identify players who own advanced/high-level heroes.

**Business Context**: Game analysts need to understand player progression and identify advanced players for targeted content or competitive analysis.

**SQL Query**:
```sql
SELECT 
    P.PlayerID, 
    PI.*
FROM Player2 P 
JOIN PlayerInfo PI ON P.Player_Name = PI.Player_Name
JOIN Player_Hero PH ON PH.Player_ID = P.PlayerID
JOIN Hero2 H ON H.Hero_ID = PH.Hero_ID
WHERE H.Current_Level > 3;
```

**Technical Details**:
- Four-table JOIN with table aliases
- Numeric comparison in WHERE clause
- Retrieves comprehensive player information
- Demonstrates complex data retrieval

**Expected Output**: Player details for those owning high-level heroes

**Skills Demonstrated**: Four-table JOIN, table aliases, numeric comparison

---

### Query 4: Subquery with Aggregate Comparison

**Purpose**: Find heroes with expensive skins (above average price).

**Business Context**: Revenue analysis and pricing strategy require understanding which heroes have premium skins and how they compare to average pricing.

**SQL Query**:
```sql
SELECT 
    H.Hero_ID, 
    H.Hero_Name, 
    SI.Skin_Cost
FROM SkinInfo SI 
JOIN Skin S ON SI.Skin_Name = S.Skin_Name
JOIN Skin_Hero SH ON S.Skin_ID = SH.Skin_ID
JOIN Hero2 H ON SH.Hero_ID = H.Hero_ID
WHERE SI.Skin_Cost > (SELECT AVG(Skin_Cost) FROM SkinInfo);
```

**Technical Details**:
- Four-table JOIN chain
- Subquery in WHERE clause
- `AVG()` aggregate function in subquery
- Compares individual values against aggregate
- Demonstrates subqueries and aggregation

**Expected Output**: Heroes with expensive skins (above average)

**Skills Demonstrated**: Subqueries, aggregate functions, multiple JOINs

---

### Query 5: Hero Skin Count Analysis

**Purpose**: Count total skins available for each hero.

**Business Context**: Content inventory management requires understanding which heroes have the most customization options for players.

**SQL Query**:
```sql
SELECT 
    H.Hero_ID,
    H.Hero_Name,
    COUNT(S.Skin_ID) AS 'TOTAL NUMBER OF SKINS'
FROM Hero2 H 
INNER JOIN Skin S ON H.Hero_ID = S.Hero_ID
GROUP BY H.Hero_ID, H.Hero_Name;
```

**Technical Details**:
- INNER JOIN to ensure matching records
- `COUNT()` aggregate function
- `GROUP BY` on multiple columns
- Column alias for readability
- Demonstrates aggregation and grouping

**Expected Output**: Each hero with their skin count

**Skills Demonstrated**: INNER JOIN, COUNT aggregate, GROUP BY

---

### Query 6: Inactive Player Identification

**Purpose**: Find players who have not played any games.

**Business Context**: Retention teams need to identify inactive players for re-engagement campaigns and churn analysis.

**SQL Query**:
```sql
SELECT 
    T.*,
    P.Global_Level,
    P.Game_Played,
    P.User_Email,
    P.Username
FROM PlayerInfo P 
INNER JOIN Player2 T ON P.Player_Name = T.Player_Name
WHERE Game_Played = 0;
```

**Technical Details**:
- INNER JOIN between player tables
- Filters on zero game count
- Retrieves comprehensive player information
- Demonstrates finding non-matching conditions

**Expected Output**: Inactive players with zero games

**Skills Demonstrated**: INNER JOIN, filtering on zero values

---

## Analytics Queries

### Query 1: Daily Game Mode Analysis

**Purpose**: Analyze game distribution across modes for a specific date.

**Business Context**: Operations teams need to understand which game modes are most popular on specific days for server capacity planning and event scheduling.

**SQL Query**:
```sql
SELECT 
    G.Game_Date,
    M.Mode_ID,
    COUNT(Game_ID) AS 'Total number of games played'
FROM Game_Mode2 M 
INNER JOIN Game G ON M.Mode_ID = G.Mode_ID
WHERE Game_Date = '2021-03-15'
GROUP BY M.Mode_ID, G.Game_Date
ORDER BY COUNT(Game_ID) DESC;
```

**Technical Details**:
- Date-specific filtering
- COUNT aggregation for game volumes
- GROUP BY on multiple columns
- ORDER BY DESC for ranking
- Demonstrates time-based analysis

**Expected Output**: Game count per mode for March 15, 2021

**Skills Demonstrated**: Date filtering, COUNT aggregate, GROUP BY, ranking

---

### Query 2: Most Popular Hero Analysis

**Purpose**: Identify the most frequently used hero across all games.

**Business Context**: Game balance and monetization teams need to understand hero popularity for balance adjustments and marketing focus.

**SQL Query**:
```sql
SELECT TOP 1 
    PH.Hero_ID,
    Hero_Name, 
    COUNT(Player_ID) AS 'HeroUsed'
FROM Player_Hero PH 
JOIN Hero2 H ON H.Hero_ID = PH.Hero_ID
GROUP BY PH.Hero_ID, Hero_Name
ORDER BY HeroUsed DESC;
```

**Technical Details**:
- `TOP 1` clause for single result
- COUNT aggregation for usage frequency
- GROUP BY for hero-level aggregation
- ORDER BY DESC for ranking
- Demonstrates ranking analysis

**Expected Output**: Single most popular hero with usage count

**Skills Demonstrated**: TOP clause, COUNT aggregate, GROUP BY, ranking

---

### Query 3: Player Performance Analytics

**Purpose**: Analyze player win rates across different game modes.

**Business Context**: Competitive analysis and matchmaking require understanding player performance patterns across different game modes for fair matchmaking and balance.

**SQL Query**:
```sql
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
```

**Technical Details**:
- Complex CASE statements for conditional aggregation
- Multiple aggregations (COUNT, SUM)
- Win rate calculation with division
- CAST for precise decimal formatting
- HAVING clause to filter groups
- Demonstrates advanced analytics

**Expected Output**: Player performance metrics by game mode

**Skills Demonstrated**: CASE statements, complex aggregation, HAVING clause, calculations

---

### Query 4: Hero Popularity Analysis

**Purpose**: Analyze hero popularity based on player ownership and levels.

**Business Context**: Content development and marketing teams need to understand which heroes are most popular to guide development priorities and promotional activities.

**SQL Query**:
```sql
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
```

**Technical Details**:
- LEFT JOIN to include heroes without owners
- COUNT DISTINCT for unique player count
- AVG for average level calculation
- Multiple ORDER BY criteria
- Demonstrates comprehensive analytics

**Expected Output**: Hero popularity metrics with ownership statistics

**Skills Demonstrated**: LEFT JOIN, DISTINCT, AVG aggregate, multi-criteria sorting

---

### Query 5: Revenue Potential Analysis

**Purpose**: Calculate potential revenue from skin sales by hero role.

**Business Context**: Finance and product teams need to understand revenue potential across different hero categories for budget planning and ROI analysis.

**SQL Query**:
```sql
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
```

**Technical Details**:
- Four-table JOIN for comprehensive data
- Multiple aggregations (COUNT, AVG, SUM)
- Revenue calculation and analysis
- GROUP BY for category analysis
- Demonstrates financial analytics

**Expected Output**: Revenue potential analysis by hero role

**Skills Demonstrated**: Multiple JOINs, aggregate functions, financial analysis

---

### Query 6: Player Engagement Segmentation

**Purpose**: Segment players by activity level for targeted marketing.

**Business Context**: Marketing and retention teams need player segmentation to deliver personalized campaigns and improve user engagement.

**SQL Query**:
```sql
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
```

**Technical Details**:
- Complex CASE statements for segmentation
- Multiple aggregations per segment
- CASE in both SELECT and ORDER BY
- Demonstrates advanced segmentation

**Expected Output**: Player engagement segmentation with metrics

**Skills Demonstrated**: Complex CASE statements, segmentation analysis

---

## Query Complexity Summary

### Basic Queries (4)
- Pattern matching, date filtering, activity filtering, maximum values
- Single table operations with simple WHERE clauses
- Fundamental SQL concepts

### Advanced Queries (6)
- Multi-table JOINs (3-4 tables)
- Subqueries and aggregate comparisons
- Complex filtering and relationships
- Intermediate SQL concepts

### Analytics Queries (6)
- Business intelligence and reporting
- Complex aggregations and calculations
- CASE statements and segmentation
- Advanced SQL for data analysis

---

## Performance Considerations

### Indexes Used
- `IX_Player2_Battle_Points` for player statistics queries
- `IX_Game_Game_Date` for time-based analysis
- `IX_Player_Hero_Player_ID` and `IX_Player_Hero_Hero_ID` for relationship queries

### Optimization Tips
- Use appropriate JOIN types (INNER vs LEFT)
- Filter early in the query pipeline
- Consider indexed columns in WHERE clauses
- Use GROUP BY efficiently for aggregations

---

## Business Value

These queries demonstrate:
- **Player Analytics**: Understanding user behavior and engagement
- **Game Balance**: Identifying popular heroes and game modes
- **Revenue Analysis**: Understanding monetization potential
- **Operational Insights**: Server capacity and event planning
- **Marketing Intelligence**: Player segmentation and targeting

The queries provide actionable insights for game development, operations, marketing, and business strategy teams.

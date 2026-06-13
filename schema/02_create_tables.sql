-- ============================================================================
-- BingBingLegends Database Schema
-- ============================================================================
-- Purpose: Create all tables for the gaming analytics database
-- Database: BingBingLegends
-- Author: Group Project (Bachelor's Degree)
-- Date: 2021
-- ============================================================================

USE BingBingLegends;
GO

-- ============================================================================
-- PLAYER TABLES
-- ============================================================================

-- Player2: Main player information with game statistics
CREATE TABLE Player2 
(
    PlayerID CHAR(10) PRIMARY KEY NOT NULL,
    Player_Name VARCHAR(60) NULL,
    Online_Status VARCHAR(60) NULL,
    Battle_Points INT NULL,
    Diamonds_Collected INT NULL
);

-- PlayerInfo: Detailed player account information
CREATE TABLE PlayerInfo 
(
    Player_Name VARCHAR(60) PRIMARY KEY NOT NULL,
    Username VARCHAR(60) NULL,
    User_Email VARCHAR(60) NULL,
    Global_Level INT NULL,
    Game_Played INT NULL
);

-- ============================================================================
-- HERO TABLES
-- ============================================================================

-- Hero2: Hero basic information
CREATE TABLE Hero2 
(
    Hero_ID CHAR(10) PRIMARY KEY NOT NULL,
    Hero_Name VARCHAR(60) NULL,
    Current_Level INT NULL
);

-- HeroInfo: Detailed hero attributes and specialties
CREATE TABLE HeroInfo
(
    Hero_Name VARCHAR(60) PRIMARY KEY NOT NULL,
    Hero_Role VARCHAR(60) NULL,
    Hero_Speciality VARCHAR(60) NULL,
    Hero_Cost INT NULL
);

-- ============================================================================
-- SKIN TABLES
-- ============================================================================

-- Skin: Skin information linked to heroes
CREATE TABLE Skin
(
    Skin_ID CHAR(10) PRIMARY KEY NOT NULL,
    Skin_Name VARCHAR(60) NULL,
    Hero_ID CHAR(10) NOT NULL REFERENCES Hero2(Hero_ID)
);

-- SkinInfo: Skin pricing information
CREATE TABLE SkinInfo
(
    Skin_Name VARCHAR(60) PRIMARY KEY NOT NULL,
    Skin_Cost INT NULL
);

-- ============================================================================
-- GAME TABLES
-- ============================================================================

-- Game_Mode2: Available game modes
CREATE TABLE Game_Mode2 
(
    Mode_ID CHAR(10) PRIMARY KEY NOT NULL,
    Mode_Name VARCHAR(60) NULL
);

-- Game: Individual game records
CREATE TABLE Game
(
    Game_ID CHAR(10) PRIMARY KEY NOT NULL,
    Game_Date DATE NULL,
    Game_Time TIME NULL,
    Game_Result VARCHAR(60) NULL,
    Mode_ID CHAR(10) NOT NULL REFERENCES Game_Mode2(Mode_ID)
);

-- ModeInfo: Detailed mode information
CREATE TABLE ModeInfo
(
    Mode_Name VARCHAR(60) PRIMARY KEY NOT NULL,
    Mode_Type VARCHAR(60) NULL,
    Arena VARCHAR(60) NULL
);

-- ============================================================================
-- RELATIONSHIP TABLES (Many-to-Many)
-- ============================================================================

-- Player_Hero: Links players to heroes with level information
CREATE TABLE Player_Hero 
(
    Player_ID CHAR(10) NOT NULL REFERENCES Player2(PlayerID),
    Hero_ID CHAR(10) NOT NULL REFERENCES Hero2(Hero_ID),
    Game_ID CHAR(10) NOT NULL REFERENCES Game(Game_ID),
    Level INT NULL,
    PRIMARY KEY (Player_ID, Hero_ID, Game_ID)
);

-- Skin_Hero: Links skins to players and heroes
CREATE TABLE Skin_Hero
(
    Skin_ID CHAR(10) NOT NULL REFERENCES Skin(Skin_ID),
    Player_ID CHAR(10) NOT NULL,
    Hero_ID CHAR(10) NOT NULL,
    PRIMARY KEY (Skin_ID, Player_ID, Hero_ID)
);

-- ============================================================================
-- INDEXES FOR PERFORMANCE
-- ============================================================================

-- Create indexes for frequently queried columns
CREATE INDEX IX_Player2_Battle_Points ON Player2(Battle_Points);
CREATE INDEX IX_Game_Game_Date ON Game(Game_Date);
CREATE INDEX IX_Player_Hero_Player_ID ON Player_Hero(Player_ID);
CREATE INDEX IX_Player_Hero_Hero_ID ON Player_Hero(Hero_ID);

PRINT 'All tables created successfully.';

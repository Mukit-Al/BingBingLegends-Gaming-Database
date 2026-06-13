-- ============================================================================
-- BingBingLegends Database Creation Script
-- ============================================================================
-- Purpose: Create the main database for the gaming analytics project
-- Author: Group Project (Bachelor's Degree)
-- Date: 2021
-- ============================================================================

-- Drop database if it exists to avoid conflicts
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'BingBingLegends')
BEGIN
    ALTER DATABASE [BingBingLegends] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [BingBingLegends];
END
GO

-- Create the database
CREATE DATABASE BingBingLegends;
GO

-- Use the database
USE BingBingLegends;
GO

PRINT 'Database BingBingLegends created successfully.';

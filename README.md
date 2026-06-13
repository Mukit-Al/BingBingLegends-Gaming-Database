# BingBingLegends Gaming Database Project

<div align="center">

![SQL Server](https://img.shields.io/badge/SQL%20Server-2016%2B-blue?logo=microsoft-sql-server)
![Database](https://img.shields.io/badge/Database-Relational-green)
![Status](https://img.shields.io/badge/Status-Complete-success)
![License](https://img.shields.io/badge/License-Educational-yellow)
[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-live-brightgreen?logo=github)](https://mukit-al.github.io/BingBingLegends-Gaming-Database/)

**A comprehensive SQL database project for a mobile gaming platform, demonstrating professional database design, data manipulation, and analytical querying capabilities.**

[🌐 Live Demo](https://mukit-al.github.io/BingBingLegends-Gaming-Database/) • [📖 View Documentation](#-documentation) • [🚀 Getting Started](#-getting-started) • [📊 Database Schema](#-database-schema) • [💡 Use Cases](#-sample-use-cases)

</div>

## 🎯 Project Overview

This project was developed as part of a bachelor's degree group assignment to design and implement a relational database for a gaming platform called "BingBingLegends." The database manages player information, game statistics, hero/skin collections, and match history to support game analytics and player engagement analysis.

### 🎓 Academic Background
- **Course**: Database Design and Implementation
- **Level**: Bachelor's Degree Program
- **Type**: Group Project (4 members)
- **Focus**: Relational database design, SQL programming, and business intelligence

## 📊 Database Schema

The database consists of **10 interconnected tables** designed to support comprehensive gaming analytics:

### 🎮 Core Tables
- **Player2**: Player game statistics, battle points, and online status
- **PlayerInfo**: Player account details, contact information, and global level
- **Hero2**: Hero basic information and current levels
- **HeroInfo**: Hero attributes including roles, specialties, and costs
- **Game**: Individual match records with dates, times, and results
- **Game_Mode2**: Available game modes (Infinite Melee, Man-Machine Battle, Team Match)
- **ModeInfo**: Detailed game mode descriptions and arena information

### 🔗 Relationship Tables
- **Player_Hero**: Links players to heroes with level progression and game context
- **Skin**: Hero skin information linked to specific heroes
- **SkinInfo**: Skin pricing and cost details
- **Skin_Hero**: Links skins to players and heroes for ownership tracking

### 📐 Entity Relationship Diagram

![ER Diagram](docs/ER%20Diagram.png)

*Figure: Complete Entity Relationship Diagram showing all tables and relationships*

**Key Relationships:**
- **One-to-One**: Player2 ↔ PlayerInfo, Hero2 ↔ HeroInfo, Skin ↔ SkinInfo
- **One-to-Many**: Player2 → Player_Hero, Hero2 → Player_Hero, Game_Mode2 → Game
- **Many-to-Many**: Player ↔ Hero (via Player_Hero), Player ↔ Skin (via Skin_Hero)

## 🚀 Getting Started

### Prerequisites
- Microsoft SQL Server (2016 or later recommended)
- SQL Server Management Studio (SSMS) or similar tool
- Basic understanding of SQL and relational databases

### Installation

1. **Clone the repository**
   ```bash
   git clone [your-repository-url]
   cd SQL-Gaming-Analytics
   ```

2. **Execute scripts in order**
   ```sql
   -- Step 1: Create the database
   :r schema/01_create_database.sql
   
   -- Step 2: Create tables and relationships
   :r schema/02_create_tables.sql
   
   -- Step 3: Insert sample data
   :r schema/03_insert_sample_data.sql
   ```

3. **Run queries**
   ```sql
   -- Basic queries
   :r queries/basic_queries.sql
   
   -- Advanced queries
   :r queries/advanced_queries.sql
   
   -- Analytics queries
   :r queries/analytics_queries.sql
   ```

## 📁 Project Structure

```
BingBingLegends-Gaming-Database/
├── README.md                          # Comprehensive project documentation
├── .gitignore                         # Git ignore rules
├── schema/                            # Database schema files
│   ├── 01_create_database.sql        # Database creation and setup
│   ├── 02_create_tables.sql          # Table definitions with constraints and indexes
│   └── 03_insert_sample_data.sql     # Sample data insertion (20 players, 15 heroes, 30 games)
├── queries/                           # SQL query examples organized by complexity
│   ├── basic_queries.sql             # 4 fundamental queries (pattern matching, filtering, aggregation)
│   ├── advanced_queries.sql          # 6 complex queries (multi-table JOINs, subqueries)
│   └── analytics_queries.sql        # 6 business intelligence queries (performance, revenue, segmentation)
├── docs/                             # Comprehensive documentation
│   ├── ER Diagram.png                # Entity Relationship Diagram visualization
│   ├── data_dictionary.md            # Complete table and column documentation
│   └── query_documentation.md       # Detailed query explanations with business context
└── Documentation/                     # Original assignment documents
    ├── Assignment Part-2.pdf
    └── IDB PART 1.pdf
```

## 🔍 Key Features

### 🏗️ Database Design Excellence
- **Normalized Schema**: Third normal form (3NF) with proper relationships and minimal redundancy
- **Data Integrity**: Foreign key constraints, primary keys, and referential integrity
- **Performance Optimization**: Strategic indexes on frequently queried columns (Battle_Points, Game_Date, Player_ID, Hero_ID)
- **Scalability**: Design supports growth in players, games, heroes, and content
- **Data Types**: Appropriate use of CHAR, VARCHAR, INT, DATE, and TIME types

### 💻 Query Capabilities
- **Basic Operations**: SELECT, WHERE, ORDER BY, LIKE operators for fundamental data retrieval
- **Advanced Joins**: INNER JOIN, LEFT JOIN across 2-4 tables for complex data relationships
- **Aggregation**: COUNT, SUM, AVG, MAX, MIN with GROUP BY for data summarization
- **Subqueries**: Nested queries for complex filtering and comparative analysis
- **Analytics**: Business intelligence queries for player engagement, game analysis, and revenue insights
- **Case Statements**: Conditional logic for data segmentation and categorization

### 📊 Data Analytics
- **Player Analysis**: Engagement tracking, performance metrics, activity segmentation
- **Game Analytics**: Win rate calculation, mode popularity, temporal analysis
- **Business Intelligence**: Revenue potential, hero popularity, player lifetime value
- **Reporting**: Comprehensive dashboards and actionable insights

## 📈 Sample Use Cases

### 👤 Player Analysis
- **Hero Specialty Discovery**: Find players who own heroes with specific abilities (e.g., "Charge" specialty)
- **Engagement Tracking**: Identify active vs inactive players based on game participation
- **Performance Monitoring**: Track player performance across different game modes and time periods
- **Progression Analysis**: Monitor player level progression and hero ownership patterns

### 🎮 Game Analytics
- **Win Rate Analysis**: Calculate player win rates across different game modes for matchmaking balance
- **Hero Popularity**: Identify most frequently used heroes for game balance adjustments
- **Temporal Patterns**: Analyze game activity trends over time for event planning and server capacity
- **Mode Distribution**: Understand which game modes are most popular for content development focus

### 💰 Business Intelligence
- **Revenue Analysis**: Calculate potential revenue from skin sales by hero role and pricing strategy
- **Player Segmentation**: Categorize players by activity level (Inactive, Low, Medium, High) for targeted marketing
- **Content Performance**: Analyze hero and skin popularity to guide development priorities
- **Monetization Insights**: Understand which hero categories generate the most revenue potential

## 🛠️ Technical Skills Demonstrated

### Database Design & Architecture
- **Entity-Relationship Modeling**: Conceptual and logical database design
- **Normalization**: Third Normal Form (3NF) implementation to reduce redundancy
- **Schema Design**: Proper table structure with appropriate data types and constraints
- **Relationship Management**: One-to-one, one-to-many, and many-to-many relationships
- **Indexing Strategy**: Performance optimization through strategic index creation

### SQL Programming (DDL/DML/DQL)
- **Data Definition Language (DDL)**: CREATE DATABASE, CREATE TABLE, ALTER TABLE, DROP, constraints
- **Data Manipulation Language (DML)**: INSERT, UPDATE, DELETE operations with sample data
- **Data Query Language (DQL)**: Complex SELECT queries with multiple clauses
- **Advanced SQL Features**: JOINs (INNER, LEFT), subqueries, UNION, CASE statements
- **Aggregation Functions**: COUNT, SUM, AVG, MAX, MIN with GROUP BY and HAVING

### Data Analysis & Business Intelligence
- **Descriptive Analytics**: Summarizing historical data and trends
- **Diagnostic Analytics**: Understanding patterns and relationships
- **Performance Metrics**: Win rates, engagement levels, popularity rankings
- **Segmentation Analysis**: Customer/player categorization for targeted insights
- **Revenue Analysis**: Financial calculations and potential revenue modeling

### Query Optimization & Performance
- **Index Design**: Strategic indexing on frequently accessed columns
- **Query Planning**: Efficient JOIN strategies and execution paths
- **Data Type Optimization**: Appropriate data type selection for storage efficiency
- **Constraint Management**: Ensuring data integrity while maintaining performance

## 👥 Team Contributors

This project was developed as a collaborative team effort, demonstrating effective teamwork and distributed development:

- **Abdullah Al Mukit** (TP063405)
  - Database design and schema architecture
  - Basic query development (pattern matching, filtering)
  - Player-hero relationship queries

- **Saw Chiou Ming** (TP063734)
  - Advanced query development with multi-table JOINs
  - Date-based analysis and temporal queries
  - Subquery implementation for complex filtering

- **SM Rabeya Amin Ikra** (TP058834)
  - Player analytics and engagement reporting
  - Aggregation and grouping queries
  - Inactive player identification and analysis

- **GOH WEI SONG** (TP063479)
  - Performance metrics and ranking queries
  - Game mode analysis and statistics
  - TOP queries and popularity analysis

## 📚 Documentation

This project includes comprehensive documentation to ensure complete understanding of the database structure and functionality:

### 📖 Core Documentation
- **[Data Dictionary](docs/data_dictionary.md)**: Complete documentation of all 10 tables, including column descriptions, data types, constraints, relationships, and sample data statistics
- **[Query Documentation](docs/query_documentation.md)**: Detailed explanations of all 16 queries, including business context, technical approach, expected results, and skills demonstrated
- **[ER Diagram](docs/ER%20Diagram.png)**: Visual representation of the database schema showing all entities, attributes, and relationships

### 📄 Original Assignment Materials
- **Assignment Part-2.pdf**: Original project requirements and specifications
- **IDB PART 1.pdf**: Initial database design documentation and requirements

### 📝 Query Categories
- **Basic Queries** (4): Pattern matching, date filtering, activity analysis, maximum values
- **Advanced Queries** (6): Multi-table JOINs, subqueries, complex filtering, aggregation
- **Analytics Queries** (6): Business intelligence, performance metrics, revenue analysis, segmentation

## 🎓 Learning Outcomes

This project demonstrates comprehensive proficiency in database development and data analytics:

### 📚 Database Fundamentals
- **Relational Database Design**: Understanding of entities, attributes, relationships, and normalization
- **Schema Modeling**: Ability to translate business requirements into database structures
- **Data Integrity**: Implementation of constraints to ensure data quality and consistency
- **Performance Optimization**: Strategic indexing and query optimization techniques

### 💻 SQL Programming Excellence
- **DDL Mastery**: Database and table creation with proper constraints and indexes
- **DML Operations**: Data manipulation with INSERT, UPDATE, DELETE statements
- **Advanced Querying**: Complex SELECT queries with JOINs, subqueries, and aggregations
- **Analytical Functions**: Use of CASE statements, window functions, and conditional logic

### 📊 Data Analysis Skills
- **Business Intelligence**: Ability to derive actionable insights from data
- **Performance Metrics**: Development of KPIs and performance tracking queries
- **Segmentation Analysis**: Customer/player categorization and behavioral analysis
- **Revenue Analysis**: Financial calculations and business impact assessment

### 🤝 Collaboration & Project Management
- **Team Development**: Experience working in distributed team environments
- **Code Organization**: Structured project organization and documentation
- **Version Control**: Understanding of git workflows and repository management
- **Documentation**: Comprehensive technical documentation for complex systems

## 🔮 Future Enhancements

Potential improvements for production deployment and scalability:

### 🚀 Database Architecture
- **Stored Procedures**: Implement common operations as stored procedures for better performance and security
- **Views**: Create materialized views for complex, frequently-run queries to improve response times
- **Triggers**: Add automated data validation and audit logging through database triggers
- **Partitioning**: Implement table partitioning for large datasets to improve query performance
- **Replication**: Set up read replicas for reporting and analytics workloads

### 🔒 Security & Access Control
- **User Roles**: Implement role-based access control (RBAC) for different user types
- **Row-Level Security**: Add fine-grained access control for multi-tenant scenarios
- **Encryption**: Implement data-at-rest and data-in-transit encryption
- **Audit Logging**: Comprehensive audit trails for compliance and security monitoring

### 📊 Advanced Analytics
- **Real-time Dashboards**: Integration with BI tools like Power BI or Tableau for live visualization
- **Machine Learning**: Add predictive analytics for player churn and game balance recommendations
- **Time Series Analysis**: Advanced temporal analysis for trend prediction and anomaly detection
- **A/B Testing Framework**: Database structure to support experimental features and testing

### 🏗️ Infrastructure & Operations
- **Backup & Recovery**: Automated backup strategies with point-in-time recovery capabilities
- **High Availability**: Failover clustering and disaster recovery procedures
- **Monitoring**: Performance monitoring and alerting for database health metrics
- **CI/CD Integration**: Automated database schema migrations and testing pipelines

## 📄 License

This project is created for educational purposes. Feel free to use it as a reference for learning SQL and database design. The code and documentation are provided as-is for learning and portfolio development.

## 🤝 Contributing

This is a completed academic project, but suggestions and improvements are welcome for educational purposes. Feel free to:
- Report issues or bugs in the documentation
- Suggest additional query examples or use cases
- Propose improvements to the database schema
- Share this project for educational purposes

## 📞 Contact & Support

For questions about this project:
- **GitHub Issues**: Open an issue in the repository for technical questions
- **Documentation**: Refer to the comprehensive documentation in the `docs/` folder
- **Original Requirements**: See `Documentation/` folder for original assignment specifications

## 🎯 Project Summary

### 📊 Database Statistics
- **Total Tables**: 10 interconnected tables
- **Total Queries**: 16 SQL queries (4 basic, 6 advanced, 6 analytics)
- **Sample Data**: 20 players, 15 heroes, 15 skins, 30 games, 3 game modes
- **Relationships**: 6 foreign key relationships ensuring data integrity
- **Indexes**: 4 performance indexes on frequently queried columns

### 💡 Key Achievements
- ✅ Complete relational database design following normalization principles
- ✅ Comprehensive SQL implementation from DDL to complex analytics queries
- ✅ Business intelligence capabilities for player engagement and game analysis
- ✅ Professional documentation with ER diagram and detailed explanations
- ✅ Performance optimization through strategic indexing
- ✅ Scalable architecture supporting future growth

### 🚀 Portfolio Value
This project demonstrates:
- **Database Design Skills**: Entity-relationship modeling, normalization, schema design
- **SQL Expertise**: From basic SELECT to complex analytics with subqueries and JOINs
- **Business Intelligence**: Ability to derive actionable insights from data
- **Documentation Skills**: Comprehensive technical documentation and communication
- **Collaboration**: Team development experience in distributed environments
- **Problem Solving**: Translating business requirements into technical solutions

---

<div align="center">

**🎮 Built with passion for gaming and data analytics**

**📚 Perfect for learning SQL, database design, and business intelligence**

**💼 Ideal portfolio project for data analytics and database development roles**

</div>

---

**Note**: This project was developed as part of a bachelor's degree program and serves as a comprehensive portfolio piece demonstrating SQL and database design skills for data analytics roles. The project showcases both technical database skills and business intelligence capabilities essential for modern data analytics positions.

# Data Dictionary

Complete documentation of all tables, columns, and relationships in the BingBingLegends database.

## Table of Contents
- [Player Tables](#player-tables)
- [Hero Tables](#hero-tables)
- [Skin Tables](#skin-tables)
- [Game Tables](#game-tables)
- [Relationship Tables](#relationship-tables)
- [Entity Relationship Diagram](#entity-relationship-diagram)

---

## Player Tables

### Player2
Stores core player game statistics and status information.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| PlayerID | CHAR(10) | PRIMARY KEY, NOT NULL | Unique identifier for each player |
| Player_Name | VARCHAR(60) | NULL | Full name of the player |
| Online_Status | VARCHAR(60) | NULL | Current online status (Active/Inactive) |
| Battle_Points | INT | NULL | Player's battle points score |
| Diamonds_Collected | INT | NULL | Total diamonds collected by player |

**Relationships:**
- One-to-many with Player_Hero (PlayerID references Player_ID)
- One-to-one with PlayerInfo (Player_Name references Player_Name)

### PlayerInfo
Contains detailed player account and contact information.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Player_Name | VARCHAR(60) | PRIMARY KEY, NOT NULL | Full name of the player (links to Player2) |
| Username | VARCHAR(60) | NULL | Player's username for login |
| User_Email | VARCHAR(60) | NULL | Player's email address |
| Global_Level | INT | NULL | Player's overall level in the game |
| Game_Played | INT | NULL | Total number of games played by player |

**Relationships:**
- One-to-one with Player2 (Player_Name references Player_Name)

---

## Hero Tables

### Hero2
Basic hero information and current levels.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Hero_ID | CHAR(10) | PRIMARY KEY, NOT NULL | Unique identifier for each hero |
| Hero_Name | VARCHAR(60) | NULL | Name of the hero |
| Current_Level | INT | NULL | Current level of the hero |

**Relationships:**
- One-to-many with Skin (Hero_ID references Hero_ID)
- One-to-many with Player_Hero (Hero_ID references Hero_ID)
- One-to-one with HeroInfo (Hero_Name references Hero_Name)

### HeroInfo
Detailed hero attributes including roles and specialties.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Hero_Name | VARCHAR(60) | PRIMARY KEY, NOT NULL | Name of the hero (links to Hero2) |
| Hero_Role | VARCHAR(60) | NULL | Role classification (Fighter, Mage, Tank, etc.) |
| Hero_Speciality | VARCHAR(60) | NULL | Special ability or skill |
| Hero_Cost | INT | NULL | Cost to acquire the hero |

**Relationships:**
- One-to-one with Hero2 (Hero_Name references Hero_Name)

---

## Skin Tables

### Skin
Hero skin information linked to specific heroes.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Skin_ID | CHAR(10) | PRIMARY KEY, NOT NULL | Unique identifier for each skin |
| Skin_Name | VARCHAR(60) | NULL | Name of the skin |
| Hero_ID | CHAR(10) | FOREIGN KEY, NOT NULL | References Hero2(Hero_ID) |

**Relationships:**
- Many-to-one with Hero2 (Hero_ID references Hero_ID)
- One-to-many with Skin_Hero (Skin_ID references Skin_ID)
- One-to-one with SkinInfo (Skin_Name references Skin_Name)

### SkinInfo
Skin pricing and cost information.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Skin_Name | VARCHAR(60) | PRIMARY KEY, NOT NULL | Name of the skin (links to Skin) |
| Skin_Cost | INT | NULL | Cost of the skin in battle points |

**Relationships:**
- One-to-one with Skin (Skin_Name references Skin_Name)

---

## Game Tables

### Game_Mode2
Available game modes in the system.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Mode_ID | CHAR(10) | PRIMARY KEY, NOT NULL | Unique identifier for each game mode |
| Mode_Name | VARCHAR(60) | NULL | Name of the game mode |

**Relationships:**
- One-to-many with Game (Mode_ID references Mode_ID)
- One-to-one with ModeInfo (Mode_Name references Mode_Name)

### Game
Individual game/match records with results and timing.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Game_ID | CHAR(10) | PRIMARY KEY, NOT NULL | Unique identifier for each game |
| Game_Date | DATE | NULL | Date when the game was played |
| Game_Time | TIME | NULL | Time when the game was played |
| Game_Result | VARCHAR(60) | NULL | Result of the game (WIN/LOSE) |
| Mode_ID | CHAR(10) | FOREIGN KEY, NOT NULL | References Game_Mode2(Mode_ID) |

**Relationships:**
- Many-to-one with Game_Mode2 (Mode_ID references Mode_ID)
- One-to-many with Player_Hero (Game_ID references Game_ID)

### ModeInfo
Detailed information about game modes.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Mode_Name | VARCHAR(60) | PRIMARY KEY, NOT NULL | Name of the game mode (links to Game_Mode2) |
| Mode_Type | VARCHAR(60) | NULL | Type or category of the game mode |
| Arena | VARCHAR(60) | NULL | Arena or map name for the mode |

**Relationships:**
- One-to-one with Game_Mode2 (Mode_Name references Mode_Name)

---

## Relationship Tables

### Player_Hero
Links players to heroes with level progression information.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Player_ID | CHAR(10) | FOREIGN KEY, NOT NULL | References Player2(PlayerID) |
| Hero_ID | CHAR(10) | FOREIGN KEY, NOT NULL | References Hero2(Hero_ID) |
| Game_ID | CHAR(10) | FOREIGN KEY, NOT NULL | References Game(Game_ID) |
| Level | INT | NULL | Level achieved with this hero in the game |

**Primary Key:** (Player_ID, Hero_ID, Game_ID)

**Relationships:**
- Many-to-one with Player2 (Player_ID references PlayerID)
- Many-to-one with Hero2 (Hero_ID references Hero_ID)
- Many-to-one with Game (Game_ID references Game_ID)

### Skin_Hero
Links skins to players and heroes (many-to-many relationship).

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| Skin_ID | CHAR(10) | FOREIGN KEY, NOT NULL | References Skin(Skin_ID) |
| Player_ID | CHAR(10) | NOT NULL | Player who owns the skin |
| Hero_ID | CHAR(10) | NOT NULL | Hero associated with the skin |

**Primary Key:** (Skin_ID, Player_ID, Hero_ID)

**Relationships:**
- Many-to-one with Skin (Skin_ID references Skin_ID)

---

## Entity Relationship Diagram

### Key Relationships

```
Player2 (1) ----< (1) PlayerInfo
Player2 (1) ----< (N) Player_Hero
Hero2 (1) ----< (1) HeroInfo
Hero2 (1) ----< (N) Player_Hero
Hero2 (1) ----< (N) Skin
Game (1) ----< (N) Player_Hero
Game_Mode2 (1) ----< (1) ModeInfo
Game_Mode2 (1) ----< (N) Game
Skin (1) ----< (1) SkinInfo
Skin (1) ----< (N) Skin_Hero
```

### Relationship Types

- **One-to-One**: Player2 ↔ PlayerInfo, Hero2 ↔ HeroInfo, Skin ↔ SkinInfo, Game_Mode2 ↔ ModeInfo
- **One-to-Many**: Player2 → Player_Hero, Hero2 → Player_Hero, Hero2 → Skin, Game_Mode2 → Game, Game → Player_Hero, Skin → Skin_Hero
- **Many-to-Many**: Player ↔ Hero (via Player_Hero), Player ↔ Skin (via Skin_Hero)

---

## Data Constraints

### Primary Keys
- Player2: PlayerID
- PlayerInfo: Player_Name
- Hero2: Hero_ID
- HeroInfo: Hero_Name
- Skin: Skin_ID
- SkinInfo: Skin_Name
- Game_Mode2: Mode_ID
- Game: Game_ID
- ModeInfo: Mode_Name
- Player_Hero: (Player_ID, Hero_ID, Game_ID)
- Skin_Hero: (Skin_ID, Player_ID, Hero_ID)

### Foreign Keys
- Skin.Hero_ID → Hero2.Hero_ID
- Game.Mode_ID → Game_Mode2.Mode_ID
- Player_Hero.Player_ID → Player2.PlayerID
- Player_Hero.Hero_ID → Hero2.Hero_ID
- Player_Hero.Game_ID → Game.Game_ID
- Skin_Hero.Skin_ID → Skin.Skin_ID

### Indexes
- IX_Player2_Battle_Points on Player2(Battle_Points)
- IX_Game_Game_Date on Game(Game_Date)
- IX_Player_Hero_Player_ID on Player_Hero(Player_ID)
- IX_Player_Hero_Hero_ID on Player_Hero(Hero_ID)

---

## Data Types Summary

- **CHAR(10)**: Fixed-length character strings for IDs
- **VARCHAR(60)**: Variable-length strings for names and descriptions
- **INT**: Integer values for numeric data (levels, points, counts)
- **DATE**: Date values for game dates
- **TIME**: Time values for game times

---

## Sample Data Statistics

- **Players**: 20 records
- **Heroes**: 15 records
- **Skins**: 15 records
- **Games**: 30 records
- **Game Modes**: 3 records
- **Player-Hero Relationships**: 15 records
- **Skin-Hero Relationships**: 15 records

---

## Notes

- All VARCHAR fields are nullable to accommodate missing data
- Integer fields allow NULL for flexibility in data entry
- Foreign key constraints ensure referential integrity
- Composite primary keys in relationship tables prevent duplicate associations
- Indexes are created on frequently queried columns for performance optimization

-- ============================================================================
-- BingBingLegends Sample Data Insertion
-- ============================================================================
-- Purpose: Populate database with sample data for testing and demonstration
-- Database: BingBingLegends
-- Author: Group Project (Bachelor's Degree)
-- Date: 2021
-- ============================================================================

USE BingBingLegends;
GO

-- ============================================================================
-- HERO DATA
-- ============================================================================

-- Insert hero basic information
INSERT INTO Hero2 VALUES (101,'Dante',2); 
INSERT INTO Hero2 VALUES (102,'Hestia',8); 
INSERT INTO Hero2 VALUES (103,'Ophelia',4); 
INSERT INTO Hero2 VALUES (104,'Sterben',1); 
INSERT INTO Hero2 VALUES (105,'Gaia',3); 
INSERT INTO Hero2 VALUES (106,'Uranus',2); 
INSERT INTO Hero2 VALUES (107,'Sierra',4); 
INSERT INTO Hero2 VALUES (108,'Medusa',1); 
INSERT INTO Hero2 VALUES (109,'Ymer',2); 
INSERT INTO Hero2 VALUES (110,'Asgard',3); 
INSERT INTO Hero2 VALUES (111,'Hyperion',1); 
INSERT INTO Hero2 VALUES (112,'Typhon',2); 
INSERT INTO Hero2 VALUES (113,'Lyssa',5); 
INSERT INTO Hero2 VALUES (114,'Eudora',7); 
INSERT INTO Hero2 VALUES (115,'Aura',5);

-- Insert hero detailed information
INSERT INTO HeroInfo VALUES ('Dante','Fighter','Charge',700); 
INSERT INTO HeroInfo VALUES ('Hestia','Mage','Efficient Spells',850); 
INSERT INTO HeroInfo VALUES ('Ophelia','Mage','Wisdom',900); 
INSERT INTO HeroInfo VALUES ('Sterben','Assassin','Dodging',1000); 
INSERT INTO HeroInfo VALUES ('Gaia','Tank','Fortress',1200); 
INSERT INTO HeroInfo VALUES ('Uranus','Fighter','Knockback',1450); 
INSERT INTO HeroInfo VALUES ('Sierra','Archer','Triple Shot',1150); 
INSERT INTO HeroInfo VALUES ('Medusa','Mage','Rapid Fire',1750); 
INSERT INTO HeroInfo VALUES ('Ymer','Assassin','Invicibility',1500); 
INSERT INTO HeroInfo VALUES ('Asgard','Fighter','Life Steal',1900); 
INSERT INTO HeroInfo VALUES ('Hyperion','Tank','Reflection',2300); 
INSERT INTO HeroInfo VALUES ('Typhon','Archer','Bouncy Arrow',2200); 
INSERT INTO HeroInfo VALUES ('Lyssa','Archer','Target Tracer',3000); 
INSERT INTO HeroInfo VALUES ('Eudora','Fighter','Berserker',2250); 
INSERT INTO HeroInfo VALUES ('Aura','Healer','Revive',3500);

-- ============================================================================
-- PLAYER DATA
-- ============================================================================

-- Insert player game statistics (fixed typos: 'Inctive' -> 'Inactive')
INSERT INTO Player2 VALUES ('P001','Eric White','Active','11','300'); 
INSERT INTO Player2 VALUES ('P002','Josh Pieters','Active','33','1500'); 
INSERT INTO Player2 VALUES ('P003','Louis James','Inactive','07','200'); 
INSERT INTO Player2 VALUES ('P004','Emily Chark','Inactive','15','1300'); 
INSERT INTO Player2 VALUES ('P005','Rivhard Blair','Inactive','05','100'); 
INSERT INTO Player2 VALUES ('P006','Chung Garcia','Inactive','19','1600'); 
INSERT INTO Player2 VALUES ('P007','Daniel Davis','Inactive','25','500'); 
INSERT INTO Player2 VALUES ('P008','Jack Lee','Inactive','22','2300'); 
INSERT INTO Player2 VALUES ('P009','Abram Cole','Active','19','1100'); 
INSERT INTO Player2 VALUES ('P010','Waylon Long','Inactive','12','1700'); 
INSERT INTO Player2 VALUES ('P011','Chris Wade','Inactive','44','3300'); 
INSERT INTO Player2 VALUES ('P012','John Alex','Active','39','3200'); 
INSERT INTO Player2 VALUES ('P013','Raynold Matt','Inactive','22','1300'); 
INSERT INTO Player2 VALUES ('P014','Eric Cantona','Active','22','2100'); 
INSERT INTO Player2 VALUES ('P015','Drew Ryan','Inactive','05','100'); 
INSERT INTO Player2 VALUES ('P016','Reyna Tapia','Inactive','07','500'); 
INSERT INTO Player2 VALUES ('P017','Zane Gomez','Inactive','21','1900'); 
INSERT INTO Player2 VALUES ('P018','Bobbi Pope','Active','25','1350'); 
INSERT INTO Player2 VALUES ('P019','Allison Baker','Inactive','21','900'); 
INSERT INTO Player2 VALUES ('P020','Ashley Young','Inactive','16','500');

-- Insert player account information
INSERT INTO PlayerInfo VALUES ('Eric White','ericpieters','eric123@gmail.com','23','11');  
INSERT INTO PlayerInfo VALUES ('Josh Pieters','joshpietss','jpieters01@gmail.com','50','71');  
INSERT INTO PlayerInfo VALUES ('Louis James','JLouis','jameslouis@gmail.com','02','01');  
INSERT INTO PlayerInfo VALUES ('Emily Chark','Emilyyyy','clarkemy@gmail.com','31','47');  
INSERT INTO PlayerInfo VALUES ('Rivhard Blair','BlairR','blair001@gmail.com','33','50');  
INSERT INTO PlayerInfo VALUES ('Chung Garcia','ChungGarcia','garciachung@gmail.com','53','83');  
INSERT INTO PlayerInfo VALUES ('Daniel Davis','DDaniel','ddaniel10@gmail.com','62','70');  
INSERT INTO PlayerInfo VALUES ('Jack Lee','LeeJ','leejack@gmail.com','55','66');  
INSERT INTO PlayerInfo VALUES ('Abram Cole','ColeRam','abramcole@gmail.com','33','41');  
INSERT INTO PlayerInfo VALUES ('Waylon Long','Longlon','longlon@gmail.com','23','20');  
INSERT INTO PlayerInfo VALUES ('Chris Wade','Chrissade','chriswade110@gmail.com','51','82');  
INSERT INTO PlayerInfo VALUES ('John Alex','jonnnylex','johnalex01@gmail.com','73','113');  
INSERT INTO PlayerInfo VALUES ('Raynold Matt','mattynold','mattraynold22@gmail.com','41','60');  
INSERT INTO PlayerInfo VALUES ('Eric Cantona','Cantonnaric','cantonaeric@gmail.com','47','55');  
INSERT INTO PlayerInfo VALUES ('Drew Ryan','RDrew','rdrew0001@gmail.com','03','02');  
INSERT INTO PlayerInfo VALUES ('Reyna Tapia','Tapiana','tapianaaaa@gmail.com','03','04');  
INSERT INTO PlayerInfo VALUES ('Zane Gomez','ZGomez','zgomezyy1@gmail.com','41','72');  
INSERT INTO PlayerInfo VALUES ('Bobbi Pope','bobby','bobbypope0123@gmail.com','45','60');  
INSERT INTO PlayerInfo VALUES ('Allison Baker','bakkeryson','allison321@gmail.com','73','109');  
INSERT INTO PlayerInfo VALUES ('Ashley Young','ashyoung','youngashley30@gmail.com','04','03');

-- ============================================================================
-- GAME MODE DATA
-- ============================================================================

-- Insert game modes
INSERT INTO Game_Mode2 VALUES ('GM001','INFINITE MELEE');  
INSERT INTO Game_Mode2 VALUES ('GM002','MAN-MACHINE BATTLE');  
INSERT INTO Game_Mode2 VALUES ('GM003','TEAM MATCH');

-- Insert game mode details
INSERT INTO ModeInfo VALUES ('INFINITE MELEE','BRAWL MODE','ABYSS OF DREAMLAD');  
INSERT INTO ModeInfo VALUES ('MAN-MACHINE BATTLE','HUMAN VS AI MODE','CLONE FIGHT');  
INSERT INTO ModeInfo VALUES ('TEAM MATCH','CLASSIC MODE','FIGHT FOR FIRE');

-- ============================================================================
-- GAME DATA
-- ============================================================================

-- Insert game records
INSERT INTO Game VALUES ('G00001','2021-01-22','12:23','WIN','GM003');  
INSERT INTO Game VALUES ('G00002','2021-01-14','17:01','WIN','GM002');  
INSERT INTO Game VALUES ('G00003','2021-04-06','21:30','LOSE','GM001');  
INSERT INTO Game VALUES ('G00004','2021-08-12','14:46','WIN','GM003');  
INSERT INTO Game VALUES ('G00005','2021-09-25','06:28','LOSE','GM003');  
INSERT INTO Game VALUES ('G00006','2021-03-15','09:59','WIN','GM002');  
INSERT INTO Game VALUES ('G00007','2021-02-15','13:12','WIN','GM002');  
INSERT INTO Game VALUES ('G00008','2021-07-23','17:56','LOSE','GM001');  
INSERT INTO Game VALUES ('G00009','2021-06-26','11:26','WIN','GM002');  
INSERT INTO Game VALUES ('G00010','2021-02-28','02:18','LOSE','GM001');  
INSERT INTO Game VALUES ('G00011','2021-03-15','23:35','WIN','GM003');  
INSERT INTO Game VALUES ('G00012','2021-08-15','15:16','LOSE','GM001');  
INSERT INTO Game VALUES ('G00013','2021-04-17','19:35','WIN','GM003');  
INSERT INTO Game VALUES ('G00014','2021-03-28','10:17','WIN','GM002');  
INSERT INTO Game VALUES ('G00015','2021-12-29','23:45','WIN','GM003');  
INSERT INTO Game VALUES ('G00016','2021-11-24','00:00','WIN','GM002');  
INSERT INTO Game VALUES ('G00017','2021-08-31','16:12','WIN','GM002');  
INSERT INTO Game VALUES ('G00018','2021-03-15','19:04','WIN','GM003');  
INSERT INTO Game VALUES ('G00019','2021-02-04','12:28','LOSE','GM003');  
INSERT INTO Game VALUES ('G00020','2021-03-15','01:23','WIN','GM001');  
INSERT INTO Game VALUES ('G00021','2021-06-21','17:46','WIN','GM003');  
INSERT INTO Game VALUES ('G00022','2021-03-08','02:50','WIN','GM002');  
INSERT INTO Game VALUES ('G00023','2021-06-21','11:17','LOSE','GM003');  
INSERT INTO Game VALUES ('G00024','2021-04-01','20:10','WIN','GM001');  
INSERT INTO Game VALUES ('G00025','2021-08-05','14:12','WIN','GM002');  
INSERT INTO Game VALUES ('G00026','2021-09-07','11:01','WIN','GM001');  
INSERT INTO Game VALUES ('G00027','2021-10-28','10:31','WIN','GM003');  
INSERT INTO Game VALUES ('G00028','2021-04-18','12:06','WIN','GM003');  
INSERT INTO Game VALUES ('G00029','2021-11-11','23:37','LOSE','GM003');  
INSERT INTO Game VALUES ('G00030','2021-12-25','20:43','WIN','GM001');

-- ============================================================================
-- PLAYER-HERO RELATIONSHIPS
-- ============================================================================

-- Insert player-hero-game relationships
INSERT INTO Player_Hero VALUES ('P001','101','G00001','5');  
INSERT INTO Player_Hero VALUES ('P002','102','G00001','18');  
INSERT INTO Player_Hero VALUES ('P003','103','G00001','4');  
INSERT INTO Player_Hero VALUES ('P004','104','G00001','8');  
INSERT INTO Player_Hero VALUES ('P005','105','G00001','5');  
INSERT INTO Player_Hero VALUES ('P006','106','G00002','20');  
INSERT INTO Player_Hero VALUES ('P007','107','G00002','12');  
INSERT INTO Player_Hero VALUES ('P008','102','G00002','1');  
INSERT INTO Player_Hero VALUES ('P009','109','G00002','2');  
INSERT INTO Player_Hero VALUES ('P010','110','G00002','10');  
INSERT INTO Player_Hero VALUES ('P011','111','G00003','1');  
INSERT INTO Player_Hero VALUES ('P012','102','G00003','2');  
INSERT INTO Player_Hero VALUES ('P013','113','G00003','5');  
INSERT INTO Player_Hero VALUES ('P014','114','G00003','7');  
INSERT INTO Player_Hero VALUES ('P015','115','G00003','5');

-- ============================================================================
-- SKIN DATA
-- ============================================================================

-- Insert skin information
INSERT INTO Skin VALUES ('S01','Assasin Darius','101'); 
INSERT INTO Skin VALUES ('S02','Battlecast Elise','102'); 
INSERT INTO Skin VALUES ('S03','Blacksmith Mordekaiser','103'); 
INSERT INTO Skin VALUES ('S04','Full Metal Veigar','104'); 
INSERT INTO Skin VALUES ('S05','Wonderland Riven','105'); 
INSERT INTO Skin VALUES ('S06','Vandal Yorick','106'); 
INSERT INTO Skin VALUES ('S07','Debonair Urgot','107'); 
INSERT INTO Skin VALUES ('S08','Barbarian Karthus','108'); 
INSERT INTO Skin VALUES ('S09','Runeguard Brand','109'); 
INSERT INTO Skin VALUES ('S10','Divine Evelynn','110'); 
INSERT INTO Skin VALUES ('S11','Spooky Ziggs','111'); 
INSERT INTO Skin VALUES ('S12','Explorer Xerath','112'); 
INSERT INTO Skin VALUES ('S13','Tango Galio','113'); 
INSERT INTO Skin VALUES ('S14','Forsaken Ryze','114'); 
INSERT INTO Skin VALUES ('S15','Franken Zyra','115');

-- Insert skin pricing information
INSERT INTO SkinInfo VALUES ('Assasin Darius','500'); 
INSERT INTO SkinInfo VALUES ('Battlecast Elise','600'); 
INSERT INTO SkinInfo VALUES ('Blacksmith Mordekaiser','700'); 
INSERT INTO SkinInfo VALUES ('Full Metal Veigar','800'); 
INSERT INTO SkinInfo VALUES ('Wonderland Riven','900'); 
INSERT INTO SkinInfo VALUES ('Vandal Yorick','1000'); 
INSERT INTO SkinInfo VALUES ('Debonair Urgot','1100'); 
INSERT INTO SkinInfo VALUES ('Barbarian Karthus','1200'); 
INSERT INTO SkinInfo VALUES ('Runeguard Brand','1300'); 
INSERT INTO SkinInfo VALUES ('Divine Evelynn','1400'); 
INSERT INTO SkinInfo VALUES ('Spooky Ziggs','1500'); 
INSERT INTO SkinInfo VALUES ('Explorer Xerath','1600'); 
INSERT INTO SkinInfo VALUES ('Tango Galio','1700'); 
INSERT INTO SkinInfo VALUES ('Forsaken Ryze','1800'); 
INSERT INTO SkinInfo VALUES ('Franken Zyra','1900');

-- Insert skin-hero-player relationships
INSERT INTO Skin_Hero VALUES ('S01','P001','101'); 
INSERT INTO Skin_Hero VALUES ('S02','P002','102'); 
INSERT INTO Skin_Hero VALUES ('S03','P003','103'); 
INSERT INTO Skin_Hero VALUES ('S04','P004','104'); 
INSERT INTO Skin_Hero VALUES ('S05','P005','105'); 
INSERT INTO Skin_Hero VALUES ('S06','P006','106'); 
INSERT INTO Skin_Hero VALUES ('S07','P007','107'); 
INSERT INTO Skin_Hero VALUES ('S08','P008','108'); 
INSERT INTO Skin_Hero VALUES ('S09','P009','109'); 
INSERT INTO Skin_Hero VALUES ('S10','P010','110'); 
INSERT INTO Skin_Hero VALUES ('S11','P011','111'); 
INSERT INTO Skin_Hero VALUES ('S12','P012','112'); 
INSERT INTO Skin_Hero VALUES ('S13','P013','113'); 
INSERT INTO Skin_Hero VALUES ('S14','P014','114'); 
INSERT INTO Skin_Hero VALUES ('S15','P015','115');

PRINT 'Sample data inserted successfully.';

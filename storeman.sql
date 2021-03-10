-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2020 at 07:54 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storeman`
--
CREATE DATABASE IF NOT EXISTS `storeman` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `storeman`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`) VALUES
(1, 'admin', '123'),
(2, 'cloudyahihi', '123');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CatId` int(11) NOT NULL AUTO_INCREMENT,
  `CatName` varchar(100) NOT NULL,
  PRIMARY KEY (`CatId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CatId`, `CatName`) VALUES
(1, 'Strategy boardgame'),
(2, 'Family boardgame'),
(3, 'Boardgame VietNam'),
(4, 'Boardgame for kid'),
(5, 'Rubik'),
(6, 'Boardgame entertainment');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CusId` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`CusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `OrderId` varchar(10) NOT NULL,
  `OrderDate` date NOT NULL,
  `CusId` int(11) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `CusId` (`CusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE IF NOT EXISTS `orderdetail` (
  `OrderId` varchar(10) NOT NULL,
  `ProductId` varchar(10) NOT NULL,
  `Quantitty` int(11) NOT NULL,
  PRIMARY KEY (`OrderId`,`ProductId`),
  KEY `OrderId` (`OrderId`),
  KEY `ProductId` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ProductId` varchar(10) NOT NULL,
  `ProductName` varchar(200) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Price` double NOT NULL,
  `CatId` int(11) NOT NULL,
  `Detail` text NULL,
  PRIMARY KEY (`ProductId`),
  KEY `foreignkey_product_catid` (`CatId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductId`, `ProductName`, `Image`, `Price`, `CatId`, `Detail`) VALUES
('1001', 'Arkham Horror', 'images/2.jpg', '34.50', 1, '1. The plot
The story begins with a series of successive disappearances in the city of Arkham, the bodies of the victims later found in the forest, with deformed bodies and missing parts. The police announced that it was wild animals, but you do not believe it, so you created an investigative team (the players themselves) to the latest crime scene to investigate the incident.
But when you arrive, you and your team have discovered horrifying mysteries beyond human understanding, thereby getting involved in tough and challenging adventures, confronting the forces being lurk in the dark manipulating things, and try to expose them before its too late. Whether you can stop the intentions of the bad guys before they bring humanity to the brink of destruction, or if some bad end happens to your team, it all depends on yourself. friend!
2. Gameplay
In Arkham Horror: The Card Game, you will choose a character from 1 of 5 different faction, each faction has its own strength and weakness. Then, players create themselves a 30-card deck, including skill cards, equipment, magic, ... and 1 random weak spot card. Each character also has different stats representing intelligence, fitness, spell speed, and attack power. It is all about preparation for the challenge you are about to enter, and the more prepared you are, the more likely you are to survive.
At the beginning of a game screen, all players will usually be in the same place, and from there explore the surrounding locations, depending on the task you need to complete to pass the level: find enough numbers. Termite, kill a monster or rescue someone, ... Of course, you will not be able to always work hard on the task, because every turn passes, the scenario will are flipped open and create difficulty for each player. Not only that, each level has a certain number of turns, and when that number of turns passes and you have not completed the task, the consequences will be unpredictable, even deciding the teams victory or defeat. Difficulties accumulate difficulties, players will have to be very alert and have a good strategy to support each other.
Arkham horror TCG is a big campaign, divided into a total of 3 small gameplay. Each level is a different story, all creating a big story, the end only appears when we have passed all three levels. So, after each play, the group will record the experience points that they have gained, use those points to buy more items, equip the character to be ready for the next adventure. The beauty of the game is that it sometimes gives the player options, and each choice has a different outcome, leading to a completely new scenario in the future.'),
('1002', 'Imhotep', 'images/3.jpg', '50.46', 1, 'In Imhotep, the players become builders in Egypt who want to emulate the first and best-known architect there, namely Imhotep.
Over six rounds, they move wooden stones by boat to create five seminal monuments, and on a turn, a player chooses one of four actions: Procure new stones, load stones on a boat, bring a boat to a monument, or play an action card. While this sounds easy, naturally the other players constantly thwart your building plans by carrying out plans of their own. Only those with the best timing — and the stones to back up their plans — will prove to be Egypts best builder.
AWARDS & HONORS
2016 Spiel des Jahres Nominee
2016 Golden Geek Best Family Board Game Nominee'),
('1003', 'Catan', 'images/4.jpg', '53.91', 1, '1. General introduction
Imagine you are a great explorer. After a long, arduous journey on the sea, your boat has finally landed in a new land - the rich and very unspoiled Catan island. However, you are not the only one to find this land. Others, from some distant sea out there, had also set foot on this island. Come on, the race to master Catan has officially begun! (Catan.com)
Launched in 1995, The Settlers of Catan has become a "legend", an early lesson that almost every board gamer in the world must know. With its simple rules, interactive and highly competitive, the game is present everywhere, from big and small tournaments, in the meetings of friends to the family dining table - as it is. suitable for all subjects.
During nearly 25 years of storming the market, the game has released countless different versions, from retheme versions, expansions to standalone inspired by novels and movie publications. language. Among them are Catan: Seafarer, Catan: Cities and Knights, Series Catan Scenario, Catan: Game of Thrones, Catan: Star Trek, ... This has partly demonstrated the great attraction of this game. just as the heat has not cooled down over the years. The game has a score of 7.2 on BGG
2. Content:
In Catan, you will compete with other players in building houses and cities, creating your own community and becoming the most influential person on this island. Your goal is 10 points - anyone hitting the 10-point mark on your turn wins instantly. There are 3 ways you can earn points: build buildings and earn points, play Growth cards to earn points or win prizes like: Longest Road or Biggest Army.
The main factors that make up the success of the game are the competitiveness in construction and the very strong interaction and exchange. If in other games you earn resources you keep, then in Catan you are entitled to exchange your resources with any player in exchange for what you need. Without a certain exchange rate, you can shout as many resources as you want, as long as you think someone will trade it for you. Are the residents here - the guys you are competing fiercely with - ready to trade what you want, and at what price? Join us now, to discover for yourself and have the unique experience that this game gives you!
3. Awards:
2012 JoTa Best Game Released in Brazil Nominee
2012 JoTa Best Game Released in Brazil Critic Award
2011 Ludo Award Best Board Game Editors Choice Winner
2005 Gra Roku Game of the Year
2004 Hra roku Winner
2004 Hra roku Nominee
2002 Japan Boardgame Prize Best Japanese Game Nominee
2001 Origins Awards Hall of Fame Inductee
1996 Origins Awards Best Fantasy or Science Fiction Board Game Winner
1995 Spiel des Jahres Winner
1995 Meeples Choice Award
1995 Essener Feder Best Written Rules Winner
1995 Deutscher Spiele Preis Best Family / Adult Game Winner
4. Ingredients:
19 pieces Terrain (hexagon)
6 Sea fragments (Edge map)
9 Port tokens
18 round tokens numbered 2-12
95 resource cards, divided into 5 categories: wood, brick, stone, sheep, rice
25 Development cards
4 Tags Constructions
2 special cards: The Longest Path and the Biggest Army
16 City tokens (4 people, 4 Cities each)
20 Residential tokens (4 people each 5 Homestay)
60 Sugar tokens (4 people 15 sugar each)
2 Dice
1 Token of Robbery
1 Law Book
5. Similar boardgame:
Construction game:
Deus
Terra Mystica
Puerto Rico
Resource Control Game:
Stone Age
Scythe
Concordia
Game Map changes:
Five Tribes
Betrayal at house on the hill
Magic maze'),
('2001', 'Monopoly', 'images/5.jpg', '33.64', 2, 'When participating in the game, players will play the role of landowners, owning a certain amount of capital and have one of the most important goals, which is to buy land and develop those lands, and build houses. housing and upgrading into hotels, a process that is not short and requires you to be able to accumulate and use money in a reasonable and correct manner. The money you collect in the game will come from other landowners when they visit your plot or it can be from the chance cards, the air you get. However, there will come a time when those chance cards, fortunes can cost you money, or when you move to another players land or when you have to pay different taxes, so luck is also weak. element is equally important in this game.
2. Awards:
The game has no awards.
3. Ingredients
 1 Guide to the rules of the game
- 1 Table play
- 8 Tokens represent players
- 28 Real estate ownership cards
- 16 Opportunity Cards
- 16 Card air transport
- 32 House model
- 12 Hotel models
- 2 Dice
- Money used in the game'),
('2002', 'addition and subtraction', 'images/6.jpg', '3.45', 2, '"Precious treasures have been discovered in the magical forest. You could be the owner if you were faster than the others. Follow the escape signals from your friend Dwarf Mushroom," is a hint for you to follow the right path. The race starts and the fastest, quickest, fastest calculator will be the winner! "
Math Add and Subtract is a special version of Math, with simpler rules that are suitable for even younger children.
In this game, you need to do the math correctly and quickly, the person who hits all the cards first wins.
Everyone playing at the same time without turn, so the game will be very dramatic, interesting with the competition with each other.
This is an interesting, simple game and helps improve fast calculation ability, mathematical thinking, social interaction; Especially suitable for educational purposes for children and students.
Math Plus Subtraction is a product made in Vietnam with extremely good quality, safe, guaranteed to make you satisfied. Learn while playing with Math, Plus Subtraction version!'),
('2003', 'Jenga', 'images/7.jpg', '6.43', 2, 'The game consists of 48 pieces of wood with common sizes of each piece (1.5x2.5x7.5cm - this size may vary depending on the version of the game).
Players will have to build an 18-storey building with adjacent floors having perpendicular directions. For example, if the 1st floor is in the North-South direction, the 2nd floor will be in the East-West direction, the next floors will also follow this rule.'),
('2004', 'Foldscope', 'images/8.jpg', '5.18', 2, 'Each Foldscope Basic Classroom Kit will include
- 1 Paper folding microscope Foldscope paper, set of template frame.
- 1 Guide to the glass, how to prepare the standard, how to connect to the phone and notes, tips for using.
- 1 Set of transparent stickers to create templates.
- 1 Set of transparent sticker to attach lenses as well as combine Foldscope with mobile phones.
- 1 Sticker with separate ID for each user, unique for each Foldscope glasses
- 1 List of microorganisms that can be observed in the surrounding life, detailed description and ways to obtain such specimens.
- 3 Magnets fitted with glass, 1 lens.
- 1 eyeglasses swab.
- 1 detailed English guide and 1 Vietnamese instruction'),
('2005', 'Exploding Kittens', 'images/9.jpg', '30.62', 2, ''),
('3001', 'Đường đua tài chính', 'images/10.jpg', '17.21', 3, 'Basic gameplay:
There are 4 tracks INCOME, SPENDING, INVESTMENT, GIVING
Each player will receive 4 tokens of the same color and 1 deposit of 300 dong, placed in 4 starting lines (4 corners on each track)
Roll the dice and move the token across the map following the tracks with the dice being rolled. Take each step on the map to draw 1 corresponding card and increase or decrease the amount in hand based on the card you draw.
The game ends when all 4 tokens finish on all 4 tracks.
The dice poured into the lucky box have the right to jump straight to the lucky square on the map.
If a player goes bankrupt, he or she can borrow from another player up to of the original amount, and at the end of the game he will have to repay the other player at 10% interest.
If there are 2 people with the same square, the next person can kick the body first.'),
('3002', 'Dozen War', 'images/11.png', '58.22', 3, 'Dozen War (Thap Nhi Chien) is a strategy board game created by the Vietnamese, set in a fantasy world called Mativen with the battle between 12 heroes.
The game has 2 separate game modes:
   Fighting: 2 players with duration 5-15 minutes
   God of War (full): for 3-4 players (can play Free for all or Co-op) with playing time from 1.5 hours - 2.5 hours
1. The plot
2. Gameplay
Dozen is a board game of strategy of army, war, calculation and solicitation of other players.
In the easiest way to understand, you can imagine Dozen war is a combination of chess, chess (move strategy, attack distance, blind spot on the board) + magic card (use skill cards power, use traps) and Dota (commanding generals, teamfights, picking heroes, choosing factions with a variety of combo skills combining generals, soldiers and equipment) to create a game line of troops, generals, breaking into slashes extremely attractive and bitter generals.
The game will have 2 types of play:
A. Version 1vs1 "Confrontation": Enhance strategy and calculation in each move by using 1 hero and limited number of soldiers to destroy 1 hero of the opponent, this version has no damage amount between 2 players.
B. Version "War God" 3-4 players: Highlight the nature of total warfare, negotiating strategy with you using 3 heroes at the same time and sending large numbers of troops, taking advantage of the terrain for the purpose of slashing enemy hero.
3. Game Components
Games include:
1 map and 1 dice.
4 plastic bags, each containing 21 pieces of the same color.
12 generals
60 equipped cards.
12 cards skill generals.
The 12 heart stones mark the heros health on the map
40 event cards.
12 cities.
9 mountains.
30 Mativen coins.
9 tokens (5 map pieces and 4 treasure pieces).
1 teleport point.
15 skulls marked victory'),
('3003', 'Bom Lắc', 'images/12.jpg', '6.90', 3, 'In the underworld you always have to take risks at all times, be prepared to bomb the enemy before you explode yourself. Only the last survivor wins.
An extremely stupid, silly, bullshit game but… super SURPRISE and FUN !!!
Sow the dice and see what happens. Each player has a special function that can be activated to change his or her destiny!
A simple party game, learn the rules in 5 minutes and can be played by up to 50 people!
The rules of the game are extremely simple:
In your turn to roll 1 dice, based on the number of buttons you roll, you give to the other person clockwise or vice versa. For example you throw "3" then choose one of two directions to give.
The person receiving the dice throws it, and hands it to another person in the same way.
Keep going until whoever gets number 1 gets BÙMMM !!! and disqualify, hand the dice to the next person to continue playing.
When there were less than 6 players left, whichever was higher than the number of players was also BOOM! For example, if there are 5 people, 1 and 6 would be explosives, while 4 people would say 1, 5, 6 would be explosive.
When there were 2 people had a special law. Even if it is sown, it will live.
The last survivor wins!
Each player will have a secret function that is played at the beginning of the game. You can activate this function according to the time recorded in it.
There are 50 functions that interact with each other and each play will never overlap!
These functions create a myriad of in-game surprises as they interact with each other in ways you never expected! Sometimes causing a sequence of combos is very "difficult". That creates a very high diversity for Bom Lak, resulting in repeated replay value.
Bom Shak is a party game according to the following standards: Simple, easy to learn, fast, crowded, interactive and humorous. This is a game that suits the trend of crowded party in Vietnam today. Above all, Bom Lak is a pure Vietnamese game, designed by author Nguyen Truong and exclusively by BoardgameVN.
Tired of playing hardcore games with complicated, thoughtful rules?
Just want a super simple game just to hit the poker room fast?
Do you want to entertain your friends with silly laughter?
Then you are in need of a "god" game like that: BOM SHAKE - Game of Destiny!'),
('4001', 'UNO', 'images/13.jpg', '5.99', 4, 'Lesson Uno is too familiar to you?
Board Game Rank: 11692 / Family Game Rank: 1403
Uno is one of the most famous card games in the world and has become a classic in this genre. The goal of each player is to hit all the cards in front of the opponent while blocking the opponent with special cards that have different effects. Uno is very simple, easy to play, fast and fun, suitable for a large group of people, the more chaotic and fun the game becomes. You can create a bustling Uno party with laughter, moments that will be remembered forever as a happy memory with your friends. Come on with Uno!
1. Introduce Uno post:
- A UNO deck of cards includes 108 cards including:
 + 4 colors Red, Blue, Green and Yellow.
 + Each color will have numbers from 1 - 9 and cards with symbols.
2. Game rules:
     - The game can be played by 2 - 10 people.
     - Divide each player 7 cards evenly, with the rest in the middle.
     - Peel one card in the middle and start playing.
     - In turn, players discard 1 card according to the following principles:
          + The same color or the same number or the same symbols.
          Black cards (free card or +4 card).
     - If you cannot put the card down, you must draw 1 card in the middle, you can discard the new card to rise if following the above rule, then discard your turn.
     - When you have 2 cards left, you put 1 card down, you must say "Uno". If you forget, you will have to draw 2 more cards.
     - The game ends when someone has lost all the cards, whoever has the most cards loses.
 3. Special cards:
 - Skip Cards: when you hit this card down, the next player will lose turns and draw 1 more card.
 - Reverse Cards: change direction.
 - Draw 2 Cards (+2): when you hit this card down, the next person is required to draw 2 cards.
 - Wild Cards (Free cards): you can play freely and choose the color to beat for the next person.
 - Wild Draw 4 Cards (Card + 4): you can play freely, choose the color of the next player and the next person will have to draw 4 more cards.
* Combo rule: for +2 cards, +4 cards can avoid having to draw 2 more cards / 4 cards, if you have a + 2 card / +4 card, the number of cards must be drawn. add up to the next person and keep going.
For example:
Player A gives +2 card to person B.
Person B also has +2 card, if he drops it, current person C will have to draw 4 cards.
Person C, if he has +2 card and drops it, person D will have to draw 6 cards. After that, go as usual, remove 1 card'),
('4002', 'The Sea Battle', 'images/14.jpg', '6.47', 4, 'THE SEA BATTLE or Battle Ship is a fighting game for 2 players, in the game, the player will arrange the warships at sea and then judge the position of the enemy warship to shoot down. The player who shoots down all of the enemys battleships wins.
Ingredient:
2 player boards can be turned up.
2 Battleship set
2 Orange marker set
4 White marker set'),
('5001', 'Apple Rubik YJ', 'images/15.jpg', '3.88', 5, 'Rubik is an intellectual toy invented in 1974 by Hungarian professor of sculpture and architect Erno Rubik and has become a familiar toy since the 1980s. BoardgameVNs Rubik Mirror is a new version with a unique gameplay, not by color but by shape:
Each time the rubik is rotated, the shape of the rubik changes
Only successful when the rubik returns to its original box shape
Brand: YongJun'),
('5002', 'Rubik Ghost 2x2 FangCun', 'images/16.jpg', '9.88', 5, 'Rubik is an intellectual toy invented in 1974 by Hungarian professor of sculpture and architect Erno Rubik and has become a familiar toy since the 1980s. The way to play this game is also very simple, players just need to rotate until all sides of the rubik are the same color. BoardgameVNs Rubik Fisher has the following features:
Smooth edges so as not to be a hazard
Smooth rotation for quick solution
Brand: FangCun
Dimensions: 60.0mm x 60.0mm x 60.0mm'),
('5003', 'Rubik Rex Cube LanLan', 'images/17.jpg', '7.55', 5, 'Rubik is an intellectual toy invented in 1974 by Hungarian professor of sculpture and architect Erno Rubik and has become a familiar toy since the 1980s. The way to play this game is also very simple, players just need to rotate until all sides of the rubik are the same color. BoardgameVNs Rubik Rex Cube has the following features:
Angled the ring so as not to pose a hazard
Smooth rotation for quick solution
Variant of Rubik 3x3
Brand: Windtalkers
Dimensions: 60.0mm x 60.0mm x 60.0mm'),
('6001', 'Werewolf', 'images/18.jpg', '18.33', 6, 'The most engaging party game youll ever play - for up to 75 players
In Ultimate Werewolf, you and any number of other players (as few as 7 and as many as 75) attempt to figure out who is a werewolf over the course of several game days and nights. Each day youll choose a player (hopefully a werewolf) to eliminate.

Each night. ..the werewolves will eliminate a villager. Fortunately for you, some of the villagers have special powers, like the Seer, who learns the true identity of a player each night. The game continues until only villagers. ..or werewolves. ..remain.'),
('6002', 'Mouse stack cheese', 'images/1.jpg', '10.78', 6, 'The rats love their cheeses so much, its sad if you let the cheeses fall from the mices hands and hit the ground. Your task is to put the mice on the cheese tower and how not to let the tower and cheese fall to the ground. What a waste !!!!!!
Lets show our ingenuity, tenderness and our greed.
The rats in here are not as scary as in real life ^^');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CusId`) REFERENCES `customer` (`CusId`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `order` (`OrderId`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `foreignkey_product_catid` FOREIGN KEY (`CatId`) REFERENCES `category` (`CatId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

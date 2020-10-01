/*
Author - Gayathri Sanjeev
Course - IST659 M400
Term - June 2018
Title - IPL Matches Data Project
*/
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Team')
BEGIN
DROP TABLE Team
END
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TeamPlayers')
BEGIN
DROP TABLE TeamPlayers
END
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Venue')
BEGIN
DROP TABLE Venue
END
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Matches')
BEGIN
DROP TABLE Matches
END
GO

-- Creating the table Team
CREATE TABLE Team (
	-- columns for the Team table
	TeamID int identity,
	TeamName varchar(30) not null
	--Constraints on the Team Table
	CONSTRAINT PK_Team PRIMARY KEY (TeamID),
	CONSTRAINT U1_Team UNIQUE(TeamName)
	)
-- End Creating the Team table
-- Creating the table TeamPlayers
CREATE TABLE TeamPlayers (
	-- columns for the TeamPlayers table
	PlayerID int identity,
	PlayerFirstName varchar(15) not null,
	PlayerLastName varchar(20) not null,
	TeamID int not null
	-- constraints on the TeamPlayers table
	CONSTRAINT PK_TeamPlayers PRIMARY KEY (PlayerID),
	CONSTRAINT FK_TeamPlayers FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
	)
-- End Creating the TeamPlayers table
-- Creating the Venue Table
CREATE TABLE Venue (
	-- columns for the Venue table
	VenueID int identity,
	VenueName char(50) not null,
	VenueCity char(20),
	VenueCountry char(15)
	-- Constraints on the Venue table
	CONSTRAINT PK_Venue PRIMARY KEY (VenueID),
	CONSTRAINT U1_Venue UNIQUE (VenueName)
	)
-- End creating the Venue table
-- Creating the Matches table
CREATE TABLE Matches (
	-- columns for the Matches table
	MatchID int identity,
	TossWinner int not null,
	TossDecision char(10) not null,
	MatchDate datetime not null,
	SeasonYear datetime not null,
	MatchWinner int not null,
	Team1_home int not null,
	Team2_away int not null,
	Match_won_by_runs int not null,
	Match_won_by_wickets int not null,
	MatchResults char(10),
	VenueID int not null,
	Player_Match int not null
	--Constraints on the Matches Table
	CONSTRAINT PK_Matches PRIMARY KEY (MatchID),
	CONSTRAINT FK1_Matches FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
	CONSTRAINT FK3_Matches FOREIGN KEY (TossWinner) REFERENCES Team(TeamID),
	CONSTRAINT FK4_Matches FOREIGN KEY (MatchWinner) REFERENCES Team(TeamID),
	CONSTRAINT FK5_Matches FOREIGN KEY (Team1_home) REFERENCES Team(TeamID),
	CONSTRAINT FK6_Matches FOREIGN KEY (Team2_away) REFERENCES Team(TeamID),
	CONSTRAINT FK7_Matches FOREIGN KEY (Player_Match) REFERENCES TeamPlayers(PlayerID)
	)
-- End Creating the Matches table
-- Creating the Team_Winner table
/*CREATE TABLE Team_Winner (
	-- columns for the Team_Winner table
	TeamMatchPlayerID int identity,
	Player_Match varchar(20) not null,
	MatchWinner varchar(30) not null,
	PlayerID int not null,
	TeamID int not null,
	MatchID int not null
	-- constraints on the Team_Winner table
	CONSTRAINT PK_Team_Winner PRIMARY KEY (TeamMatchPlayerID),
	CONSTRAINT FK1_Team_Winner FOREIGN KEY (PlayerID) REFERENCES TeamPlayers(PlayerID),
	CONSTRAINT FK2_Team_Winner FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
	CONSTRAINT FK3_Team_Winner FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
	)
--End Creating the Team_Winner table*/

-- Adding Team names to the Team table
INSERT INTO Team
	(TeamName)
VALUES
	('Delhi Daredevils'),
	('Royal Challengers Bangalore'),
	('Gujarat Lions'),
	('Mumbai Indians'),
	('Sunrisers Hyderabad'),
	('Kings XI Punjab'),
	('Kolkata Knight Riders'),
	('Rising Pune Supergiants')
-- Adding Venue names to the Venue table
INSERT INTO Venue
	(VenueName, VenueCity, VenueCountry)
VALUES
	('Eden Gardens','Kolkata','India'),
	('Feroz Shah Kotla','New Delhi','India'),
	('Green Park','New Delhi','India'),
	('Holkar Cricket Stadium','Indore','India'),
	('M Chinnaswamy Stadium','Bangalore','India'),
	('Maharashtra Cricket Association Stadium','Pune','India'),
	('Punjab Cricket Association IS Bindra Stadium', 'Mohali', 'India'),
	('Rajiv Gandhi International Stadium','Hyderabad','India'),
	('Saurashtra Cricket Association Stadium','Rajkot','India'),
	('Wankhede Stadium','Mumbai','India')
-- Adding names of the players to the TeamPlayers table
INSERT INTO TeamPlayers
	(PlayerFirstName, PlayerLastName, TeamID)
VALUES
	('Zaheer','Khan','1'),
	('Angelo','Mathews','1'),
	('Corey','Anderson','1'),
	('Kagiso','Rabada','1'),
	('Pat','Cummins','1'),
	('Ankit','Bawne','1'),
	('Aditya','Tare','1'),
	('Murugan','Ashwin','1'),
	('Navdeep','Saini','1'),
	('Shashank','Singh','1'),
	('Mohammed','Shami','1'),
	('Shahbaz','Nadeem','1'),
	('Jayant','Yadav','1'),
	('Amit','Mishra','1'),
	('Shreyas','Iyer','1'),
	('Sam','Billings','1'),
	('Sanju','Samson','1'),
	('Chris','Morris','1'),
	('Carlos','Brathwaite','1'),
	('Karun','Nair','1'),
	('Rishabh','Pant','1'),
	('Chama','Milind','1'),
	('Khaleel','Ahmed','1'),
	('Pratyush','Singh','1'),
	('Ben','Hilfenhaus','1'),
	('Marlon','Samuels','1'),
	('Virat','Kohli','2'),
('ABD','Villiers','2'),
('Chris','Gayle','2'),
('Yuzvendra','Chahal','2'),
('Harshal','Patel','2'),
('Mandeep','Singh','2'),
('Adam','Milne','2'),
('Sarfaraz','Khan','2'),
('Sreenath','Aravind','2'),
('Kedar','Jadhav','2'),
('Shane','Watson','2'),
('Stuart','Binny','2'),
('Samuel','Badree','2'),
('Iqbal','Abdulla','2'),
('Travis','Head','2'),
('Sachin','Baby','2'),
('Avesh','Khan','2'),
('Tabraiz','Shamsi','2'),
('Pawan','Negi','2'),
('Tymal','Mills','2'),
('Praveen','Dubey','2'),
('Aniket','Choudhary','2'),
('Billy','Stanlake','2'),
('Vishnu','Vinod','2'),
('Harpreet','Singh','2'),
('Suresh','Raina','3'),
('Ravindra','Jadeja','3'),
('James','Faulkner','3'),
('Brendon','McCullum','3'),
('Aaron','Finch','3'),
('Dwayne','Smith','3'),
('Dinesh','Karthik','3'),
('Dhawal','Kulkarni','3'),
('Praveen','Kumar','3'),
('Andrew','Tye','3'),
('Ishan','Kishan','3'),
('Pradeep','Sangwan','3'),
('Shadab','Jakati','3'),
('Jaydev','Shah','3'),
('Manpreet','Gony','3'),
('Nathu','Singh','3'),
('Jason','Roy','3'),
('Munaf','Patel','3'),
('Chirag','Suri','3'),
('Akshdeep','Nath','3'),
('Basil','Thampi','3'),
('Shubham','Agarwal','3'),
('Tejas','Baroka','3'),
('Pratham','Singh','3'),
('Shelley','Shaurya','3'),
('Ankit','Soni','3'),
('Irfan','Pathan','3'),
('Rohit','Sharma','4'),
('Kieron','Pollard','4'),
('Lasith','Malinga','4'),
('Harbhajan','Singh','4'),
('Ambati','Rayudu','4'),
('Jasprit','Bumrah','4'),
('Shreyas','Gopal','4'),
('Lendl','Simmons','4'),
('Vinay','Kumar','4'),
('Parthiv','Patel','4'),
('Mitchell','McClenaghan','4'),
('Nitish','Rana','4'),
('Siddhesh','Lad','4'),
('Jagadeesha','Suchith','4'),
('Hardik','Pandya','4'),
('Jos','Buttler','4'),
('Tim','Southee','4'),
('Jitesh','Sharma','4'),
('Krunal','Pandya','4'),
('Deepak','Punia','4'),
('Saurabh','Tiwary','4'),
('Nicholas','Pooran','4'),
('Mitchell','Johnson','4'),
('Karn','Sharma','4'),
('Asela','Gunaratne','4'),
('Krishnappa','Gowtham','4'),
('Kulwant','Khejroliya','4'),
('Shikhar','Dhawan','5'),
('Bhuvneshwar','Kumar','5'),
('David','Warner(c)','5'),
('Moises','Henriques','5'),
('Naman','Ojha','5'),
('Ricky','Bhui','5'),
('Kane','Williamson','5'),
('Siddarth','Kaul','5'),
('Bipul','Sharma','5'),
('Yuvraj','Singh','5'),
('Ben','Cutting','5'),
('Abhimanyu','Mithun','5'),
('Mustafizur','Rahman','5'),
('Barinder','Sran','5'),
('Deepak','Hooda','5'),
('Vijay','Shankar','5'),
('Chris','Jordan','5'),
('Mohammad','Nabi','5'),
('Eklavya','Dwivedi','5'),
('Rashid','Khan','5'),
('Pravin','Tambe','5'),
('Ben','Laughlin','5'),
('Tanmay','Agarwal','5'),
('Mohammed','Siraj','5'),
('David','Miller','6'),
('Manan','Vohra','6'),
('Axar','Patel','6'),
('Glenn','Maxwell','6'),
('Gurkeerat','Singh','6'),
('Anureet','Singh','6'),
('Sandeep','Sharma','6'),
('Shaun','Marsh','6'),
('Wriddhiman','Saha','6'),
('Nikhil','Naik','6'),
('Mohit','Sharma','6'),
('Marcus','Stoinis','6'),
('KC','Cariappa','6'),
('Armaan','Jaffer','6'),
('Pardeep','Sahu','6'),
('Swapnil','Singh','6'),
('Hashim','Amla','6'),
('Varun','Aaron','6'),
('Eoin','Morgan','6'),
('Matt','Henry','6'),
('Rahul','Tewatia','6'),
('Martin','Guptill','6'),
('Daren','Sammy','6'),
('Rinku','Singh','6'),
('T','Natarajan','6'),
('Ishant','Sharma','6'),
('Gautam','Gambhir','7'),
('Sunil','Narine','7'),
('Kuldeep','Yadav','7'),
('Manish','Pandey','7'),
('Suryakumar','Yadav','7'),
('Piyush','Chawla','7'),
('Robin','Uthappa','7'),
('Shakib','Al','7'),
('Chris','Lynn','7'),
('Umesh','Yadav','7'),
('Yusuf','Pathan','7'),
('Sheldon','Jackson','7'),
('Ankit','Rajpoot','7'),
('Trent','Boult','7'),
('Nathan','Coulter-Nile','7'),
('Darren','Bravo','7'),
('Rishi','Dhawan','7'),
('Chris','Woakes','7'),
('Rovman','Powell','7'),
('Ishank','Jaggi','7'),
('Sayan','Ghosh','7'),
('Ramsingh','Yadav','7'),
('Colin','Grandhomme','7'),
('MS','Dhoni','8'),
('Ajinkya','Rahane','8'),
('Steven','Smith','8'),
('Faf','Plessis','8'),
('Ashok','Dinda','8'),
('Ankush','Bains','8'),
('Rajat','Bhatia','8'),
('Ankit','Sharma','8'),
('Ishwar','Pandey','8'),
('Adam','Zampa','8'),
('Jaskaran','Singh','8'),
('Baba','Aparajith','8'),
('Deepak','Chahar','8'),
('Usman','Khawaja','8'),
('Mayank','Agarwal','8'),
('Ben','Stokes','8'),
('Manoj','Tiwary','8'),
('Jaydev','Unadkat','8'),
('Rahul','Chahar','8'),
('Daniel','Christian','8'),
('Lockie','Ferguson','8'),
('Saurabh','Kumar','8'),
('Milind','Tandon','8'),
('Rahul','Tripathi','8'),
('Shardul','Thakur','8'),
('Imran','Tahir','8'),
('Washington','Sundar','8')

-- Adding data into the matches table
INSERT INTO Matches 
	(TossWinner, TossDecision, MatchDate, SeasonYear, MatchWinner, Team1_home, Team2_away, Match_won_by_runs, Match_won_by_wickets, MatchResults, VenueID, Player_Match)
VALUES
	('2','field','4/5/2017','2017','5','5','2','35','0','normal','8','115'),
('8','field','4/6/2017','2017','8','4','8','0','7','normal','6','181'),
('7','field','4/7/2017','2017','7','3','7','0','10','normal','9','164'),
('6','field','4/8/2017','2017','6','8','6','0','6','normal','4','133'),
('2','bat','4/8/2017','2017','2','2','1','15','0','normal','5','36'),
('5','field','4/9/2017','2017','5','3','5','0','9','normal','8','125'),
('4','field','4/9/2017','2017','4','4','4','0','4','normal','10','90'),
('2','bat','4/10/2017','2017','6','2','6','0','8','normal','4','132'),
('8','field','4/11/2017','2017','1','1','8','97','0','normal','6','17'),
('4','field','4/12/2017','2017','4','5','4','0','4','normal','10','84'),
('7','field','4/13/2017','2017','7','6','7','0','8','normal','1','157'),
('4','field','4/14/2017','2017','4','2','4','0','4','normal','5','80'),
('3','field','4/14/2017','2017','3','8','3','0','7','normal','9','61'),
('5','field','4/15/2017','2017','7','7','5','17','0','normal','1','162'),
('1','bat','4/15/2017','2017','1','1','6','51','0','normal','2','3'),
('4','field','4/16/2017','2017','4','3','4','0','6','normal','10','90'),
('2','field','4/16/2017','2017','8','8','2','27','0','normal','5','194'),
('1','bat','4/17/2017','2017','7','1','7','0','4','normal','3','170'),
('6','field','4/17/2017','2017','5','5','6','5','0','normal','8','107'),
('3','field','4/18/2017','2017','2','2','3','21','0','normal','9','29'),
('5','bat','4/19/2017','2017','5','5','1','15','0','normal','8','112'),
('4','field','4/20/2017','2017','4','6','4','0','8','normal','4','94'),
('3','field','4/21/2017','2017','3','7','3','0','4','normal','1','52'),
('1','field','4/22/2017','2017','4','4','1','14','0','normal','10','89'),
('8','field','4/22/2017','2017','8','5','8','0','6','normal','6','179'),
('3','field','4/23/2017','2017','6','6','3','26','0','normal','9','146'),
('2','field','4/23/2017','2017','7','7','2','82','0','normal','1','170'),
('4','field','4/24/2017','2017','8','8','4','3','0','normal','10','194'),
('7','field','4/26/2017','2017','7','8','7','0','7','normal','6','162'),
('3','field','4/27/2017','2017','3','2','3','0','7','normal','5','61'),
('7','field','4/28/2017','2017','7','1','7','0','7','normal','1','156'),
('6','field','4/28/2017','2017','5','5','6','26','0','normal','7','125'),
('2','field','4/29/2017','2017','8','8','2','61','0','normal','6','199'),
('3','bat','4/29/2017','2017','4','3','4','0','0','tie','9','97'),
('6','field','4/30/2017','2017','6','1','6','0','10','normal','7','136'),
('7','field','4/30/2017','2017','5','5','7','48','0','normal','8','108'),
('2','bat','5/1/2017','2017','4','2','4','0','5','normal','10','79'),
('8','field','5/1/2017','2017','8','3','8','0','5','normal','6','194'),
('1','field','5/2/2017','2017','1','5','1','0','6','normal','2','11'),
('8','field','5/3/2017','2017','8','7','8','0','4','normal','1','202'),
('1','field','5/4/2017','2017','1','3','1','0','7','normal','2','21'),
('2','field','5/5/2017','2017','6','6','2','19','0','normal','5','136'),
('5','field','5/6/2017','2017','8','8','5','12','0','normal','8','196'),
('1','field','5/6/2017','2017','4','4','1','146','0','normal','2','86'),
('7','field','5/7/2017','2017','7','2','7','0','6','normal','5','157'),
('3','field','5/7/2017','2017','3','6','3','0','6','normal','7','57'),
('4','bat','5/8/2017','2017','5','4','5','0','7','normal','8','106'),
('7','field','5/9/2017','2017','6','6','7','14','0','normal','7','140'),
('1','field','5/10/2017','2017','1','3','1','0','2','normal','3','15'),
('4','field','5/11/2017','2017','6','6','4','7','0','normal','10','138'),
('1','bat','5/12/2017','2017','1','1','8','7','0','normal','2','20'),
('5','field','5/13/2017','2017','5','3','5','0','8','normal','3','129'),
('7','field','5/13/2017','2017','4','4','7','9','0','normal','1','83'),
('8','field','5/14/2017','2017','8','6','8','0','9','normal','6','196'),
('2','bat','5/14/2017','2017','2','2','1','10','0','normal','2','31'),
('4','field','5/16/2017','2017','8','8','4','20','0','normal','10','205'),
('7','field','5/17/2017','2017','7','5','7','0','7','normal','5','170'),
('4','field','5/19/2017','2017','4','7','4','0','6','normal','5','102'),
('4','bat','5/21/2017','2017','4','4','8','1','0','normal','8','97')
GO
/* Creating a function to count the number of matches played by a team*/

CREATE FUNCTION MatchesCount (@TeamID int)
	RETURNS int AS -- COUNT() is an integer value, so return it as an int
BEGIN
	DECLARE @returnValue int -- matches the function's return type

	/* Get the count of the matches won for the provided TeamID and assign
	that value to @returnValue. Note that we use the @TeamID parameter in 
	the WHERE clause to limit our count to that team's winning records*/
	SELECT @returnValue = COUNT(MatchWinner) FROM Matches 
	WHERE Matches.MatchWinner = @TeamID

	-- return @returnValue to the calling code
	RETURN @returnValue
END
GO

/* Selecting and viewing the top 10 records of the MatchesCount function and merging it with the columns from the team table*/
CREATE VIEW most_matches_won_by_team AS
	SELECT TOP 10
		*,
		dbo.MatchesCount(TeamID) as MatchesCount
FROM Team
ORDER BY MatchesCount DESC
GO

SELECT * FROM most_matches_won_by_team
GO

/* Creating a function to count the number of Player of the match awards won by a player*/
CREATE FUNCTION PlayerOfMatch (@PlayerID int)
	RETURNS int AS -- COUNT() is an integer value, so return it as an int
BEGIN
	DECLARE @returnValue int -- matches the function's return type

	/* Get the count of the awards won for the provided PlayerID and assign
	that value to @returnValue. Note that we use the @PlayerID parameter in 
	the WHERE clause to limit our count to that player's awards*/
	SELECT @returnValue = COUNT(Player_Match) FROM Matches 
	WHERE Matches.Player_Match = @PlayerID

	-- return @returnValue to the calling code
	RETURN @returnValue
END
GO

/* Selecting and viewing the top 10 records of the PlayerOfMatch function 
and merging it with the columns from the TeamPlayers table*/
CREATE VIEW Player_of_Match AS
	SELECT TOP 10
		*,
		dbo.PlayerOfMatch(PlayerID) as PlayerOfTheMatchAwards
FROM TeamPlayers
ORDER BY PlayerOfTheMatchAwards DESC
GO

SELECT * FROM Player_of_Match
GO

/* Creating a function to count the number of matches played in a venue*/
CREATE FUNCTION VenueMatches (@venueID int)
RETURNS int AS  -- COUNT() is an integer value, so return it as an int
BEGIN
	DECLARE @returnValue int -- matches the function's return type
	/* Get the count of the matches played for the provided VenueID and assign
	that value to @returnValue. Note that we use the @venueID parameter in 
	the WHERE clause to limit our count to that venue's matches*/
	SELECT @returnValue = COUNT(VenueID) FROM Matches
	WHERE Matches.VenueID = @venueID
	RETURN @returnValue  	-- return @returnValue to the calling code
END
GO


/* Selecting and viewing the top 5 records of the VenueMatches function 
and merging it with the columns from the Venue table*/
CREATE VIEW Venue_Most_Matches AS
	SELECT TOP 5
		*,
		dbo.VenueMatches(VenueID) as VenueWithTheMostNoOfMatches
FROM Venue
ORDER BY VenueWithTheMostNoOfMatches DESC
GO

SELECT * FROM Venue_Most_Matches
GO

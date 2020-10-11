CREATE SCHEMA ipl;
USE ipl;
DROP TABLE PLAYERS;
CREATE TABLE players
	(player_name VARCHAR(255) NOT NULL,
    DOB DATETIME,
    batting_hand VARCHAR(255) NOT NULL,
    bowling_skill VARCHAR(255),
    country VARCHAR(255));
   
load data infile 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\players.csv'
	into table players
    fields terminated by ","
    lines terminated by '\n'
    ignore 1 lines
    (player_name, @v_DOB, batting_hand, bowling_skill, @v_country)
    set
    DOB = nullif(@v_DOB, ''),
    country = nullif(@v_country, '');
    
DROP table deliveries;
CREATE TABLE deliveries
	(match_id INTEGER NOT NULL,
    inning INTEGER NOT NULL,
    batting_team VARCHAR(255) NOT NULL,
    bowling_team VARCHAR(255) NOT NULL,
    over1 INTEGER NOT NULL,
    ball INTEGER NOT NULL,
    batsman VARCHAR(255) NOT NULL,
    non_striker VARCHAR(255) NOT NULL,
    bowler VARCHAR(255) NOT NULL,
    is_super_over INTEGER NOT NULL,
    wide_runs INTEGER NOT NULL,
    bye_runs INTEGER NOT NULL,
    legbye_runs INTEGER NOT NULL,
    note_ball_runs INTEGER NOT NULL,
    penalty_runs INTEGER NOT NULL,
    batsman_run INTEGER NOT NULL,
    extra_runs INTEGER NOT NULL,
    total_runs INTEGER NOT NULL,
    player_dismissed varchar(255),
    dimsissal_kind varchar(255),
    fielder varchar(255));

LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/deliveries.csv'
	into table deliveries
    fields terminated by ','
    lines terminated by '\n'
    ignore 1 lines
    (match_id, inning, batting_team, bowling_team, over1, ball, batsman, non_striker, bowler, is_super_over, wide_runs, bye_runs, legbye_runs, note_ball_runs, penalty_runs, batsman_run, extra_runs, total_runs, @v_player_dismissed, @v_dimsissal_kind, @v_fielder)
    set
    player_dismissed = nullif(@v_player_dismissed, ''),
    dimsissal_kind = nullif(@v_dismissal_kind, ''),
    fielder = nullif(@v_fielder, '');
    
DROP TABLE matches;
CREATE TABLE matches
	(id INTEGER NOT NULL,
    season VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    date1 DATE NOT NULL,
    team1 VARCHAR(255) NOT NULL,
    team2 VARCHAR(255) NOT NULL,
    toss_winner VARCHAR(255) NOT NULL,
    toss_decision VARCHAR(255) NOT NULL,
    result VARCHAR(255) NOT NULL,
    dl_applied INTEGER NOT NULL,
    winner VARCHAR(255) NOT NULL,
    win_by_runs INTEGER NOT NULL,
    win_by_wickets INTEGER NOT NULL,
    player_of_match VARCHAR(255) NOT NULL,
    venue VARCHAR(255) NOT NULL,
    empire1 VARCHAR(255),
    empire2 VARCHAR(255),
    empire3 VARCHAR(255),
    Primary key (id));
    
LOAD DATA infile 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\matches.csv'
	into table matches
    fields terminated by ','
    lines terminated by '\n'
    ignore 1 lines
    (id, season, city, date1, team1, team2, toss_winner, toss_decision, result, dl_applied, winner, win_by_runs, win_by_wickets, player_of_match, venue, @v_empire1, @v_empire2, @v_empire3)
    set
    empire1 = nullif(@v_empire1, ''),
    empire2 = nullif(@v_empire2, ''),
    empire3 = nullif(@v_empire3, '');

DROP TABLE mostruns;
CREATE TABLE mostruns
	(batsman VARCHAR(255) NOT NULL,
    total_runs INTEGER NOT NULL,
    out1 integer not null,
    numberofballs integer not null,
    average float not null,
    strikerate float not null);

load data infile 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\most_runs_average_strikerate.csv'
	into table mostruns
    ignore 1 lines
    (batsman, total_runs, out1, numberofballs, average, strikerate);
    
DROP TABLE teams;   
CREATE TABLE teams
	(team1 VARCHAR(255) NOT NULL);
    
load data infile 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\teams.csv'
	into table teams
	ignore 1 lines
	(team1);
 
 DROP TABLE wins;
CREATE TABLE wins
	(team VARCHAR(255) NOT NULL,
    home_wins INTEGER NOT NULL,
    away_wins INTEGER NOT NULL,
    home_matches INTEGER NOT NULL,
    away_matches INTEGER NOT NULL,
    home_win_percent FLOAT NOT NULL,
    away_win_percent FLOAT NOT NULL);
    
load data infile 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\teamwise_home_and_away.csv'
	into table wins
    ignore 1 lines
    (team, home_wins, away_wins, home_matches, away_matches, home_win_percent, away_win_percent);


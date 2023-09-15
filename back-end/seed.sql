-- Use COPY command to load data from CSV
COPY "teams" FROM '/Users/johnchong/rithm/HUNT/draft-prince/back-end/generator/teams.csv'
  DELIMITER ',' CSV HEADER;

-- Use COPY command to load data from CSV file
COPY "players" FROM '/Users/johnchong/rithm/HUNT/draft-prince/back-end/generator/BBM_PlayerRankings_2223.csv'
  DELIMITER ',' CSV HEADER;


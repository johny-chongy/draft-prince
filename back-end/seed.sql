-- Create table to store data

CREATE TABLE IF NOT EXISTS "22_23" (INTEGER Round, INTEGER "Rank", FLOAT "Value",
                                                                         CHAR(50) "Name",
                                                                         CHAR(4) "Team",
                                                                         CHAR(10) "Pos",
                                                                         CHAR(50) "Inj", INTEGER "g", FLOAT "m/g", FLOAT "p/g", FLOAT "3/g", FLOAT "r/g", FLOAT "a/g", FLOAT "s/g", FLOAT "b/g", FLOAT "fg%", FLOAT "fga/g", FLOAT "ft%", FLOAT "fta/g", FLOAT "to/g", FLOAT "pV", FLOAT "3V", FLOAT "rV", FLOAT "aV", FLOAT "sV", FLOAT "bV", FLOAT "fg%V", FLOAT "ft%V", FLOAT "toV");

-- Use COPY command to load data from CSV file
COPY "22_23"
FROM '/Users/johnchong/Desktop/BBM_PlayerRankings_2223.csv' WITH CSV HEADER;
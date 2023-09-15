-- Create teams table to store teams

CREATE TABLE "teams" (
    "id" VARCHAR PRIMARY KEY,
    "conference" VARCHAR, "division" VARCHAR
);

-- Create players table to store players

CREATE TABLE "players" (
    "id" INTEGER PRIMARY KEY,
    "value" FLOAT NOT NULL,
    "name" VARCHAR NOT NULL,
    "team" VARCHAR REFERENCES teams ON DELETE CASCADE,
    "pos" VARCHAR NOT NULL,
    "inj" VARCHAR,
    "g" INTEGER NOT NULL DEFAULT 0,
    "m_g" FLOAT NOT NULL DEFAULT 0,
    "p_g" FLOAT NOT NULL DEFAULT 0,
    "th_g" FLOAT NOT NULL DEFAULT 0,
    "r_g" FLOAT NOT NULL DEFAULT 0,
    "a_g" FLOAT NOT NULL DEFAULT 0,
    "s_g" FLOAT NOT NULL DEFAULT 0,
    "b_g" FLOAT NOT NULL DEFAULT 0,
    "fgp" FLOAT NOT NULL DEFAULT 0,
    "fga_g" FLOAT NOT NULL DEFAULT 0,
    "ftp" FLOAT NOT NULL DEFAULT 0,
    "fta_g" FLOAT NOT NULL DEFAULT 0,
    "to_g" FLOAT NOT NULL DEFAULT 0,
    "season" VARCHAR NOT NULL
);

-- Create users table to store users

CREATE TABLE "users" (
    "username" VARCHAR PRIMARY KEY,
    "password" VARCHAR,
    "admin" BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create userplayer table for m2m relationship

CREATE TABLE "userplayer" (
    "id" INTEGER PRIMARY KEY,
    "username" VARCHAR REFERENCES users ON DELETE CASCADE,
    "player" INTEGER REFERENCES players ON DELETE CASCADE
);
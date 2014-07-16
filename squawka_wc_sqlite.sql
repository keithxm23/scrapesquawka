-- Creator:       MySQL Workbench 6.0.9/ExportSQLite plugin 2009.12.02
-- Author:        Mascarenhas
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2014-07-16 18:49
-- Created:       2014-06-18 14:27
PRAGMA foreign_keys = OFF;

-- Schema: mydb
BEGIN;
CREATE TABLE "teams"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "long_name" VARCHAR(45),
  "short_name" VARCHAR(45),
  "logo" VARCHAR(45),
  "shirt_url" VARCHAR(45),
  "team_color" VARCHAR(45)
);
CREATE TABLE "venues"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" VARCHAR(200)
);
CREATE TABLE "players"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "first_name" VARCHAR(45),
  "last_name" VARCHAR(45),
  "name" VARCHAR(45),
  "surname" VARCHAR(45),
  "photo" VARCHAR(45),
  "position" VARCHAR(45),
  "dob" DATE,
  "weight" INTEGER,
  "height" INTEGER,
  "shirt_num" INTEGER,
  "real_position" VARCHAR(45),
  "player_postype" INTEGER,
  "country" VARCHAR(45),
  "player_profile_url" VARCHAR(200),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id")
);
CREATE TABLE "action_types"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" VARCHAR(45)
);
CREATE TABLE "detailed_assists"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "start_x" FLOAT,
  "start_y" FLOAT,
  "end_x" FLOAT,
  "end_y" FLOAT,
  "min" INTEGER,
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id")
);
CREATE TABLE "games"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  CONSTRAINT "home_team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "away_team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "venue_id"
    FOREIGN KEY("id")
    REFERENCES "venues"("id")
);
CREATE TABLE "gk_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  "injury_time" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "action_type_id"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
CREATE TABLE "goal_attempt_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "start_x" FLOAT,
  "start_y" FLOAT,
  "end_x" FLOAT,
  "end_y" FLOAT,
  "gmouth_y" FLOAT,
  "gmouth_z" FLOAT,
  "shot" BOOL,
  "swerve" VARCHAR(45),
  "headed" BOOL,
  "injury_time" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "assist_id"
    FOREIGN KEY("id")
    REFERENCES "detailed_assists"("id")
);
CREATE TABLE "interception_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  "headed" BOOL,
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "injury_time" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "action_type_id"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
CREATE TABLE "clearance_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  "headed" BOOL,
  "injury_time" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "action_type_id"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
CREATE TABLE "all_pass_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "throw_in" BOOL,
  "start_x" FLOAT,
  "start_y" FLOAT,
  "end_x" FLOAT,
  "end_y" FLOAT,
  "injury_time" BOOL,
  "assist" BOOL,
  "headed" BOOL,
  "long_ball" BOOL,
  "through_ball" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "action_type_id"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
CREATE TABLE "tackle_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "opp_team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "opp_player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "action_type_id"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
CREATE TABLE "cross_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "start_x" FLOAT,
  "start_y" FLOAT,
  "end_x" FLOAT,
  "end_y" FLOAT,
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "injury_time" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id")
);
CREATE TABLE "corner_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "injury_time" BOOL,
  "start_x" FLOAT,
  "start_y" FLOAT,
  "end_x" FLOAT,
  "end_y" FLOAT,
  "swerve" VARCHAR(45),
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id")
);
CREATE TABLE "takeon_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  "injury_time" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "opp_team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "opp_player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "action_type_id"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
CREATE TABLE "foul_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "injury_time" BOOL,
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "opp_team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "opp_player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id")
);
CREATE TABLE "card_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "card" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "injury_time" BOOL,
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id")
);
CREATE TABLE "blocked_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "injury_time" BOOL,
  "x_loc" FLOAT,
  "y_loc" FLOAT,
  "shot" BOOL,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "opp_team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "opp_player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "action_type"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
CREATE TABLE "balls_out_events"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "type" VARCHAR(45),
  "mins" INTEGER,
  "secs" INTEGER,
  "minsecs" INTEGER,
  "injury_time" BOOL,
  "start_x" FLOAT,
  "start_y" FLOAT,
  "end_x" FLOAT,
  "end_y" FLOAT,
  CONSTRAINT "game_id"
    FOREIGN KEY("id")
    REFERENCES "games"("id"),
  CONSTRAINT "team_id"
    FOREIGN KEY("id")
    REFERENCES "teams"("id"),
  CONSTRAINT "player_id"
    FOREIGN KEY("id")
    REFERENCES "players"("id"),
  CONSTRAINT "action_type_id"
    FOREIGN KEY("id")
    REFERENCES "action_types"("id")
);
COMMIT;

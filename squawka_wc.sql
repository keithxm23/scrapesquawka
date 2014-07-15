SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teams` (
  `id` INT NOT NULL,
  `long_name` VARCHAR(45) NULL,
  `short_name` VARCHAR(45) NULL,
  `logo` VARCHAR(45) NULL,
  `shirt_url` VARCHAR(45) NULL,
  `team_color` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`venues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`venues` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`players` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `photo` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `weight` INT NULL,
  `height` INT NULL,
  `shirt_num` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gk_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gk_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  `injury_time` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`action_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`action_types` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`goal_attempt_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`goal_attempt_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `start_x` FLOAT NULL,
  `start_y` FLOAT NULL,
  `end_x` FLOAT NULL,
  `end_y` FLOAT NULL,
  `gmouth_y` FLOAT NULL,
  `gmouth_z` FLOAT NULL,
  `shot` TINYINT(1) NULL,
  `swerve` VARCHAR(45) NULL,
  `headed` TINYINT(1) NULL,
  `injury_time` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`detailed_assists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`detailed_assists` (
  `id` INT NOT NULL,
  `start_x` FLOAT NULL,
  `start_y` FLOAT NULL,
  `end_x` FLOAT NULL,
  `end_y` FLOAT NULL,
  `min` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`interception_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`interception_events` (
  `id` INT NOT NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  `headed` TINYINT(1) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `injury_time` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clearance_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clearance_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  `headed` TINYINT(1) NULL,
  `injury_time` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`all_pass_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`all_pass_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `throw_in` TINYINT(1) NULL,
  `start_x` FLOAT NULL,
  `start_y` FLOAT NULL,
  `end_x` FLOAT NULL,
  `end_y` FLOAT NULL,
  `injury_time` TINYINT(1) NULL,
  `assist` TINYINT(1) NULL,
  `headed` TINYINT(1) NULL,
  `long_ball` TINYINT(1) NULL,
  `through_ball` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tackle_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tackle_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cross_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cross_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `start_x` FLOAT NULL,
  `start_y` FLOAT NULL,
  `end_x` FLOAT NULL,
  `end_y` FLOAT NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `injury_time` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`corner_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`corner_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `injury_time` TINYINT(1) NULL,
  `start_x` FLOAT NULL,
  `start_y` FLOAT NULL,
  `end_x` FLOAT NULL,
  `end_y` FLOAT NULL,
  `swerve` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`takeon_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`takeon_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  `injury_time` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`foul_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`foul_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `injury_time` TINYINT(1) NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`card_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`card_events` (
  `id` INT NOT NULL,
  `card` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `injury_time` TINYINT(1) NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`blocked_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`blocked_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `injury_time` TINYINT(1) NULL,
  `x_loc` FLOAT NULL,
  `y_loc` FLOAT NULL,
  `shot` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`balls_out_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`balls_out_events` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `mins` INT NULL,
  `secs` INT NULL,
  `minsecs` INT NULL,
  `injury_time` TINYINT(1) NULL,
  `start_x` FLOAT NULL,
  `start_y` FLOAT NULL,
  `end_x` FLOAT NULL,
  `end_y` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

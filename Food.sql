-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema group_project-schema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `group_project-schema` ;

-- -----------------------------------------------------
-- Schema group_project-schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `group_project-schema` DEFAULT CHARACTER SET utf8 ;
USE `group_project-schema` ;

-- -----------------------------------------------------
-- Table `group_project-schema`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_project-schema`.`users` ;

CREATE TABLE IF NOT EXISTS `group_project-schema`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(300) NULL,
  `createdAt` DATETIME NULL DEFAULT NOW(),
  `updatedAt` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`userName` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_project-schema`.`reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_project-schema`.`reviews` ;

CREATE TABLE IF NOT EXISTS `group_project-schema`.`reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `restaurant` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `dateVisited` DATE NULL,
  `dish` VARCHAR(45) NULL,
  `price` DOUBLE NULL,
  `reviewX` TEXT NULL,
  `rating` INT NULL,
  `reviewscol` INT NULL,
  `createdAt` DATETIME NULL DEFAULT NOW(),
  `updatedAt` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_reviews_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_reviews_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `group_project-schema`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

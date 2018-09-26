-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema taskdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema taskdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taskdb` DEFAULT CHARACTER SET latin1 ;
USE `taskdb` ;

-- -----------------------------------------------------
-- Table `taskdb`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taskdb`.`tasks` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `duedate` DATE NULL DEFAULT NULL,
  `completed` TINYINT(1) NULL DEFAULT '0',
  `trashed` TINYINT(1) NULL DEFAULT '0',
  `priority` INT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `priority_UNIQUE` (`priority` ASC),
  INDEX `DUEDATE` (`duedate` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;

CREATE USER 'utask' IDENTIFIED BY 'ucreator18';

GRANT ALL ON `taskdb`.* TO 'utask';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `taskdb`.* TO 'utask';
FLUSH PRIVILEGES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

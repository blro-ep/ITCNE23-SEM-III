-- MySQL Script generated by MySQL Workbench
-- Mon May 13 19:55:12 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`benutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`benutzer` (
  `id_benutzer` INT NOT NULL,
  `unsername` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `vorname` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_benutzer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`kunden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`kunden` (
  `id_kunden` INT NOT NULL,
  `kundennummer` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `rechnungsadresse` VARCHAR(45) NULL,
  `lieferadresse` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_kunden`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artikel` (
  `id_artikel` INT NOT NULL,
  `artikelnummer` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `gewicht` VARCHAR(45) NULL,
  `Seriennummer` TINYINT NULL,
  PRIMARY KEY (`id_artikel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lieferschein`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lieferschein` (
  `id_lieferschein` INT NOT NULL,
  `ref_benutzer` INT NULL,
  `ref_kunde` INT NULL,
  `lieferscheinnummer` INT NULL,
  `status` VARCHAR(45) NULL,
  `lieferadresse` VARCHAR(45) NULL,
  `bestell_datum` DATETIME NULL,
  `liefer_datum` DATE NULL,
  PRIMARY KEY (`id_lieferschein`),
  INDEX `fk_lieferschein_1_idx` (`ref_benutzer` ASC) VISIBLE,
  INDEX `fk_lieferschein_2_idx` (`ref_kunde` ASC) VISIBLE,
  CONSTRAINT `fk_lieferschein_1`
    FOREIGN KEY (`ref_benutzer`)
    REFERENCES `mydb`.`benutzer` (`id_benutzer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lieferschein_2`
    FOREIGN KEY (`ref_kunde`)
    REFERENCES `mydb`.`kunden` (`id_kunden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`seriennummer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`seriennummer` (
  `id_seriennummer` INT NOT NULL,
  `ref_lieferschein` INT NULL,
  `ref_artikel` INT NULL,
  `status` INT NULL,
  `seriennummer` VARCHAR(45) NULL,
  PRIMARY KEY (`id_seriennummer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`behaelter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`behaelter` (
  `id_behaelter` INT NOT NULL,
  `ref_lieferschein` VARCHAR(45) NULL,
  `ref_artikel` VARCHAR(45) NULL,
  `ref_benutzer` VARCHAR(45) NULL,
  PRIMARY KEY (`id_behaelter`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lieferschein_positionen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lieferschein_positionen` (
  `id_lieferschein_positionen` INT NOT NULL,
  `ref_lieferschein` INT NULL,
  `ref_artikel` INT NULL,
  `ref_seriennummer` INT NULL,
  `ref_behaelter` INT NULL,
  `menge` INT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_lieferschein_positionen`),
  INDEX `fk_lieferschein_positionen_2_idx` (`ref_artikel` ASC) VISIBLE,
  INDEX `fk_lieferschein_positionen_1_idx` (`ref_lieferschein` ASC) VISIBLE,
  INDEX `fk_lieferschein_positionen_3_idx` (`ref_seriennummer` ASC) VISIBLE,
  INDEX `fk_lieferschein_positionen_4_idx` (`ref_behaelter` ASC) VISIBLE,
  CONSTRAINT `fk_lieferschein_positionen_1`
    FOREIGN KEY (`ref_lieferschein`)
    REFERENCES `mydb`.`lieferschein` (`id_lieferschein`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lieferschein_positionen_2`
    FOREIGN KEY (`ref_artikel`)
    REFERENCES `mydb`.`artikel` (`id_artikel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lieferschein_positionen_3`
    FOREIGN KEY (`ref_seriennummer`)
    REFERENCES `mydb`.`seriennummer` (`id_seriennummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lieferschein_positionen_4`
    FOREIGN KEY (`ref_behaelter`)
    REFERENCES `mydb`.`behaelter` (`id_behaelter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`behaleter_positionen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`behaleter_positionen` (
  `id_behaleter_positionen` INT NOT NULL,
  `ref_behaelter` INT NULL,
  `ref_artikel` INT NULL,
  `ref_lieferschein_positionen` INT NULL,
  `ref_benutzer` INT NULL,
  `status` VARCHAR(45) NULL,
  `erstell_datum` DATE NULL,
  `update` VARCHAR(45) NULL,
  PRIMARY KEY (`id_behaleter_positionen`),
  INDEX `fk_behaleter_positionen_1_idx` (`ref_behaelter` ASC) VISIBLE,
  INDEX `fk_behaleter_positionen_2_idx` (`ref_artikel` ASC) VISIBLE,
  INDEX `fk_behaleter_positionen_4_idx` (`ref_lieferschein_positionen` ASC) VISIBLE,
  INDEX `fk_behaleter_positionen_5_idx` (`ref_benutzer` ASC) VISIBLE,
  CONSTRAINT `fk_behaleter_positionen_1`
    FOREIGN KEY (`ref_behaelter`)
    REFERENCES `mydb`.`behaelter` (`id_behaelter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_behaleter_positionen_2`
    FOREIGN KEY (`ref_artikel`)
    REFERENCES `mydb`.`artikel` (`id_artikel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_behaleter_positionen_4`
    FOREIGN KEY (`ref_lieferschein_positionen`)
    REFERENCES `mydb`.`lieferschein_positionen` (`id_lieferschein_positionen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_behaleter_positionen_5`
    FOREIGN KEY (`ref_benutzer`)
    REFERENCES `mydb`.`benutzer` (`id_benutzer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

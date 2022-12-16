-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema krankenhaus
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `krankenhaus` ;

-- -----------------------------------------------------
-- Schema krankenhaus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `krankenhaus` DEFAULT CHARACTER SET utf8 ;
USE `krankenhaus` ;

-- -----------------------------------------------------
-- Table `krankenhaus`.`krankenhaus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`krankenhaus` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`krankenhaus` (
  `idKrankenhaus` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `adresse` VARCHAR(45) NULL DEFAULT NULL,
  `stadt` VARCHAR(45) NULL DEFAULT NULL,
  `plz` INT(11) NULL DEFAULT NULL,
  `E-Mail` VARCHAR(25) NULL DEFAULT NULL,
  `Tel-Nummer` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`idKrankenhaus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`arzt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`arzt` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`arzt` (
  `idarzt` INT(11) NOT NULL,
  `vorname` VARCHAR(25) NULL DEFAULT NULL,
  `nachname` VARCHAR(25) NULL DEFAULT NULL,
  `adresse` VARCHAR(45) NULL DEFAULT NULL,
  `stadt` VARCHAR(20) NULL DEFAULT NULL,
  `plz` INT(11) NULL DEFAULT NULL,
  `E-Mail` VARCHAR(45) NULL DEFAULT NULL,
  `Tel-Nummer` VARCHAR(45) NULL DEFAULT NULL,
  `gehalt` VARCHAR(20) NULL DEFAULT NULL,
  `fachgebiet` VARCHAR(45) NULL DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` INT(11) NOT NULL,
  PRIMARY KEY (`idarzt`, `Krankenhaus_idKrankenhaus`),
  INDEX `fk_arzt_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus` ASC),
  CONSTRAINT `fk_arzt_Krankenhaus1`
    FOREIGN KEY (`Krankenhaus_idKrankenhaus`)
    REFERENCES `krankenhaus`.`krankenhaus` (`idKrankenhaus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`zimmer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`zimmer` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`zimmer` (
  `idzimmer` INT(11) NOT NULL,
  `zimmer_nummer` VARCHAR(45) NULL DEFAULT NULL,
  `zimmer_name` VARCHAR(45) NULL DEFAULT NULL,
  `bettenzahl` VARCHAR(10) NULL DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` INT(11) NOT NULL,
  PRIMARY KEY (`idzimmer`, `Krankenhaus_idKrankenhaus`),
  INDEX `fk_zimmer_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus` ASC),
  CONSTRAINT `fk_zimmer_Krankenhaus1`
    FOREIGN KEY (`Krankenhaus_idKrankenhaus`)
    REFERENCES `krankenhaus`.`krankenhaus` (`idKrankenhaus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`patient` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`patient` (
  `idpatient` INT(11) NOT NULL,
  `vorname` VARCHAR(20) NULL DEFAULT NULL,
  `nachname` VARCHAR(20) NULL DEFAULT NULL,
  `geschlecht` VARCHAR(1) NULL DEFAULT NULL,
  `geburtsdatum` VARCHAR(10) NULL DEFAULT NULL,
  `blutgruppe` VARCHAR(10) NULL DEFAULT NULL,
  `adresse` VARCHAR(45) NULL DEFAULT NULL,
  `stadt` VARCHAR(20) NULL DEFAULT NULL,
  `plz` INT(11) NULL DEFAULT NULL,
  `zimmer_idzimmer` INT(11) NOT NULL,
  PRIMARY KEY (`idpatient`, `zimmer_idzimmer`),
  INDEX `fk_patient_zimmer1_idx` (`zimmer_idzimmer` ASC),
  CONSTRAINT `fk_patient_zimmer1`
    FOREIGN KEY (`zimmer_idzimmer`)
    REFERENCES `krankenhaus`.`zimmer` (`idzimmer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`arzt_has_patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`arzt_has_patient` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`arzt_has_patient` (
  `arzt_idarzt` INT(11) NOT NULL,
  `patient_idpatient` INT(11) NOT NULL,
  PRIMARY KEY (`arzt_idarzt`, `patient_idpatient`),
  INDEX `fk_arzt_has_patient_patient1_idx` (`patient_idpatient` ASC),
  INDEX `fk_arzt_has_patient_arzt1_idx` (`arzt_idarzt` ASC),
  CONSTRAINT `fk_arzt_has_patient_arzt1`
    FOREIGN KEY (`arzt_idarzt`)
    REFERENCES `krankenhaus`.`arzt` (`idarzt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arzt_has_patient_patient1`
    FOREIGN KEY (`patient_idpatient`)
    REFERENCES `krankenhaus`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`fachklinik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`fachklinik` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`fachklinik` (
  `idfachklinik` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` INT(11) NOT NULL,
  PRIMARY KEY (`idfachklinik`, `Krankenhaus_idKrankenhaus`),
  INDEX `fk_fachklinik_Krankenhaus_idx` (`Krankenhaus_idKrankenhaus` ASC),
  CONSTRAINT `fk_fachklinik_Krankenhaus`
    FOREIGN KEY (`Krankenhaus_idKrankenhaus`)
    REFERENCES `krankenhaus`.`krankenhaus` (`idKrankenhaus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`krankenschwester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`krankenschwester` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`krankenschwester` (
  `idkrankenschwester` INT(11) NOT NULL,
  `vorname` VARCHAR(45) NULL DEFAULT NULL,
  `nachname` VARCHAR(45) NULL DEFAULT NULL,
  `adresse` VARCHAR(45) NULL DEFAULT NULL,
  `stadt` VARCHAR(45) NULL DEFAULT NULL,
  `plz` INT(11) NULL DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` INT(11) NOT NULL,
  PRIMARY KEY (`idkrankenschwester`, `Krankenhaus_idKrankenhaus`),
  INDEX `fk_krankenschwester_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus` ASC),
  CONSTRAINT `fk_krankenschwester_Krankenhaus1`
    FOREIGN KEY (`Krankenhaus_idKrankenhaus`)
    REFERENCES `krankenhaus`.`krankenhaus` (`idKrankenhaus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`krankheit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`krankheit` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`krankheit` (
  `idkrankheit` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `symptome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idkrankheit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`krankheit_has_patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`krankheit_has_patient` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`krankheit_has_patient` (
  `krankheit_idkrankheit` INT(11) NOT NULL,
  `patient_idpatient` INT(11) NOT NULL,
  PRIMARY KEY (`krankheit_idkrankheit`, `patient_idpatient`),
  INDEX `fk_krankheit_has_patient_patient1_idx` (`patient_idpatient` ASC),
  INDEX `fk_krankheit_has_patient_krankheit1_idx` (`krankheit_idkrankheit` ASC),
  CONSTRAINT `fk_krankheit_has_patient_krankheit1`
    FOREIGN KEY (`krankheit_idkrankheit`)
    REFERENCES `krankenhaus`.`krankheit` (`idkrankheit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_krankheit_has_patient_patient1`
    FOREIGN KEY (`patient_idpatient`)
    REFERENCES `krankenhaus`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`labor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`labor` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`labor` (
  `idlabor` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `Tel-Nummer` VARCHAR(15) NULL DEFAULT NULL,
  `Krankenhaus_idKrankenhaus` INT(11) NOT NULL,
  PRIMARY KEY (`idlabor`, `Krankenhaus_idKrankenhaus`),
  INDEX `fk_labor_Krankenhaus1_idx` (`Krankenhaus_idKrankenhaus` ASC),
  CONSTRAINT `fk_labor_Krankenhaus1`
    FOREIGN KEY (`Krankenhaus_idKrankenhaus`)
    REFERENCES `krankenhaus`.`krankenhaus` (`idKrankenhaus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`medikamente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`medikamente` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`medikamente` (
  `idmedikamente` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `inhalt` VARCHAR(45) NULL DEFAULT NULL,
  `preis` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idmedikamente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`op`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`op` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`op` (
  `idop` INT(11) NOT NULL,
  `datum` VARCHAR(15) NULL DEFAULT NULL,
  `arzt_idarzt` INT(11) NOT NULL,
  `arzt_Krankenhaus_idKrankenhaus` INT(11) NOT NULL,
  `patient_idpatient` INT(11) NOT NULL,
  PRIMARY KEY (`idop`, `arzt_idarzt`, `arzt_Krankenhaus_idKrankenhaus`, `patient_idpatient`),
  INDEX `fk_op_arzt1_idx` (`arzt_idarzt` ASC, `arzt_Krankenhaus_idKrankenhaus` ASC),
  INDEX `fk_op_patient1_idx` (`patient_idpatient` ASC),
  CONSTRAINT `fk_op_arzt1`
    FOREIGN KEY (`arzt_idarzt` , `arzt_Krankenhaus_idKrankenhaus`)
    REFERENCES `krankenhaus`.`arzt` (`idarzt` , `Krankenhaus_idKrankenhaus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_op_patient1`
    FOREIGN KEY (`patient_idpatient`)
    REFERENCES `krankenhaus`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`termin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`termin` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`termin` (
  `idtermin` INT(11) NOT NULL,
  `datum` VARCHAR(45) NULL DEFAULT NULL,
  `patient_idpatient` INT(11) NOT NULL,
  PRIMARY KEY (`idtermin`, `patient_idpatient`),
  INDEX `fk_termin_patient1_idx` (`patient_idpatient` ASC),
  CONSTRAINT `fk_termin_patient1`
    FOREIGN KEY (`patient_idpatient`)
    REFERENCES `krankenhaus`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`test` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`test` (
  `idtest` INT(11) NOT NULL,
  `typ` VARCHAR(45) NULL DEFAULT NULL,
  `labor_idlabor` INT(11) NOT NULL,
  PRIMARY KEY (`idtest`, `labor_idlabor`),
  INDEX `fk_test_labor1_idx` (`labor_idlabor` ASC),
  CONSTRAINT `fk_test_labor1`
    FOREIGN KEY (`labor_idlabor`)
    REFERENCES `krankenhaus`.`labor` (`idlabor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`zimmer_has_krankenschwester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`zimmer_has_krankenschwester` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`zimmer_has_krankenschwester` (
  `zimmer_idzimmer` INT(11) NOT NULL,
  `krankenschwester_idkrankenschwester` INT(11) NOT NULL,
  PRIMARY KEY (`zimmer_idzimmer`, `krankenschwester_idkrankenschwester`),
  INDEX `fk_zimmer_has_krankenschwester_krankenschwester1_idx` (`krankenschwester_idkrankenschwester` ASC),
  INDEX `fk_zimmer_has_krankenschwester_zimmer1_idx` (`zimmer_idzimmer` ASC),
  CONSTRAINT `fk_zimmer_has_krankenschwester_krankenschwester1`
    FOREIGN KEY (`krankenschwester_idkrankenschwester`)
    REFERENCES `krankenhaus`.`krankenschwester` (`idkrankenschwester`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_zimmer_has_krankenschwester_zimmer1`
    FOREIGN KEY (`zimmer_idzimmer`)
    REFERENCES `krankenhaus`.`zimmer` (`idzimmer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `krankenhaus`.`medikamente_has_patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `krankenhaus`.`medikamente_has_patient` ;

CREATE TABLE IF NOT EXISTS `krankenhaus`.`medikamente_has_patient` (
  `medikamente_idmedikamente` INT(11) NOT NULL,
  `patient_idpatient` INT(11) NOT NULL,
  PRIMARY KEY (`medikamente_idmedikamente`, `patient_idpatient`),
  INDEX `fk_medikamente_has_patient_patient1_idx` (`patient_idpatient` ASC),
  INDEX `fk_medikamente_has_patient_medikamente1_idx` (`medikamente_idmedikamente` ASC),
  CONSTRAINT `fk_medikamente_has_patient_medikamente1`
    FOREIGN KEY (`medikamente_idmedikamente`)
    REFERENCES `krankenhaus`.`medikamente` (`idmedikamente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medikamente_has_patient_patient1`
    FOREIGN KEY (`patient_idpatient`)
    REFERENCES `krankenhaus`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

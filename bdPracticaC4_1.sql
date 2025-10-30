SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `bdPracticaC4_1` DEFAULT CHARACTER SET utf8 ;
USE `bdPracticaC4_1` ;

CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cCalle` (
  `CvCalle` INT NOT NULL AUTO_INCREMENT,
  `DsCalle` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvCalle`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cMunicp` (
  `CvMunicp` INT NOT NULL AUTO_INCREMENT,
  `DsMunicp` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvMunicp`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cColon` (
  `CvColon` INT NOT NULL AUTO_INCREMENT,
  `DsColon` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvColon`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cEstado` (
  `CvEstado` INT NOT NULL AUTO_INCREMENT,
  `DsEstado` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvEstado`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cPais` (
  `CvPais` INT NOT NULL AUTO_INCREMENT,
  `DsPais` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvPais`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`mDirec` (
  `CvDirec` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(15) NOT NULL,
  `CvCalle` INT NOT NULL,
  `CvColon` INT NOT NULL,
  `CvMunic` INT NOT NULL,
  `CvEstado` INT NOT NULL,
  `CvPais` INT NOT NULL,
  `Referencia` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CvDirec`),
  INDEX `CvCalle_idx` (`CvCalle` ASC),
  INDEX `CvColon_idx` (`CvColon` ASC),
  INDEX `CvMunicp_idx` (`CvMunic` ASC),
  INDEX `CvEstado_idx` (`CvEstado` ASC),
  INDEX `CvPais_idx` (`CvPais` ASC),
  CONSTRAINT `CvCalle`
    FOREIGN KEY (`CvCalle`)
    REFERENCES `bdPracticaC4_1`.`cCalle` (`CvCalle`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvColon`
    FOREIGN KEY (`CvColon`)
    REFERENCES `bdPracticaC4_1`.`cColon` (`CvColon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CvMunicp`
    FOREIGN KEY (`CvMunic`)
    REFERENCES `bdPracticaC4_1`.`cMunicp` (`CvMunicp`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvEstado`
    FOREIGN KEY (`CvEstado`)
    REFERENCES `bdPracticaC4_1`.`cEstado` (`CvEstado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvPais`
    FOREIGN KEY (`CvPais`)
    REFERENCES `bdPracticaC4_1`.`cPais` (`CvPais`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cDepto` (
  `CvDepto` INT NOT NULL AUTO_INCREMENT,
  `DsDepto` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`CvDepto`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cMarca` (
  `CvMarca` INT NOT NULL AUTO_INCREMENT,
  `DsMarca` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CvMarca`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cPresent` (
  `CvPresent` INT NOT NULL AUTO_INCREMENT,
  `DsPresent` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvPresent`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`mProduct` (
  `CvProduct` INT NOT NULL AUTO_INCREMENT,
  `Descripc` VARCHAR(150) NOT NULL,
  `CvPresent` INT NOT NULL,
  `CvDepto` INT NOT NULL,
  `CvMarca` INT NOT NULL,
  `Cantidad` DECIMAL(10,2) NOT NULL,
  `PcoCto` DECIMAL(10,2) NOT NULL,
  `PcoVta` DECIMAL(10,2) NOT NULL,
  `PorOfer` DECIMAL(5,2) NOT NULL,
  `Stock` INT NOT NULL,
  `CvProved` INT NOT NULL,
  PRIMARY KEY (`CvProduct`),
  INDEX `CvDepto_idx` (`CvDepto` ASC),
  INDEX `CvMarca_idx` (`CvMarca` ASC),
  INDEX `CvPresent_idx` (`CvPresent` ASC),
  CONSTRAINT `Fk_Product_Depto` 
    FOREIGN KEY (`CvDepto`)
    REFERENCES `bdPracticaC4_1`.`cDepto` (`CvDepto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvMarca`
    FOREIGN KEY (`CvMarca`)
    REFERENCES `bdPracticaC4_1`.`cMarca` (`CvMarca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvPresent`
    FOREIGN KEY (`CvPresent`)
    REFERENCES `bdPracticaC4_1`.`cPresent` (`CvPresent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cApellid` (
  `CvApellid` INT NOT NULL AUTO_INCREMENT,
  `DsApellid` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvApellid`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cTpPerso` (
  `CvTpPerson` INT NOT NULL AUTO_INCREMENT,
  `DsTpPerson` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CvTpPerson`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cAficion` (
  `CvAficion` INT NOT NULL AUTO_INCREMENT,
  `DsAficion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CvAficion`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cGenero` (
  `CvGenero` INT NOT NULL AUTO_INCREMENT,
  `DsGenero` VARCHAR(30) NULL,
  PRIMARY KEY (`CvGenero`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cPuesto` (
  `CvPuesto` INT NOT NULL AUTO_INCREMENT,
  `DsPuesto` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`CvPuesto`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`CGdoAca` (
  `CvGdoAca` INT NOT NULL AUTO_INCREMENT,
  `DsGdoAca` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvGdoAca`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`cNombre` (
  `CvNombre` INT NOT NULL AUTO_INCREMENT,
  `DsNombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CvNombre`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`mDtsPerson` (
  `CvPerson` INT NOT NULL AUTO_INCREMENT,
  `CvNombre` INT NOT NULL,
  `CvApePat` INT NOT NULL,
  `CvApeMat` INT NOT NULL,
  `FecNac` DATE NOT NULL,
  `E_mail` VARCHAR(100) NOT NULL,
  `RedSoc` VARCHAR(100) NOT NULL,
  `Edad` INT NOT NULL,
  `CvGdoAca` INT NOT NULL,
  `Telefono` VARCHAR(20) NOT NULL,
  `CvGenero` INT NOT NULL,
  `CvPuesto` INT NOT NULL,
  `CvDepto` INT NOT NULL,
  `CvAficion` INT NOT NULL,
  `CvDirecc` INT NOT NULL,
  `CvTpPerso` INT NOT NULL,
  PRIMARY KEY (`CvPerson`),
  INDEX `CvApePat_idx` (`CvApePat` ASC, `CvApeMat` ASC),
  INDEX `CvGenero_idx` (`CvGenero` ASC),
  INDEX `CvPuesto_idx` (`CvPuesto` ASC),
  INDEX `CvAficion_idx` (`CvAficion` ASC),
  INDEX `CvDirecc_idx` (`CvDirecc` ASC),
  INDEX `CvTpPerson_idx` (`CvTpPerso` ASC),
  INDEX `CvGdoAca_idx` (`CvGdoAca` ASC),
  INDEX `CvNombre_idx` (`CvNombre` ASC),
  INDEX `CvDepto_idx` (`CvDepto` ASC),
  
  CONSTRAINT `Fk_ApePat`
    FOREIGN KEY (`CvApePat`)
    REFERENCES `bdPracticaC4_1`.`cApellid` (`CvApellid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Fk_ApeMat`
    FOREIGN KEY (`CvApeMat`)
    REFERENCES `bdPracticaC4_1`.`cApellid` (`CvApellid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `CvGenero`
    FOREIGN KEY (`CvGenero`)
    REFERENCES `bdPracticaC4_1`.`cGenero` (`CvGenero`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvPuesto`
    FOREIGN KEY (`CvPuesto`)
    REFERENCES `bdPracticaC4_1`.`cPuesto` (`CvPuesto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvAficion`
    FOREIGN KEY (`CvAficion`)
    REFERENCES `bdPracticaC4_1`.`cAficion` (`CvAficion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvDirecc`
    FOREIGN KEY (`CvDirecc`)
    REFERENCES `bdPracticaC4_1`.`mDirec` (`CvDirec`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvTpPerson`
    FOREIGN KEY (`CvTpPerso`)
    REFERENCES `bdPracticaC4_1`.`cTpPerso` (`CvTpPerson`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvGdoAca`
    FOREIGN KEY (`CvGdoAca`)
    REFERENCES `bdPracticaC4_1`.`CGdoAca` (`CvGdoAca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CvNombre`
    FOREIGN KEY (`CvNombre`)
    REFERENCES `bdPracticaC4_1`.`cNombre` (`CvNombre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Fk_Person_Depto`
    FOREIGN KEY (`CvDepto`)
    REFERENCES `bdPracticaC4_1`.`cDepto` (`CvDepto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bdPracticaC4_1`.`mUsuario` (
  `CvUser` INT NOT NULL AUTO_INCREMENT,
  `CvPerson` INT NOT NULL,
  `Login` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `FecIni` VARCHAR(30) NOT NULL,
  `FecVen` VARCHAR(30) NOT NULL,
  `EdoCta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CvUser`),
  INDEX `CvPerson_idx` (`CvPerson` ASC),
  CONSTRAINT `CvPerson`
    FOREIGN KEY (`CvPerson`)
    REFERENCES `bdPracticaC4_1`.`mDtsPerson` (`CvPerson`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema TP Bases de Datos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TP Bases de Datos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TP Bases de Datos` DEFAULT CHARACTER SET utf8 ;
USE `TP Bases de Datos` ;

-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Contenido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Contenido` (
  `idContenido` INT NOT NULL COMMENT '\n\n',
  `extension` VARCHAR(3) NULL,
  `titulo` VARCHAR(45) NULL,
  `fecha_de_publicacion` DATE NULL,
  PRIMARY KEY (`idContenido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Comentario` (
  `idComentario` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `apodo` VARCHAR(45) NULL,
  `Comentario_idComentario` INT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Comentario1_idx` (`Comentario_idComentario` ASC),
  CONSTRAINT `fk_Comentario_Comentario1`
    FOREIGN KEY (`Comentario_idComentario`)
    REFERENCES `TP Bases de Datos`.`Comentario` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Comentario` (
  `idComentario` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `apodo` VARCHAR(45) NULL,
  `Comentario_idComentario` INT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Comentario1_idx` (`Comentario_idComentario` ASC),
  CONSTRAINT `fk_Comentario_Comentario1`
    FOREIGN KEY (`Comentario_idComentario`)
    REFERENCES `TP Bases de Datos`.`Comentario` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Video` (
  `idVideo` INT NOT NULL,
  `Contenido_idContenido` INT NOT NULL,
  PRIMARY KEY (`idVideo`, `Contenido_idContenido`),
  INDEX `fk_Video_Contenido1_idx` (`Contenido_idContenido` ASC),
  CONSTRAINT `fk_Video_Contenido1`
    FOREIGN KEY (`Contenido_idContenido`)
    REFERENCES `TP Bases de Datos`.`Contenido` (`idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Reproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Reproduccion` (
  `idReproduccion` INT NOT NULL,
  `os_utilizado` VARCHAR(20) NULL,
  `fecha_y_hora_de_inicio` DATETIME NULL,
  `fecha_y_hora_de_fin` DATETIME NULL,
  `Video_idVideo` INT NOT NULL,
  `Video_Contenido_idContenido` INT NOT NULL,
  PRIMARY KEY (`idReproduccion`),
  INDEX `fk_Reproduccion_Video1_idx` (`Video_idVideo` ASC, `Video_Contenido_idContenido` ASC),
  CONSTRAINT `fk_Reproduccion_Video1`
    FOREIGN KEY (`Video_idVideo` , `Video_Contenido_idContenido`)
    REFERENCES `TP Bases de Datos`.`Video` (`idVideo` , `Contenido_idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Reproduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Reproduccion` (
  `idReproduccion` INT NOT NULL,
  `os_utilizado` VARCHAR(20) NULL,
  `fecha_y_hora_de_inicio` DATETIME NULL,
  `fecha_y_hora_de_fin` DATETIME NULL,
  `Video_idVideo` INT NOT NULL,
  `Video_Contenido_idContenido` INT NOT NULL,
  PRIMARY KEY (`idReproduccion`),
  INDEX `fk_Reproduccion_Video1_idx` (`Video_idVideo` ASC, `Video_Contenido_idContenido` ASC),
  CONSTRAINT `fk_Reproduccion_Video1`
    FOREIGN KEY (`Video_idVideo` , `Video_Contenido_idContenido`)
    REFERENCES `TP Bases de Datos`.`Video` (`idVideo` , `Contenido_idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Descargable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Descargable` (
  `idDescargable` INT NOT NULL,
  `Contenido_idContenido` INT NOT NULL,
  PRIMARY KEY (`idDescargable`, `Contenido_idContenido`),
  INDEX `fk_Descargable_Contenido1_idx` (`Contenido_idContenido` ASC),
  CONSTRAINT `fk_Descargable_Contenido1`
    FOREIGN KEY (`Contenido_idContenido`)
    REFERENCES `TP Bases de Datos`.`Contenido` (`idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Encuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Encuesta` (
  `idEncuesta` INT NOT NULL,
  `resumen_positivo` VARCHAR(45) NULL,
  `resumen_negativo` VARCHAR(45) NULL,
  `puntaje` INT(2) NULL,
  PRIMARY KEY (`idEncuesta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Descarga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Descarga` (
  `idDescarga` INT NOT NULL,
  `velocidad_descarga` FLOAT NULL,
  `Descargable_idDescargable` INT NOT NULL,
  `Descargable_Contenido_idContenido` INT NOT NULL,
  `Encuesta_idEncuesta` INT NULL,
  PRIMARY KEY (`idDescarga`),
  INDEX `fk_Descarga_Descargable1_idx` (`Descargable_idDescargable` ASC, `Descargable_Contenido_idContenido` ASC),
  INDEX `fk_Descarga_Encuesta1_idx` (`Encuesta_idEncuesta` ASC),
  CONSTRAINT `fk_Descarga_Descargable1`
    FOREIGN KEY (`Descargable_idDescargable` , `Descargable_Contenido_idContenido`)
    REFERENCES `TP Bases de Datos`.`Descargable` (`idDescargable` , `Contenido_idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Descarga_Encuesta1`
    FOREIGN KEY (`Encuesta_idEncuesta`)
    REFERENCES `TP Bases de Datos`.`Encuesta` (`idEncuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `password` CHAR(25) NULL,
  `fecha_de_nacimiento` DATE NULL,
  `Descarga_idDescarga` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Descarga1_idx` (`Descarga_idDescarga` ASC),
  CONSTRAINT `fk_Usuario_Descarga1`
    FOREIGN KEY (`Descarga_idDescarga`)
    REFERENCES `TP Bases de Datos`.`Descarga` (`idDescarga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Contenido_has_Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Contenido_has_Categoria` (
  `Contenido_idContenido` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`Contenido_idContenido`, `Categoria_idCategoria`),
  INDEX `fk_Contenido_has_Categoria_Categoria1_idx` (`Categoria_idCategoria` ASC),
  INDEX `fk_Contenido_has_Categoria_Contenido_idx` (`Contenido_idContenido` ASC),
  CONSTRAINT `fk_Contenido_has_Categoria_Contenido`
    FOREIGN KEY (`Contenido_idContenido`)
    REFERENCES `TP Bases de Datos`.`Contenido` (`idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contenido_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `TP Bases de Datos`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TP Bases de Datos`.`Contenido_has_Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TP Bases de Datos`.`Contenido_has_Comentario` (
  `Contenido_idContenido` INT NOT NULL,
  `Comentario_idComentario` INT NULL,
  PRIMARY KEY (`Contenido_idContenido`, `Comentario_idComentario`),
  INDEX `fk_Contenido_has_Comentario_Comentario1_idx` (`Comentario_idComentario` ASC),
  INDEX `fk_Contenido_has_Comentario_Contenido1_idx` (`Contenido_idContenido` ASC),
  CONSTRAINT `fk_Contenido_has_Comentario_Contenido1`
    FOREIGN KEY (`Contenido_idContenido`)
    REFERENCES `TP Bases de Datos`.`Contenido` (`idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contenido_has_Comentario_Comentario1`
    FOREIGN KEY (`Comentario_idComentario`)
    REFERENCES `TP Bases de Datos`.`Comentario` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

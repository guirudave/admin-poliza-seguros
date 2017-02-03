-- MySQL Script generated by MySQL Workbench
-- 02/02/17 23:45:08
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aseguradora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aseguradora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aseguradora` DEFAULT CHARACTER SET utf8 ;
USE `aseguradora` ;

-- -----------------------------------------------------
-- Table `aseguradora`.`aseguradora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`aseguradora` (
  `rif` VARCHAR(45) NOT NULL,
  `cuentabancaria` VARCHAR(45) NULL,
  `cedulacuentabancaria` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `telefonolocal` VARCHAR(45) NULL DEFAULT NULL,
  `telefonopersonal` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `estatus` VARCHAR(45) NULL DEFAULT 'INACTIVA',
  `estado` VARCHAR(45) NULL,
  `fechafundacion` VARCHAR(45) NULL,
  PRIMARY KEY (`rif`),
  UNIQUE INDEX `rif_UNIQUE` (`rif` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`corredor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`corredor` (
  `cedula` VARCHAR(45) NOT NULL,
  `nombres` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `fechanacimiento` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `fecharegistro` VARCHAR(45) NULL DEFAULT NULL,
  `estatus` VARCHAR(45) NULL DEFAULT 'INACTIVO',
  `aseguradora_rif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC),
  INDEX `fk_corredor_aseguradora1_idx` (`aseguradora_rif` ASC),
  CONSTRAINT `fk_corredor_aseguradora1`
    FOREIGN KEY (`aseguradora_rif`)
    REFERENCES `aseguradora`.`aseguradora` (`rif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`asegurado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`asegurado` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombres` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `fechanacimiento` DATE NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `estatus` VARCHAR(45) NULL DEFAULT 'SIN ASEGURAR',
  `estado` INT(11) NULL DEFAULT '1',
  `corredor_cedula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC),
  INDEX `fk_asegurado_corredor1_idx` (`corredor_cedula` ASC),
  CONSTRAINT `fk_asegurado_corredor1`
    FOREIGN KEY (`corredor_cedula`)
    REFERENCES `aseguradora`.`corredor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`beneficiario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`beneficiario` (
  `cedula` INT(10) UNSIGNED NOT NULL,
  `nombres` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `fechanacimiento` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL,
  `estatus` VARCHAR(45) NULL DEFAULT 'SIN ASIGNAR',
  `asegurado_cedula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC),
  INDEX `fk_beneficiario_asegurado1_idx` (`asegurado_cedula` ASC),
  CONSTRAINT `fk_beneficiario_asegurado1`
    FOREIGN KEY (`asegurado_cedula`)
    REFERENCES `aseguradora`.`asegurado` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`tipopolizas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`tipopolizas` (
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `costo` VARCHAR(45) NULL DEFAULT NULL,
  `cobertura` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`tiposeguro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`tiposeguro` (
  `codigo` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `id_UNIQUE` (`codigo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`servicio` (
  `codigo` VARCHAR(45) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `fechaadquisicion` DATE NULL DEFAULT NULL,
  `fechavigencia` DATE NULL DEFAULT NULL,
  `fechaculminacion` DATE NULL DEFAULT NULL,
  `beneficios` VARCHAR(45) NULL DEFAULT NULL,
  `monto` VARCHAR(45) NULL DEFAULT NULL,
  `estatus` VARCHAR(45) NULL DEFAULT 'SIN ADQUIRIR',
  `cobertura` VARCHAR(45) NULL DEFAULT 'NACIONAL',
  `observaciones` VARCHAR(100) NULL DEFAULT NULL,
  `tipopolizas_codigo` VARCHAR(45) NOT NULL,
  `tiposeguro_codigo` INT(11) NOT NULL,
  `aseguradora_rif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC),
  INDEX `fk_servicio_tipopolizas1_idx` (`tipopolizas_codigo` ASC),
  INDEX `fk_servicio_tiposeguro1_idx` (`tiposeguro_codigo` ASC),
  INDEX `fk_servicio_aseguradora1_idx` (`aseguradora_rif` ASC),
  CONSTRAINT `fk_servicio_tipopolizas1`
    FOREIGN KEY (`tipopolizas_codigo`)
    REFERENCES `aseguradora`.`tipopolizas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_tiposeguro1`
    FOREIGN KEY (`tiposeguro_codigo`)
    REFERENCES `aseguradora`.`tiposeguro` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_aseguradora1`
    FOREIGN KEY (`aseguradora_rif`)
    REFERENCES `aseguradora`.`aseguradora` (`rif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`factura` (
  `codigo` VARCHAR(45) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `montototal` VARCHAR(45) NULL DEFAULT NULL,
  `montocancelado` VARCHAR(45) NULL DEFAULT NULL,
  `estatus` VARCHAR(45) NULL DEFAULT 'SIN CANCELAR',
  `observaciones` VARCHAR(100) NULL DEFAULT NULL,
  `servicio_codigo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC),
  INDEX `fk_factura_servicio1_idx` (`servicio_codigo` ASC),
  CONSTRAINT `fk_factura_servicio1`
    FOREIGN KEY (`servicio_codigo`)
    REFERENCES `aseguradora`.`servicio` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`gastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`gastos` (
  `codigo` VARCHAR(45) NOT NULL,
  `monto` VARCHAR(45) NULL DEFAULT NULL,
  `reembolso` VARCHAR(45) NULL DEFAULT NULL,
  `asegurado_cedula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC),
  INDEX `fk_gastos_asegurado1_idx` (`asegurado_cedula` ASC),
  CONSTRAINT `fk_gastos_asegurado1`
    FOREIGN KEY (`asegurado_cedula`)
    REFERENCES `aseguradora`.`asegurado` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`pagos_de_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`pagos_de_servicios` (
  `factura_codigo` VARCHAR(45) NOT NULL,
  `servicio_codigo` VARCHAR(45) NOT NULL,
  `asegurado_cedula` VARCHAR(10) NOT NULL,
  INDEX `fk_pagos_de_servicios_factura1_idx` (`factura_codigo` ASC),
  INDEX `fk_pagos_de_servicios_servicio1_idx` (`servicio_codigo` ASC),
  INDEX `fk_pagos_de_servicios_asegurado1_idx` (`asegurado_cedula` ASC),
  CONSTRAINT `fk_pagos_de_servicios_factura1`
    FOREIGN KEY (`factura_codigo`)
    REFERENCES `aseguradora`.`factura` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_de_servicios_servicio1`
    FOREIGN KEY (`servicio_codigo`)
    REFERENCES `aseguradora`.`servicio` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_de_servicios_asegurado1`
    FOREIGN KEY (`asegurado_cedula`)
    REFERENCES `aseguradora`.`asegurado` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`polizas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`polizas` (
  `tipopolizas_codigo` VARCHAR(45) NOT NULL,
  `corredor_cedula` VARCHAR(45) NOT NULL,
  `asegurado_cedula` VARCHAR(10) NOT NULL,
  INDEX `fk_polizas_tipopolizas1_idx` (`tipopolizas_codigo` ASC),
  INDEX `fk_polizas_corredor1_idx` (`corredor_cedula` ASC),
  INDEX `fk_polizas_asegurado1_idx` (`asegurado_cedula` ASC),
  CONSTRAINT `fk_polizas_tipopolizas1`
    FOREIGN KEY (`tipopolizas_codigo`)
    REFERENCES `aseguradora`.`tipopolizas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_polizas_corredor1`
    FOREIGN KEY (`corredor_cedula`)
    REFERENCES `aseguradora`.`corredor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_polizas_asegurado1`
    FOREIGN KEY (`asegurado_cedula`)
    REFERENCES `aseguradora`.`asegurado` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`reembolsos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`reembolsos` (
  `monto` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` VARCHAR(45) NULL DEFAULT NULL,
  `gastos_codigo` VARCHAR(45) NOT NULL,
  `asegurado_cedula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`gastos_codigo`),
  INDEX `fk_reembolsos_gastos1_idx` (`gastos_codigo` ASC),
  INDEX `fk_reembolsos_asegurado1_idx` (`asegurado_cedula` ASC),
  CONSTRAINT `fk_reembolsos_gastos1`
    FOREIGN KEY (`gastos_codigo`)
    REFERENCES `aseguradora`.`gastos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reembolsos_asegurado1`
    FOREIGN KEY (`asegurado_cedula`)
    REFERENCES `aseguradora`.`asegurado` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aseguradora`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseguradora`.`usuarios` (
  `ID` INT(5) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `apellido` VARCHAR(20) NOT NULL,
  `correo` VARCHAR(20) NOT NULL,
  `telefono` VARCHAR(12) NOT NULL,
  `direccion` VARCHAR(20) NOT NULL,
  `password` CHAR(128) NOT NULL,
  `salt` CHAR(28) NOT NULL,
  `cedula` INT(10) NOT NULL,
  `nivel` INT(1) NOT NULL,
  `cookie` INT(10) NOT NULL,
  `logueado` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Salespersons` (
  `staffID` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customers` (
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `zip` INT(11) NULL DEFAULT NULL,
  `customer_number_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_ID` INT(11) NOT NULL,
  PRIMARY KEY (`customer_number_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoices` (
  `invoiceID` INT(11) NOT NULL,
  `date` TIME NULL DEFAULT NULL,
  `carID` VARCHAR(45) NULL DEFAULT NULL,
  `customerID` VARCHAR(45) NULL DEFAULT NULL,
  `salesperonsID` VARCHAR(45) NULL DEFAULT NULL,
  `Cars_VIN` INT(11) NOT NULL,
  `Customer_customerID` INT(11) NOT NULL,
  `Salespersons_staffID` INT(11) NOT NULL,
  `Cars_VIN1` VARCHAR(45) NOT NULL,
  `Salespersons_staffID1` INT(11) NOT NULL,
  `Customers_customer_number_ID` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`invoiceID`, `Cars_VIN`, `Customer_customerID`, `Salespersons_staffID`, `Cars_VIN1`, `Salespersons_staffID1`, `Customers_customer_number_ID`),
  INDEX `fk_Invoices_Cars1_idx` (`Cars_VIN` ASC) VISIBLE,
  INDEX `fk_Invoices_Customer1_idx` (`Customer_customerID` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_staffID` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons2_idx` (`Salespersons_staffID1` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers_customer_number_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `lab_mysql`.`cars` (`VIN`),
  CONSTRAINT `fk_Invoices_Customer1`
    FOREIGN KEY (`Customer_customerID`)
    REFERENCES `lab_mysql`.`customer` (`customerID`),
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_staffID`)
    REFERENCES `lab_mysql`.`salespersons` (`staffID`),
  CONSTRAINT `fk_Invoices_Salespersons2`
    FOREIGN KEY (`Salespersons_staffID1`)
    REFERENCES `lab_mysql`.`Salespersons` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_customer_number_ID`)
    REFERENCES `lab_mysql`.`Customers` (`customer_number_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Cars` (
  `VIN` VARCHAR(45) NOT NULL COMMENT 'THIS IS THE INSCRIPTION ON THE CHASIS CAR',
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `year` INT(11) NULL DEFAULT NULL COMMENT 'YEAR OF REGISTRATION OF THE CAR\\n',
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `Invoices_invoiceID` INT(11) NOT NULL,
  `Invoices_Cars_VIN` INT(11) NOT NULL,
  `Invoices_Customer_customerID` INT(11) NOT NULL,
  `Invoices_Salespersons_staffID` INT(11) NOT NULL,
  `Invoices_Cars_VIN1` VARCHAR(45) NOT NULL,
  `Invoices_Salespersons_staffID1` INT(11) NOT NULL,
  `Invoices_Customers_customer_number_ID` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`VIN`, `Invoices_invoiceID`, `Invoices_Cars_VIN`, `Invoices_Customer_customerID`, `Invoices_Salespersons_staffID`, `Invoices_Cars_VIN1`, `Invoices_Salespersons_staffID1`, `Invoices_Customers_customer_number_ID`),
  INDEX `Cars_VIN` (`VIN` ASC) VISIBLE,
  INDEX `fk_Cars_Invoices1_idx` (`Invoices_invoiceID` ASC, `Invoices_Cars_VIN` ASC, `Invoices_Customer_customerID` ASC, `Invoices_Salespersons_staffID` ASC, `Invoices_Cars_VIN1` ASC, `Invoices_Salespersons_staffID1` ASC, `Invoices_Customers_customer_number_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_Invoices1`
    FOREIGN KEY (`Invoices_invoiceID` , `Invoices_Cars_VIN` , `Invoices_Customer_customerID` , `Invoices_Salespersons_staffID` , `Invoices_Cars_VIN1` , `Invoices_Salespersons_staffID1` , `Invoices_Customers_customer_number_ID`)
    REFERENCES `lab_mysql`.`Invoices` (`invoiceID` , `Cars_VIN` , `Customer_customerID` , `Salespersons_staffID` , `Cars_VIN1` , `Salespersons_staffID1` , `Customers_customer_number_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `lab_mysql` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
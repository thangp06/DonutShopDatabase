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
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NULL,
  `TotalAmount` INT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Customers_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NULL,
  `Price` DECIMAL(60) NULL,
  `Category` VARCHAR(45) NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProductOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProductOrder` (
  `ProductID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`ProductID`, `OrderID`),
  INDEX `fk_Products_has_Orders_Orders1_idx` (`OrderID` ASC) VISIBLE,
  INDEX `fk_Products_has_Orders_Products1_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `fk_Products_has_Orders_Products1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mydb`.`Products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_Orders_Orders1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO Customers (CustomerID, FirstName, LastName, PhoneNumber)
VALUES
(1, 'John', 'Smith', '555-111-2222'),
(2, 'Maria', 'Garcia', '555-222-3333'),
(3, 'James', 'Brown', '555-333-4444'),
(4, 'Emily', 'Davis', '555-444-5555'),
(5, 'Michael', 'Wilson', '555-555-6666');

INSERT INTO Products (ProductID, ProductName, Price, Category)
VALUES
(1, 'Glazed Donut', 2.00, 'Donut'),
(2, 'Chocolate Donut', 2.50, 'Donut'),
(3, 'Coffee', 3.00, 'Drink'),
(4, 'Iced Coffee', 4.00, 'Drink'),
(5, 'Bagel', 3.50, 'Breakfast');

INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID)
VALUES
(1, '2026-04-01', 7, 1),
(2, '2026-04-02', 5, 2),
(3, '2026-04-03', 10, 3),
(4, '2026-04-04', 8, 4),
(5, '2026-04-05', 12, 5);

INSERT INTO ProductOrder (ProductID, OrderID, Quantity)
VALUES
(1, 1, 2),
(3, 1, 1),
(2, 2, 2),
(4, 3, 2),
(5, 4, 1),
(1, 5, 3);

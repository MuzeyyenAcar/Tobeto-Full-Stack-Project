CREATE TABLE IF NOT EXISTS `depo`.`employee` (
  `id` BINARY(16) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `surname` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `rol` VARCHAR(30) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_email` (`email` ASC) VISIBLE
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `depo`.`shelf` (
  `id` INT NOT NULL,
  `totalcapacity` INT NOT NULL,
  `occupiedquantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id`) VISIBLE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `depo`.`product` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `quantity` INT NOT NULL,
  `shelf_id` INT, -- eklenen FOREIGN KEY sütunu
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id`) VISIBLE,
  CONSTRAINT `fk_shelf_id`
    FOREIGN KEY (`shelf_id`)
    REFERENCES `depo`.`shelf` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `depo`.`productinout` (
  `operation` INT NOT NULL,
  `quantity` INT NOT NULL,
  `operationtype` TINYINT NOT NULL,
  `date` DATETIME NOT NULL,
  `product_id` INT, -- eklenen FOREIGN KEY sütunu
  `employee_id` BINARY(16), -- eklenen FOREIGN KEY sütunu
  PRIMARY KEY (`operation`),
  CONSTRAINT `fk_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `depo`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `depo`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
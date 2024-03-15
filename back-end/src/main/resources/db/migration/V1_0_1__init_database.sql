CREATE TABLE IF NOT EXISTS `depo`.`cpu` (
  `id` INT NOT NULL,
  `brand` VARCHAR(50) NOT NULL,
  `clock_speed` INT NOT NULL, -- Örnek olarak, saat hızı gibi sayısal bir değer kullanılıyorsa DECIMAL tipi kullanılabilir.
  `socket_type` VARCHAR(50) NOT NULL,
  `generation` VARCHAR(50) NOT NULL,
  `series` VARCHAR(50) NOT NULL,
  `core_count` INT NOT NULL, -- Örnek olarak, çekirdek sayısı gibi tam sayı değerler için INT tipi kullanılabilir.
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `brand_UNIQUE` (`brand` ASC) VISIBLE, -- Marka sütunu için UNIQUE INDEX eklendi.
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `depo`.`motherboard` (
  `id` INT NOT NULL,
  `cpu_socket_type` VARCHAR(50) NOT NULL,
  `cpu_compatibility` BOOLEAN NOT NULL, -- Örnek olarak, uyumluluk durumu gibi doğru/yanlış değerler için BOOLEAN tipi kullanılabilir.
  `ram_type` VARCHAR(50) NOT NULL,
  `size` VARCHAR(50) NOT NULL,
  `ram_slots` INT NOT NULL, -- Örnek olarak, RAM slot sayısı gibi tam sayı değerler için INT tipi kullanılabilir.
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `brand_UNIQUE` (`brand` ASC) VISIBLE, -- Marka sütunu için UNIQUE INDEX eklendi.
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `depo`.`psu` (
  `id` INT NOT NULL,
  `watt` INT NOT NULL,
  `efficiency` VARCHAR(50) NOT NULL,
  `modular` BOOLEAN NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `pcie_gen_5_support` BOOLEAN NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `brand_UNIQUE` (`brand` ASC) VISIBLE, -- Marka sütunu için UNIQUE INDEX eklendi.
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `depo`.`cpu_cooler` (
  `id` INT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `fan_length` INT NOT NULL,
  `rpm` INT NOT NULL,
  `material` VARCHAR(50) NOT NULL,
  `led` VARCHAR(50) NOT NULL,
  `brand` VARCHAR(50) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `brand_UNIQUE` (`brand` ASC) VISIBLE, -- Marka sütunu için UNIQUE INDEX eklendi.
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `depo`.`ram` (
  `id` INT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `capacity` INT NOT NULL,
  `frequency_speed` INT NOT NULL,
  `channel_type` VARCHAR(50) NOT NULL,
  `compatibility` VARCHAR(50) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `brand_UNIQUE` (`brand` ASC) VISIBLE, -- Marka sütunu için UNIQUE INDEX eklendi.
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `depo`.`gpu` (
  `id` INT NOT NULL,
  `brand` VARCHAR(50) NOT NULL,
  `producer` VARCHAR(50) NOT NULL,
  `series` VARCHAR(50) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `vram` INT NOT NULL,
  `memory_interface` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `brand_UNIQUE` (`brand` ASC) VISIBLE -- Marka sütunu için UNIQUE INDEX eklendi.
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `depo`.`shelf` (
  `id` INT NOT NULL,
  `occupied_quantity` INT NOT NULL,
  `stock_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `stock_id_UNIQUE` (`stock_id` ASC)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `depo`.`stock` (
  `id` INT NOT NULL,
  `type` VARCHAR(40) NOT NULL,
  `quantity` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_shelf_id`
    FOREIGN KEY (`type_id`)
    REFERENCES `depo`.`shelf` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `depo`.`employee` (
  `id` BINARY(16) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC)
) ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `depo`.`cpu` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `clock_speed` INT NOT NULL,
  `socket_type` VARCHAR(50) NOT NULL,
  `generation` VARCHAR(50) NOT NULL,
  `series` VARCHAR(50) NOT NULL,
  `core_count` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `depo`.`gpu` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `producer` VARCHAR(50) NOT NULL,
  `series` VARCHAR(50) NOT NULL,
  `model` VARCHAR(50) NOT NULL,
  `vram` INT NOT NULL,
  `memory_interface` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `depo`.`case` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `psu` TINYINT NOT NULL,
  `psu_location` VARCHAR(50) NOT NULL,
  `transparent` TINYINT NOT NULL,
  `psu_watt` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `depo`.`psu` (
  `id` INT NOT NULL,
  `watt` INT NOT NULL,
  `efficiency` VARCHAR(50) NOT NULL,
  `modular` TINYINT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `pcie_gen_5_support` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `depo`.`motherboard` (
  `id` INT NOT NULL,
  `cpu_socket_type` VARCHAR(50) NOT NULL,
  `cpu_compatibility` TINYINT NOT NULL,
  `ram_type` VARCHAR(50) NOT NULL,
  `size` VARCHAR(50) NOT NULL,
  `ram_slots` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `depo`.`ram` (
  `id` INT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `capacity` INT NOT NULL,
  `frequency_speed` INT NOT NULL,
  `channel_type` VARCHAR(50) NOT NULL,
  `compatibility` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `depo`.`cooler` (
  `id` INT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `fan_length` INT NOT NULL,
  `rpm` INT NOT NULL,
  `material` VARCHAR(50) NOT NULL,
  `led` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
) ENGINE = InnoDB;
#Borrar Base de datos
DROP DATABASE C5_AutoTech;
#Crear base de datos
 CREATE DATABASE C5_AutoTech;
 USE C5_AutoTech;


#EMPLOYEES ✅
CREATE TABLE employees (
		 `id` INT(11) NOT NULL AUTO_INCREMENT, 
		`name` VARCHAR(100),
        `lastname`VARCHAR(100),
		`email` VARCHAR(50) NOT NULL,
        `role` VARCHAR(10) NOT NULL,
        `user` VARCHAR(10) NOT NULL,
        `password` VARCHAR(10)NOT NULL,
		PRIMARY KEY (`id`))
ENGINE=InnoDB;

#UNIT_STAGE_STATUS - relacionar estado ✅
CREATE TABLE unit_stage_status (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
		`status` VARCHAR(50) NOT NULL,
		`vehicle_stage_id` INT(11) NOT NULL,
        `units_id` INT(11) NOT NULL,
        `employee_id` INT(11) NOT NULL,
        PRIMARY KEY(`id`),
        FOREIGN KEY (`employee_id`) REFERENCES employees(`id`), 
        FOREIGN KEY (`vehicle_stage_id`) REFERENCES vehicle_stage(`id`),
        FOREIGN KEY (`units_id`) REFERENCES units(`id`)
        
)
ENGINE=InnoDB;

#UNITS ✅
CREATE TABLE `units` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `niv` VARCHAR(50) NOT NULL,
        `status` VARCHAR(20) NOT NULL,
        `date_production` VARCHAR(20)NOT NULL,
        PRIMARY KEY(`id`)
)ENGINE = InnoDB;

#PRODUCTION_ORDER_UNITS - Relacionar [Production_order] - [Units] ✅
CREATE TABLE `production_order_units` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `production_order_id` INT(11)NOT NULL,
        `units_id` INT(11)NOT NULL,
        PRIMARY KEY(`id`),
        FOREIGN KEY (`production_order_id`) REFERENCES production_order(`id`),
        FOREIGN KEY (`units_id`) REFERENCES units(`id`)
)ENGINE = InnoDB;


#PRODUCTION_ORDER ✅
CREATE TABLE `production_order` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `quantity_produce` INT(10) NOT NULL,
        `deadline` INT(10) NOT NULL,
        `special_instruccions` VARCHAR(10)NOT NULL,
        `vehicle_specifications_id` INT(11) NOT NULL,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`vehicle_specifications_id`) REFERENCES vehicle_specifications(`id`)
) ENGINE = InnoDB;

#VEHICLE_SPECIFICATIONS = [modelos] ✅
CREATE TABLE `vehicle_specifications` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `model` VARCHAR(50) NOT NULL,
		`engine` VARCHAR(50) NOT NULL, # [gasolina,diesel, electrico, hibrido]
		`transmission` VARCHAR(50) NOT NULL, # [manual, automatica,CVT]
        `dimensions` VARCHAR(50) NOT NULL, # [Longitud, ancho, altura, distancia entre ejes]
        `passenger_capacity` VARCHAR (50) NOT NULL, #  [Capacidad de pasajeros]
        `performance` VARCHAR (50) NOT NULL, # [Consumo de combusitble(litros por cada 100 kilometros)]
        `suspension` VARCHAR (50) NOT NULL, #  [Tipo de suspension delantera y trasera]
        `breaks` VARCHAR (50) NOT NULL, #  [Tipo de frenos = [ABS ,EBD ,BA] ]
        `equipment` VARCHAR (50) NOT NULL, # [caracteristicasz de interior]
        `security` VARCHAR(50) NOT NULL, # [airbags, ESC(control electronico de estabilidad), TPMS(sistema de monitoreo de presion de neumaticos),  ADAS(sistema de asistencia al conductor)]
        `technology` VARCHAR(50) NOT NULL, # [infoentretenimiento, bluetooh, asistente de voz, camaras de vision trasera]
		PRIMARY KEY (`id`)
        ) ENGINE = InnoDB;


#VEHICLE_STAGES - [Especifications = [stages]] ✅
CREATE TABLE `vehicle_stage` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `vehicle_especifactions_id` INT(11),
        `stages_id` INT(11) NOT NULL,
        PRIMARY KEY (`id`),
        FOREIGN KEY(`vehicle_especifactions_id`) REFERENCES vehicle_specifications(`id`),
        FOREIGN KEY(`stages_id`) REFERENCES stages(`id`)
) ENGINE = InnoDB;

#STAGES - [Protocolos de procesos a realizar a vehicles escpeicification] ✅
CREATE TABLE `stages` (
		`id` INT(11) NOT NULL AUTO_INCREMENT, # [identificacion ]
        `description` VARCHAR (50) NOT NULL, # [Descripcion]
        `instrucctions` VARCHAR (50) NOT NULL, # [instrucciones de la etapa]
        `estimated_time` VARCHAR(50) NOT NULL, # [Tiempo estimado]
        `quality_control` VARCHAR(50)NOT NULL, # [control de calidad]
        PRIMARY KEY(`id`)
) ENGINE = InnoDB;

#STAGE_ITEMS - relacionar estado ✅
CREATE TABLE `stage_items` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `amount` INT(11) NOT NULL,
        `status` VARCHAR(50) NOT NULL,
        `stages_id` INT (11) NOT NULL, # [Requisitos - Items del inventario]
        `items_inventory_id` INT(11),
        PRIMARY KEY(`id`),
        FOREIGN KEY(`stages_id`) REFERENCES stages(`id`),
		FOREIGN KEY(`items_inventory_id`) REFERENCES items_invetory(`id`)
) ENGINE = InnoDB;

#items_INVENTORY ✅
CREATE TABLE `items_invetory` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `amount` INT(11),
        `value` INT(11),
        `location_physical` VARCHAR (50),
        `acquisition_date` VARCHAR(50),
        `description` VARCHAR(100),
        `state` VARCHAR(50),
        `suppliers_id` int(50), 
        PRIMARY KEY(`id`),
        FOREIGN KEY(`suppliers_id`) REFERENCES suppliers(`id`)
) ENGINE = InnoDB;

#SUPPLIERS ✅
CREATE TABLE `suppliers` (
		`id` INT(11) NOT NULL AUTO_INCREMENT,
        `name_company` VARCHAR(50),
        `address` VARCHAR(50),
        `phone_number` VARCHAR(50),
        `supplier_name` VARCHAR(50),
        `nif` VARCHAR (50),
        `financial_information` VARCHAR(50),
        PRIMARY KEY(`id`)
) ENGINE = InnoDB;
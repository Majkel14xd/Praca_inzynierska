DROP TABLE water_sensor;
DROP TABLE rain_gaugae;
DROP TABLE rain_sensor;

DROP DATABASE rain_measurement_system;
CREATE DATABASE rain_measurement_system;
 CREATE TABLE IF NOT EXISTS rain_measurement_system.water_sensor(
`ID` INT NOT NULL AUTO_INCREMENT, 
`Data_odczytu` DATE NOT NULL, 
`Godzina_odczytu` TIME NOT NULL,
`Wartosc` INT NOT NULL, 
`Wartosc_tekstowa` VARCHAR(255) NOT NULL, 
`Alert` VARCHAR(255) NOT NULL, 
PRIMARY KEY(`ID`)
)
ENGINE = InnoDB;

 CREATE TABLE IF NOT EXISTS rain_measurement_system.rain_gaugae (
`ID` INT NOT NULL AUTO_INCREMENT , 
`Data_odczytu` DATE NOT NULL , 
`Godzina_odczytu` TIME NOT NULL,
`Wartosc` INT NOT NULL ,
 PRIMARY KEY (`ID`)
 ) 
 ENGINE = InnoDB;

 CREATE TABLE IF NOT EXISTS rain_measurement_system.rain_sensor (
`ID` INT NOT NULL AUTO_INCREMENT , 
`Data_odczytu` DATE NOT NULL , 
`Godzina_odczytu` TIME NOT NULL,
`Wartosc` INT NOT NULL , 
`Wartosc_tesktowa` VARCHAR(255) NOT NULL , 
PRIMARY KEY (`ID`)
) 
ENGINE = InnoDB;

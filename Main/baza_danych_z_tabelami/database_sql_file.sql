-- Active: 1693519773037@@192.168.100.12@3306@rain_measurement_system
DROP TABLE water_sensor;
DROP TABLE rain_gaugae;
DROP TABLE rain_sensor;
Drop TABLE logs;

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
`Wartosc_tekstowa` VARCHAR(255) NOT NULL , 
PRIMARY KEY (`ID`)
) 
ENGINE = InnoDB;

CREATE TABLE rain_measurement_system.logs (
`ID` INT NOT NULL AUTO_INCREMENT , 
`Data_zdarzenia` DATE NOT NULL , 
`Godzina_zdarzenia` TIME NOT NULL ,
`Opis_zdarzenia` VARCHAR(255) NOT NULL , 
PRIMARY KEY (`ID`)
) 
ENGINE = InnoDB;

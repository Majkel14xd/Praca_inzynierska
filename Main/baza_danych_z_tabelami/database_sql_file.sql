-- Active: 1697808530746@@192.168.0.170@3306@rain_measurement_system
DROP TABLE water_sensor;
DROP TABLE rain_gaugae;
DROP TABLE rain_sensor;
DROP TABLE device_info;
DROP TABLE logs;

DELETE FROM water_sensor;
DELETE FROM  rain_gaugae;
DELETE FROM  rain_sensor;
DELETE FROM  device_info;
DELETE FROM  logs;


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


CREATE TABLE rain_measurement_system.device_info
(`ID` INT NOT NULL AUTO_INCREMENT , 
`Device_mac_address` VARCHAR(17) NOT NULL ,
`Network_ssid` VARCHAR(30) NOT NULL ,
`Network_ip` VARCHAR(30) NOT NULL , 
`Database_name` VARCHAR(50) NOT NULL , 
`Database_ip` VARCHAR(30) NOT NULL , 
`Database_port` INT(10) NOT NULL , 
`Database_user_name` VARCHAR(50) NOT NULL ,
`Data_aktualizacji` DATE NOT NULL , 
`Czas_aktualizacji` TIME NOT NULL ,
PRIMARY KEY (`ID`)
) ENGINE = InnoDB;
@echo off

REM Set MySQL connection parameters
set MYSQL_HOST=192.168.100.12
set MYSQL_PORT=3306
set MYSQL_USER=Majkel14xd
set MYSQL_PASSWORD=zaq1@WSX

REM Set database name
set DATABASE_NAME=rain_measurement_system

REM Set the path to the mysql executable
set MYSQL_EXECUTABLE=C:\xampp\mysql\bin\mysql.exe

REM Create the database
%MYSQL_EXECUTABLE% -h %MYSQL_HOST% -P %MYSQL_PORT% -u %MYSQL_USER% -p%MYSQL_PASSWORD% -e "CREATE DATABASE IF NOT EXISTS %DATABASE_NAME%;"

REM Switch to the database
%MYSQL_EXECUTABLE% -h %MYSQL_HOST% -P %MYSQL_PORT% -u %MYSQL_USER% -p%MYSQL_PASSWORD% -e "USE %DATABASE_NAME%;"

REM Create water_sensor table
%MYSQL_EXECUTABLE% -h %MYSQL_HOST% -P %MYSQL_PORT% -u %MYSQL_USER% -p%MYSQL_PASSWORD% -D %DATABASE_NAME% -e "CREATE TABLE IF NOT EXISTS `water_sensor` (`ID` INT NOT NULL AUTO_INCREMENT,`Data_odczytu` DATE NOT NULL,`Wartosc` INT NOT NULL,`Wartosc_tekstowa` VARCHAR(255) NOT NULL,`Alert` VARCHAR(255) NOT NULL,PRIMARY KEY (`ID`)) ENGINE = InnoDB;"

REM Create rain_gauge table
%MYSQL_EXECUTABLE% -h %MYSQL_HOST% -P %MYSQL_PORT% -u %MYSQL_USER% -p%MYSQL_PASSWORD% -D %DATABASE_NAME% -e "CREATE TABLE IF NOT EXISTS `rain_gauge` (`ID` INT NOT NULL AUTO_INCREMENT,`Data_odczytu` DATE NOT NULL,`Wartosc` INT NOT NULL,PRIMARY KEY (`ID`)) ENGINE = InnoDB;"

REM Create rain_sensor table
%MYSQL_EXECUTABLE% -h %MYSQL_HOST% -P %MYSQL_PORT% -u %MYSQL_USER% -p%MYSQL_PASSWORD% -D %DATABASE_NAME% -e "CREATE TABLE IF NOT EXISTS `rain_sensor` (`ID` INT NOT NULL AUTO_INCREMENT,`Data_odczytu` DATE NOT NULL,`Wartosc` INT NOT NULL,`Wartosc_tesktowa` VARCHAR(255) NOT NULL,PRIMARY KEY (`ID`)) ENGINE = InnoDB;"

REM Confirm completion
echo Database and tables created successfully.
pause
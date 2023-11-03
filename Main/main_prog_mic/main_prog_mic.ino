/*Macros*/
#define WATER_SENSOR_PIN_DIGITAL 13
#define RAIN_SENSOR_PIN_DIGITAL 4
#define ECHO_PIN_ULTR_SONIC_SENSOR 5
#define TRIG_PIN_ULTR_SONIC_SENSOR 18
#define WATER_SENSOR_ANALOG_PIN 35
#define RAIN_SENSOR_ANALOG_PIN 34
#define BLYNK_TEMPLATE_ID "TMPL4pChBbFWL"
#define BLYNK_TEMPLATE_NAME "measurementrainsystem"
#define BLYNK_PRINT Serial
#define WATER_SENSOR_POWER_ON_OFF V0
#define RAIN_SENSOR_POWER_ON_OFF V1
#define WATER_SENSOR_VALUE V4
#define WATER_SENSOR_TEXT_VALUE V5
#define RAIN_SENSOR_VALUE V6
#define RAIN_SENSOR_TEXT_VALUE V7
#define RAIN_GAUGE_VALUE V8
#define WATER_NOTIFICATION V9
#define MYSQL_DEBUG_PORT Serial
#define _MYSQL_LOGLEVEL_ 1
#define SMTP_server "smtp.gmail.com"
#define SMTP_Port 587
#define sender_email "majkel114xdd@gmail.com"

/*Includes*/
#include "passwords_keys.h"
#include <BlynkSimpleEsp32.h>
#include <MySQL_Generic.h>
#include <NTPClient.h>
#include <NewPing.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WiFiUdp.h>
#include <ESP_Mail_Client.h>

/*Variables*/
byte mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
char ssid[] = "NETIASPOT-2.4GHz-8Ps7";
char pass[] = "tw6eUEH8";
char userdatabse[] = "Majkel14xd";
char database[] = "rain_measurement_system";
char table_water_sensor[] = "water_sensor";
char table_rain_gaugae[] = "rain_gaugae";
char table_rain_sensor[] = "rain_sensor";
char table_logs[] = "logs";
char table_device_info[] = "device_info";
int status_rain_sensor_pin_virtual = 1;
int status_water_sensor_pin_virtual = 1;
uint16_t server_port = 3306;

/*Objects*/
BlynkTimer timer;
IPAddress serverIP(192, 168, 100, 12);
NewPing sonar(TRIG_PIN_ULTR_SONIC_SENSOR, ECHO_PIN_ULTR_SONIC_SENSOR);
MySQL_Connection conn((Client *)&client);
MySQL_Query *query_mem;
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP);
ESP_Mail_Session session;
SMTP_Message message;
SMTPSession smtp;
/*Blynk Functions*/
BLYNK_CONNECTED() { Blynk.syncAll(); }

BLYNK_WRITE(WATER_SENSOR_POWER_ON_OFF)
{
  status_water_sensor_pin_virtual = param.asInt();
  String table_logs_insert;

  if (status_water_sensor_pin_virtual == 1)
  {
    digitalWrite(WATER_SENSOR_PIN_DIGITAL, HIGH);
    Serial.println("Wlaczony czujnik poziomu zbiornika");
    table_logs_insert = String("INSERT INTO `") + database + "`.`" +
                        table_logs +
                        "`( `Data_zdarzenia`, `Godzina_zdarzenia`, "
                        "`Opis_zdarzenia`) VALUES ('" +
                        get_date() + "','" + get_time() +
                        "','Wlaczony czujnik poziomu zbiornika');";
  }
  else if (status_water_sensor_pin_virtual == 0)
  {
    digitalWrite(WATER_SENSOR_PIN_DIGITAL, LOW);
    Serial.println("Wylaczony czujnik poziomu zbiornika");
    table_logs_insert = String("INSERT INTO `") + database + "`.`" +
                        table_logs +
                        "`( `Data_zdarzenia`, `Godzina_zdarzenia`, "
                        "`Opis_zdarzenia`) VALUES ('" +
                        get_date() + "','" + get_time() +
                        "','Wylaczony czujnik poziomu zbiornika');";
  }
  connect_to_database_again();
  MySQL_Query query_mem = MySQL_Query(&conn);
  if (conn.connected())
  {
    MYSQL_DISPLAY(table_logs_insert);
    if (!query_mem.execute(table_logs_insert.c_str()))
    {
      MYSQL_DISPLAY("Insert error");
    }
    else
    {
      MYSQL_DISPLAY("Data Inserted.");
    }
  }
  else
  {
    MYSQL_DISPLAY("Error server connected");
  }
  conn.close();
}

BLYNK_WRITE(RAIN_SENSOR_POWER_ON_OFF)
{
  status_rain_sensor_pin_virtual = param.asInt();
  String table_logs_insert;
  if (status_rain_sensor_pin_virtual == 1)
  {
    digitalWrite(RAIN_SENSOR_PIN_DIGITAL, HIGH);
    Serial.println("Wlaczony czujnik opadow deszczu");
    table_logs_insert = String("INSERT INTO `") + database + "`.`" +
                        table_logs +
                        "`( `Data_zdarzenia`, `Godzina_zdarzenia`, "
                        "`Opis_zdarzenia`) VALUES ('" +
                        get_date() + "','" + get_time() +
                        "','Wlaczony czujnik opadow deszczu');";
  }
  else if (status_rain_sensor_pin_virtual == 0)
  {

    digitalWrite(RAIN_SENSOR_PIN_DIGITAL, LOW);
    Serial.println("Wylaczony czujnik opadow deszczu");
    table_logs_insert = String("INSERT INTO `") + database + "`.`" +
                        table_logs +
                        "`( `Data_zdarzenia`, `Godzina_zdarzenia`, "
                        "`Opis_zdarzenia`) VALUES ('" +
                        get_date() + "','" + get_time() +
                        "','Wylaczony czujnik opadow deszczu');";
  }
  connect_to_database_again();
  MySQL_Query query_mem = MySQL_Query(&conn);
  if (conn.connected())
  {
    MYSQL_DISPLAY(table_logs_insert);
    if (!query_mem.execute(table_logs_insert.c_str()))
    {
      MYSQL_DISPLAY("Insert error");
    }
    else
    {
      MYSQL_DISPLAY("Data Inserted.");
    }
  }
  else
  {
    MYSQL_DISPLAY("Error server connected");
  }
  conn.close();
}
/*Owns Functions*/
void rain_sensor()
{
  int rain_sensor_value = 0;
  String rain_sensor_insert;
  rain_sensor_value = analogRead(RAIN_SENSOR_ANALOG_PIN);
  Blynk.virtualWrite(RAIN_SENSOR_VALUE, rain_sensor_value);
  Serial.print("Stan czujnika opadow deszczu wynosi: ");
  Serial.println(rain_sensor_value);
  if (status_rain_sensor_pin_virtual == 1)
  {
    if (rain_sensor_value == 4095)
    {
      Serial.println("Brak opadow");
      Blynk.virtualWrite(RAIN_SENSOR_TEXT_VALUE, "Brak opadow");
      rain_sensor_insert = String("INSERT INTO `") + database + "`.`" +
                           table_rain_sensor +
                           "`(Data_odczytu, Godzina_odczytu, Wartosc, "
                           "Wartosc_tekstowa) VALUES ('" +
                           get_date() + "','" + get_time() + "','" +
                           rain_sensor_value + "','Brak opadow');";
    }
    else if (rain_sensor_value < 4095 && rain_sensor_value >= 2048)
    {
      Serial.println("Slabe opady");
      Blynk.virtualWrite(RAIN_SENSOR_TEXT_VALUE, "Slabe opady");
      rain_sensor_insert = String("INSERT INTO `") + database + "`.`" +
                           table_rain_sensor +
                           "`(Data_odczytu, Godzina_odczytu, Wartosc, "
                           "Wartosc_tekstowa) VALUES ('" +
                           get_date() + "','" + get_time() + "','" +
                           rain_sensor_value + "','Slabe opady');";
    }
    else
    {
      Serial.println("Silne opady");
      Blynk.virtualWrite(RAIN_SENSOR_TEXT_VALUE, "Silne opady");
      rain_sensor_insert = String("INSERT INTO `") + database + "`.`" +
                           table_rain_sensor +
                           "`(Data_odczytu, Godzina_odczytu, Wartosc, "
                           "Wartosc_tekstowa) VALUES ('" +
                           get_date() + "','" + get_time() + "','" +
                           rain_sensor_value + "','Silne opady');";
    }

    connect_to_database_again();
    MySQL_Query query_mem = MySQL_Query(&conn);
    if (conn.connected())
    {
      MYSQL_DISPLAY(rain_sensor_insert);
      if (!query_mem.execute(rain_sensor_insert.c_str()))
      {
        MYSQL_DISPLAY("Insert error");
      }
      else
      {
        MYSQL_DISPLAY("Data Inserted.");
      }
    }
    else
    {
      MYSQL_DISPLAY("Error server connected");
    }
    conn.close();
  }
  else
  {
    Serial.println("Brak danych");
    Blynk.virtualWrite(RAIN_SENSOR_TEXT_VALUE, "Brak danych");
  }
}

void rain_gaugae()
{
  const float onehumltocm = 1.18;
  const float ml_to_cm = 100.0 / onehumltocm;
  const float max_height_gaugae = 11.8;
  const float funnel_area = 3.14159 * pow((12.5 / 2) / 100, 2);
  digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, LOW);

  unsigned long duration = pulseIn(ECHO_PIN_ULTR_SONIC_SENSOR, HIGH);

  float distance = duration * 0.0343 / 2.0;

  if (distance == 0 || distance > max_height_gaugae)
  {

    distance = 0;
  }

  float volume = distance * ml_to_cm;

  if (distance > 0 && distance < max_height_gaugae)
  {
    volume = (max_height_gaugae - distance) * ml_to_cm;
  }

  float volumeL = volume / 1000;

  float rainlevel = volumeL / funnel_area;

  Serial.print("Odległość: ");
  Serial.print(distance);
  Serial.print(" cm, Objętość wody: ");
  Serial.print(volumeL);
  Serial.print(" l, Ilość opadów: ");
  Serial.print(rainlevel);
  Serial.println(" l/m²");
  Blynk.virtualWrite(RAIN_GAUGE_VALUE, rainlevel);
  String rain_gaugae_insert =
      String("INSERT INTO `") + database + "`.`" + table_rain_gaugae +
      "`(`Data_odczytu`, `Godzina_odczytu`, `Wartosc`) VALUES ('" + get_date() +
      "','" + get_time() + "','" + rainlevel + "');";
  connect_to_database_again();
  MySQL_Query query_mem = MySQL_Query(&conn);

  if (conn.connected())
  {
    MYSQL_DISPLAY(rain_gaugae_insert);
    if (!query_mem.execute(rain_gaugae_insert.c_str()))
    {
      MYSQL_DISPLAY("Insert error");
    }
    else
    {
      MYSQL_DISPLAY("Data Inserted.");
    }
  }
  else
  {
    MYSQL_DISPLAY("Error server connected");
  }
  conn.close();
}

void water_sensor()
{
  int water_sensor_value = 0;
  water_sensor_value = analogRead(WATER_SENSOR_ANALOG_PIN);
  Blynk.virtualWrite(WATER_SENSOR_VALUE, water_sensor_value);
  Serial.print("Stan czujnika wody wynosi: ");
  Serial.println(water_sensor_value);
  String water_sensor_insert;
  if (status_water_sensor_pin_virtual == 1)
  {
    if (water_sensor_value <= 0)
    {
      Blynk.virtualWrite(WATER_SENSOR_TEXT_VALUE, "Poziom niski zbiornika");
      Serial.println("Poziom niski zbiornika");
      Blynk.virtualWrite(WATER_NOTIFICATION,
                         "Zbiornik jeszcze nie do oproznienia");
      Serial.println("Zbiornik jeszcze nie do oproznienia");
      water_sensor_insert =
          String("INSERT INTO `") + database + "`.`" + table_water_sensor +
          "`(Data_odczytu, Godzina_odczytu, Wartosc, Wartosc_tekstowa, Alert) "
          "VALUES ('" +
          get_date() + "','" + get_time() + "','" + water_sensor_value +
          "','Poziom niski zbiornika','Zbiornik jeszcze nie do oproznienia');";
    }
    else if (water_sensor_value >= 1 && water_sensor_value <= 2100)
    {
      Blynk.virtualWrite(WATER_SENSOR_TEXT_VALUE, "Poziom wysoki zbiornika");
      Serial.println("Poziom wysoki zbiornika");
      Blynk.virtualWrite(WATER_NOTIFICATION, "Zbiornik do oproznienia");
      Serial.println("Zbiornik do oproznienia");
      water_sensor_insert =
          String("INSERT INTO `") + database + "`.`" + table_water_sensor +
          "`(Data_odczytu, Godzina_odczytu, Wartosc, Wartosc_tekstowa, Alert) "
          "VALUES ('" +
          get_date() + "','" + get_time() + "','" + water_sensor_value +
          "','Poziom wysoki zbiornika','Zbiornik do oproznienia');";
    }
    else
    {
      Blynk.virtualWrite(WATER_SENSOR_TEXT_VALUE, "Stan krytyczny zbiornika");
      Serial.println("Stan krytyczny zbiornika");
      Blynk.virtualWrite(WATER_NOTIFICATION, "Zbiornik do oproznienia");
      Serial.println("Zbiornik do oproznienia");
      water_sensor_insert =
          String("INSERT INTO `") + database + "`.`" + table_water_sensor +
          "`(Data_odczytu, Godzina_odczytu, Wartosc, Wartosc_tekstowa, Alert) "
          "VALUES ('" +
          get_date() + "','" + get_time() + "','" + water_sensor_value +
          "','Stan krytyczny zbiornika','Zbiornik do oproznienia');";
    }

    connect_to_database_again();
    MySQL_Query query_mem = MySQL_Query(&conn);

    if (conn.connected())
    {
      MYSQL_DISPLAY(water_sensor_insert);
      if (!query_mem.execute(water_sensor_insert.c_str()))
      {
        MYSQL_DISPLAY("Insert error");
      }
      else
      {
        MYSQL_DISPLAY("Data Inserted.");
      }
    }
    else
    {
      MYSQL_DISPLAY("Error server connected");
    }
    conn.close();
  }
  else
  {
    Blynk.virtualWrite(WATER_SENSOR_TEXT_VALUE, "Brak danych");
    Serial.println("Brak danych");
    Blynk.virtualWrite(WATER_NOTIFICATION, "Brak danych");
    Serial.println("Brak danych");
  }
}

void pin_setup()
{
  pinMode(RAIN_SENSOR_PIN_DIGITAL, OUTPUT);
  pinMode(RAIN_SENSOR_ANALOG_PIN, INPUT);
  pinMode(WATER_SENSOR_PIN_DIGITAL, OUTPUT);
  pinMode(WATER_SENSOR_ANALOG_PIN, INPUT);
  pinMode(TRIG_PIN_ULTR_SONIC_SENSOR, OUTPUT);
  pinMode(ECHO_PIN_ULTR_SONIC_SENSOR, INPUT);
  digitalWrite(RAIN_SENSOR_PIN_DIGITAL, HIGH);
  digitalWrite(WATER_SENSOR_PIN_DIGITAL, HIGH);
}
void blynk_setup_and_virtual_pins()
{
  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
  Blynk.virtualWrite(WATER_SENSOR_POWER_ON_OFF, 1);
  Blynk.virtualWrite(RAIN_SENSOR_POWER_ON_OFF, 1);
}
void connect_wifi_to_database()
{
  MYSQL_DISPLAY1("\nStarting Basic_Insert_ESP on", ARDUINO_BOARD);
  MYSQL_DISPLAY(MYSQL_MARIADB_GENERIC_VERSION);
  MYSQL_DISPLAY1("Connecting to", ssid);
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    MYSQL_DISPLAY0(".");
  }
  MYSQL_DISPLAY1("Connected to network. My IP address is:", WiFi.localIP());
}
void connect_to_mysql_database()
{
  MYSQL_DISPLAY3("Connecting to SQL Server @", serverIP,
                 ", Port =", server_port);
  if (conn.connect(serverIP, server_port, userdatabse, passworddatabase))
  {
    MYSQL_DISPLAY("Connecting to database successful");
  }
  else
  {
    MYSQL_DISPLAY("Connecting to database unsuccessful");
  }
}
void check_database_or_create_database()
{
  String check_database_query =
      String("SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE "
             "SCHEMA_NAME = '") +
      database + "';";
  String create_database = String("CREATE DATABASE ") + database + ";";
  MYSQL_DISPLAY("Checking database exist");
  MYSQL_DISPLAY(check_database_query);
  MySQL_Query query_mem = MySQL_Query(&conn);
  if (!query_mem.execute(check_database_query.c_str(), true))
  {
    MYSQL_DISPLAY("Querying error");
    return;
  }
  column_names *cols = query_mem.get_columns();

  if (cols->num_fields > 0)
  {
    row_values *row = query_mem.get_next_row();
    if (row != NULL)
    {
      if (String(row->values[0]) == String(database))
      {
        MYSQL_DISPLAY("Database exists");
        query_mem.close();
      }
    }

    else
    {
      MYSQL_DISPLAY("Database not exists");
      MYSQL_DISPLAY("Creating database");
      if (!query_mem.execute(create_database.c_str(), true))
      {
        MYSQL_DISPLAY("Querying error, database not added");
        return;
      }
      MYSQL_DISPLAY("Database creating");
      query_mem.close();
    }
  }
  conn.close();
}
void check_tables_database()
{
  connect_to_database_again();
  String check_water_sensor_table_exist =
      String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE "
             "TABLE_SCHEMA = '") +
      database + "' AND TABLE_NAME = '" + table_water_sensor + "';";
  String check_rain_sensor_table_exist =
      String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE "
             "TABLE_SCHEMA = '") +
      database + "' AND TABLE_NAME = '" + table_rain_sensor + "';";
  String check_rain_gaugae_table_exist =
      String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE "
             "TABLE_SCHEMA = '") +
      database + "' AND TABLE_NAME = '" + table_rain_gaugae + "';";
  String check_logs_table_exist =
      String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE "
             "TABLE_SCHEMA = '") +
      database + "' AND TABLE_NAME = '" + table_logs + "';";
  String check_device_info_table_exist =
      String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE "
             "TABLE_SCHEMA = '") +
      database + "' AND TABLE_NAME = '" + table_device_info + "';";
  String create_table_water_sensor =
      String("CREATE TABLE `") + database + "`.`" + table_water_sensor +
      "`(`ID` INT NOT NULL AUTO_INCREMENT, `Data_odczytu` DATE NOT NULL, "
      "`Godzina_odczytu` TIME NOT NULL,`Wartosc` INT NOT NULL, "
      "`Wartosc_tekstowa` VARCHAR(255) NOT NULL, `Alert` VARCHAR(255) NOT "
      "NULL, PRIMARY KEY(`ID`))ENGINE = InnoDB;";
  String create_table_rain_gaugae =
      String("CREATE TABLE `") + database + "`.`" + table_rain_gaugae +
      "`(`ID` INT NOT NULL AUTO_INCREMENT , `Data_odczytu` DATE NOT NULL "
      ",`Godzina_odczytu` TIME NOT NULL, `Wartosc` INT NOT NULL ,PRIMARY KEY "
      "(`ID`)) ENGINE = InnoDB;";
  String create_table_rain_sensor =
      String("CREATE TABLE `") + database + "`.`" + table_rain_sensor +
      "`(`ID` INT NOT NULL AUTO_INCREMENT , `Data_odczytu` DATE NOT NULL , "
      "`Godzina_odczytu` TIME NOT NULL,`Wartosc` INT NOT NULL , "
      "`Wartosc_tekstowa` VARCHAR(255) NOT NULL , PRIMARY KEY (`ID`)) ENGINE = "
      "InnoDB;";
  String create_table_logs =
      String("CREATE TABLE `") + database + "`.`" + table_logs +
      "`(`ID` INT NOT NULL AUTO_INCREMENT , `Data_zdarzenia` DATE NOT NULL , "
      "`Godzina_zdarzenia` TIME NOT NULL , `Opis_zdarzenia` VARCHAR(255) NOT "
      "NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB;";
  String create_table_device_info =
      String("CREATE TABLE `") + database + "`.`" + table_device_info +
      "`(`ID` INT NOT NULL AUTO_INCREMENT , `Device_mac_address` VARCHAR(17) NOT NULL , `Network_ssid` VARCHAR(30) NOT NULL , `Network_ip` VARCHAR(30) NOT NULL , `Database_name` VARCHAR(50) NOT NULL , `Database_ip` VARCHAR(30) NOT NULL , `Database_port` INT(10) NOT NULL , `Database_user_name` VARCHAR(50) NOT NULL , `Data_aktualizacji` DATE NOT NULL , `Czas_aktualizacji` TIME NOT NULL , PRIMARY KEY (`ID`) ) ENGINE = InnoDB;";

  MYSQL_DISPLAY("Checking database tables");
  MYSQL_DISPLAY("Checking water sensor table");
  MYSQL_DISPLAY(check_water_sensor_table_exist);
  MySQL_Query query_mem = MySQL_Query(&conn);
  if (!query_mem.execute(check_water_sensor_table_exist.c_str(), true))
  {
    MYSQL_DISPLAY("Querying error");
    return;
  }
  column_names *cols = query_mem.get_columns();

  if (cols->num_fields > 0)
  {
    row_values *row = query_mem.get_next_row();
    if (row != NULL)
    {
      if (String(row->values[0]) == String(table_water_sensor))
      {
        MYSQL_DISPLAY("Table exists");
        query_mem.close();
      }
    }
    else
    {
      MYSQL_DISPLAY("Table not exists");
      MYSQL_DISPLAY("Creating table water_sensor");
      MYSQL_DISPLAY(create_table_water_sensor);
      if (!query_mem.execute(create_table_water_sensor.c_str(), true))
      {
        MYSQL_DISPLAY("Querying error, table not added");
        return;
      }
      MYSQL_DISPLAY("Table creating");
      query_mem.close();
    }
  }
  conn.close();
  connect_to_database_again();
  MYSQL_DISPLAY("Checking rain sensor table");
  MYSQL_DISPLAY(check_rain_sensor_table_exist);
  if (!query_mem.execute(check_rain_sensor_table_exist.c_str(), true))
  {
    MYSQL_DISPLAY("Querying error");
    return;
  }
  column_names *cols2 = query_mem.get_columns();

  if (cols2->num_fields > 0)
  {
    row_values *row2 = query_mem.get_next_row();
    if (row2 != NULL)
    {
      if (String(row2->values[0]) == String(table_rain_sensor))
      {
        MYSQL_DISPLAY("Table exists");
        query_mem.close();
      }
    }
    else
    {
      MYSQL_DISPLAY("Table not exists");
      MYSQL_DISPLAY("Creating table rain_sensor");
      MYSQL_DISPLAY(create_table_rain_sensor);
      if (!query_mem.execute(create_table_rain_sensor.c_str(), true))
      {
        MYSQL_DISPLAY("Querying error, table not added");
        return;
      }
      MYSQL_DISPLAY("Table creating");
      query_mem.close();
    }
  }
  conn.close();
  connect_to_database_again();
  MYSQL_DISPLAY("Checking table rain_gaugae");
  MYSQL_DISPLAY(check_rain_gaugae_table_exist);
  if (!query_mem.execute(check_rain_gaugae_table_exist.c_str(), true))
  {
    MYSQL_DISPLAY("Querying error ");
    return;
  }
  column_names *cols3 = query_mem.get_columns();

  if (cols3->num_fields > 0)
  {
    row_values *row3 = query_mem.get_next_row();
    if (row3 != NULL)
    {
      if (String(row3->values[0]) == String(table_rain_gaugae))
      {
        MYSQL_DISPLAY("Table exists");
        query_mem.close();
      }
    }
    else
    {
      MYSQL_DISPLAY("Table not exists");
      MYSQL_DISPLAY("Creating table rain gaugae");
      MYSQL_DISPLAY(create_table_rain_gaugae);
      if (!query_mem.execute(create_table_rain_gaugae.c_str(), true))
      {
        MYSQL_DISPLAY("Querying error, table not added");
        return;
      }
      MYSQL_DISPLAY("Table creating");
      query_mem.close();
    }
  }
  conn.close();
  connect_to_database_again();
  MYSQL_DISPLAY("Checking table logs");
  MYSQL_DISPLAY(check_logs_table_exist);
  if (!query_mem.execute(check_logs_table_exist.c_str(), true))
  {
    MYSQL_DISPLAY("Querying error ");
    return;
  }
  column_names *cols4 = query_mem.get_columns();

  if (cols4->num_fields > 0)
  {
    row_values *row4 = query_mem.get_next_row();
    if (row4 != NULL)
    {
      if (String(row4->values[0]) == String(table_logs))
      {
        MYSQL_DISPLAY("Table exists");
        query_mem.close();
      }
    }
    else
    {
      MYSQL_DISPLAY("Table not exists");
      MYSQL_DISPLAY("Creating table logs");
      MYSQL_DISPLAY(create_table_logs);
      if (!query_mem.execute(create_table_logs.c_str(), true))
      {
        MYSQL_DISPLAY("Querying error, table not added");
        return;
      }
      MYSQL_DISPLAY("Table creating");
      query_mem.close();
    }
  }
  conn.close();

  connect_to_database_again();
  MYSQL_DISPLAY("Checking table device info");
  MYSQL_DISPLAY(check_device_info_table_exist);
  if (!query_mem.execute(check_device_info_table_exist.c_str(), true))
  {
    MYSQL_DISPLAY("Querying error ");
    return;
  }
  column_names *cols5 = query_mem.get_columns();

  if (cols5->num_fields > 0)
  {
    row_values *row5 = query_mem.get_next_row();
    if (row5 != NULL)
    {
      if (String(row5->values[0]) == String(table_device_info))
      {
        MYSQL_DISPLAY("Table exists");
        query_mem.close();
      }
    }
    else
    {
      MYSQL_DISPLAY("Table not exists");
      MYSQL_DISPLAY("Creating table logs");
      MYSQL_DISPLAY(create_table_device_info);
      if (!query_mem.execute(create_table_device_info.c_str(), true))
      {
        MYSQL_DISPLAY("Querying error, table not added");
        return;
      }
      MYSQL_DISPLAY("Table creating");
      query_mem.close();
    }
  }
  conn.close();
}
void connect_to_database_again()
{
  MYSQL_DISPLAY("Connecting again to database")
  if (conn.connect(serverIP, server_port, userdatabse, passworddatabase))
  {
    MYSQL_DISPLAY("Connecting to database successful");
  }
  else
  {
    MYSQL_DISPLAY("Connecting to database unsuccessful");
  }
}
void set_time_and_date()
{
  timeClient.begin();
  timeClient.setTimeOffset(3600);
}
String get_time()
{
  timeClient.update();
  unsigned long epochTime = timeClient.getEpochTime();
  struct tm *currentTime = localtime((const time_t *)&epochTime);
  int hour = currentTime->tm_hour;
  int minute = currentTime->tm_min;
  int second = currentTime->tm_sec;
  String fulltime = String(hour) + ":" + String(minute) + ":" + String(second);
  return fulltime;
}
String get_date()
{
  timeClient.update();
  unsigned long epochTime = timeClient.getEpochTime();
  struct tm *currentTime = localtime((const time_t *)&epochTime);
  int year = currentTime->tm_year + 1900;
  int month = currentTime->tm_mon + 1;
  int day = currentTime->tm_mday;
  String fulldate = String(year) + "-" + String(month) + "-" + String(day);
  return fulldate;
}

void add_log_power_on_device()
{
  String table_logs_insert =
      String("INSERT INTO `") + database + "`.`" + table_logs +
      "`( `Data_zdarzenia`, `Godzina_zdarzenia`, `Opis_zdarzenia`) VALUES ('" +
      get_date() + "','" + get_time() + "','Wlaczenie urzadzenia');";
  connect_to_database_again();
  MySQL_Query query_mem = MySQL_Query(&conn);
  if (conn.connected())
  {
    MYSQL_DISPLAY(table_logs_insert);
    if (!query_mem.execute(table_logs_insert.c_str()))
    {
      MYSQL_DISPLAY("Insert error");
    }
    else
    {
      MYSQL_DISPLAY("Data Inserted.");
    }
  }
  else
  {
    MYSQL_DISPLAY("Error server connected");
  }
  conn.close();
}
void add_data_device_info()
{
  String device_info_insert =
      String("INSERT INTO `") + database + "`.`" + table_device_info +
      "`(`Device_mac_address`, `Network_ssid`, `Network_ip`, `Database_name`, `Database_ip`, `Database_port`, `Database_user_name`, `Data_aktualizacji`, `Czas_aktualizacji` ) VALUES ('" +
      WiFi.macAddress() + "','" + ssid + "','" + WiFi.localIP().toString() + "','" + database + "','" + serverIP.toString() + "','" + server_port + "','" + userdatabse + "','" + get_date() + "','" + get_time() + "');";
  connect_to_database_again();
  MySQL_Query query_mem = MySQL_Query(&conn);
  if (conn.connected())
  {
    MYSQL_DISPLAY(device_info_insert);
    if (!query_mem.execute(device_info_insert.c_str()))
    {
      MYSQL_DISPLAY("Insert error");
    }
    else
    {
      MYSQL_DISPLAY("Data Inserted.");
    }
  }
  else
  {
    MYSQL_DISPLAY("Error server connected");
  }
  conn.close();
}
void smtp_server_setup()
{
  smtp.debug(1);
  session.server.host_name = SMTP_server;
  session.server.port = SMTP_Port;
  session.login.email = sender_email;
  session.login.password = sender_password;
  session.login.user_domain = "";
  message.sender.name = "System monitorowania opadow deszczu";
  message.sender.email = sender_email;
}
void send_email_water_sensor_alert()
{
  row_values *row = NULL;
  int water_sensor_value = 0;
  water_sensor_value = analogRead(WATER_SENSOR_ANALOG_PIN);
  Serial.print("Z aletru wynosi");
  Serial.println(water_sensor_value);
  if (water_sensor_value > 2100)
  {
    String query_users = String("SELECT ") + database + ".auth_user.first_name, " + database + ".auth_user.last_name, " + database + ".auth_user.email FROM " + database + ".auth_user WHERE " + database + ".auth_user.is_superuser=0;";
    connect_to_database_again();
    MySQL_Query query_mem = MySQL_Query(&conn);
    if (conn.connected())
    {
      MYSQL_DISPLAY(query_users);

      if (!query_mem.execute(query_users.c_str()))
      {
        MYSQL_DISPLAY("Querying error");
        return;
      }
      column_names *cols = query_mem.get_columns();

      if (cols->num_fields > 0)
      {
        do
        {
          row = query_mem.get_next_row();
          if (row != NULL)
          {
            String firstName = row->values[0];
            String lastName = row->values[1];
            String email = row->values[2];
            message.subject = "System pomiaru opadów wody";
            message.addRecipient(firstName + " " + lastName, email);
            String textMsg = "UWAGA!!!!!!! Pełny zbiornik wody!!!! Oproznij wode";
            message.text.content = textMsg.c_str();
            message.text.charSet = "us-ascii";
            message.text.transfer_encoding = Content_Transfer_Encoding::enc_7bit;
            if (!smtp.connect(&session))
            {
              return;
            }
            if (!MailClient.sendMail(&smtp, &message))
            {
              Serial.println("Error sending Email, " + smtp.errorReason());
            }
            Serial.println("Email sent");
          }
        } while (row != NULL);

        query_mem.close();
      }
    }
    else
    {
      MYSQL_DISPLAY("Error server connected");
    }
    conn.close();
  }
}
/*Setup*/
void setup()
{
  Serial.begin(115200);
  delay(1000);
  connect_wifi_to_database();
  delay(1000);
  connect_to_mysql_database();
  delay(1000);
  smtp_server_setup();
  delay(1000);
  check_database_or_create_database();
  delay(1000);
  check_tables_database();
  delay(1000);
  set_time_and_date();
  delay(1000);
  add_log_power_on_device();
  delay(1000);
  add_data_device_info();
  delay(1000);
  pin_setup();
  delay(1000);
  blynk_setup_and_virtual_pins();
  timer.setInterval(10000L, water_sensor);
  timer.setInterval(10000L, rain_sensor);
  timer.setInterval(30000L, rain_gaugae);
  timer.setInterval(15000L, send_email_water_sensor_alert);
}
/*Loop*/
void loop()
{
  Blynk.run();
  timer.run();
}

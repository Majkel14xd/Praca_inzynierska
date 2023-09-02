#if !(ESP8266 || ESP32)
#error This code is intended to run on the ESP8266/ESP32 platform! Please check your Tools->Board setting
#endif

/*Macros*/
#define WATER_SENSOR_PIN_DIGITAL 13
#define RAIN_SENSOR_PIN_DIGITAL 4
#define ECHO_PIN_ULTR_SONIC_SENSOR 5
#define TRIG_PIN_ULTR_SONIC_SENSOR 18
#define WATER_SESNOR_ANALOG_PIN 35
#define RAIN_SENSOR_ANALOG_PIN 34
#define BLYNK_TEMPLATE_ID "TMPL4pChBbFWL"
#define BLYNK_TEMPLATE_NAME "measurementrainsystem"
#define BLYNK_AUTH_TOKEN "vnEDWHA3KRFwm91ji5MNPcojZgo1NfOT"
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
/*Includes*/
#include <WiFi.h>
#include <WiFiClient.h>
#include <NewPing.h>
#include <BlynkSimpleEsp32.h>
#include <MySQL_Generic.h>

/*Variables*/
byte mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
char ssid[] = "NETIASPOT-2.4GHz-8Ps7";
char pass[] = "tw6eUEH8";
char userdatabse[] = "Majkel14xd";
char passworddatabase[] = "zaq1@WSX";
char database[] = "rain_measurement_system";
char table_water_sesnor[] = "water_sensor";
char table_rain_gaugae[] = "rain_gaugae";
char table_rain_sensor[] = "rain_sensor";
int water_sensor_value = 0;
int rain_sesnor_value = 0;
int capacitygaugae = 1000;
int funnelsize = 10;
uint16_t server_port = 3306;

/*Objects*/
BlynkTimer timer;
IPAddress serverIP(192, 168, 100, 12);
NewPing sonar(TRIG_PIN_ULTR_SONIC_SENSOR, ECHO_PIN_ULTR_SONIC_SENSOR);
MySQL_Connection conn((Client *)&client);
MySQL_Query *query_mem;
/*Blynk Functions*/
BLYNK_CONNECTED()
{
    Blynk.syncAll();
}

BLYNK_WRITE(WATER_SENSOR_POWER_ON_OFF)
{
    if (param.asInt() == 1)
    {
        digitalWrite(WATER_SENSOR_PIN_DIGITAL, HIGH);
        Serial.println("Wlaczony czujnik poziomu zbiornika");
    }
    else if (param.asInt() == 0)
    {

        digitalWrite(WATER_SENSOR_PIN_DIGITAL, LOW);
        Serial.println("Wlaczony czujnik poziomu zbiornika");
    }
}

BLYNK_WRITE(RAIN_SENSOR_POWER_ON_OFF)
{
    if (param.asInt() == 1)
    {
        digitalWrite(RAIN_SENSOR_PIN_DIGITAL, HIGH);
        Serial.println("Wlaczony czujnik opadow deszczu");
    }
    else if (param.asInt() == 0)
    {

        digitalWrite(RAIN_SENSOR_PIN_DIGITAL, LOW);
        Serial.println("Wylaczony czujnik opadow deszczu");
    }
}
/*Owns Functions*/
void rain_sensor()
{
    rain_sesnor_value = analogRead(RAIN_SENSOR_ANALOG_PIN);
    Blynk.virtualWrite(RAIN_SENSOR_VALUE, rain_sesnor_value);
    Serial.print("Stan czujnika opadow deszczu wynosi: ");
    Serial.println(rain_sesnor_value);
    if (rain_sesnor_value > 1000)
    {
        Serial.println("Brak opadow");
        Blynk.virtualWrite(RAIN_SENSOR_TEXT_VALUE, "Brak opadow");
    }
    else if (rain_sesnor_value < 1000 && rain_sesnor_value >= 512)
    {
        Serial.println("Slabe opady");
        Blynk.virtualWrite(RAIN_SENSOR_TEXT_VALUE, "Slabe opady");
    }
    else
    {
        Serial.println("Silne opady");
        Blynk.virtualWrite(RAIN_SENSOR_TEXT_VALUE, "Silne opady");
    }
}

void rain_gaugae()
{

    digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, LOW);
    delayMicroseconds(2);
    digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, LOW);
    unsigned int distance = sonar.ping_cm();

    int waterLevelgauge = capacitygaugae - (capacitygaugae * distance) / 100;

    Serial.print("Odległość: ");
    Serial.print(distance);
    Serial.print(" cm, Poziom wody: ");
    Serial.print(waterLevelgauge);
    Serial.print(" ml");
    int rainlevel = waterLevelgauge * funnelsize;
    Serial.println(" Poziom deszczu wynosi: ");
    Serial.print(rainlevel);
    Blynk.virtualWrite(RAIN_GAUGE_VALUE, rainlevel);
}

void water_sensor()
{
    // String water_sensor_add_to_database = String("SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '") + database + "'";
    water_sensor_value = analogRead(WATER_SESNOR_ANALOG_PIN);
    Blynk.virtualWrite(WATER_SENSOR_VALUE, water_sensor_value);
    Serial.print("Stan czujnika wody wynosi: ");
    Serial.println(water_sensor_value);

    if (water_sensor_value <= 10)
    {
        Blynk.virtualWrite(WATER_SENSOR_TEXT_VALUE, "Poziom niski zbiornika");
        Serial.println("Poziom niski zbiornika");
        Blynk.virtualWrite(WATER_NOTIFICATION, "Zbiornik jeszcze nie do oproznienia");
        Serial.println("Zbiornik jeszcze nie do oproznienia");
    }
    else if (water_sensor_value >= 11 && water_sensor_value <= 400)
    {
        Blynk.virtualWrite(WATER_SENSOR_TEXT_VALUE, "Poziom wysoki zbiornika");
        Serial.println("Poziom wysoki zbiornika");
        Blynk.virtualWrite(WATER_NOTIFICATION, "Zbiornik do oproznienia");
        Serial.println("Zbiornik do oproznienia");
    }
    else
    {
        Blynk.virtualWrite(WATER_SENSOR_TEXT_VALUE, "Poziom wysoki zbiornika");
        Serial.println("Stan krytyczny zbiornika");
        Blynk.virtualWrite(WATER_NOTIFICATION, "Zbiornik do oproznienia");
        Serial.println("Zbiornik do oproznienia");
    }
}

void pin_setup()
{
    pinMode(RAIN_SENSOR_PIN_DIGITAL, OUTPUT);
    pinMode(RAIN_SENSOR_ANALOG_PIN, INPUT);
    pinMode(WATER_SENSOR_PIN_DIGITAL, OUTPUT);
    pinMode(WATER_SESNOR_ANALOG_PIN, INPUT);
    pinMode(TRIG_PIN_ULTR_SONIC_SENSOR, OUTPUT);
    pinMode(ECHO_PIN_ULTR_SONIC_SENSOR, INPUT);
    digitalWrite(RAIN_SENSOR_PIN_DIGITAL, HIGH);
    digitalWrite(WATER_SENSOR_PIN_DIGITAL, HIGH);
}
void blynk_setup_and_virtual_pins()
{
    Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
    Blynk.virtualWrite(V0, 1);
    Blynk.virtualWrite(V1, 1);
    Blynk.virtualWrite(V2, 1);
    Blynk.virtualWrite(V3, 1);
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
    MYSQL_DISPLAY3("Connecting to SQL Server @", serverIP, ", Port =", server_port);
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
    String check_database_query = String("SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '") + database + "';";
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
}
void check_tables_database()
{
    String check_water_sensor_table_exist = String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '") + database + "' AND TABLE_NAME = '" + table_water_sesnor + "';";
    String check_rain_sensor_table_exist = String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '") + database + "' AND TABLE_NAME = '" + table_rain_sensor + "';";
    String check_rain_gaugae_table_exist = String("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '") + database + "' AND TABLE_NAME = '" + table_rain_gaugae + "';";
    String create_table_rain_sensor = String("CREATE TABLE `") + database + "`.`" + table_water_sesnor + "`(`ID` INT NOT NULL AUTO_INCREMENT, `Data_odczytu` DATE NOT NULL, `Wartosc` INT NOT NULL, `Wartosc_tekstowa` VARCHAR(255) NOT NULL, `Alert` VARCHAR(255) NOT NULL, PRIMARY KEY(`ID`))ENGINE = InnoDB;";
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
            if (String(row->values[0]) == String(table_water_sesnor))
            {
                MYSQL_DISPLAY("Table exists");
                query_mem.close();
            }
        }
        else
        {
            MYSQL_DISPLAY("Table not exists");
            MYSQL_DISPLAY("Creating table water_sensor");
            if (!query_mem.execute(create_table_rain_sensor.c_str(), true))
            {
                MYSQL_DISPLAY("Querying error, table not added");
                return;
            }
            MYSQL_DISPLAY("Table creating");
            query_mem.close();
        }
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
    check_database_or_create_database();
    delay(1000);
    check_tables_database();
    delay(1000);
    pin_setup();
    delay(1000);
    blynk_setup_and_virtual_pins();
    timer.setInterval(10000L, water_sensor);
    timer.setInterval(10000L, rain_sensor);
    timer.setInterval(30000L, rain_gaugae);
}
/*Loop*/
void loop()
{
    Blynk.run();
    timer.run();
}

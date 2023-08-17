#define WATER_SENSOR_PIN_DIGITAL 13
#define RAIN_SENSOR_PIN_DIGITAL 4
#define ECHO_PIN_ULTR_SONIC_SENSOR 5
#define TRIG_PIN_ULTR_SONIC_SENSOR 18
#define WATER_SESNOR_ANALOG_PIN 35
#define RAIN_SENSOR_ANALOG_PIN 34
#define BLYNK_TEMPLATE_ID "TMPL4pChBbFWL"
#define BLYNK_TEMPLATE_NAME "measurementrainsystem"
#define BLYNK_AUTH_TOKEN "vnEDWHA3KRFwm91ji5MNPcojZgo1NfOT"
#define MAX_DISTANCE 200
#define BLYNK_PRINT Serial

#include <WiFi.h>
#include <WiFiClient.h>
#include <BlynkSimpleEsp32.h>

char ssid[] = "NETIASPOT-2.4GHz-8Ps7";
char pass[] = "tw6eUEH8";
int water_sensor_value = 0;
int rain_sesnor_value = 0;
const float widthgaugae = 1.0;
const float heightgaugae = 1.0;
BlynkTimer timer;

BLYNK_CONNECTED()
{
    Blynk.syncAll();
}

BLYNK_WRITE(V0)
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

BLYNK_WRITE(V1)
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

void rain_sensor()
{
    rain_sesnor_value = analogRead(RAIN_SENSOR_ANALOG_PIN);
    Blynk.virtualWrite(V6, rain_sesnor_value);
    Serial.print("Stan czujnika opadow deszczu wynosi: ");
    Serial.println(rain_sesnor_value);
}

void check_rain()
{
    if (rain_sesnor_value > 1000)
    {
        Serial.println("Brak opadow");
        Blynk.virtualWrite(V7, "Brak opadow");
    }
    else if (rain_sesnor_value < 1000 && rain_sesnor_value >= 512)
    {
        Serial.println("Slabe opady");
        Blynk.virtualWrite(V7, "Slabe opady");
    }
    else
    {
        Serial.println("Silne opady");
        Blynk.virtualWrite(V7, "Silne opady");
    }
}

void rain_gaugae()
{
    digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, LOW);
    delayMicroseconds(2);
    digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIG_PIN_ULTR_SONIC_SENSOR, LOW);

    unsigned long duration = pulseIn(ECHO_PIN_ULTR_SONIC_SENSOR, HIGH, MAX_DISTANCE * 29.1);

    unsigned int distance = duration / 29.1 / 2;
    if (distance != 0)
    {
        float valuerain = (distance * 10) / (widthgaugae * heightgaugae);
        Serial.print("Odlegosc: ");
        Serial.print(distance);
        Serial.print(" cm, Ilosc opadow: ");
        Serial.print(valuerain);
        Serial.println(" mm/m^2");
        Blynk.virtualWrite(V8, valuerain);
    }
}

void water_sensor()
{
    water_sensor_value = analogRead(WATER_SESNOR_ANALOG_PIN);
    Blynk.virtualWrite(V4, water_sensor_value);
    Serial.print("Stan czujnika wody wynosi: ");
    Serial.println(water_sensor_value);
}

void check_sensor_water()
{
    if (water_sensor_value <= 10)
    {
        Blynk.virtualWrite(V5, "Poziom niski zbiornika");
        Serial.println("Poziom niski zbiornika");
    }
    else if (water_sensor_value >= 11 && water_sensor_value <= 400)
    {
        Blynk.virtualWrite(V5, "Poziom wysoki zbiornika");
        Serial.println("Poziom wysoki zbiornika");
    }
    else
    {
        Blynk.virtualWrite(V5, "Poziom wysoki zbiornika");
        Serial.println("Stan krytyczny zbiornika");
    }
}

void check_sensor_gauage()
{
    if (water_sensor_value <= 10)
    {
        Blynk.virtualWrite(V9, "Zbiornik jeszcze nie do oproznienia");
        Serial.println("Zbiornik jeszcze nie do oproznienia");
    }
    else if (water_sensor_value >= 11 && water_sensor_value <= 400)
    {
        Blynk.virtualWrite(V9, "Zbiornik do oproznienia");
        Serial.println("Zbiornik do oproznienia");
    }
    else
    {
        Blynk.virtualWrite(V9, "Zbiornik do oproznienia");
        Serial.println("Zbiornik do oproznienia");
    }
}

void setup()
{
    Serial.begin(115200);
    pinMode(RAIN_SENSOR_PIN_DIGITAL, OUTPUT);
    pinMode(RAIN_SENSOR_ANALOG_PIN, INPUT);
    pinMode(WATER_SENSOR_PIN_DIGITAL, OUTPUT);
    pinMode(WATER_SESNOR_ANALOG_PIN, INPUT);
    pinMode(TRIG_PIN_ULTR_SONIC_SENSOR, OUTPUT);
    pinMode(ECHO_PIN_ULTR_SONIC_SENSOR, INPUT);
    digitalWrite(RAIN_SENSOR_PIN_DIGITAL, HIGH);
    digitalWrite(WATER_SENSOR_PIN_DIGITAL, HIGH);
    delay(1000);
    Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
    Blynk.virtualWrite(V0, 1);
    Blynk.virtualWrite(V1, 1);
    Blynk.virtualWrite(V2, 1);
    Blynk.virtualWrite(V3, 1);
    timer.setInterval(1000L, water_sensor);
    timer.setInterval(1000L, check_sensor_water);
    timer.setInterval(1000L, check_sensor_gauage);
    timer.setInterval(2000L, rain_sensor);
    timer.setInterval(2000L, check_rain);
    timer.setInterval(5000L, rain_gaugae);
}

void loop()
{
    Blynk.run();
    timer.run();
}

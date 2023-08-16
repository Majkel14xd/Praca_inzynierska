// for ESP32 Microcontroller
#define rainAnalog 39
#define POWER_PIN 26

void setup()
{
    Serial.begin(9600);
    pinMode(POWER_PIN, OUTPUT);
}
void loop()
{
    digitalWrite(POWER_PIN, HIGH); // turn the sensor ON
    delay(1000);
    int rainAnalogVal = analogRead(rainAnalog);
    digitalWrite(POWER_PIN, LOW);
    Serial.println(rainAnalogVal);
    delay(200);
}
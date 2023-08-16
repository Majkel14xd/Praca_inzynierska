#define POWER_PIN 25  // ESP32 pin GPIO17 connected to sensor's VCC pin
#define SIGNAL_PIN 36 // ESP32 pin GPIO36 (ADC0) connected to sensor's signal pin
#define SENSOR_MIN 0
#define SENSOR_MAX 521

int value = 0; // variable to store the sensor value
int level = 0; // variable to store the water level

void setup()
{
    Serial.begin(9600);
    pinMode(POWER_PIN, OUTPUT);   // configure D7 pin as an OUTPUT
    digitalWrite(POWER_PIN, LOW); // turn the sensor OFF
}

void loop()
{
    digitalWrite(POWER_PIN, HIGH);  // turn the sensor ON
    delay(10);                      // wait 10 milliseconds
    value = analogRead(SIGNAL_PIN); // read the analog value from sensor
    digitalWrite(POWER_PIN, LOW);   // turn the sensor OFF
    Serial.print("Water value: ");
    Serial.println(value);

    delay(1000);
}
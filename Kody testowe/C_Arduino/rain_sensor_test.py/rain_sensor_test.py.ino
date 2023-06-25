int sensorPowerPin = 7;
int sensorPin = 8;

void setup() {
  Serial.begin(9600);
  pinMode(sensorPowerPin, OUTPUT);
  pinMode(sensorPin, INPUT);
  digitalWrite(sensorPowerPin, LOW);
  Serial.println("Board connected");
}

void loop() {
  int val = readSensor();
  Serial.println("Digital output");
  Serial.print("Value sensor is ");
  Serial.println(val);

  if (val) {
    Serial.println("Status: Clear");
  } else {
    Serial.println("Status: It's raining");
  }
  delay(1000);
  Serial.println(" ");
}

int readSensor() {
  digitalWrite(sensorPowerPin, HIGH);
  delay(1000);

  int val = digitalRead(sensorPin);
  digitalWrite(sensorPowerPin, LOW);
  return val;
}
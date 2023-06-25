int ledPin = 12;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  Serial.println("Board connected");
}

void loop() {
  digitalWrite(ledPin, HIGH);
  Serial.println("LED ON");
  delay(500);
  Serial.println("LED OFF");
  digitalWrite(ledPin, LOW);
  delay(500);
}
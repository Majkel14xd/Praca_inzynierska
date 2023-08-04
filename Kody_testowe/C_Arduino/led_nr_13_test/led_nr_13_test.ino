int ledPin = 13;  // Numer pinu do podłączenia diody LED

void setup() {
  pinMode(ledPin, OUTPUT);  // Ustawienie pinu jako wyjście
  Serial.begin(9600);  // Inicjalizacja komunikacji szeregowej (opcjonalne)
  delay(2000);  // Poczekaj 2 sekundy (opcjonalne)
  Serial.println("Płyta podłączona");  // Wysłanie wiadomości przez port szeregowy (opcjonalne)
}

void loop() {
  digitalWrite(ledPin, HIGH);  // Włącz diodę LED
  Serial.println("LED ON");  // Wysłanie wiadomości przez port szeregowy (opcjonalne)
  delay(500);  // Poczekaj 0.5 sekundy
  digitalWrite(ledPin, LOW);  // Wyłącz diodę LED
  Serial.println("LED OFF");  // Wysłanie wiadomości przez port szeregowy (opcjonalne)
  delay(500);  // Poczekaj 0.5 sekundy
}

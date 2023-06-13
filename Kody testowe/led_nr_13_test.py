from pyfirmata import Arduino
import time
# Ustawienia połączenia szeregowego z Arduino
port = 'COM3'  # Nazwa portu, na którym jest podłączone Arduino

# Inicjalizacja połączenia z Arduino
board = Arduino(port)

# Poczekaj na inicjalizację połączenia
time.sleep(2)
print("płyta podlaczona")
# Określenie pinu LED
led_pin = board.get_pin('d:13:o')

while True:
    led_pin.write(1)  # Włącz diodę LED
    print("LED ON")
    time.sleep(0.5)
    led_pin.write(0)  # Wyłącz diodę LED
    print("LED OFF")
    time.sleep(0.5)

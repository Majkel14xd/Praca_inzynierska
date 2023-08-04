import time
import serial


def send_at_command(command):
    board.write(command.encode() + b'\r\n')
    time.sleep(1)
    response = board.read_all().decode()
    return response


port = 'COM3'
board = serial.Serial(port, 115200)

# Wysyłamy komendę AT, aby upewnić się, że moduł jest gotowy
print("Checking AT response...")
response = send_at_command('AT')
print(response)

# Ustawiamy tryb
print("Setting mode to Access Point (AP)...")
response = send_at_command('AT+CWMODE=1')
print(response)

# Łączymy się z siecią Wi-Fi jako klient (Station)
print("Connecting to Wi-Fi as Station (Client)...")
response = send_at_command('AT+CWJAP="TP-Link_9274","55827812"')
print(response)

# Sprawdzamy połączenie Wi-Fi
print("Checking Wi-Fi connection...")
response = send_at_command('AT+CWJAP?')
print(response)

# Zamknij połączenie z modułem ESP8266
board.close()

from pyfirmata import Arduino
from pyfirmata.util import Iterator
import time

POWER_PIN = 7
SIGNAL_PIN = 5
sensorvalue = 0
port = 'COM3'
board = Arduino(port)
power_pin = board.get_pin('d:7:o')
analog_pin = board.get_pin('a:5:i')
power_pin.write(0)
it = Iterator(board)
it.start()
while True:
    power_pin.write(1)
    time.sleep(1)
    analog_pin.enable_reporting()
    sensorvalue = analog_pin.read()
    power_pin.write(0)
    print(f"Sensor value: {sensorvalue}")
    time.sleep(1)

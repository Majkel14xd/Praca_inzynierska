from pymata4 import pymata4
import time

POWER_PIN = 7
SIGNAL_PIN = 5
sensorvalue = 0
port = 'COM3'
board = pymata4.Pymata4(port)
board.set_pin_mode_digital_output(POWER_PIN)
board.set_pin_mode_analog_input(SIGNAL_PIN)

while True:
    board.digital_write(POWER_PIN, 1)
    time.sleep(1)
    sensorvalue = board.analog_read(SIGNAL_PIN)
    board.digital_write(POWER_PIN, 0)
    print(f"Sensor value: {sensorvalue[0]}")
    time.sleep(1)

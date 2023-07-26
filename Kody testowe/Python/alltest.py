from pymata4 import pymata4
import time

port = 'COM3'
board = pymata4.Pymata4(port)
time.sleep(2)
print("Board connected")

SIGNAL_PIN_WATER_SENSOR = 5
TRIGPIN = 9
ECHOPIN = 10
SIGNAL_PIN_RAIN_SENSOR = 0

board.set_pin_mode_analog_input(SIGNAL_PIN_WATER_SENSOR)
board.set_pin_mode_analog_input(SIGNAL_PIN_RAIN_SENSOR)


def ultrasonic_val(ultrasonic_sensor_value):
    print("Ultrasonic Sensor value: ", ultrasonic_sensor_value[2])


board.set_pin_mode_sonar(TRIGPIN, ECHOPIN, ultrasonic_val)


def rain_sensor():
    rain_sensor_value = board.analog_read(SIGNAL_PIN_RAIN_SENSOR)
    return rain_sensor_value[0]


def ultrasonic():
    board.sonar_read(TRIGPIN)


def water_sensor():
    sensorvalue = board.analog_read(SIGNAL_PIN_WATER_SENSOR)
    return sensorvalue[0]


while True:
    water_value = water_sensor()
    ultrasonic()
    rain_value = rain_sensor()
    print(f"Water_sensor value: {water_value}")
    print(f"Rain_sensor value: {rain_value}")
    time.sleep(0.5)

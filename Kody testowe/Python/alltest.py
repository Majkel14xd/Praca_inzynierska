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
ultrasonic_sensor_value = 0
board.set_pin_mode_analog_input(SIGNAL_PIN_WATER_SENSOR)
board.set_pin_mode_analog_input(SIGNAL_PIN_RAIN_SENSOR)
board.set_pin_mode_sonar(TRIGPIN, ECHOPIN, ultrasonic_sensor_value)
time.sleep(2)


def rain_sensor():
    rain_sensor_value = board.analog_read(SIGNAL_PIN_RAIN_SENSOR)
    return rain_sensor_value[0]


def ultrasonic():
    ultrasonic_sensor_value = board.sonar_read(TRIGPIN)
    return ultrasonic_sensor_value[0]


def water_sensor():
    sensorvalue = board.analog_read(SIGNAL_PIN_WATER_SENSOR)
    return sensorvalue[0]


while True:
    print(f"Water_sensor value: {water_sensor()}")
    print(f"Ulstrasonic value: {ultrasonic()}")
    print(f"Rain_sensor value: {rain_sensor()}")
    time.sleep(0.5)

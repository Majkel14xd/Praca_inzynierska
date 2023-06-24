from pyfirmata import Arduino, util
import time
port = 'COM4'
board = Arduino(port)
it = util.Iterator(board)
it.start()
time.sleep(2)
print("Board connected")
sensor_power = board.get_pin('d:7:o')
sensor_pin = board.get_pin('d:8:i')
sensor_power.write(0)


def readSensor():
    sensor_power.write(1)
    time.sleep(1)

    val = sensor_pin.read()
    sensor_power.write(0)
    return val


while True:
    val = readSensor()
    print("Digital output")
    print("Value sensor is ", val)

    if val:
        print("Status: Clear")
    else:
        print("Status: It's raining")
    time.sleep(1)
    print(" ")

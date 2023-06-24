import time
from pymata4 import pymata4
port = 'COM4'
board = pymata4.Pymata4()
trigpin = 9
echopin = 10
time.sleep(2)
print("Board connected")


def distanceprint(data):
    print("Distance", data)


board.set_pin_mode_sonar(trigpin, echopin, distanceprint)

while True:
    try:
        time.sleep(0.1)
        board.sonar_read(trigpin)
    except Exception:
        board.shutdown()

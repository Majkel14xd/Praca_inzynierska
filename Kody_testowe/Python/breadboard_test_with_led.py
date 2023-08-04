import time
from pyfirmata import Arduino, util

port = 'COM5'
board = Arduino(port)
it = util.Iterator(board)
it.start()
time.sleep(2)
print("Board connected")
led_pin = board.get_pin('d:12:o')

while True:
    led_pin.write(1)
    print("LED ON")
    time.sleep(0.5)
    print("LED OFF")
    led_pin.write(0)
    time.sleep(0.5)

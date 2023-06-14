from pyfirmata import Arduino
import time
port = 'COM3'  
board = Arduino(port)
time.sleep(2)
print("płyta podlaczona")
led_pin = board.get_pin('d:13:o')
while True:
    led_pin.write(1)  
    print("LED ON")
    time.sleep(0.5)
    led_pin.write(0)  
    print("LED OFF")
    time.sleep(0.5)

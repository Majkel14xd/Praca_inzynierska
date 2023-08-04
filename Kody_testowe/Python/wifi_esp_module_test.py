import time
import serial
port = 'COM5'
board = serial.Serial(port, 115200)
board.write(b'AT\r\n')
time.sleep(1)
response = board.read_all()
print(response)
board.write(b'AT+CWMODE=2\r\n')
time.sleep(1)
response = board.read_all()
print(response)
board.write(b'AT+CWSAP?\r\n')
time.sleep(1)
response = board.read_all()
print(response)
board.close()

#!/usr/bin/python

from time import sleep
import serial

ser = serial.Serial('/dev/ttyUSB0', 9600)
counter = 32

while counter < 35:
     counter +=1
     ser.write(str(chr(counter))) # Convert the decimal number to ASCII then send it to the Arduino
     print ser.readline() # Read the newest output from the Arduino
     sleep(2) # Delay for one tenth of a second
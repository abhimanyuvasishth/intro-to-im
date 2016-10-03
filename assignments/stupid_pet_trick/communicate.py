#!/usr/bin/python

from time import sleep
import serial

ser = serial.Serial('/dev/ttyUSB0', 9600)
ser.write(str(chr(97))) # Convert the decimal number to ASCII then send it to the Arduino ('a')
print ser.readline() # Read the newest output from the Arduino
sleep(0.1) # Delay for one tenth of a second
import cv2
import time
import serial
import pygame

pygame.init()

# For facial recognition
# https://github.com/shantnu/Webcam-Face-Detect
# https://realpython.com/blog/python/face-detection-in-python-using-a-webcam/

# For communicating with arduino from python
# http://www.instructables.com/id/Interface-Python-and-Arduino-with-pySerial/

faceCascade = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
video_capture = cv2.VideoCapture(0)
ser = serial.Serial('/dev/ttyUSB0', 9600)
flag = 0
sleep_start = 0
count = 0

def send_message():
    ser.write(str(chr(55))) # Convert the decimal number to ASCII then send it to the Arduino
    print ser.readline() # Read the newest output from the Arduino

    # sound from here: http://soundbible.com/769-Hello.html
    pygame.mixer.music.load("hello.wav")
    pygame.mixer.music.play()

while True:
    # Capture frame-by-frame
    ret, frame = video_capture.read()
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    faces = faceCascade.detectMultiScale(
        gray,
        scaleFactor=1.1,
        minNeighbors=5,
        minSize=(30, 30),
        flags=cv2.cv.CV_HAAR_SCALE_IMAGE
    )

    # Draw a rectangle around the faces
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)

    # Display the resulting frame
    cv2.imshow('Video', frame)

    if len(faces) > count and flag == 0:
        flag = 1
        if int(time.time()) - sleep_start >= 3:
            print "hello there "
            send_message()
        else:
            print "back too quickly "    
        sleep_start = int(time.time())

    if len(faces) <= count and flag == 1:
        sleep_start = int(time.time())
        print "sleep start changed " + str(sleep_start)
        flag = 0

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything is done, release the capture
video_capture.release()
cv2.destroyAllWindows()
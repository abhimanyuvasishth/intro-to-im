#include <Servo.h>

Servo myServo;

void setup() {
  Serial.begin(9600); // set the baud rate
  myServo.attach(9);
  Serial.println("READY");
  myServo.write(105);
}

void loop() {
  char inByte = ' ';
  if(Serial.available()){ // only send data back if data has been sent
    char inByte = Serial.read(); // read the incoming data
    if (inByte){
      wave();
      myServo.write(105);
    }
  }
  delay(100); // delay for 1/10 of a second
}

void wave(){
  Serial.println("WAVING");
  myServo.write(90);
  delay(200);
  myServo.write(120);
  delay(200);

  myServo.write(90);
  delay(200);
  myServo.write(120);
  delay(200);
}


#include <Servo.h>

Servo myServo;

int potPin = 0;
int val;

void setup() {
  // put your setup code here, to run once:
  myServo.attach(9);

}

void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(potPin);
  val = map(val, 0, 1023, 0, 180);
  myServo.write(val);
  delay(15);
}

int motor = 9;
int led = 13;
int timeCounter = 0;
float pi = 3.1415;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 13 as an output.
  pinMode(motor, OUTPUT);
  pinMode(led, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  int angle = timeCounter*pi/180;
  analogWrite(motor, 70+20*sin(angle));
  delay(10);
  timeCounter++;
}

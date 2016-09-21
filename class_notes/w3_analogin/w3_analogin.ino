const int potPin = A0;
const int ledPin = 3;

int sensorVal;
int ledBright;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  sensorVal = analogRead(potPin);
  ledBright = sensorVal/4;        // Divide by 4 to scale appropriately
  analogWrite(ledPin, ledBright); // PWM the LED
  delay(2);
}

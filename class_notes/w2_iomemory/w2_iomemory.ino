const int ledPin = 7;
const int potPin = A5;
int sensorVal;

void setup() {
  // put your setup code
  pinMode(ledPin,OUTPUT);
  pinMode(potPin,INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int delayTime;
  sensorVal = analogRead(potPin);
  Serial.println(sensorVal);
  delayTime = sensorVal; // Values between 0 and 1023

  digitalWrite(ledPin,HIGH);
  delay(delayTime);
  digitalWrite(ledPin,LOW);
  delay(delayTime);
}

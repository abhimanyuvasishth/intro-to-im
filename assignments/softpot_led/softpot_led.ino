/*
SparkFun Inventor's Kit 
Based on the example sketch 10
*/

const int pins[10] = {2,3,4,6,7,8,9,10,11,12};
const int SENSOR_PIN = 0;      // Analog input pin
int num = 0;

void setup(){
  // No need for any code here
  // analogWrite() sets up the pins as outputs
  Serial.begin(9600);
}

void loop(){
  int sensorValue;
  int delayNum = 1000;
  // Read the voltage from the softpot (0-1023)
  sensorValue = analogRead(SENSOR_PIN);
  if (sensorValue < 10){
    switchOffLeds(100);
  }
  else {
    sensorValue = map(sensorValue,0,1023,0,9);
    Serial.println(sensorValue);
    digitalWrite(pins[sensorValue],HIGH); 
    delay(100);
    switchOffLeds(sensorValue);
  }
}

void switchOffLeds(int value){
  for (int i = 0; i < 10; i++){
    if (i == value){
      break;
    }
    digitalWrite(pins[i],LOW); 
  }
}

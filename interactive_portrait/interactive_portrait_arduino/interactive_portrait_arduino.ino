#define trigPin 10                                   //Trig Pin, Sensor 
#define echoPin 13                                   //Echo Pin, Reactor 
int reading;  
int counter;

void setup() {
  Serial.begin (9600);                               //Starts Communication
  pinMode(trigPin, OUTPUT); 
  pinMode(2, INPUT_PULLUP);  
  pinMode(3, INPUT_PULLUP);  
  pinMode(echoPin, INPUT);
  reading = 0;
  counter = 0;
}

void loop() {
  float duration, distance;                         
  
  digitalWrite(trigPin, LOW);                       //Short LOW pulse
  delayMicroseconds(2);                             
  digitalWrite(trigPin, HIGH);                      //Sensor triggered by a HIGH pulse of 10 or more microseconds
  delayMicroseconds(10);                          
  digitalWrite(trigPin, LOW);
  
  duration = pulseIn(echoPin, HIGH);                //Read signal from sensor: HIGH pulse's duration is length of time it takes for the ping to go from trig to echo 
  distance = (duration / 2) * 0.0344;               //Translate time mentioned above into distance (accurate to cm) 
  int temp = digitalRead(2);
  if (temp != reading){
    counter++;
    reading = temp;
    if (counter >= 5){
      Serial.print(1);
      counter = 0;
    }
    else {
      Serial.print(0);
    }
  }
  else {
    Serial.print(0);
  }
  
//  Serial.print(!digitalRead(2));
  Serial.print(',');
  
  if (distance < 150){            //The maximum input is of 55 cm, so 55 in arduino is = height in Processing 
    Serial.print("1");
    delay(1);
  }
  else {
    Serial.print("0");                       //Sending prints to processing so it can map out the distance values to y values in the sketch 
    delay(1);
  }
  Serial.print(',');
  Serial.println(!digitalRead(3));
  delay(50);
}

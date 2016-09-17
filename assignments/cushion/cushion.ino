

/*
 Turns on and off a light emitting diode(LED) connected to digital  
 pin 12, when pressing a pushbutton attached to pin 2. 

 Additionally, it turns on and off a light emitting diode(LED) connected to digital  
 pin 8, when pressing a pushbutton attached to pin 7. 
 
 This example code is in the public domain.

 Based on this tutorial by Tom Igoe: http://www.arduino.cc/en/Tutorial/Button
 */

// constants won't change. They're used here to 
// set pin numbers:
const int buttonPin = 2;     // the number of the pushbutton pin
const int ledPin =  12;      // the number of the LED pin
const int leverPin = 7;
const int ledPin2 = 8;

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status
int buttonState2 = 0;         // variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  Serial.begin(9600);  
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);     
  pinMode(leverPin, INPUT);     
}

void loop(){
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  buttonState2 = digitalRead(leverPin);

  // check if the pushbutton is pressed.
  // if it is, the buttonState is HIGH:
  if (buttonState == HIGH) {     
    // turn LED on:    
    digitalWrite(ledPin, HIGH);  
    Serial.println("FARTS!!!");
  } 
  else {
    // turn LED off:
    digitalWrite(ledPin, LOW); 
  }

  if (buttonState2 == HIGH) {     
    // turn LED on:    
    digitalWrite(ledPin2, HIGH);  
    Serial.println("PULLSS!!!");
  } 
  else {
    // turn LED off:
    digitalWrite(ledPin2, LOW); 
  }
}

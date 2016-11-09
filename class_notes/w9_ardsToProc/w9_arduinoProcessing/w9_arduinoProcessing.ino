String msg;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(12,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  /* Send output from sensor */
  Serial.println(analogRead(A0));

  /* Read from processing */
  while (Serial.available()){
    msg = Serial.readString();
    msg.trim();
    if (msg == "on"){
      digitalWrite(12,HIGH);
    }
    else if (msg = "off"){
      digitalWrite(12,LOW);
    }
  }
  delay(10);
}

void setup() {
  // put your setup code here, to run once:
  for (int x = 2; x <= 4; x++){
    pinMode(x, INPUT_PULLUP);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  
  if (digitalRead(2) == LOW){
    tone(8, 440, 20);
  }
  else if (digitalRead(3) == LOW ){
    tone(8, 494, 20);
  }
  else if (digitalRead(4) == LOW){
    tone(8, 131, 20);
  }
  else {
    noTone(8);
  }
}

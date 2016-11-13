int joyX = A0;
int joySel = 4;
int gun = 2;
int val, sel, shoot;
boolean isDown = false;

void setup() {
  // put your setup code here, to run once:
  pinMode(joyX, INPUT);
  pinMode(joySel, INPUT_PULLUP);
  pinMode(gun, INPUT_PULLUP);
  Serial.begin(9600);
  val = 0;
  sel = 0;
  shoot = 0;
}

void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(joyX);
  sel = !digitalRead(joySel);
  Serial.print(val);
  Serial.print(',');
  Serial.print(sel);
  Serial.print(',');  
  if(digitalRead(gun) == LOW){
    if(!isDown){
      shoot = 1;
      isDown = true;
      Serial.println(shoot);
    }
    else {
      shoot = 0;
      Serial.println(shoot);
    }
  }
  else{
    isDown = false;
    shoot = 0;
    Serial.println(shoot);
  }
  delay(10);
}

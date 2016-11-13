// http://www.journaldev.com/378/java-util-concurrentmodificationexception
import java.util.Iterator;
import processing.serial.*;

Serial myPort;
Weapon weapon;
ArrayList<Bullet> aliveBullets;
ArrayList<Banknote> aliveNotes;
boolean left, right;
int bulletCounter, survivors, score, totalBullets;
boolean gameOver;
float mappedSpeed;
float receiveSpeed;
float launchTime;

void setup(){
  size(600,600);
  setupPort();
  init();
}

void setupPort(){
  //Use 'println(Serial.list());' to get your port name:
  String portName = "/dev/ttyUSB0";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); //Reads until endline character. This works well when we "Serial.println" from Arduino.
}

void init(){
  weapon = new Weapon();
  receiveSpeed = 0;
  mappedSpeed = 0;
  aliveBullets = new ArrayList<Bullet>();
  aliveNotes = new ArrayList<Banknote>();
  survivors = 0;
  score = 0;
  bulletCounter = 0;
  totalBullets = 100;
  launchTime = 0;
  gameOver = true;
  for (int i = 0; i < 100; i++){
    Banknote note = new Banknote();
    aliveNotes.add(note);
  }
}

void draw(){
  background(255);
  if (gameOver){
    text(score,width/2,height/4);
    text(bulletCounter,width/2,height/2);
    text(survivors,width/2,3*height/4);
  }
  else {
    if (left) weapon.move("left");
    if (right) weapon.move("right");
    Iterator<Bullet> bulletIt = aliveBullets.iterator();
    while(bulletIt.hasNext()){
      Bullet bullet = bulletIt.next();
      if (!bullet.isAlive) bulletIt.remove();
      else {
        bullet.display();
        bullet.move();
      }
    }
    Iterator<Banknote> bankIt = aliveNotes.iterator();
    while(bankIt.hasNext()){
      Banknote note = bankIt.next();
      if (!note.isAlive) bankIt.remove();
      else {
        note.display();
        note.move();  
      }
    }
    weapon.display();
    if (aliveNotes.size() == 0) gameOver = true;
  }
}

void keyPressed(){
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased(){
  if (keyCode == UP && gameOver) {
    init();
    gameOver = false;
  }
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (key == ' ' && !gameOver) weapon.fire();
}

//Listen for received messages:
void serialEvent(Serial  myPort) {
  String message = myPort.readString();   //Reads serial data as string  
  message = message.trim();               //Trim whitespaces
  String[] list = message.split(",");
  receiveSpeed = float(list[0]);          //Converts from string to float
  if (receiveSpeed < 550 && receiveSpeed > 450) mappedSpeed = 0;
  else if (receiveSpeed < 450 || receiveSpeed > 550) mappedSpeed = map(receiveSpeed,0,1023,-3,3);
  else mappedSpeed = 0;
  weapon.move(mappedSpeed);
  if (float(list[1]) == 1 && gameOver){
    init();
    gameOver = false;
  }
  if (float(list[2]) == 1 && millis() > launchTime + 100) {
    weapon.fire();
    launchTime = millis();
  }
}
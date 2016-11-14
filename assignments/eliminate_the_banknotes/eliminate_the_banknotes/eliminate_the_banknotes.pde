// Images: http://www.123rf.com/photo_8422535_indian-rupee-bank-notes-background.html
// http://www.journaldev.com/378/java-util-concurrentmodificationexception
import java.util.Iterator;
import processing.serial.*;

Serial myPort;
Weapon weapon;
ArrayList<Bullet> aliveBullets;
ArrayList<Bullet> additionalBullets;
ArrayList<Banknote> aliveNotes;
boolean left, right;
int bulletCounter, survivors, score, totalBullets;
boolean gameOver;
float mappedSpeed, receiveSpeed, launchTime;
PImage bg;

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
  bg = loadImage("data/bg.png");
  bg.resize(width,height);
  weapon = new Weapon();
  receiveSpeed = 0;
  mappedSpeed = 0;
  aliveBullets = new ArrayList<Bullet>();
  additionalBullets = new ArrayList<Bullet>();
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
  background(bg);
  if (gameOver){
    if (score > 0){
      fill(180,0,0);
      textSize(100);
      text("GAME OVER",width/35,height/2);
      fill(128,0,0);
      textSize(50);
      text("SCORE: " + score,width/3.5,height*0.6);
      fill(0,0,0);
      textSize(20);
      text("Tap the joystick to restart!",width/3.5,height*0.9);
    }
    else {
      fill(128,0,0);
      textSize(75);
      text("ELIMINATE THE",width/25,height*0.45);
      fill(180,0,0);
      textSize(100);
      text("BANKNOTES",width/75,height*0.6);
      fill(0,0,0);
      textSize(20);
      text("Tap the joystick to restart!",width/3.5,height*0.9);
    }
  }
  else {
    fill(map(bulletCounter,0,100,0,255),0,0);
    textSize(30);
    int bullets = totalBullets-bulletCounter;
    text("BULLETS: " + bullets,width*0.6,height*0.1);  
    fill(180,0,0);
    textSize(30);
    text("SCORE: " + score,width*0.02,height*0.1);
    if (left) weapon.move("left");
    if (right) weapon.move("right");
    Iterator<Bullet> bulletAdd = additionalBullets.iterator();
    while (bulletAdd.hasNext()){
      Bullet bullet = bulletAdd.next();
      aliveBullets.add(bullet);
      bulletAdd.remove();
    }
    
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
  if (float(list[2]) == 1 && millis() > launchTime + 50) {  
    weapon.fire();
    launchTime = millis();
  }
}
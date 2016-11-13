// http://www.journaldev.com/378/java-util-concurrentmodificationexception
import java.util.Iterator;

Weapon weapon;
ArrayList<Bullet> aliveBullets;
ArrayList<Banknote> aliveNotes;
boolean left, right;
int bulletCounter, survivors, score, totalBullets;
boolean gameOver;

void setup(){
  size(600,600);
  init();
}

void init(){
  weapon = new Weapon();
  aliveBullets = new ArrayList<Bullet>();
  aliveNotes = new ArrayList<Banknote>();
  bulletCounter = 0;
  totalBullets = 100;
  survivors = 0;
  score = 0;
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
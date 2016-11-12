// http://www.journaldev.com/378/java-util-concurrentmodificationexception
import java.util.Iterator;

Weapon weapon;
ArrayList<Bullet> aliveBullets;
ArrayList<Banknote> aliveNotes;
boolean left, right;
int bulletCounter;

void setup(){
  size(600,600);
  weapon = new Weapon();
  aliveBullets = new ArrayList<Bullet>();
  aliveNotes = new ArrayList<Banknote>();
  bulletCounter = 0;
  for (int i = 0; i < 100; i++){
    Banknote note = new Banknote();
    aliveNotes.add(note);
  }
}

void draw(){
  background(255);
  if (left) weapon.move("left");
  if (right) weapon.move("right");
  Iterator<Bullet> bulletIt = aliveBullets.iterator();
  while(bulletIt.hasNext()){
    if (!bulletIt.next().isAlive) bulletIt.remove();
  }
  Iterator<Banknote> bankIt = aliveNotes.iterator();
  while(bankIt.hasNext()){
    if (!bankIt.next().isAlive) bankIt.remove();
  }
  
  for (Bullet bullet : aliveBullets){
    bullet.display();
    bullet.move();
  }
  for (Banknote note : aliveNotes){
    note.display();
    note.move();
  }
  weapon.display();
  if (aliveNotes.size() == 0) println("game over");
}

void keyPressed(){
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased(){
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (key == ' ') weapon.fire();
}
Weapon weapon;
ArrayList<Bullet> aliveBullets;
ArrayList<Banknote> aliveNotes;
boolean left, right;

void setup(){
  size(600,600);
  weapon = new Weapon();
  aliveBullets = new ArrayList<Bullet>();
  aliveNotes = new ArrayList<Banknote>();
  for (int i = 0; i < 100; i++){
    Banknote note = new Banknote();
    aliveNotes.add(note);
  }
}

void draw(){
  background(255);
  if (left) weapon.move("left");
  if (right) weapon.move("right");
  for (Bullet bullet : aliveBullets){
    bullet.display();
    bullet.move();
  }
  for (Banknote note : aliveNotes){
    if (note.isAlive){
      note.display();
      note.move();
    }
  }
  weapon.display();
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
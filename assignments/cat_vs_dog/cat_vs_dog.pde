import processing.sound.*;

float easing = 0.05;

boolean up = false, down = false, w = false, s = false;
boolean gameOver = true, displayWinner = false;
boolean readyUp = false, readyDown = false, getReadyGo = false;
int readyTime, finishTime;

PImage cat, dog, bigCat, bigDog;

Ship ship1, ship2, winner;
Ship[] ships;

int numStars = 800;
Star[] stars = new Star[numStars];

void setup(){
  size(600,600);
  
  ship1 = new Ship("Cat", this);
  ship2 = new Ship("Dog", this);
  
  cat = loadImage("data/squareCat.png");
  bigCat = loadImage("data/squareCat.png");
  dog = loadImage("data/squareDog.png");
  bigDog = loadImage("data/squareDog.png");
  cat.resize((int)(height/4),(int)(height/4));
  dog.resize((int)(height/4),(int)(height/4));
  bigCat.resize((int)(height/2),(int)(height/2));
  bigDog.resize((int)(height/2),(int)(height/2));
  
  ships = new Ship[]{ship1,ship2};
  finishTime = 0;
}

void draw(){
  background(0);
  
  if (gameOver){
    noStroke();
    if ((w || s) && !displayWinner) readyUp = true;
    if ((up || down) && !displayWinner) readyDown = true;
    
    if (readyUp && !getReadyGo) fill(0,255,0);
    else fill(0);
    rect(0,0,width,height*0.5);
    image(cat,width*0.5-cat.width*0.5,height*0.25-cat.height*0.5);
    
    if (readyDown && !getReadyGo) fill(0,255,0);
    else fill(0);
    rect(0,height*0.5,width,height);
    image(dog,width*0.5-dog.width*0.5,height*0.75-dog.height*0.5);
    
    if (readyUp && readyDown && !getReadyGo){
      readyTime = millis();
      getReadyGo = true;
    }
    if (getReadyGo) getReadyGo();
  }
  else {
    for (int i = 0; i < numStars; i++){
      stars[i].move();
      stars[i].display();
    }
    ship1.display();
    ship2.display();
    if (w) ship1.move("up");
    if (s) ship1.move("down");
    if (up) ship2.move("up");
    if (down) ship2.move("down");
  }
  stroke(255);
  strokeWeight(3);
  line(0,height/2,width,height/2);
  if (displayWinner) displayWinner();
}

void getReadyGo(){
  noStroke();
  if (millis() < readyTime + 1000){
    fill(255,255,0);
    ellipse(width*0.5,height*0.25,150,150);
    ellipse(width*0.5,height*0.75,150,150);
  }
  else if (millis() < readyTime + 2000){
    fill(255,0,255);
    ellipse(width*0.5,height*0.25,150,150);
    ellipse(width*0.5,height*0.75,150,150);
  }
  else if (millis() < readyTime + 3000){
    fill(0,255,255);
    ellipse(width*0.5,height*0.25,150,150);
    ellipse(width*0.5,height*0.75,150,150);
  }
  else {
    createStars();
    gameOver = false;
    getReadyGo = false;
    readyUp = false;
    readyDown = false;
  } 
}

void createStars(){
  for (int i = 0; i < numStars; i=i+2){
    float xPos = random(width,11*width);
    float yPos = random(height/2);
    float rad = random(1,3);
    float speed = random(0.5,3);
    Star starUp = new Star(xPos,yPos,rad, speed);
    Star starDown = new Star(xPos,yPos+height/2,rad, speed);
    stars[i] = starUp;
    stars[i+1] = starDown;
  }  
}

void endGame(Ship loser){
  gameOver = true;
  displayWinner = true;
  finishTime = millis() + 3000;

  for (Ship ship : ships){
    ship.numCollisions = 0;
    if (ship.player != loser.player) winner = ship;
  }
  winner.score++;
  println(winner.player + " WINS!!!");
  println("CAT: " + ships[0].score + " | DOG: " + ships[1].score);
  fill(0,0,200);
}

void displayWinner(){
  if (millis() < finishTime){
    noStroke();
    fill(random(0,85), random(85,170), random(175,255));
    rect(0,0,width,height);
    if (winner.player == "Cat") {
      image(bigCat,width*0.5-bigCat.width*0.5,height*0.5-bigCat.height*0.5);
    }
    else {
      image(bigDog,width*0.5-bigDog.width*0.5,height*0.5-bigDog.height*0.5);
    }
  }
  else {
    fill(0);
    displayWinner = false;    
  }
}

void keyPressed(){
  if (keyCode == UP) up = true;
  if (keyCode==DOWN) down = true;
  if (key=='w') w=true;
  if (key=='s') s=true;
}

void keyReleased(){
  if (keyCode == UP) up = false;
  if (keyCode==DOWN) down = false;
  if (key=='w') w=false;
  if (key=='s') s=false;
}
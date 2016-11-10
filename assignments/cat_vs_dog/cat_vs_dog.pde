import processing.sound.*;

float easing = 0.05;

// Booleans that map to key pressed and released. This allows two people to hold
// a key simultaneously without interrupting each other.
boolean up = false, down = false, w = false, s = false;
boolean right = false, left = false, a = false, d = false;

// Booleans for the different stages of the game
boolean gameOver = true, displayWinner = false, getReadyGo = false, intro = true;
int readyTime, finishTime;

// Images and image arrays for the story
PImage cat, dog, bigCat, bigDog, bg;
PImage[] cats = new PImage[5];
PImage[] dogs = new PImage[5];

Animal winner;
Animal[] animals = new Animal[2];

// A counter to increment the story
int countUp = 0, countDown = 0;

int numStars = 100;
Star[] stars = new Star[numStars];

void setup(){
  size(600,600);
  
  // Initializing the Animals
  animals[0] = new Animal("Cat", this);
  animals[1] = new Animal("Dog", this);
  
  // Initializing the images
  bg = loadImage("data/background600.jpg");
  bg.resize(width,height);
  cat = loadImage("data/squareCat.png");
  bigCat = loadImage("data/squareCat.png");
  dog = loadImage("data/squareDog.png");
  bigDog = loadImage("data/squareDog.png");
  
  cats[0] = loadImage("data/deskCat600Start.png");
  cats[1] = loadImage("data/CatToBoss600_1.png");
  cats[2] = loadImage("data/BossToCat600_1.png");
  cats[3] = loadImage("data/BossToCat600_2.png");
  cats[4] = loadImage("data/CatToBoss600_2.png");
  
  dogs[0] = loadImage("data/deskDog600Start.png");
  dogs[1] = loadImage("data/DogToBoss600_1.png");
  dogs[2] = loadImage("data/BossToDog600_1.png");
  dogs[3] = loadImage("data/BossToDog600_2.png");
  dogs[4] = loadImage("data/DogToBoss600_2.png");
  
  // Resizing the image to fit a dynamic width and height
  for (PImage dog: dogs){
    dog.resize((int)(width),(int)(height/2));  
  }
  
  for (PImage cat: cats){
    cat.resize((int)(width),(int)(height/2));  
  }
  
  cat.resize((int)(height/4),(int)(height/4));
  dog.resize((int)(height/4),(int)(height/4));
  bigCat.resize((int)(height/2),(int)(height/2));
  bigDog.resize((int)(height/2),(int)(height/2));
 
  finishTime = 0;
}

void draw(){
  background(bg);
  // Intro plays the introductory storyline before the game starts
  if (intro){
    image(cats[countUp],0,0);
    image(dogs[countDown],0,height/2);
    if (countDown == 4 && countUp == 4){
      intro = false;
      getReadyGo = true;
    } 
  }
  else if (gameOver && !intro){
    if (getReadyGo) {
      getReadyGo();
    }
  }
  // The game has started!!
  else {
    for (int i = 0; i < numStars; i++){
      if (stars[i].x < width && stars[i].x > 0){
        stars[i].display();
      }
      stars[i].move();
    }
    animals[0].display();
    animals[1].display();
    // Since the keyboards faced opposite directions, pressing w would make the 
    // animal in the upper frame move down but up relative to the player 
    if (w) animals[0].move("down");
    if (s) animals[0].move("up");
    if (up) animals[1].move("up");
    if (down) animals[1].move("down");
  }
  stroke(255);
  strokeWeight(3);
  line(0,height/2,width,height/2);
  if (displayWinner) displayWinner();
}

void getReadyGo(){
  noStroke();
  createStars();
  gameOver = false;
  getReadyGo = false;
}

// This function was taken out of the setup function so that the game could restart
// Without stopping and starting it on processing
void createStars(){
  for (int i = 0; i < numStars; i=i+2){
    float xPos = random(width,5*width);
    float yPos = random(10,height/2-10);
    float speed = random(width/1200,width/200);
    Star starUp = new Star(xPos,yPos, speed);
    Star starDown = new Star(xPos,yPos+height/2, speed);
    stars[i] = starUp;
    stars[i+1] = starDown;
  }  
}

void endGame(Animal loser){
  gameOver = true;
  displayWinner = true;
  countUp = 0;
  countDown = 0;
  intro = true;
  finishTime = millis();
  
  // Resetting the lives to 10
  for (Animal animal : animals){
    animal.numCollisions = 0;
    animal.y = (animal.player == "Cat") ? 0.25*height : 0.75* height;
    if (animal.player != loser.player) winner = animal;
  }
  winner.score++;
  println(winner.player + " WINS!!!");
  println("CAT: " + animals[0].score + " | DOG: " + animals[1].score);
}

// Displaying the winner with a flashy blue background
void displayWinner(){
  if (millis() < finishTime + 1500){
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
    displayWinner = false;    
  }
}

void keyPressed(){
  if (keyCode == UP) up = true;
  if (keyCode==DOWN) down = true;
  if (keyCode==RIGHT) right = true;
  if (key=='w') w=true;
  if (key=='s') s=true;
  if (key=='d') d=true;
}

// The key released function is only called once so we could increment the 
// counter that updates the story here
void keyReleased(){
  if (keyCode == UP) up = false;
  if (keyCode==DOWN) down = false;
  if (keyCode==RIGHT) {
    right = false;
    if (countDown < 4){
      countDown++;
    }
  }
  if (key=='w') w=false;
  if (key=='s') s=false;
  if (key=='d') {
    d=false;
    if (countUp < 4){
      countUp++;
    }
  }
}
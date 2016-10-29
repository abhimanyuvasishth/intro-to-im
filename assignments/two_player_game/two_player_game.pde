float easing = 0.05;
boolean up = false, down = false, w = false, s = false;
boolean gameOver = true, readyUp = false, readyDown = false, getReadyGo = false;
Ship ship1;
Ship ship2;
int scoreUp = 0;
int scoreDown = 0;
int numStars = 200;
int readyTime;
Star[] stars = new Star[numStars];

void setup(){
  size(600,600);
  ship1 = new Ship(1);
  ship2 = new Ship(2);
  for (int i = 0; i < numStars; i=i+2){
    float xPos = random(10*width);
    float yPos = random(height/2);
    float rad = random(1,3);
    float speed = random(0.5,3);
    Star starUp = new Star(xPos,yPos,rad, speed);
    Star starDown = new Star(xPos,yPos+height/2,rad, speed);
    stars[i] = starUp;
    stars[i+1] = starDown;
  }
}

void draw(){
  background(0);
  stroke(255);
  line(0,height/2,width,height/2);
  if (gameOver){
    if (w || s) readyUp = true;
    if (up || down) readyDown = true;
    if (readyUp) fill(255,0,0);
    else fill(255,255,255);
    ellipse(width*0.5,height*0.25,100,100);
    if (readyDown) fill(0,255,0);
    else fill(255,255,255);
    ellipse(width*0.5,height*0.75,100,100);
    if (readyUp && readyDown){
      readyTime = millis();
      getReadyGo = true;
      readyUp = false;
      readyDown = false;
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
}

void getReadyGo(){
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
    getReadyGo = false;
    gameOver = false;
  }
}

void keyPressed(){
  if (keyCode == UP){up = true;}
  if (keyCode==DOWN){down = true;}
  if (key=='w'){w=true;}
  if (key=='s'){s=true;}
}

void keyReleased(){
  if (keyCode == UP){up = false;}
  if (keyCode==DOWN){down = false;}
  if (key=='w'){w=false;}
  if (key=='s'){s=false;}
}
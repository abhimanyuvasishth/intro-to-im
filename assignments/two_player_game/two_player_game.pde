float easing = 0.05;
boolean up = false, down = false, w = false, s = false;
Ship ship1;
Ship ship2;
int numStars = 200;
Star[] stars = new Star[numStars];

void setup(){
  size(600,600);
  ship1 = new Ship(1);
  ship2 = new Ship(2);
  for (int i = 0; i < numStars; i=i+2){
    float xPos = random(10*width);
    float yPos = random(height/2);
    float rad = random(0.5,2);
    Star starUp = new Star(xPos,yPos,rad);
    Star starDown = new Star(xPos,yPos+height/2,rad);
    stars[i] = starUp;
    stars[i+1] = starDown;
  }
}

void draw(){
  background(0);
  stroke(255);
  line(0,height/2,width,height/2);
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
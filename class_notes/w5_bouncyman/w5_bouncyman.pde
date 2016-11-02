float posX = 300;
float speedX = 5;
float posY = 100;
float speedY = 5;
float scale = 5;
float speedScale = 0.1;
float colorVal = 20;
float speedColor = 5;
float headG = 0;
boolean keyP = false;
float bodyR = 0;

void setup(){
  size(600,400);
}

void draw(){
  background(random(255),random(255), random(255));
  fill(random(255), random(255), random(255));
  for (int j = 0; j < 100; j++){
    float radius = random(20);
    ellipse(random(600),random(400), radius, radius);  
  }
  
  noStroke();
  fill(255,headG,0);
  
  //head
  ellipse(posX,posY,scale*10,scale*10);
  fill(255);
  
  //eyes
  ellipse(posX+scale*2,posY-scale,scale*3,scale*3);
  ellipse(posX-scale*2,posY-scale,scale*3,scale*3);
  fill(0);
  
  //eyeballs
  ellipse(posX+scale*2,posY-scale,scale,scale);
  ellipse(posX-scale*2,posY-scale,scale,scale);
  
  //body
  fill(bodyR,255,40);
  rect(posX-5*scale,posY+5*scale,scale*10,scale*10);
  
  //legs
  fill(colorVal);
  rect(posX+scale,posY+scale*15,scale*4,scale*10);
  rect(posX-scale*5,posY+scale*15,scale*4,scale*10);
  
  if(posX < 5*scale || posX > width-5*scale){speedX = -1*speedX;}
  if (posY > height-5*scale || posY < 5*scale){speedY = -1*speedY;}
  posX = posX + speedX;
  posY = posY + speedY;
  
  if (scale<1 || scale > 10){speedScale = -1*speedScale;}
  scale += speedScale;
  
  if (colorVal <= 0 || colorVal >= 255){speedColor = -1*speedColor;}
  colorVal += speedColor;
  
  ellipse(mouseX, mouseY, 20,20);
  headG = mousePressed? 255:0;
  if (key == 'y'){bodyR = 255;}
  else if (key == 'g'){bodyR = 0;}
}
boolean up = false,down = false,left = false,right = false;
PVector loc, vel, acc;
float rad;

void setup(){
  size(600,400);
  loc = new PVector(300,100);
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  rad = 20;
}

void draw(){
  background(0);
  ballDisplay();
  ballMovement();
  checkBoundaries();
}

void ballDisplay(){
  fill(255, 0, 0);
  ellipse(loc.x, loc.y, rad, rad);  
}

void ballMovement(){
  gravity();
  //friction();
  checkKeys();
  vel.add(acc);
  loc.add(vel);
  acc.mult(0);
  vel.mult(0);
}

void gravity(){
  acc.add(0,2);
}

void friction(){
  vel.mult(0.997);
}

void checkBoundaries(){
  if (loc.x <= rad/2){
    vel.x = -1*vel.x;
    loc.x = rad/2;
  }
  
  if (loc.y <= rad/2){
    vel.y = -1*vel.y;
    loc.y = rad/2;
  }
  
  if (loc.x >= width-rad/2){
    vel.x = -1*vel.x;
    loc.x = width-rad/2;
  }
  
  if (loc.y >= height-rad/2){
    vel.y = -1*vel.y;
    loc.y = height-rad/2;
  }
}

void keyPressed(){
  if (keyCode == UP && !up) up = true;
  if (keyCode == DOWN && !down) down = true;
  if (keyCode == LEFT && !left) left = true;
  if (keyCode == RIGHT && !right) right = true;
}

void keyReleased(){
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}

void checkKeys(){
  if (up) acc.add(0,-10);
  if (down) acc.add(0,2);
  if (left) acc.add(-2,0);
  if (right) acc.add(2,0);
}
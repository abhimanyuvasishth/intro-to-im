PImage bg;
PImage rocket;  
float x,y;
float easing = 0.05;
int numStars = 1000;
Star[] stars = new Star[numStars];

void setup() {
  size(900, 600);
  bg = loadImage("gradient.jpg");   
  // Rocket image: http://pics-about-space.com/space-shuttles-clipart?p=1
  rocket = loadImage("rocket.png");
  x = width/2;
  y = height/2;
  for (int i = 0; i < numStars; i++){
    Star star = new Star(random(0-2*width, 4*width),random(height));
    stars[i] = star;
  }
}

void draw() { 
  background(0,0,10);
  background(bg);
  for (int i = 0; i < numStars; i++){
    stars[i].move();
    stars[i].check();
    stars[i].display();
  }
  
  // Moves the ship up or down with easing following the mouse
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  fill(255);
  
  // Rotates the ship 180 depending on the position of the mouse
  // It also translates to the center since processing rotates about the (0,0) point
  if (mouseX < width/2){
    rotate(radians(180));
    translate(-width, -height);
    image(rocket, x-rocket.width/2,height-y-rocket.height/2, rocket.width, rocket.height);
  }
  else {
    image(rocket, x-rocket.width/2,y-rocket.height/2, rocket.width, rocket.height);  
  }
}
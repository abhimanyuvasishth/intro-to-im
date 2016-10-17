PImage bg;
PImage rocket;  
float screenW = 900; float screenH = 600;
float x = screenW/2;
float y = screenH/2;
float easing = 0.05;
int numStars = 1000;
Star[] stars = new Star[numStars];

void setup() {
  size(900, 600); 
  bg = loadImage("gradient.jpg");  
  
  // I got the image of the rocket from here: 
  // http://pics-about-space.com/space-shuttles-clipart?p=1
  rocket = loadImage("rocket.png");
  
  for (int i = 0; i < numStars; i++){
    Star star = new Star(random(0-2*screenW, 4*screenW),random(screenH),screenW);
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
  if (mouseX < width/2){
    rotate(radians(180));
    translate(-width, -height);
    image(rocket, x-rocket.width/2,height-y-rocket.height/2, rocket.width, rocket.height);
  }
  else {
    image(rocket, x-rocket.width/2,y-rocket.height/2, rocket.width, rocket.height);  
  }
}
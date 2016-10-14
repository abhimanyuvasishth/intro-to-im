float screenW = 900; float screenH = 600;
float x = screenW/2;
float y;
float easing = 0.05;
int numStars = 100;
Star[] stars = new Star[numStars];

void setup() {
  size(900, 600); 
  noStroke();
  for (int i = 0; i < numStars; i++){
    Star star = new Star(random(screenW),random(screenH),screenW);
    stars[i] = star;
  }
}

void draw() { 
  background(51);
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  fill(255);
  ellipse(x, y, 66, 66);
}
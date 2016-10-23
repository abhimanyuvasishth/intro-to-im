float sizeX = 640;
float sizeY = 480;

void setup(){
  size(640,480);
}

void draw(){
  noStroke();
  //fill(random(255), random(255), random(255));
  fill(random(255));
  float rad = random(100);
  ellipse(random(sizeX),random(sizeY),rad,rad);
  ellipse(mouseX+random(-20,20),mouseY+random(-20,20),rad,rad);
}
float sizeX = 640;
float sizeY = 480;

void setup(){
  size(640,480);
}

void draw(){
  fill(random(255));
  float rad = random(100);
  ellipse(random(sizeX),random(sizeY),rad,rad);  
}
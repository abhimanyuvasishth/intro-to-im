float size = 640;
int squares = 20;
float col = 0;

void setup(){
  background(0);
  size(640,640);
}

void draw(){
  noStroke();
  for (int i = 0; i < squares; i ++){
    for (int j = 0; j < squares; j ++){  
      fill(random(255));
      float xVal = size/squares*i + size/(squares*2);
      float yVal = size/squares*j + size/(squares*2);
      float rad = random(size/(squares*2), size/(squares)-10/squares);
      ellipse(xVal, yVal, rad, rad);
    }
  }
}
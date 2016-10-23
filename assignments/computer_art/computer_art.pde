float size = 640;
int squares = 20;
float boxSize = size/squares;
float buffer = size/(squares*2);
float radBuffer = 10/squares;
float outerRad = size/(squares)-radBuffer;

void setup(){
  background(255);
  size(640,640);
  stroke(0);
  noFill();
  // Drawing the outer frame of the circles
  for (int i = 0; i < squares; i++){
    for (int j = 0; j < squares; j++){
      ellipse(boxSize*i+buffer, boxSize*j+buffer, outerRad, outerRad);
    }
  }
}

void draw(){
  stroke(random(255));
  int i = int(random(squares+1));
  int j = int(random(squares+1));
  // Radius is dynamically generated now
  float rad = random(size/(squares)-radBuffer);
  ellipse(boxSize*i+buffer, boxSize*j+buffer, rad, rad);
}
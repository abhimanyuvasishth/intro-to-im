float size = 1200;
int squares = 20;
float boxSize = size/squares;
float buffer = size/(squares*2);
float radBuffer = 10/squares;
float outerRad = size/(squares)-radBuffer;

void setup(){
  background(255-255);
  fill(0);
  size(1200,1200);
  // Drawing the outer frame of the circles
  for (int i = 0; i < squares; i++){
    for (int j = 0; j < squares; j++){
      ellipse(boxSize*i+buffer, boxSize*j+buffer, outerRad, outerRad);
    }
  }
}

void draw(){
  noFill();
  //stroke(random(255));
  stroke(255);
  int i = int(random(squares));
  int j = int(random(squares));
  // Radius is dynamically generated now
  int rad = int(random(size/(squares)-radBuffer));
  rad = rad%2 == 0 && rad > 0? rad: rad-1;
  if (random(1) < 0.1) fill(0);        
  ellipse(boxSize*i+buffer, boxSize*j+buffer, rad, rad);
}
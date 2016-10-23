int counter = 0;
float size = 640;
int squares = 8;
float boxSize = size/squares;
float buffer = size/(squares*2);
float radBuffer = 10/squares;
float outerRad = size/(squares)-radBuffer;

void setup(){
  background(255);
  size(640,640);
  noFill();
  // Drawing the outer frame of the circles
  for (int i = 0; i < squares; i++){
    for (int j = 0; j < squares; j++){
      ellipse(boxSize*i+buffer, boxSize*j+buffer, outerRad, outerRad);
    }
  }
}

void draw(){
  counter++;
  if (Math.sin(counter) < 0) {
    strokeWeight(3);
    stroke(255);
  }
  else {
    strokeWeight(1);
    stroke(random(255));  
  }
  int i = int(random(squares+1));
  int j = int(random(squares+1));
  // Radius is dynamically generated now
  int rad = int(random(size/(squares)-radBuffer));
  rad = rad%2 == 0 && rad > 0? rad: rad-1;
  ellipse(boxSize*i+buffer, boxSize*j+buffer, rad, rad);
}
float size = 600;
int squares = 10;
float boxSize, buffer, radBuffer, outerRad;

void setup(){
  background(255-255);
  fill(0);
  size(600,600);
  boxSize = width/squares;
  buffer = width/(squares*2);
  radBuffer = 10/squares;
  outerRad = width/squares-radBuffer;
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
  int rad = int(random(width/(squares)-radBuffer));
  rad = rad%2 == 0 && rad > 0? rad: rad-1;
  if (random(1) < 0.1) fill(0);        
  ellipse(boxSize*i+buffer, boxSize*j+buffer, rad, rad);
}
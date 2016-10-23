float size = 640;
int squares = 20;
float col = 0;

void setup(){
  background(255);
  //background(0);
  size(640,640);
}

void draw(){
  //noStroke();
    //background(255);
  for (int i = 0; i < squares; i ++){
    for (int j = 0; j < squares; j ++){  
      int fill = (int)Math.floor(2*random(1));
      //fill(fill*255);
      noFill();
      //fill(random(255));
      float xVal = size/squares*i;
      float yVal = size/squares*j;
      float buffer = size/(squares*2);
      float radBuffer = 100/squares;
      float rad = random(size/(squares*2), size/(squares)-radBuffer);
      float rectRad = random(size/(squares));
      //ellipse(xVal+buffer, yVal+buffer, rad, rad);
      rect(xVal+buffer-rad/2, yVal+buffer-rad/2, rad, rad);
      rect(xVal+buffer-rectRad/2, yVal+buffer-rectRad/2, rectRad, rectRad);
    }
  }
}
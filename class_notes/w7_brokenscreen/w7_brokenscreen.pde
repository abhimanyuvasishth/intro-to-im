int xSize = 1200;
int ySize = 750;
float xVal = random(640);
float maxLife = random(20);

void setup(){
  size(1200,750);
}

void draw(){
  background(0);
  if (millis() > maxLife*1000){
    xVal = random(xSize);
    maxLife += random(5,20);
  }
  createManyLines(random(5,30));
}

void createManyLines(float number){
  for (int i = 0; i < number; i++){
    ScreenLine line = new ScreenLine(xVal+random(200), random(5,maxLife), random(8));
    if (millis() < line.lifeSpan*1000){
      line.display();
    }
  }
}
class ScreenLine{
  float x;
  float lifeSpan;
  float strokeWeight;
  float stroke;
  
  ScreenLine(float x, float lifeSpan, float strokeWeight){
    this.x = x;
    this.lifeSpan = lifeSpan;
    this.strokeWeight = strokeWeight;
    this.stroke = random(200,255);
  }
  
  void display(){
    stroke(this.stroke);
    strokeWeight(this.strokeWeight);
    // ySize is a global variable
    line(this.x, 0, this.x, ySize);
  } 
}
class Star {
  float x;
  float y;
  float screenW;  
  float radius = random(5,10);
  float fill = random(0,255);
  
  void move(){
    x += easing * (screenW/2-mouseX);
  }
  
  void check(){
    if (x > 4*screenW){
      x = -2*screenW;
     }
    else if (x < -2*screenW){
      x = 4*screenW;
    }
  }
  
  void display(){
    noStroke();
    fill(255,255,fill);
    ellipse(x, y, radius, radius);
  }
  
  Star(float x, float y, float screenW){
    this.x = x;
    this.y = y;
    this.screenW = screenW;
  }
}
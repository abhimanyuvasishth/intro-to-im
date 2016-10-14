class Star {
  float x;
  float y;
  float screenW;  
  float radius = 10;
  
  void move(){
    x += easing * (screenW/2-mouseX);
  }
  
  void check(){
    if (x > screenW){
      x = 0;
     }
    else if (x < 0){
      x = screenW;
    }
  }
  
  void display(){
    fill(255);
    ellipse(x, y, radius, radius);
  }
  
  Star(float x, float y, float screenW){
    this.x = x;
    this.y = y;
    this.screenW = screenW;
  }
}
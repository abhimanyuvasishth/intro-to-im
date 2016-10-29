class Star {
  float x;
  float y;  
  float radius;
  float speed;
  
  // The constructor
  Star(float x, float y, float radius){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speed = random(0.5,3);
  }
  
  void move(){
    x -= speed;
  }
  
  // Displays the star
  void display(){
    noStroke();
    fill(255,255,255);
    ellipse(x, y, radius, radius);
  }
}
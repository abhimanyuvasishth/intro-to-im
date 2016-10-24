class Star {
  float x;
  float y;
  float screenW;  
  float radius;
  float speed;
  
  // The constructor
  Star(float x, float y, float screenW){
    this.x = x;
    this.y = y;
    this.screenW = screenW;
    this.radius = random(0,2);
    // speed proportional to radius to give a 3D illusion
    this.speed = this.radius;
  }
  
  // Moves the star with easing in the direction opposite to the direction 
  // that the spaceship is "moving"
  void move(){
    x += easing * speed*(screenW/2-mouseX);
  }
  
  // Checks if the star has gone out of bounds and loops it around
  void check(){
    if (x > 4*screenW){
      x = -2*screenW;
     }
    else if (x < -2*screenW){
      x = 4*screenW;
    }
  }
  
  // Displays the star
  void display(){
    noStroke();
    fill(255,255,255);
    ellipse(x, y, radius, radius);
  }
}
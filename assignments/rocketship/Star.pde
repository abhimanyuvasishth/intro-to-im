class Star {
  float x;
  float y;  
  float radius;
  float speed;
  
  // The constructor
  Star(float x, float y){
    this.x = x;
    this.y = y;
    this.radius = random(0,2);
    // speed proportional to radius to give a 3D illusion
    this.speed = this.radius;
  }
  
  // Moves the star with easing in the direction opposite to the direction 
  // that the spaceship is "moving"
  void move(){
    x += easing * speed*(width/2-mouseX);
  }
  
  // Checks if the star has gone out of bounds and loops it around
  void check(){
    if (x > 4*width){
      x = -2*width;
     }
    else if (x < -2*width){
      x = 4*width;
    }
  }
  
  // Displays the star
  void display(){
    noStroke();
    fill(255,255,255);
    ellipse(x, y, radius, radius);
  }
}
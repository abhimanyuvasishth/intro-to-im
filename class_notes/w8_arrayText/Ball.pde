class Ball{
  PVector loc, vel, acc;
  float rad;
  
  Ball(){
    this.loc = new PVector(width/2,100);
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.rad = 20;  
  }
  
  void display(){
    noStroke();
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, rad, rad);  
  }

  void move(){
    checkKeys();
    gravity();
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.mult(0);
  }

  void gravity(){
    acc.add(0,3);
  }

  void check(){
    if (loc.x <= rad/2){
      vel.x = -1*vel.x;
      loc.x = rad/2;
    }
    
    if (loc.y <= rad/2){
      vel.y = -1*vel.y;
      loc.y = rad/2;
    }
    
    if (loc.x >= width-rad/2){
      vel.x = -1*vel.x;
      loc.x = width-rad/2;
    }
  
    if (loc.y >= height-rad/2){
      vel.y = -1*vel.y;
      loc.y = height-rad/2;
    }
  } 
  
  void checkKeys(){
    if (up) acc.add(0,-10);
  }
}
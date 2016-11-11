class Bullet {
    PVector loc;
    PVector vel;
    float rad;
    boolean isAlive;
    
    Bullet(){
      this.loc = new PVector(weapon.loc.x + weapon.w/2, weapon.loc.y);
      this.vel = new PVector(0,-2);
      this.rad = 5; 
      this.isAlive = true;
    }
    
    void display(){
      fill(100,0,0);
      ellipse(this.loc.x, this.loc.y, rad,rad);
    }
    
    void move(){
      this.loc.add(this.vel);
      check();
    }
    
    void check(){
      if (this.loc.y > height){
        this.isAlive = false;
      }
    }
}
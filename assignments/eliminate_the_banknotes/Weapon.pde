class Weapon {
    PVector loc;
    PVector vel;
    float life;
    float w;
    float h;
    
    Weapon(){
      this.w = 75;
      this.h = 25;
      this.loc = new PVector(width/2-w, height-h);
      this.life = 100;
      this.vel = new PVector(0,0);
    }
    
    void display(){
      fill(0);
      rect(this.loc.x, this.loc.y, w, h);
    }
    
    void move(String direction){
      if (direction == "left") this.loc.add(-3,0);
      if (direction == "right") this.loc.add(3,0);
      if (this.loc.x < 0) this.loc.x = 0;
      if (this.loc.x > width-this.w) this.loc.x = width-this.w;
    }
    
    void fire(){
      Bullet bullet = new Bullet();
      aliveBullets.add(bullet);
    }
}
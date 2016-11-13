class Weapon {
    PVector loc;
    float life;
    float w;
    float h;
    
    Weapon(){
      this.w = width/8;  // (75 for 600 width)
      this.h = width/24; // (25 for 600 width)
      this.loc = new PVector(width/2-w, height-h);
      this.life = 100;
    }
    
    void display(){
      fill(255,0,0);
      rect(this.loc.x, this.loc.y, w, h);
    }
    
    void move(String direction){
      if (direction == "left") this.loc.add(-5,0);
      if (direction == "right") this.loc.add(5,0);
      if (this.loc.x < 0) this.loc.x = 0;
      if (this.loc.x > width-this.w) this.loc.x = width-this.w;
    }
    
    void fire(){
      Bullet bullet = new Bullet();
      aliveBullets.add(bullet);
      bulletCounter++;
      if (bulletCounter >= totalBullets){
        gameOver = true;  
      }
    }
}
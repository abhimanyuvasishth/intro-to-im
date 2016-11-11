class Banknote {
    PVector loc;
    PVector vel;
    float w, h;
    boolean isAlive;
    
    Banknote(){
      this.loc = new PVector(random(width), random(-5*height, 0));
      this.vel = new PVector(0,random(2));
      this.w = 40;
      this.h = 20;
      this.isAlive = true;
    }
    
    void display(){
      fill(0,100,0);
      rect(this.loc.x, this.loc.y, this.w, this.h);
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
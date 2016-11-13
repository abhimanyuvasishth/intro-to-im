class Banknote {
    PVector loc;
    PVector vel;
    float w, h;
    boolean isAlive;
    PImage image;    
    
    Banknote(){
      this.w = width/15; // (40 for 600 width) 
      this.loc = new PVector(random(width-this.w), random(-4*height, 0));
      this.vel = new PVector(0,0);
      this.vel.y = map(-1*this.loc.y, -4*height, 0,1,2);
      this.h = width/30; // (20 for 600 width)
      this.image = loadImage("data/money.png");
      this.image.resize((int)this.w,(int)this.h); 
      this.isAlive = true;
    }
    
    void display(){
      noFill();
      noStroke();
      rect(this.loc.x, this.loc.y, this.w, this.h);
      image(this.image,this.loc.x,this.loc.y);
    }
    
    void move(){
      this.loc.add(this.vel);
      check();
    }
    
    void check(){
      if (this.loc.y > height){
        this.isAlive = false;
        survivors++;
      }
    }
}
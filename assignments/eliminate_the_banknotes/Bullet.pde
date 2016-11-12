class Bullet {
    PVector loc;
    PVector vel;
    float rad;
    boolean isAlive;
    
    Bullet(){
      this.loc = new PVector(weapon.loc.x + weapon.w/2, weapon.loc.y);
      this.vel = new PVector(0,-5);
      this.rad = width/100; 
      this.isAlive = true;
    }
    
    void display(){
      fill(255,0,0);
      ellipse(this.loc.x, this.loc.y, rad,rad);
    }
    
    void move(){
      this.loc.add(this.vel);
      check();
    }
    
    void check(){
      if (this.loc.y < 0){
        this.isAlive = false;
      }
      for (Banknote note: aliveNotes){
        if (in(this.loc, note)){
          note.isAlive = false;
          this.isAlive = false;
        }
      }
    }
    
    boolean in(PVector center, Banknote note){
        if (center.x - note.loc.x < note.w + this.rad/2 && center.x - note.loc.x > - this.rad/2 &&
            center.y - note.loc.y < note.h + this.rad/2 && center.y - note.loc.y > - this.rad/2){
          score++;
          return true;
        }
        else return false;
    }
}
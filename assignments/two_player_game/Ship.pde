class Ship{
  float y;
  float ySpeed;
  float radius;
  float player;
  float maxY;
  float minY;
  
  Ship(float player){
    this.player = player;
    if (player == 1){
      this.y = 0.75*height;
      this.maxY = height;
      this.minY = 0.5*height;
    }
    else {
      this.y = 0.25*height;
      this.maxY = 0.5*height;
      this.minY = 0;
    }
    this.radius = 30;
    this.ySpeed = 2.5;
  }
  
  void display(){
    fill(255,255,255);
    ellipse(width/2, this.y, this.radius, this.radius);
  }
  
  void move(String direction){
    switch (direction){
      case "up":
        if (this.y > this.minY+this.radius/2) this.y -= ySpeed;
        break;
      case "down":
        if (this.y < this.maxY-this.radius/2) this.y += ySpeed;
        break;
      default:
        break;
    }
  }
}
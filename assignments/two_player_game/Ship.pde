class Ship{
  float y;
  float ySpeed;
  float radius;
  String player;
  float maxY;
  float minY;
  float collisionTime;
  int numCollisions;
  
  Ship(String player){
    this.player = player;
    this.collisionTime = 0;
    this.numCollisions = 0;
    if (player == "down"){
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
    if (millis() > this.collisionTime) fill(255,255,255);
    else fill(255,0,0);
    ellipse(width/2, this.y, this.radius, this.radius);
  }
  
  void collision(){
    this.collisionTime = millis()+300; 
    this.numCollisions++;
    if (this.numCollisions == 10){
      gameOver = true;
      endGame(this);
    }
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
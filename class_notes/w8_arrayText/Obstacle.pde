class Obstacle{
  float gap;
  float x;
  float speed;
  float y;
  int obstacleNumber; 
  
  Obstacle(float x, int i){
    this.gap = 100;
    this.x = x;
    this.speed = 5;
    this.y = random(this.gap, height-this.gap);
    this.obstacleNumber = i;
  }
  
  void display(){
    stroke(255);
    strokeWeight(3);
    line(this.x,0,this.x,this.y-this.gap);
    line(this.x,this.y,this.x,height);
    
  }
    
  void move(){
    this.x -= this.speed;
  }
  
  void updateSpeed(float speed){
    this.speed = speed;  
  }
  
  void collision(Ball ball){
    if (this.x <= width/2 + ball.rad/2 && this.x >= width/2-ball.rad/2){
      if (!(ball.loc.y + ball.rad/2 < this.y && ball.loc.y - ball.rad/2 > this.y - this.gap)){
        println("dead");
        gameOver(this.obstacleNumber);
      }
    }
  }
}
boolean up = false;
boolean gameOver = false;
Ball ball;
ArrayList<Obstacle> obstacles;
int numObstacles = 1000;

void setup(){
  size(600,400);
  ball = new Ball();
  createObstacles();
}

void draw(){
  background(0);
  if (!gameOver){
    ball.display();
    ball.move();
    ball.check();
    
    for (Obstacle obstacle: obstacles){
      obstacle.display();
      obstacle.move();
      obstacle.collision(ball);
    }
  }
  else {
    noStroke();
    fill(100,0,100);
    rect(0,0,width,height);
    if (up) {
      createObstacles();
      gameOver = false;
    }
  }
}

void createObstacles(){
  obstacles = new ArrayList<Obstacle>();
  for (int i = 0; i < numObstacles; i++){
    obstacles.add(new Obstacle(width*1.5+i*400, i)); 
  }
}

void gameOver(int num){
  gameOver = true;
  println("score: " + num);
}

void keyPressed(){
  if (keyCode == UP && !up) up = true;
}

void keyReleased(){
  if (keyCode == UP) up = false;
}
class Star {
  float x;
  float y;  
  float radius;
  float speed;
  boolean canCollide;
  PImage img;
  String[] imgNames = new String[]{"nuclear.jpg","stopsign.jpg","flattire.png"};
  String[] flippedImages = new String[]{"nuclearFlipped.jpg","stopsignFlipped.jpg","flattireFlipped.png"};
  
  // The constructor
  Star(float x, float y, float speed){
    this.y = y;
    String imgName = "ha";
    // The stars move right to left relative to the player
    if (this.y < height/2){
      this.x = width-x;
      this.speed = -1*speed;
      imgName = flippedImages[(int)random(3)];
    }
    else {
      this.x = x;
      this.speed = speed;
      imgName = imgNames[(int)random(3)];
    }
    this.radius = width/40;
    this.canCollide = true;
    
    this.img = loadImage("data/" + imgName); 
    this.img.resize((int)this.radius,(int)this.radius);
  }
  
  void move(){
    // The stars move right to left relative to the player
    if (this.y < height/2 && this.x > width){
      this.x = -5*width;   
    }
    else if (this.y > height/2 && this.x < 0) {
      this.x = 5*width;  
    } 
    this.x -= speed;
    // We only check for collision when the obstacle is in a certain band
    // To reduce the total number of computations and make the game faster
    if (Math.abs(this.x-width/2) <= 15 && this.canCollide){
      if (this.y < height/2) checkCollision(animals[0]);
      else checkCollision(animals[1]);  
    }
  }
  
  // Collision checking
  void checkCollision(Animal animal){
    if (Math.abs(animal.y - this.y) <= animal.radius/2){
      animal.collision();  
      this.canCollide = false;
    }
  }
  
  // Displays the star/Obstacle
  void display(){
    image(img,this.x-img.width/2,this.y-img.height/2);
  }
}
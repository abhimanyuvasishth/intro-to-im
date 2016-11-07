class Star {
  float x;
  float y;  
  float radius;
  float speed;
  boolean canCollide;
  PImage img;
  String[] imgNames = new String[]{"nuclear.jpg","stopsign.jpg","flattire.png"};
  // The constructor
  Star(float x, float y, float speed){
    this.y = y;
    // FLIP STAR MOVEMENTS
    if (this.y < height/2){
      this.x = width-x;
      this.speed = -1*speed;
    }
    else {
      this.x = x;
      this.speed = speed;
    }
    //this.x = x;
    //this.speed = speed;
    this.radius = width/40;
    this.canCollide = true;
    String imgName = imgNames[(int)random(3)];
    this.img = loadImage("data/" + imgName); 
    this.img.resize((int)this.radius,(int)this.radius);
  }
  
  void move(){
    // FLIP OBSTACLES
    if (this.y < height/2 && this.x > width){
      this.x = -5*width;   
    }
    else if (this.y > height/2 && this.x < 0) {
      this.x = 5*width;  
    } 
    this.x -= speed;
    if (Math.abs(this.x-width/2) <= 15 && this.canCollide){
      if (this.y < height/2) checkCollision(animals[0]);
      else checkCollision(animals[1]);  
    }
    //else if (this.x < 0){
      //this.x = 5*width;  
    //}
  }
  
  void checkCollision(Animal animal){
    if (Math.abs(animal.y - this.y) <= animal.radius/2){
      animal.collision();  
      this.canCollide = false;
    }
  }
  
  // Displays the star
  void display(){
    image(img,this.x-img.width/2,this.y-img.height/2);
  }
}
class Star {
  float x;
  float y;  
  float radius;
  float speed;
  boolean canCollide;
  PImage img;
  String[] imgNames = new String[]{"nuclear.jpg","stopsign.jpg","flattire.png"};
  // The constructor
  Star(float x, float y, float radius, float speed){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speed = speed;
    this.canCollide = true;
    String imgName = imgNames[(int)random(3)];
    this.img = loadImage("data/" + imgName); 
    this.img.resize((int)(20),(int)(20));
  }
  
  void move(){
    this.x -= speed;
    if (Math.abs(this.x-width/2) <= 15 && this.canCollide){
      if (this.y < height/2) checkCollision(animals[0]);
      else checkCollision(animals[1]);  
    }
    else if (this.x < 0){
      this.x = 5*width;  
    }
  }
  
  void checkCollision(Animal animal){
    if (Math.abs(animal.y - this.y) <= animal.radius/2){
      animal.collision();  
      this.canCollide = false;
    }
  }
  
  // Displays the star
  void display(){
    noStroke();
    noStroke();
    fill(0);
    ellipse(x, y, radius, radius);
    image(img,this.x-img.width/2,this.y-img.height/2);
  }
}
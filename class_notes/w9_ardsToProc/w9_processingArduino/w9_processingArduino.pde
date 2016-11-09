import processing.serial.*;
Serial myPort;
float bg = 100;
boolean offOn = false;

void setup(){
  size(600,600);  
  /* Initializing the port */
  String portName = "/dev/ttyUSB0";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
}

void draw(){
  if (offOn) background(255,255,105); 
  else background(100);
  
  noStroke();
  fill(50);
  rect(width/2-10,height/4,20,height/2);
  
  fill(100,bg,100);
  ellipse(width/2,height/4,200,200);
}

/* Event listener function */
void serialEvent(Serial port){
  String message = port.readString();
  bg = map(float(message),0,1023,0,255);
  println(message);
}

void mousePressed(){
  if (!offOn) myPort.write("on");
  else myPort.write("off");
  offOn = !offOn;
}
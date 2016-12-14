// Fade between cuts
// Water pistol for angry interaction

import processing.video.*;
import processing.serial.*;

// Robot help from here https://forum.processing.org/two/discussion/4583/how-do-i-generate-a-keypress-maybe-robot
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;

Serial myPort;
Movie [] myMovies;
Movie myMovie;
int numMovies;
int index;
boolean hasLeft;
boolean texting;
float time = 0;
float shakeTime = 0;
float actionTime = 0;
Robot robot;

void setup() {
  size(600, 390);
  numMovies = 15;
  hasLeft = false;
  texting = false;
  myMovies = new Movie [numMovies];
  // Neutral standing
  myMovies[0] = new Movie(this, "small/standing/standing.mp4");
  // Standing reactions
  myMovies[1] = new Movie(this, "small/standing/waving.mp4");
  myMovies[2] = new Movie(this, "small/standing/hiding_face.mp4");
  myMovies[3] = new Movie(this, "small/standing/see_you.mp4");
  myMovies[4] = new Movie(this, "small/standing/dodge.mp4");
  myMovies[5] = new Movie(this, "small/standing/angry.mp4");
  myMovies[6] = new Movie(this, "small/standing/shaking.mp4");
  // Leaving/entering
  myMovies[7] = new Movie(this, "small/standing/checking_for_people.mp4");
  myMovies[8] = new Movie(this, "small/standing/leaving.mp4");
  myMovies[9] = new Movie(this, "small/standing/blank.mp4");
  // Texting
  myMovies[10] = new Movie(this, "small/texting/takes_phone_out.mp4");
  myMovies[11] = new Movie(this, "small/texting/texting.mp4");
  myMovies[12] = new Movie(this, "small/texting/phone_back_in_pocket.mp4");
  myMovies[13] = new Movie(this, "small/texting/texting_angry.mp4");
  myMovies[14] = new Movie(this, "small/texting/texting_shake.mp4");

  index = 0;
  if (index >= 8) hasLeft = true;
  if (index >= 10) texting = true;
  myMovie = myMovies[index];
  myMovie.play();

  //Let's get a Robot...
  try { 
    robot = new Robot();
  } 
  catch (AWTException e) {
    e.printStackTrace();
  }
  setupPort();
}

void setupPort(){
  //Use 'println(Serial.list());' to get your port name:
  //println(Serial.list());
  String portName = "/dev/tty.usbserial-DA01L0ME";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); //Reads until endline character. This works well when we "Serial.println" from Arduino.
}

void draw() {
  if (myMovie.time() >= myMovie.duration() - 0.1) {
    myMovie.stop();
    if (hasLeft){
      if (random(1) < 0.9){
       index = 7;
       hasLeft = false;
      }
      else index = 9;       
      playMovie(index);
    }
    else if (texting){
      if (random(1) < 0.5){
       index = 12;
       texting = false;
      }
      else index = 11;     
      playMovie(index); 
    }
    else {
      float prob = random(1);
      if (prob < 0.05){
        index = 8;
        hasLeft = true;
      }
      else if (prob > 0.95){
        index = 10;
        texting = true;
      }
      else index = 0;
      if (index == numMovies) index = 0;
      playMovie(index);
    }
  }
  if (myMovie.available()) myMovie.read();
  if (index == 6 || index == 14) {
    image(myMovie, -width/3+random(-10,10), 0+random(10,10));
  }
  else {
    if (myMovie.time() < 0.5){
      tint(255,100);
    }
    else noTint();
    image(myMovie, -width/3, 0);
  }
}

void keyPressed() {
  // Angry or active interaction
  if (key == 'a'){
    if (index == 0) {
      float j = random(1);
      if (j < 0.33) index = 3;
      else if (j > 0.66) index = 5;
      else index = 4;
      myMovie.stop();
      playMovie(index);
    }
    else if (index == 11){
      index = 13;
      myMovie.stop();
      playMovie(index);
    }  
  }
  // Shaking 
  if (key == 's'){
    if (index == 0) {
      index = 6;
      myMovie.stop();
      playMovie(index);
    }
    else if (index == 11){
      index = 14;
      myMovie.stop();
      playMovie(index);
    }  
  }
  // Waving or person detection
  if (key == 'd') {
    if (index == 0) {
      index = random(1) < 0.5 ? 1 : 2;
      myMovie.stop(); 
      playMovie(index);
    }
  }
}

void playMovie(int ind){
  myMovie = myMovies[ind];
  myMovie.play();
  //println("changing to: " + ind);
}

//Listen for received messages:
void serialEvent(Serial  myPort) {
  String message = myPort.readString();   //Reads serial data as string  
  message = message.trim();   //Trim whitespaces
  String[] list = message.split(",");
  // Distance sensor
  if (int(list[1]) == 1 && millis() > time + 1000*20){
    time = millis();
    robot.keyPress(KeyEvent.VK_D);
    robot.keyRelease(KeyEvent.VK_D);
  }
  // Active reaction
  if (int(list[0]) == 1 && millis() > shakeTime + 1000*10){
    shakeTime = millis();
    robot.keyPress(KeyEvent.VK_S);
    robot.keyRelease(KeyEvent.VK_S);
  } 
  // Shake sensor
  if (int(list[2]) == 1 && millis() > actionTime + 1000*5){
    actionTime = millis();
    robot.keyPress(KeyEvent.VK_A);
    robot.keyRelease(KeyEvent.VK_A);
  } 
}
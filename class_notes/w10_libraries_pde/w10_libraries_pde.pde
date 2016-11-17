import processing.sound.*;
float volume, frequency;
SinOsc myWave;

void setup(){
  size(600,600);
  volume = 1.0;
  frequency = 0;
  myWave = new SinOsc(this);
  myWave.play();
  myWave.amp(volume);
}

void draw(){
 myWave.freq(frequency);
}

void keyPressed(){
  if (key == 'a') frequency = 450;
  if (key == 's') frequency = 550;
  if (key == 'd') frequency = 650;
  if (key == 'f') frequency = 750;
  if (key == 'g') frequency = 850;
  if (key == 'h') frequency = 950;
  if (key == 'j') frequency = 1050;
  if (key == 'k') frequency = 1150;
  if (key == 'l') frequency = 1250;
}
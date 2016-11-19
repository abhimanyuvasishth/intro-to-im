import processing.sound.*;
/* The sound aspect of this project was inspired by: http://listen.hatnote.com
 * The sound files came from here: https://github.com/hatnote/listen-to-wikipedia
 * The instrument that plays the soundfiles is the celesta
 */

float size = 600;
int squares = 10;
float boxSize, buffer, radBuffer, outerRad;
SoundFile[] sounds;

void setup(){
  background(255-255);
  loadSounds();
  fill(0);
  stroke(255);
  size(600,600);
  boxSize = width/squares;
  buffer = width/(squares*2);
  radBuffer = 10/squares;
  outerRad = width/squares-radBuffer;
  // Drawing the outer frame of the circles
  for (int i = 0; i < squares; i++){
    for (int j = 0; j < squares; j++){
      ellipse(boxSize*i+buffer, boxSize*j+buffer, outerRad, outerRad);
    }
  }
}

void loadSounds(){
  sounds = new SoundFile[squares];
  for (int i = 0; i < squares; i++){
    if (i >= 9)sounds[i] = new SoundFile(this, "c0" + str(i+1) + ".mp3");
    else sounds[i] = new SoundFile(this, "c00" + str(i+1) + ".mp3");
  }
}

void draw(){
  noFill();
  stroke(255);
  int i = int(random(squares));
  int j = int(random(squares));
  // Radius is dynamically generated now and consists of discrete values
  int rad = Math.round(random(outerRad));
  rad = rad%3 == 0 ? rad : rad-1;
  rad = rad%3 == 0 ? rad : rad-1;
  rad = rad%2 == 0 && rad > 0? rad: rad-1;
  // Deletes a circle with probability 0.01 and plays a sound
  if (random(1) < 0.01) {
    fill(0);
    ellipse(boxSize*i+buffer, boxSize*j+buffer, outerRad, outerRad);
    // The sound has a pitch corresponding to the x-position of the deleted circle
    sounds[i].play();
  }
  // Draws a new circle with probability 0.2
  else if (random(1) > 0.8){
    noFill();
    ellipse(boxSize*i+buffer, boxSize*j+buffer, rad, rad);
  }
}
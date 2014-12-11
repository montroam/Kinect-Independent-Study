/**

Minim Music Visualizer
Uses the left and right waveforms to create a sort of "environment"
aka the shapes look sort of like mountain in the foreground and background

Libraries: 
      Minim:  audio library

Variables:
       minim: initiates the music player library
      player: creates a player for the song
        meta: creates a variable for the meta data of the song
        beat: creates a beat detector for the song
       timer: an integer timer to change when the wave shapes are updated
**/

/*
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int timer=0;
void setup()
{
  size(displayWidth-100, displayHeight-100);
  //size(600, 400);
  //frameRate(2);
  minim = new Minim(this);
  player = minim.loadFile("Kalimba.mp3"); //loads the song into the player
  meta = player.getMetaData(); //gets the data from the song
  beat = new BeatDetect();
  player.loop();
  //player.play();
  background(0);
  noCursor();
}
 
void draw()
{ 
  

  beat.detect(player.mix); //gets the wave form data

if(timer%100 == 0){
background(0);
  translate(0, height/2-200);
  noFill();
  fill(-1, 10);

  stroke(-1, 50);
  int bsize = player.bufferSize(); // gets the sized of the buffer of the player
  scale(2);
  beginShape();
  fill(204,255,204);
  stroke(-1, 50);
  vertex(0,height/2);
  vertex(0,0);
//  for the size of the buffer, get each point and add it to the shape
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (i);
    float y2 = (player.left.get(i)*300);
    vertex(x2, y2);
    pushStyle();
 //   stroke(random(0,255),random(0,255),random(0,255));
 //   strokeWeight(random(2,20));
 //   point(x2, y2);
    popStyle();
  }
  
  vertex(width,0);
  vertex(width,height/2);
endShape();

//translate to offset the waves, and then do the same for the right side.
translate(0,200);
 beginShape();
   fill(204,204,255);
  stroke(-1, 50);
 vertex(0,height/2);
  vertex(0,0);
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (i);
    float y2 = (player.right.get(i)*300);
    vertex(x2, -y2);
    pushStyle();
 //   stroke(random(0,255),random(0,255),random(0,255));
//    strokeWeight(random(2,10));
 //   point(x2, -y2);
    popStyle();
  }
    vertex(width,0);
  vertex(width,height/2);
  endShape();
}

timer++;
}
 
 
//
boolean sketchFullScreen() {
  return true;
}
*/
 

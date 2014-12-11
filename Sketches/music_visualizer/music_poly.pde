/**

Draws the left wave as a FPoly. Creates a new one every 60 frames.
Note: does not redraw background.

Libraries:
fisica: physics
 minim: audio

Variables:
 minim: initialize audio library
player: create audio player for song
  meta: create metadata collector for player
  beat: create beat detector for player
 timer: to iterate the making of new polys
 world: physics world
 poly: new FPoly

**/

/*
import fisica.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
int timer=0;

FWorld world;
FPoly poly;


void setup() {
size(displayWidth-100, displayHeight-100);
  //size(600, 400);
  //frameRate(2);
  minim = new Minim(this);
  player = minim.loadFile("Kalimba.mp3");
  meta = player.getMetaData();
  beat = new BeatDetect();
  player.loop();
  //player.play();
  background(0);
  noCursor();
  smooth();

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 800);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);
  
  world.setEdgesRestitution(0.5);
}
void draw() {
//
 beat.detect(player.mix);
//background(0);
if(timer%60 == 0){
background(0);
  translate(0, height/2-200);
  noFill();
  fill(-1, 10);

  stroke(-1, 50);
  int bsize = player.bufferSize();
scale(2);
//background(255);

  poly = new FPoly();
  poly.setStrokeWeight(3);
  poly.setFill(120, 30, 90);
  poly.setDensity(10);
  poly.setRestitution(0.5);
//  poly.vertex(0,height/2);
  poly.vertex(0,0);
  for (int i = 0; i < bsize; i+=30)
  {
  float x2 = (i);
  float y2 = (player.left.get(i)*300);
  poly.vertex(x2, y2);
  }
  poly.vertex(width,0);  
//  poly.vertex(width,height/2);
    world.add(poly);
} 
  world.step();
  world.draw(this);  
    timer++;
}
*/


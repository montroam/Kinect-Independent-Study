/**

Draws waves as set of lines in background with random circles at vertexes.
Draws a shape that represents the area above the wave at the top as an FPoly.

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
 
Functions:
drawmusic(): draws the lines with random circles on them in the background

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
size(displayWidth, displayHeight);
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

}
void draw() {
//
 beat.detect(player.mix);
background(0);
        int bsize = player.bufferSize();
        
        drawmusic(bsize);
  translate(0, height/4);
      if(timer%6 == 0){
        if(poly!= null){
          world.remove(poly);
        }
      
        noFill();
        fill(-1, 10);
      
        stroke(-1, 50);


     //scale(.5);
      //background(255);
      
        poly = new FPoly();
        poly.setStrokeWeight(3);
        poly.setFill(120, 30, 90);
        //poly.setDensity(10);
        //poly.setRestitution(0.5);
        //poly.vertex(0,height/2);
        poly.vertex(0,-height/2);
        poly.vertex(0,0);
        for (int i = 0; i < bsize; i+=30)
        {
            float x2 = (i);
            float y2 = (player.left.get(i)*300);
            poly.vertex(x2, y2);
        }
        poly.vertex(width,0);
        poly.vertex(width,-height/2);
        poly.setStatic(true);
          world.add(poly);
      } 
    timer++;
      world.step();
  world.draw(this);  
}
void drawmusic(int bsize){
  
  scale(2); 
  pushMatrix();
  translate(0,200);
   beginShape();
  //fill(204,255,204);
  stroke(-1, 50);
  //vertex(0,height/2);
  //vertex(0,0);
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (i);
    float y2 = (player.left.get(i)*300);
    vertex(x2, y2);
    pushStyle();
    stroke(random(0,255),random(0,255),random(0,255));
    strokeWeight(random(2,20));
    point(x2, y2);
    popStyle();
  }

//  vertex(width,0);
//  vertex(width,height/2);
endShape();
translate(0,200);
 beginShape();
  // fill(204,204,255);
  stroke(-1, 50);
// vertex(0,height/2);
//  vertex(0,0);
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (i);
    float y2 = (player.right.get(i)*300);
    vertex(x2, -y2);
    pushStyle();
    stroke(random(0,255),random(0,255),random(0,255));
    strokeWeight(random(2,10));
    point(x2, -y2);
    popStyle();
  }
 //   vertex(width,0);
 // vertex(width,height/2);
  endShape();
popMatrix(); 
}
*/

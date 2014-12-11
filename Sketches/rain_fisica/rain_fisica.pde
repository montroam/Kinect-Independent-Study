import fisica.*;

/**
 *  Rain_Fisica: Create an interactive environment where a rain cloud follows you around.
 *  Uses fisica, geomerative, and kinect libraries, as well as minim for audio.
 *  Rain interacts with the body.
 *
 *  Next steps: view on projector to see where the head point is drawn.
 **/
 
import SimpleOpenNI.*;
import fisica.*;
import geomerative.*;
import ddf.minim.* ;

Minim minim;
AudioPlayer au_player1, au_player2;
SimpleOpenNI  context;
FWorld world;
FCircle c;

color[]       userClr = new color[] { 
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255, 255, 0), 
  color(255, 0, 255), 
  color(0, 255, 255)
};

int circleCount = 20;
float hole = 50;
float topMargin = 50;
float bottomMargin = 300;
float sideMargin = 100;
float xPos = 0;
int x=0;
int x2=height/2;
PVector com = new PVector();                                   
PVector com2d = new PVector();  
PVector jointPos= new PVector();
PVector jP= new PVector();

PVector[] locations = new PVector[5];

void setup() {
  size(displayWidth, displayHeight);
  smooth();
  
  minim = new Minim(this) ;
  au_player1 = minim.loadFile("rain.wav");
  au_player2 = minim.loadFile("umbrella.wav"); 
 
  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 1500);

  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  context.enableDepth();
  context.enableUser();
  au_player1.loop();
  au_player2.loop();
}

void draw() {
  background(0);
  au_player1.play();
  context.update();

//  image(context.userImage(), 0, 0); 
  int[] userList = context.getUsers();

  if (x>width-200) {
    x=0; x2=height/2;
  }
  if (c!=null) {
    world.remove(c);
  }
  
  noStroke();
  
  fill(80, 120, 200);
  for (int i = 0; i<50; i++) {
    float s = random(1, 5);
    float space = (width);
    xPos = (xPos + random(s, space/2)) % space;
    ellipse(xPos+s/2, x-random(height), s, 20);
    ellipse(xPos+s/2, x2+random(height), s, 20);
  }

  for (int i=0; i<userList.length; i++) {
    if (context.isTrackingSkeleton(userList[i])) {
      locations[i] = drawSkeleton(userList[i]);
      
      drawRain(locations[i]);
      fill(0);
      rect(locations[i].x-75, locations[i].y-70,150,height/2);
      c = new FCircle(150);
      c.setPosition(locations[i].x, locations[i].y);
      c.setFillColor(0);
      c.setStatic(true);
      world.add(c);
    }
  }

  

  world.step();
  world.draw();

 for (int i=0; i<userList.length; i++) {
    if (context.isTrackingSkeleton(userList[i])) {
  translate(locations[i].x-200, -100);
      fill(0);
  fill(200);
  beginShape();
  vertex(110.0, 211.0);
  bezierVertex(110.0, 211.0, 110.0, 211.0, 110.0, 211.0);
  bezierVertex(110.0, 211.0, 44.0, 221.0, 49.0, 256.0);
  bezierVertex(54.0, 291.0, 141.0, 300.0, 155.0, 292.0);
  bezierVertex(168.0, 305.0, 236.0, 330.0, 283.0, 294.0);
  bezierVertex(333.0, 292.0, 356.0, 308.0, 371.0, 276.0);
  bezierVertex(388.0, 239.0, 359.0, 205.0, 327.0, 205.0);
  bezierVertex(321.0, 197.0, 340.0, 157.0, 282.0, 159.0);
  bezierVertex(265.0, 141.0, 255.0, 125.0, 231.0, 130.0);
  bezierVertex(195.0, 132.0, 189.0, 156.0, 184.0, 169.0);
  bezierVertex(178.0, 171.0, 171.0, 140.0, 117.0, 170.0);
  bezierVertex(96.0, 190.0, 114.0, 210.0, 113.0, 210.0);
  endShape();
    }

  }
  
  if(userList.length > 0){
     au_player2.play(); 
     au_player2.unmute();
  }
  else if(userList.length == 0){
   au_player2.mute(); 
    
  }
  
}

PVector drawSkeleton(int userId)
{
  jointPos = new PVector();
  jP = new PVector();
  context.getJointPositionSkeleton(userId, 0, jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  jP.x = map(jP.x,0,640,0,width);
  jP.y = map(jP.y,0,480,height/2,height);
  println(jP.y);
 return jP; 
}


void keyPressed()
{
  switch(key)
  {
  case 'x':
    context.setMirror(true);
    println(context.mirror());
    break;
  }
} 

void drawRain(PVector jP){

   if ((frameCount % 2) == 1) {
    for (int i=0; i<2; i++) {
      FBlob b = new FBlob();
      float s = random(5, 10);
      float space = (275);
      xPos = (xPos + random(s, space/2)) % space;
      b.setAsCircle(jP.x-125 + xPos+s/2, random(150, 170), s, int(s));
      b.setStroke(0);
      b.setStrokeWeight(0);
      b.setFill(80, 120, 200);
      b.setFriction(0);
      world.add(b);
    }
  }
}

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");

  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}
boolean sketchFullScreen() {
  return true;
}



/**
documentation
libraries
write up
code
**/

/**
wave of bodies with head and arms as points on curve
rain interacts with the curve like it is the ground
kill bodies manually, if it reaches the max pair,
get the bodies and then kill the first one in the list

**/

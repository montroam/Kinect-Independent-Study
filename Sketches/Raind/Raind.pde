/**

Creates a scene where a user is followed by a rain cloud that falls
on them. The rain is made of blobs that hit them and fall around it.
The user is formed by created an ellipse around the point of the head.

Libraries:
       box2d:    physics world
      jbox2d:    physics world, based off of box2d
       minim:    audio library
SimpleOpenNI:    kinect skeleton library
         Map:    java maps for storage

Functions:
drawSkeleton:

Variables:
      minim:      Minim initializes library    
au_player1, 
 au_player2:      audio players that load music files
      box2d:      initializes world
  particles:      creates Array List of particles
    context:      initializes SimpleOpenNI world
    userClr:      Array of colors
        com:      PVector to hold kinect data
      com2d:      PVector to hold kinect data
      skels:      array of newSkeletonn
**/

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import ddf.minim.* ;
import SimpleOpenNI.*;
import java.util.Map;

Minim minim;
AudioPlayer au_player1, au_player2 ;
Box2DProcessing box2d;

ArrayList<Particle> particles;

SimpleOpenNI  context;
color[]       userClr = new color[]{ color(255,0,0),
                                     color(0,255,0),
                                     color(0,0,255),
                                     color(255,255,0),
                                     color(255,0,255),
                                     color(0,255,255)
                                   };
PVector com = new PVector();                                   
PVector com2d = new PVector();   
newSkeletonn[] skels;

void setup() {
  minim = new Minim(this) ;
  au_player1 = minim.loadFile("rain.wav"); 
  au_player2 = minim.loadFile("umbrella.wav"); 
  size(displayWidth,displayHeight);
  smooth();

  context = new SimpleOpenNI(this);
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  
  // enable depthMap generation 
  context.enableDepth();
   
  // enable skeleton generation for all joints
  context.enableUser();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  particles = new ArrayList<Particle>();
  //initializes an array of 5 skeletons
  skels = new newSkeletonn[5];
  for (int j=0; j<5; j++){
  
  skels[j] = new newSkeletonn(j+1);
   for(int i=0; i<15; i++){
  //initializes all of the points to 0
  PVector jP = new PVector(0,0);
  skels[j].createJoint(i,jP);
  }
  //kills the physics body
  skels[j].killBody();
  skels[j].display();
  
  }
}

void draw() {
  au_player1.play();
  background(50,100,200);
  context.update();
  image(context.userImage(),0,0); 
      
  //creates an array of the users
  int[] userList = context.getUsers();

 //skels = new newSkeleton[userList.length];

 //draws 4 randomly placed, randomly sized particles each time
 //and adds them to the array of particles
    float sz = random(1,4);
    particles.add(new Particle(random(0,250),300,sz));
    particles.add(new Particle(random(250,width),300,sz));
    particles.add(new Particle(random(0,250),20,sz));
    particles.add(new Particle(random(250,width),20,sz));

  box2d.step();

  //gets and displays the particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
  //if the particles leave the screen, they are removed
    if (p.done()) {
      particles.remove(i);
    }
  }
  
  //draw a skeleton for each user
    for(int i=0;i<userList.length;i++) {
        if(context.isTrackingSkeleton(userList[i])) {
      stroke(userClr[ (userList[i] - 1) % userClr.length ] );
            drawSkeleton(userList[i]);

          }      
  } 
  //if there is a user picked up, change the sound to be that of
  // rain hitting an umbrella
    if(userList.length > 0){
     au_player2.play(); 
     au_player2.unmute();
  }
  //mute the music if not
  else if(userList.length == 0){
   au_player2.mute(); 
    
  }

}


void drawSkeleton(int userId)
{
  //kills the previous body
  skels[userId-1].killBody();
  //creates a new body
  skels[userId-1] = new newSkeletonn(userId);

  //accesses each joint and assigns it to the skeleton assigned to 
  //that userId
  for(int i=0; i<15; i++){
  PVector jointPos = new PVector();
  PVector jP = new PVector();
  context.getJointPositionSkeleton(userId,i,jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  skels[userId-1].createJoint(i,jP);
  }
  
  skels[userId-1].display();
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


/**

Draws a skeleton using vertex points


**/

import SimpleOpenNI.*;
import java.util.Map;
float a_x;
float a_y;
PImage christian;
PImage allison;
PImage sarah;
PShape tri;
boolean bDraw = false;
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
//PVector[][] Points;
newSkeleton[] skels;

void setup() {
  size(displayWidth-400,displayHeight-100);
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
 
  background(200,0,0);

  stroke(0,0,255);
  strokeWeight(3);
  smooth();

}
void draw() {
  background(0);
 // When the mouse is clicked, add a new Box object
 context.update();
image(context.userImage(),0,0);
  // Display all the boundaries

  translate(0,height/4);

   int[] userList = context.getUsers();
   //print(userList.length);
  //  translate(0,height/4);
  skels = new newSkeleton[userList.length];
   
  // Points = new PVector[userList.length][15];
   
  for(int i=0;i<userList.length;i++) {
        if(context.isTrackingSkeleton(userList[i])) {
      stroke(userClr[ (userList[i] - 1) % userClr.length ] );
            drawSkeleton(userList[i]);}      
      

  } 

}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  // to get the 3d joint data
  skels[userId-1] = new newSkeleton(userId);

  //PVector[] points = new PVector[15];
  for(int i=0; i<15; i++){
  PVector jointPos = new PVector();
  PVector jP = new PVector();
  context.getJointPositionSkeleton(userId,i,jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  //println(userId);
  skels[userId-1].createJoint(i,jP);
  }
  
  skels[userId-1].sdraw();
    PVector jointPos = new PVector();
  PVector jP = new PVector();
  context.getJointPositionSkeleton(userId,1,jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  //println(jointPos);
  a_x = jP.x-25;
  a_y = jP.y-50;
     

}

// -----------------------------------------------------------------
// SimpleOpenNI events

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



/**
Libraries Used:
SimpleOpenNI --> for Kinect
Map --> To store Kinect points
Variables:
   context:      SimpleOpenNI
   userClr:      Array of <<color>>
       com:      PVector
     com2d:      PVector
     skels:      Array of <<newSkeleton>>s

Functions:
drawSkeleton(userId): calls the newSkeleton class to create a skeleton for the user

**/

import SimpleOpenNI.*;
import java.util.Map;

SimpleOpenNI  context; //needed to use the SimpleOpenNI library.
color[]       userClr = new color[]{ color(255,0,0),
                                     color(0,255,0),
                                     color(0,0,255),
                                     color(255,255,0),
                                     color(255,0,255),
                                     color(0,255,255)
                                   }; //array of colors to represent users skeleton
PVector com = new PVector();    //needed for context/simpleopenni                               
PVector com2d = new PVector();  //same as above 
PVector[][] Points; 
newSkeleton[] skels;

void setup() {
  size(displayWidth-400,displayHeight-100,P2D);
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
  background(255);
  context.update();
  
  //this draws the image in the top corner of the view from the kinect
  image(context.userImage(),300,0); 
  
  //accesses the list of users picked up by the kinect and stores it into an array of ints
  int[] userList = context.getUsers(); 
  
  //makes an array of skeletons the size of the number of users 
  skels = new newSkeleton[userList.length];
  
  //makes a PVector that makes all of the points for each skeleton 
  Points = new PVector[userList.length][15]; 
   
  
 //For the number of users the kinect picks up, check if each has a skeleton that is being tracked, then draw it.
  for(int i=0;i<userList.length;i++) {
        if(context.isTrackingSkeleton(userList[i])) {
      stroke(userClr[ (userList[i] - 1) % userClr.length ] ); //adds a new stroke color for each user
            drawSkeleton(userList[i]); 
          }      
      
    // draw the center of mass --> little '+' sign on the torso that lists the userId number
/*    if(context.getCoM(userList[i],com))
    
    {
      context.convertRealWorldToProjective(com,com2d);
      noFill();
      //rect(com2d.x-100,com2d.y-200,200,400);
      stroke(100,255,0);
      
      fill(0,255,100);
      strokeWeight(1);
      //beginShape(LINES);
        //vertex(com2d.x,com2d.y - 5);
        //vertex(com2d.x,com2d.y + 5);

        //vertex(com2d.x - 5,com2d.y);
        //vertex(com2d.x + 5,com2d.y);
      //endShape();
      
      fill(0,255,100);
     // text(Integer.toString(userList[i]),com2d.x,com2d.y);
    }
  }
 */ 
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  // to get the 3d joint data

  PVector jointPos = new PVector();
  PVector jP = new PVector();
  PVector[] points = new PVector[15]; //creates a new PVector of all of the point locally for each skeleton
  for(int i=0; i<15; i++){ //reads through the index for each joint
  context.getJointPositionSkeleton(userId,i,jointPos); //grabs the data from the kinect camera
  context.convertRealWorldToProjective(jointPos, jP);  //converts it into a form that works with the scene
  skels[userId].createJoint(i,jP); //creates the joints that are assigned to the correct userId.
  }
  
  skels[userId].sdraw();
 
//the original way from the examples of how to display/draw each joint to create a skeleton.     

/*     
  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  stroke(0,0,255);
  strokeWeight(10);
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
*/
 
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



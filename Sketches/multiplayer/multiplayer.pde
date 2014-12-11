/* --------------------------------------------------------------------------
 * SimpleOpenNI User Test
 * --------------------------------------------------------------------------
 * Processing Wrapper for the OpenNI/Kinect 2 library
 * http://code.google.com/p/simple-openni
 * --------------------------------------------------------------------------
 * prog:  Max Rheiner / Interaction Design / Zhdk / http://iad.zhdk.ch/
 * date:  12/12/2012 (m/d/y)
 * ----------------------------------------------------------------------------
 */
 
 /*
 
 Creates a field of users with 3 different head choices
 
 */

import SimpleOpenNI.*;
PImage christian;
PImage allison;
PImage sarah;

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

void setup()
{
  size(displayWidth,displayHeight);
  christian = loadImage("x1.png");
  allison = loadImage("x2.png");
  sarah = loadImage("x3.png");
 
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

void draw()
{
  background(255);
  fill(0,200,40);
  rect(0,height-300,width,400);
  // update the cam
  context.update();
  
  // draw depthImageMap
  //image(context.depthImage(),0,0);
  image(context.userImage(),0,0);
   int[] userList = context.getUsers();
  for(int i=0;i<userList.length;i++)
  {
    fill(0,75*i,0);
    println((width/userList.length)*i);
    rect(0+(width/userList.length)*i,0,width/userList.length,height);
    noFill();
  }
  translate(0,height/4);
  // draw the skeleton if it's available
 scale(2);
  for(int i=0;i<userList.length;i++)
  {
    
    if(context.isTrackingSkeleton(userList[i]))
    {
      stroke(userClr[ (userList[i] - 1) % userClr.length ] );
      
      drawSkeleton(userList[i]);
    }      
      
    // draw the center of mass
    if(context.getCoM(userList[i],com))
    
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
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  // to get the 3d joint data
  
  PVector jointPos = new PVector();
  PVector jP = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_NECK,jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  //println(jointPos);
  
  if(userId%2 == 0){
      image(christian,jP.x-25, jP.y-50,50,50);
      }
      else if(userId%3 == 0){
        image(sarah,jP.x-25, jP.y-50,50,50);
      }
     else{
       image(allison,jP.x-25, jP.y-50,50,50);
     } 
  //context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
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
    context.setMirror(context.mirror());
    println(context.mirror());
    break;
  }
}  


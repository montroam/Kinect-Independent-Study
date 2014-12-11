/**

Draws a skeleton that has the boxes attracted to its head

**/

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import SimpleOpenNI.*;

float a_x;
float a_y;
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
PVector[] points = new PVector[15];

// A reference to our box2d world
Box2DProcessing box2d;
// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;
void setup() {
  size(displayWidth,displayHeight-100);
  christian = loadImage("../x1.png");
  allison = loadImage("../x2.png");
  sarah = loadImage("../x3.png");
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
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);
  // Create ArrayLists  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(width/2,height,width,5));
 boundaries.add(new Boundary(width/2,0,width,5));
 // boundaries.add(new Boundary(3*width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(width,height/2,5,height));
  boundaries.add(new Boundary(0,height/2,5,height));
   for(int i=0; i<20; i++){
    Box p = new Box(random(width),10);
    boxes.add(p);
  }
}
void draw() {
  background(255);
  // We must always step through time!
  box2d.step();
  // When the mouse is clicked, add a new Box object
 context.update();

//image(context.userImage(),0,0);
  // Display all the boundaries
 
  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
     // boxes.remove(i);
    }
  }
  
  fill(0);
  
   int[] userList = context.getUsers();
   
     
   for (Boundary wall: boundaries) {
   wall.display();
  } 
 
    translate(0,height/4);
    if(userList.length > 0){
    for (Box b: boxes) {
     b.attract(a_x, a_y);
    }
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }  
  // draw the skeleton if it's available
// scale(2);
 

  
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
// drawNewSkeleton(points);
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  // to get the 3d joint data

  PVector jointPos = new PVector();
  PVector jP = new PVector();

  for(int i=0; i<15; i++){
  context.getJointPositionSkeleton(userId,i,jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  //println(i+ ": "+jP);
  points[i] = jP;
  }
  
  context.getJointPositionSkeleton(userId,1,jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  //println(jointPos);
  a_x = jP.x-25;
  a_y = jP.y-50;
  if(userId%2 == 0){
      image(christian,jP.x-50, jP.y-100,100,100);
      }
      else if(userId%3 == 0){
        image(sarah,jP.x-50, jP.y-100,100,100);
      }
     else{
       image(allison,jP.x-50, jP.y-100,100,100);
     } 
     
stroke(0,255,0);
fill(255,0,0);
triangle(points[2].x,points[2].y,points[3].x,points[3].y,points[8].x,points[8].y);
 
     
  //context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
 // context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  //context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  //context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  //context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  stroke(0,0,255);
  strokeWeight(10);
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
  
  //drawNewSkeleton();

   
}

void drawNewSkeleton(){
//     left shoulder - right shoulder
//        \                 /
//         \               /
//          \             /
//           \           /
//            \         /
//               torso
//             /       \
//            /         \  
//           /           \ 
//      left hip      right hip
//strokeWeight(4);
//stroke(0,255,0);
//fill(255,0,0);
//triangle(points[2].x,points[2].y,points[3].x,points[3].y,points[8].x,points[8].y);
//  
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



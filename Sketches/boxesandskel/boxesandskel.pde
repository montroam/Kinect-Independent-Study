/**

   context: creates simpleopenni 
     skels: an array of skeletons
     box2d: creates box2d
boundaries: adds boundaries to the world
     boxes: an array of boxes
         p: a new box
  userList: list of integers of the users
     
     
**/

import shiffman.box2d.*;//for box2d
import org.jbox2d.collision.shapes.*;//for box2d
import org.jbox2d.common.*;//for box2d
import org.jbox2d.dynamics.*; //for box2d

import SimpleOpenNI.*;

SimpleOpenNI  context;
newSkeleton[] skels;

Box2DProcessing box2d; //
ArrayList<Boundary> boundaries; //
ArrayList<Box> boxes; //

void setup() {
  size(displayWidth-400,displayHeight-100);
 context = new SimpleOpenNI(this);
  if(context.isInit() == false){
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  
  box2d = new Box2DProcessing(this); //
  box2d.createWorld();//
  box2d.setGravity(0, -20); //
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(width/2,height,width,5));
  boundaries.add(new Boundary(width/2,0,width,5));
  boundaries.add(new Boundary(width,height/2,5,height));
  boundaries.add(new Boundary(0,height/2,5,height));
   for(int i=0; i<20; i++){ //
    Box p = new Box(random(width),50);//
    boxes.add(p);//
  }//
 
  context.enableDepth();
  context.enableUser();
 
  background(200,0,0);

  stroke(0,0,255);
  strokeWeight(3);
  smooth();

}
void draw() {
  background(0);
  
  box2d.step(); // 

  
 context.update();

   int[] userList = context.getUsers();
   
      for (Boundary wall: boundaries) { //
   wall.display(); //
  } //
  
  if(userList.length > 0){
    for (Box b: boxes) {
     b.attract(width/2, height/2);
    }
    
     for (Box b: boxes) { //
    b.display(); //
  } 
  }
  
  
   
  //  translate(0,height/4);
  skels = new newSkeleton[userList.length];
   
  for(int i=0;i<userList.length;i++) {
        if(context.isTrackingSkeleton(userList[i])) {
            drawSkeleton(userList[i]);}      
  } 
}

void drawSkeleton(int userId)
{
  skels[userId-1] = new newSkeleton(userId);

  for(int i=0; i<15; i++){
  PVector jointPos = new PVector();
  PVector jP = new PVector();
  context.getJointPositionSkeleton(userId,i,jointPos);
  context.convertRealWorldToProjective(jointPos, jP);
  //println(userId);
  skels[userId-1].createJoint(i,jP);
  }
  
  skels[userId-1].sdraw();

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



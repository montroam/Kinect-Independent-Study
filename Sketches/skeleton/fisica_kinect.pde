import SimpleOpenNI.*;
import fisica.*;

SimpleOpenNI  context;
FWorld world;

color[]       userClr = new color[] { 
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255, 255, 0), 
  color(255, 0, 255), 
  color(0, 255, 255)
};
PVector com = new PVector();                                   
PVector com2d = new PVector();   
newSkeletonn[] skels;

void setup() {
  size(displayWidth, displayHeight);
  smooth();

  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // enable depthMap generation 
  context.enableDepth();

  // enable skeleton generation for all joints
  context.enableUser();
  
  
  
  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 800);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);
  
  world.setEdgesRestitution(0.5);
  

//  skels = new newSkeletonn[5];
//  for (int j=0; j<5; j++)
//  {
//    skels[j] = new newSkeletonn(j+1);
//    for (int i=0; i<15; i++)
//    {
//      PVector jP = new PVector(0, 0);
//      skels[j].createJoint(i, jP);
//    }
//    skels[j].killBody();
//    skels[j].display();
//  }
}

void draw() {

  context.update();
  image(context.userImage(), 0, 0); 
  int[] userList = context.getUsers();
  skels = new newSkeletonn[5];

  for (int i=0; i<userList.length; i++) {
    if (context.isTrackingSkeleton(userList[i])) {
      stroke(userClr[ (userList[i] - 1) % userClr.length ] );
      drawSkeleton(userList[i]);
    }
  }
}

void drawSkeleton(int userId)
{
//  if(skels[userId]!=null){
//  skels[userId].killBody();
//  }
  skels[userId] = new newSkeletonn(userId);

  for (int i=0; i<15; i++) {
    PVector jointPos = new PVector();
    PVector jP = new PVector();
    context.getJointPositionSkeleton(userId, i, jointPos);
    context.convertRealWorldToProjective(jointPos, jP);
    skels[userId].createJoint(i, jP);
  }

  skels[userId].display();

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


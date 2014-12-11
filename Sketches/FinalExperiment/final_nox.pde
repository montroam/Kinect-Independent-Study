///**
// 
// Takes points from the head and hands of a user and turns it into an FPoly that interacts with the blobs.
// 
// Using fisica and geomerative libraries
// 
//    s:      the size of the blobs, both how they are displayed 
//            as well as how many bodies represent each body in the world
//            i.e. 1 blob = 10 bodies in this example
//            
// xPos:      is initialized to 0 
// 
//world:      Fisica world - creates the world that the physics objects live in
//            In this example I initialized the world with a height and width
//            Look at the reference file to see other ways it can be initialized
//
//    l:      Fisica poly shape - creates a polygon shape that exists in the Fisica
//            world. This shape is drawn using vertex points. This is convenient for
//            drawing shapes from data, including that from the Kinect Skeleton. 
//            
//            
//bodies:     An ArrayList of Fisica bodies. This is used to get the bodies from the
//            world, which can then be used for manipulating them.
//            
//     b:     Fisica blob - 
//     
// space:     Used to space out randomly where the blobs are drawn
// **/
// 
//import SimpleOpenNI.*;
//import fisica.*;
//import geomerative.*;
//
//
//color[]       userClr = new color[] { 
//  color(255, 0, 0), 
//  color(0, 255, 0), 
//  color(0, 0, 255), 
//  color(255, 255, 0), 
//  color(255, 0, 255), 
//  color(0, 255, 255)
//};
//
//SimpleOpenNI  context;
//int space=0;
//PVector com = new PVector();                                   
//PVector com2d = new PVector();  
//PVector jointPos= new PVector();
//PVector jP= new PVector();
//
//float xPos = 0;
//FWorld world;
//FPoly l;
//ArrayList<FBody> bodies;
//float s = 20;
//void setup() {
//  size(displayWidth, displayHeight);
//  Fisica.init(this); //this has to be initialized before you can use any of the Fisica library
//  world = new FWorld(0, 0, width, height); 
//  world.setGravity(0, 1500);  
//  
//  FPoly l = new FPoly();
//   context = new SimpleOpenNI(this);
//  if (context.isInit() == false)
//  {
//    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
//    exit();
//    return;
//  }
//
//  context.enableDepth();
//  context.enableUser();
//  
//}
//void draw() {
//
//  background(0);
//  
//    context.update();
//
// // image(context.userImage(), 0, 0); 
//  int[] userList = context.getUsers();
//
//
//  ArrayList<FBody> bodies = world.getBodies(); 
//  /** creates an array list of the current bodies in the world
//      note: each blob is made up of <<s>> bodies. So the number 
//      is a lot bigger than you would expect 
//  **/
//
//
//if ((frameCount % 20) == 1 && world.getBodies().size()<=(50*s+1)) {
//  /** adds more blobs to the world over time as long as the 
//      size of the bodies is less than 25 blobs plus the 1 body
//      for the wave shape.
//  **/
//    for (int i=0; i<2; i++) {
//      FBlob b = new FBlob();
//
//      float space = (width);
//      xPos = (xPos + random(s, space/2)) % space;
//      b.setAsCircle(xPos+s/2, random(150, 170), s, int(s));
//      b.setStroke(0);
//      b.setStrokeWeight(0);
//      b.setFill(80, 120, 200);
//      b.setFriction(0);
//      world.add(b);
//    }
//  }
//
//
//  FPoly l = new FPoly();
//  l.vertex(0, height);
//  if(userList.length>0){
//    l.vertex(0,height/2);
//    space = width/(userList.length*3);
//  }
//  
//
//    int x = 0;
//for (int i=0; i<userList.length; i++) {
//x+=space;
//    if (context.isTrackingSkeleton(userList[i])) {
//        PVector xy = drawSkeleton(userList[i],6);
//        l.vertex(x,xy.y);
//        x+=space;
//        xy = drawSkeleton(userList[i],0);
//        l.vertex(x,xy.y);
//        x+=space;
//        xy = drawSkeleton(userList[i],7);
//        l.vertex(x,xy.y);
//    }
//}
//  if(userList.length>0){
//    l.vertex(width,height/2);
//  }
//if(userList.length<1){
//  l.vertex(width/2,height/2);
//}
//  l.vertex(width, height);
//  l.setStatic(true); //this makes it so gravity doesn't work on it: it is a static object.
//  l.setFill(255);
//  world.add(l);
//
//
//  world.step(); //takes a step in time
//  world.draw(); //draws the objects
//  
//if(l!=null){
// world.remove(l); 
//}
//  println(world.getBodies().size());
//  
//  if(world.getBodies().size()>=(100*s+1)){
// setup(); 
//}
//  
//}
//
//PVector drawSkeleton(int userId, int i)
//{
//  jointPos = new PVector();
//  jP = new PVector();
//  context.getJointPositionSkeleton(userId, i, jointPos);
//  context.convertRealWorldToProjective(jointPos, jP);
////  jP.x = map(jP.x,0,640,0,width);
////  jP.y = map(jP.y,0,480,0,height);
//  println(jP.y);
//  return(jP);
//  
//
//
//}
//
//void keyPressed()
//{
//  switch(key)
//  {
//  case 'x':
//    context.setMirror(true);
//    println(context.mirror());
//    break;
//  }
//} 
//
//void onNewUser(SimpleOpenNI curContext, int userId)
//{
//  println("onNewUser - userId: " + userId);
//  println("\tstart tracking skeleton");
//
//  curContext.startTrackingSkeleton(userId);
//}
//
//void onLostUser(SimpleOpenNI curContext, int userId)
//{
//  println("onLostUser - userId: " + userId);
//}
//
//void onVisibleUser(SimpleOpenNI curContext, int userId)
//{
//  //println("onVisibleUser - userId: " + userId);
//}
//


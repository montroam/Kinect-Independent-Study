///**
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
//import fisica.*;
//import geomerative.*;
//float xPos = 0;
//FWorld world;
//FPoly l = new FPoly();
//ArrayList<FBody> bodies;
//float s = 20;
//void setup() {
//  size(600, 600);
//  Fisica.init(this); //this has to be initialized before you can use any of the Fisica library
//  world = new FWorld(0, 0, width, height); 
//  world.setGravity(0, 1500);  
//
//  FPoly l = new FPoly();
//  l.vertex(0, height);
//  l.vertex(0, height/2);
//  l.vertex(height-200, 100);
//  l.vertex(width, height/2);
//  l.vertex(width, height);
//  l.setStatic(true); //this makes it so gravity doesn't work on it: it is a static object.
//  l.setFill(255);
//  world.add(l);
//  println(world.getBodies().size());
//}
//void draw() {
//
//  background(0);
//
//  ArrayList<FBody> bodies = world.getBodies(); 
//  /** creates an array list of the current bodies in the world
//      note: each blob is made up of <<s>> bodies. So the number 
//      is a lot bigger than you would expect 
//  **/
////  if(bodies.size()>=25*s+1){
////  for(int i=1; i<s+1; i++){
////    world.remove(bodies.get(i));
////  }
////  }
//  if ((frameCount % 20) == 1 && bodies.size()<25*s+1) {
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
//  world.step(); //takes a step in time
//  world.draw(); //draws the objects
//
//  println(world.getBodies().size());
//}


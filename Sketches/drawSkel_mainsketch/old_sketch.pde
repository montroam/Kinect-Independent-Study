//import SimpleOpenNI.*;
//import java.util.Map;
//float a_x;
//float a_y;
//PImage christian;
//PImage allison;
//PImage sarah;
//PShape tri;
//boolean bDraw = false;
//SimpleOpenNI  context;
//color[]       userClr = new color[]{ color(255,0,0),
//                                     color(0,255,0),
//                                     color(0,0,255),
//                                     color(255,255,0),
//                                     color(255,0,255),
//                                     color(0,255,255)
//                                   };
//PVector com = new PVector();                                   
//PVector com2d = new PVector();   
//PVector[][] Points;
//newSkeleton[] skels;
//
//void setup() {
//  size(displayWidth-400,displayHeight-100,P2D);
// context = new SimpleOpenNI(this);
//  if(context.isInit() == false)
//  {
//     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
//     exit();
//     return;  
//  }
//  
//  // enable depthMap generation 
//  context.enableDepth();
//   
//  // enable skeleton generation for all joints
//  context.enableUser();
// 
//  background(200,0,0);
//
//  stroke(0,0,255);
//  strokeWeight(3);
//  smooth();
//
//}
//void draw() {
//  background(255);
// // When the mouse is clicked, add a new Box object
// context.update();
//
//image(context.userImage(),300,0);
//  // Display all the boundaries
//
//   int[] userList = context.getUsers();
//   //print(userList.length);
//  //  translate(0,height/4);
//  skels = new newSkeleton[userList.length];
//   
//   Points = new PVector[userList.length][15];
//   
//  for(int i=0;i<userList.length;i++) {
//        if(context.isTrackingSkeleton(userList[i])) {
//      stroke(userClr[ (userList[i] - 1) % userClr.length ] );
//            drawSkeleton(userList[i]);}      
//      
////    // draw the center of mass
////    if(context.getCoM(userList[i],com))
////    
////    {
////      context.convertRealWorldToProjective(com,com2d);
////      noFill();
////      //rect(com2d.x-100,com2d.y-200,200,400);
////      stroke(100,255,0);
////      
////      fill(0,255,100);
////      strokeWeight(1);
////      //beginShape(LINES);
////        //vertex(com2d.x,com2d.y - 5);
////        //vertex(com2d.x,com2d.y + 5);
////
////        //vertex(com2d.x - 5,com2d.y);
////        //vertex(com2d.x + 5,com2d.y);
////      //endShape();
////      
////      fill(0,255,100);
////     // text(Integer.toString(userList[i]),com2d.x,com2d.y);
////    }
//  } 
////if(bDraw){  
////  println("about to draw triangle");
////  rect(0,0,50,50);
////shape(tri,0,0);  
////}
//// drawNewSkeleton(points);
//}
//
//// draw the skeleton with the selected joints
//void drawSkeleton(int userId)
//{
//  // to get the 3d joint data
//
//  PVector jointPos = new PVector();
//  PVector jP = new PVector();
//  PVector[] points = new PVector[15];
//  for(int i=0; i<15; i++){
//  context.getJointPositionSkeleton(userId,i,jointPos);
//  context.convertRealWorldToProjective(jointPos, jP);
//  //println(userId);
//  skels[userId].createJoint(i,jP);
//  }
//  
//  skels[userId].sdraw();
////  context.getJointPositionSkeleton(userId,1,jointPos);
////  context.convertRealWorldToProjective(jointPos, jP);
////  //println(jointPos);
////  a_x = jP.x-25;
////  a_y = jP.y-50;
//     
////stroke(0,255,0);
////fill(255,0,0);
////triangle(points[2].x,points[2].y,points[3].x,points[3].y,points[8].x,points[8].y);
// 
////     
////  //context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
//// context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
////
////  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
////
////  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
////  stroke(0,0,255);
////  strokeWeight(10);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
////
////  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
////  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
//  
////println("about to draw new skeleton");
// // drawNewSkeleton(Points, userId);
//
//   
//}
//
//void drawNewSkeleton(int userId){
////     left shoulder - right shoulder
////        \                 /
////         \               /
////          \             /
////           \           /
////            \         /
////               torso
////             /       \
////            /         \  
////           /           \ 
////      left hip      right hip
////strokeWeight(4);
////stroke(0,255,0);
////fill(255,0,0);
////triangle(points[6].x,points[6].y,points[7].x,points[7].y,points[8].x,points[8].y);
//// 
//  
//  //
////  PVector Head = Points[userId-1][0];
////  println("This is head.x "+Head.x+" head.y "+Head.y);
////    PVector Neck = Points[userId-1][1];
////  println("This is neck.x "+Neck.x+" neck.y "+Neck.y);
////    println("Points 0"+userId+"- x: "+Points[userId-1][0].x);
////     println("Points 0"+userId+"- y: "+Points[userId-1][0].y);
////         println("Points 1"+userId+"- x: "+Points[userId-1][0].x);
////     println("Points 1"+userId+"- y: "+Points[userId-1][0].y);
//  //}
//
////PVector[] user = Points.get(userId);
////float[] x = new float[user.length]; 
////float[] y = new float[user.length]; 
////for(int i=0; i<user.length; i++){
////  PVector part = user[i];
////x[i] = map(part.x,0,600,0,width);
////y[i] = map(part.y,0,600,0,height);
////}
//
////println(x[8],y[8]);
//////println(user[2].y-user[8].y);
////tri = createShape(TRIANGLE,x[2],y[2],x[3],y[3],y[6],y[6]);
////tri.setFill(color(0, 100, 100));
////tri.setStroke(true);
////bDraw = true;
//}
//
//
//// -----------------------------------------------------------------
//// SimpleOpenNI events
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

//----------------------------
//     if(i==0)  {
//       _head = joint;
//       println("_head is now set to: "+_head);
//     }
//if(i==1){
//  _neck = joint;
//         println("_neck is now set to: "+_neck);
//}
//if(i==2)  _lshoulder = joint;
//if(i==3)  _rshoulder = joint;
//if(i==4)  _lelbow = joint;
//if(i==5)  _relbow = joint;
//if(i==6)  _lhand = joint;
//if(i==7)  _rhand = joint;
//if(i==8)  _torso = joint;
//if(i==9)  _lhip = joint;
//if(i==10) _rhip = joint;
//if(i==11) _lknee = joint;
//if(i==12) _rknee = joint;
//if(i==13) _lfoot = joint;
//if(i==14) {_rfoot = joint;
////print("you just set _rfoot equal to: "+_rfoot+" and _head is still equal to: "+_head);}
//}
//println("in loop "+i+" _head is "+_head);


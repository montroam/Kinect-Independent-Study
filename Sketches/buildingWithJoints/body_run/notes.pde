////get points from the kinect that will serve as joints
////draw a skeleton using series of boxes and circles  
////(at this point the angle is not important - what’s important is the setting the right joints)
////updating the joint points (with kinect) should move and rotate other parts accordingly - hopefully
////
////look at how to set up box2d joints.
////
////   -          0          +
////              o
////              | 
////   o--o---o---o---o---o--o
////              |   
////              |
////              o  --- y = 0             
////              |             
////              |
////   o--o---o-------o---o--o
////   
////   
////   joints:
////   
//// at x = 0
//// head
//// neck
//// torso
////   
//// at x = -30 or 30
//// shoulders
//// hips
//// 
//// at x = -60 or 60
//// elbows
//// knees
//// 
//// at x = -80 or 80
//// hands
//// feet
//// 
//// 
////torso is at y = 0
////head at y = - 50
////arms are at y = -30
////legs are at y = 30
////
////
////head      - pvector() .x .y >   0, -50
////neck      - pvector() .x .y >   0, -30
////torso     - pvector() .x .y >   0,   0
////shoulders - pvector() .x .y > -30, -30 & 30, -30
////hips       - pvector() .x .y > -30, 30 & 30,  30
////elbows    - pvector() .x .y > -60, -30 & 60, -30
////knees     - pvector() .x .y > -60,  30 & 60,  30
////hands     - pvector() .x .y > -80, -30 & 80, -30
////feet      - pvector() .x .y > -80,  30 & 80,  30
////
////------------------------------
//
//PVector head      = new PVector( 0, -50);
//PVector neck      = new PVector( 0, -30);
//PVector torso     = new PVector( 0,   0);
//PVector shoulders = new PVector(30, -30);
//PVector hips      = new PVector(30,  30);
//PVector elbows    = new PVector(60, -30);
//PVector knees     = new PVector(60, -30);
//PVector feet      = new PVector(80, -30);
////
////-----------------------------
////
////create boxes for body parts
////head
////head     to neck
////shoulders
////shoulder to elbow
////shoulder to elbow
////elbow    to hand
////elbow    to hand
////neck     to torso
////torso    to hip
////torso    to hip
////hip      to knee
////hip      to knee
////knee     to foot
////knee     to foot
////
////------------------------------
//
//headBox         = new Box(head.x-10,head.y-10,20,20,true);
//shouldersBox    = new Box(-shoulders.x,shoulders.y-5,shoulders.x*2,10,true);
//LUArmBox        = new Box(-elbows.x,elbows.y,abs(shoulders.x-elbows.x),10,false);
//RUArmBox        = new Box( elbows.x,elbows.y,abs(shoulders.x-elbows.x),10,false);
//LLArmBox        = new Box(-hands.x,hands.y,abs(-elbows.x-hands.x),10,false);
//RLArmBox        = new Box(-hands.x,hands.y,abs( elbows.x-hands.x),10,false);
//torsoBox        = new Box(torso.x-5,torso.y-5,10,10,true);
//hipsBox         = new Box(-hips.x,hips.y,abs(hips.x*2),10,true);
//LUArmBox        = new Box(-knees.x,knees.y,abs(hips.x-knees.x),10,false);
//RUArmBox        = new Box( knees.x,knees.y,abs(hips.x-knees.x),10,false);
//LLArmBox        = new Box(-feet.x,feet.y,abs(-knees.x-feet.x),10,false);
//RLArmBox        = new Box(-feet.x,feet.y,abs( knees.x-knees.x),10,false);
//
//-----------------------------------
//RevoluteJoint joint;
//RevoluteJointDef neck = new RevoluteJointDef();
//neck.initialize(headBox.body, shouldersBox.body, shouldersBox.body.getWorldCenter());
//joint = (RevoluteJoint) box2d.world.createJoint(rjd);
//
//headBox.display();
//shouldersBox.display();

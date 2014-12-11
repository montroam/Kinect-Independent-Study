/**

Class created to work with kinect skeleton data to create a body 
that works in the box2d world

Variables:
        _userId:  saves the userId
_bodyparts(x15):  creates PVectors of body part locations
bodyparts (x15):  creates Boxes for each body part
            rjd:  creates RevoluteJoint definition
          joint:  creates RevoluteJoint definition
            w,h:  creates floats for the width and height

Functions:
 newSkeletonn():  initializes an empty skeleton 
                  with PVectors, one Box and a joint
  createJoint():  reads in the index of the joint and 
                  creates the PVector
      display():  creates boxes for each limb and draws them
    mapPoints():  maps points from the skeleton to the size of the screen
     killBody():  removes the Boxes from the world to that it can be redrawn the next frame

**/

class newSkeleton{

   int _userId;
  PVector _head;
  PVector _neck;
  PVector _lshoulder; 
  PVector _rshoulder; 
  PVector _lelbow;
  PVector _relbow;
  PVector _lhand;
  PVector _rhand; 
  PVector _torso;
  PVector _lhip;
  PVector _rhip;
  PVector _lknee;
  PVector _rknee;
  PVector _lfoot;
  PVector _rfoot;
  
  Box       head;
  Box       neck;
  Box  lshoulder; 
  Box  rshoulder; 
  Box     lelbow;
  Box     relbow;
  Box      lhand;
  Box      rhand; 
  Box      torso;
  Box       lhip;
  Box       rhip;
  Box      lknee;
  Box      rknee;
  Box      lfoot;
  Box      rfoot;
  Box      thebody;
  
  RevoluteJoint joint;
  RevoluteJointDef rjd;
  
  float w;
  float h;
  
  newSkeleton(int userId){
  _userId = userId;
  _head      = new PVector();
  _neck      = new PVector();
  _lshoulder = new PVector(); 
  _rshoulder = new PVector(); 
  _lelbow    = new PVector();
  _relbow    = new PVector();
  _lhand     = new PVector();
  _rhand     = new PVector(); 
  _torso     = new PVector();
  _lhip      = new PVector();
  _rhip      = new PVector();
  _lknee     = new PVector();
  _rknee     = new PVector();
  _lfoot     = new PVector();
  _rfoot     = new PVector();
  thebody    = new Box(0,0,10,10, true);
 
    rjd = new RevoluteJointDef();

  }
  
void createJoint(int i, PVector joint){
switch(i){
case 0:      _head =  joint;  break;
case 1:      _neck =  joint;  break;
case 2: _lshoulder =  joint;  break;
case 3: _rshoulder =  joint;  break;
case 4:    _lelbow =  joint;  break;
case 5:    _relbow =  joint;  break;
case 6:     _lhand =  joint;  break;
case 7:     _rhand =  joint;  break;
case 8:     _torso =  joint;  break;
case 9:      _lhip =  joint;  break;
case 10:     _rhip =  joint;  break;
case 11:    _lknee =  joint;  break;
case 12:    _rknee =  joint;  break;
case 13:    _lfoot =  joint;  break;
case 14:    _rfoot =  joint;  break;
}
}
void display(){
  mapPoints();
 
//head      = new Box(_head.x,_head.y,20,20, true);
//neck      = new Box(_neck.x,_neck.y,20,20, true);
  lshoulder = new Box(_lshoulder.x,_lshoulder.y,60,20, false); 
  rshoulder = new Box(_rshoulder.x,_rshoulder.y,60,20, true); 
  lelbow    = new Box(_lelbow.x,_lelbow.y,60,20, true);
  relbow    = new Box(_relbow.x,_relbow.y,60,20, true);
  lhand     = new Box(_lhand.x,_lhand.y,20,20, true);
  rhand     = new Box(_rhand.x,_rhand.y,20,20, true); 
//torso     = new Box(_torso.x,_torso.y,20,20, true);
//lhip      = new Box(_lhip.x,_lhip.y,20,20, true);
//rhip      = new Box(_rhip.x,_rhip.y,20,20, true);
//lknee     = new Box(_lknee.x,_lknee.y,20,20, true);
//rknee     = new Box(_rknee.x,_rknee.y,20,20, true);
//lfoot     = new Box(_lfoot.x,_lfoot.y,20,20, true);
//rfoot     = new Box(_rfoot.x,_rfoot.y,20,20, true);
  thebody   = new Box(_torso.x,_torso.y, 100, abs(_lhip.y-_lshoulder.y), true);
  rjd.initialize(lelbow.body, lshoulder.body, lelbow.body.getWorldCenter());
  joint     = (RevoluteJoint) box2d.world.createJoint(rjd); 
//       head.display();
//       neck.display();
    lshoulder.display();
    rshoulder.display();
       lelbow.display();
       relbow.display();
        lhand.display();
        rhand.display();
//      torso.display();
//       lhip.display();
//       rhip.display();
//      lknee.display();
//      rknee.display();
//      lfoot.display();
//      rfoot.display();
      thebody.display();
}

void mapPoints(){
  
     _head.x = map(_head.x,0,640,-100,width+100);
//_head.y= map(_head.y,0,480,height/2, height);  
_lshoulder.x = map(_lshoulder.x,0,640,-100,width+100);
//_lshoulder.y= map(_lshoulder.y,0,480,height/2, height);

_rshoulder.x = map(_rshoulder.x,0,640,-100,width+100);
//_rshoulder.y= map(_rshoulder.y,0,480,height/2, height);

    _lhand.x = map(_lhand.x,0,640,-100,width+100);
//_lhand.y= map(_lhand.y,0,480,height/2, height);

    _rhand.x = map(_rhand.x,0,640,-100,width+100);
//_rhand.y= map(_rhand.y,0,480,height/2, height);

   _lelbow.x = map(_lelbow.x,0,640,-100,width+100);
//_lelbow.y= map(_lelbow.y,0,480,height/2, height);

   _relbow.x = map(_relbow.x,0,640,-100,width+100);
//_relbow.y= map(_lelbow.y,0,480,height/2, height);

     _lhip.x = map(_lhip.x,0,640,-100,width+100);
//_lhip.y= map(_lhip.y,0,480,height/2, height);

     _rhip.x = map(_rhip.x,0,640,-100,width+100);
//_rhip.y= map(_rhip.y,0,480,height/2, height);

    _lknee.x = map(_lknee.x,0,640,-100,width+100);
//_lknee.y= map(_lknee.y,0,480,height/2, height);

    _rknee.x = map(_rknee.x,0,640,-100,width+100);
//_rknee.y= map(_rknee.y,0,480,height/2, height);

    _lfoot.x = map(_lfoot.x,0,640,-100,width+100);
    _lfoot.y = map(_lfoot.y,0,480,height/2, height);

    _rfoot.x = map(_rfoot.x,0,640,-100,width+100);
    _rfoot.y = map(_rfoot.y,0,480,height/2, height);
 
    _torso.x = map(_torso.x,0,640,-100,width+100);
    _torso.y = map(_torso.y,0,480,height/2, height);
}

  void killBody() { 
//         box2d.destroyBody(head.body);
//         box2d.destroyBody(neck.body);
//    box2d.destroyBody(lshoulder.body);
//    box2d.destroyBody(rshoulder.body);
//       box2d.destroyBody(lelbow.body);
//       box2d.destroyBody(relbow.body);
//        box2d.destroyBody(lhand.body);
//       box2d.destroyBody( rhand.body);
//        box2d.destroyBody(torso.body);
//        box2d.destroyBody( lhip.body);
//         box2d.destroyBody(rhip.body);
//        box2d.destroyBody(lknee.body);
//        box2d.destroyBody(rknee.body);
//        box2d.destroyBody(lfoot.body);
//        box2d.destroyBody(rfoot.body);
        box2d.destroyBody(thebody.body); 
  }

}

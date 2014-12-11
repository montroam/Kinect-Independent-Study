/**

Class created to work with kinect skeleton data to create a body 
that works in the box2d world

Variables:
         _userId: saves the userId
_bodyparts (x15): creates PVectors of body part locations
bodyparts  (x15): creates Boxes for each body part
             rjd: creates RevoluteJoint definition
           joint: creates RevoluteJoint definition
             w,h: creates floats for the width and height

Functions:
 newSkeletonn():  initializes an empty skeleton 
                 with PVectors, one Box and a joint
  createJoint():  reads in the index of the joint and 
                 creates the PVector
      display():
      makeBox():  returns a Box
     getAngle():  returns a float
makeRectangle():  makes a rectangle
    mapPoints():  maps points from the skeleton to the size of the screen
     killBody():  removes the Boxes from the world to that it can be redrawn the next frame

**/

class newSkeletonn{

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
  
  newSkeletonn(int userId){
     _userId = userId;
       _head = new PVector();
       _neck = new PVector();
  _lshoulder = new PVector(); 
  _rshoulder = new PVector(); 
     _lelbow = new PVector();
     _relbow = new PVector();
      _lhand = new PVector();
      _rhand = new PVector(); 
      _torso = new PVector();
      _lhip = new PVector();
      _rhip = new PVector();
     _lknee = new PVector();
     _rknee = new PVector();
     _lfoot = new PVector();
     _rfoot = new PVector();
    thebody = new Box(0,0,10,10, true);

  
    rjd = new RevoluteJointDef();
   
   //rjd.initialize(headBox.body, shoulderBox.body, headBox.body.getWorldCenter());
   
 
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
    
  println("make shoulder");
  lshoulder = makeBox( _lshoulder.x,_lshoulder.y,_lelbow.x,_lelbow.y);
  lshoulder.display();
  
   println("make shoulder");
  rshoulder = makeBox( _rshoulder.x,_rshoulder.y,_relbow.x,_relbow.y);
  rshoulder.display();
  
  println("make elbow");
  lelbow = makeBox(_lelbow.x,_lelbow.y,_lhand.x, _lhand.y);
  lelbow.display();
  
  println("make elbow");
  relbow = makeBox(_relbow.x,_relbow.y,_rhand.x, _rhand.y);
  relbow.display();

  println("make hip");
  lhip = makeBox(_lhip.x,_lhip.y,_lknee.x, _lknee.y);
  lhip.display();
 
  println("make hip");
  rhip = makeBox(_rhip.x,_rhip.y,_rknee.x, _rknee.y);
  rhip.display();  
  
  println("make knee");
  lknee = makeBox(_lknee.x, _lknee.y, _lfoot.x,_lfoot.y);
  lknee.display();  
  
  println("make knee");
  rknee = makeBox(_rknee.x, _rknee.y, _rfoot.x,_rfoot.y);
  rknee.display();  
  
  println("make torso");
  torso = makeBox(_rhip.x, _rhip.y, _lshoulder.x,_lshoulder.y);
  torso.display();  

   }

Box makeBox(float p1_x, float p1_y, float p2_x, float p2_y)
{
  float w = sqrt( pow( (p2_x-p1_x) , 2 ) + pow( (p2_y-p1_y) , 2 )  );
  return new Box(p1_x,p1_y,w,10,true);
  
}

float getAngle(float p1_x, float p1_y, float p2_x, float p2_y)
{
  float w = sqrt( pow( (p2_x-p1_x) , 2 ) + pow( (p2_y-p1_y) , 2 )  );
  return acos((p2_x-p1_x)/w); 
}

void makeRectangle(float p1_x,float p1_y, float p2_x, float p2_y){
  line(p1_x,p1_y,p2_x,p2_y); 
  float w = sqrt( pow( (p2_x-p1_x) , 2 ) + pow( (p2_y-p1_y) , 2 )  );
  float a = acos((p2_x-p1_x)/w);
  if(p2_y < p1_y) {a=(2*PI-a);}
  //rotate(a);

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
//_lfoot.y= map(_lfoot.y,0,480,height/2, height);

_rfoot.x = map(_rfoot.x,0,640,-100,width+100);
//_rfoot.y= map(_rfoot.y,0,480,height/2, height);
 
 _torso.x = map(_torso.x,0,640,-100,width+100);
//_torso.y= map(_torso.y,0,480,height/2, height);
 
}

  void killBody() {
    if(lshoulder != null)
    lshoulder.killBody();
    if(rshoulder != null)
    rshoulder.killBody();
    if(lelbow != null)
    lelbow.killBody();
    if(relbow != null)
    relbow.killBody();
    if(lhip != null)
    lhip.killBody();
    if(rhip != null)
    rhip.killBody();
    if(lknee != null)
    lknee.killBody();
    if(rknee != null)
    rknee.killBody();
    if(torso != null)
    torso.killBody();
  }
  


}

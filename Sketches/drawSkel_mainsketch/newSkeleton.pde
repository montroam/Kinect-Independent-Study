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
  
  newSkeleton(int userId){
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

  }

void createJoint(int i, PVector joint){
switch(i){
case 0:
_head = joint;  
break;
case 1:
_neck = joint;  
break;
case 2: 
_lshoulder =  joint;  
break;
case 3: _rshoulder =  joint;  break;
case 4: _lelbow =  joint;  break;
case 5: _relbow =  joint;  break;
case 6: _lhand =  joint;  break;
case 7: _rhand =  joint;  break;
case 8: _torso =  joint;  break;
case 9: _lhip =  joint;  break;
case 10:_rhip =  joint;  break;
case 11:_lknee =  joint;  break;
case 12:_rknee =  joint;  break;
case 13:_lfoot =  joint;  break;
case 14:_rfoot =  joint;  break;
}
}
  void sdraw(){
    stroke(255);
    strokeWeight(10);
    fill(0,200,100);

    mapPoints();

    beginShape();
    vertex(_lhand.x,_lhand.y);
    vertex(_lelbow.x,_lelbow.y);
    vertex(_lshoulder.x,_lshoulder.y);
    vertex(_rshoulder.x,_rshoulder.y);
    vertex(_relbow.x,_relbow.y);
    vertex(_rhand.x,_rhand.y);
    vertex(_relbow.x,_relbow.y);
    vertex(_rshoulder.x,_rshoulder.y);
    vertex(_rhip.x,_rhip.y);
    vertex(_rknee.x,_rknee.y);
    vertex(_rfoot.x,_rfoot.y);
    vertex(_rknee.x,_rknee.y);
    vertex(_rhip.x,_rhip.y);
    vertex(_lhip.x,_lhip.y);
    vertex(_lknee.x,_lknee.y);
    vertex(_lfoot.x,_lfoot.y);
    vertex(_lknee.x,_lknee.y);
    vertex(_lhip.x,_lhip.y);
    vertex(_lshoulder.x,_lshoulder.y);
    vertex(_lelbow.x,_lelbow.y);
    endShape(CLOSE);
}

void mapPoints(){
_lshoulder.x = map(_lshoulder.x,0,640,-100,width+100);
//_lshoulder.y= map(_lshoulder.y,0,480,0,height/2);

_rshoulder.x = map(_rshoulder.x,0,640,-100,width+100);
//_rshoulder.y= map(_rshoulder.y,0,480,0,height/2);

_lhand.x = map(_lhand.x,0,640,-100,width+100);
//_lhand.y= map(_lhand.y,0,480,0,height/2);

_rhand.x = map(_rhand.x,0,640,-100,width+100);
//_rhand.y= map(_rhand.y,0,480,0,height/2);

_lelbow.x = map(_lelbow.x,0,640,-100,width+100);
//_lelbow.y= map(_lelbow.y,0,480,0,height/2);

_relbow.x = map(_relbow.x,0,640,-100,width+100);

_lhip.x = map(_lhip.x,0,640,-100,width+100);
//_lhip.y= map(_lhip.y,0,480,0,height/2);

_rhip.x = map(_rhip.x,0,640,-100,width+100);
//_rhip.y= map(_rhip.y,0,480,0,height/2);

_lknee.x = map(_lknee.x,0,640,-100,width+100);
//_lknee.y= map(_lknee.y,0,480,0,height/2);

_rknee.x = map(_rknee.x,0,640,-100,width+100);
//_rknee.y= map(_rknee.y,0,480,0,height/2);

_lfoot.x = map(_lfoot.x,0,640,-100,width+100);
//_lfoot.y= map(_lfoot.y,0,480,0,height/2);

_rfoot.x = map(_rfoot.x,0,640,-100,width+100);
//_rfoot.y= map(_rfoot.y,0,480,0,height/2);


}

}

class newSkeletonn {

  PVector _head, _neck, _lshoulder, _rshoulder, _lelbow, _relbow, _lhand, _rhand, _torso, _lhip, _rhip, _lknee, _rknee, _lfoot, _rfoot;
  
  FPoly skeleton;
  
  float w;
  float h;

  newSkeletonn(int userId) {
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
    skeleton = new FPoly();
  }

  void createJoint(int i, PVector joint)
  {
    switch(i)
    {
    case 0: 
      _head = joint;  
      break;
    case 1:
      _neck = joint;  
      break;
    case 2: 
      _lshoulder =  joint;  
      break;
    case 3: 
      _rshoulder =  joint;  
      break;
    case 4: 
      _lelbow =  joint;  
      break;
    case 5: 
      _relbow =  joint;  
      break;
    case 6: 
      _lhand =  joint;  
      break;
    case 7: 
      _rhand =  joint;  
      break;
    case 8: 
      _torso =  joint;  
      break;
    case 9: 
      _lhip =  joint;  
      break;
    case 10:
      _rhip =  joint;  
      break;
    case 11:
      _lknee =  joint;  
      break;
    case 12:
      _rknee =  joint;  
      break;
    case 13:
      _lfoot =  joint;  
      break;
    case 14:
      _rfoot =  joint;  
      break;
    }
  }
  void display()
  {
    mapPoints();
    if (skeleton !=null){
    world.remove(skeleton);
    }
    skeleton.vertex(_head.x,_head.y);
    skeleton.vertex(_rshoulder.x,_rshoulder.y);
    skeleton.vertex(_relbow.x,_relbow.y);
    skeleton.vertex(_rhand.x,_rhand.y);
    skeleton.vertex(_relbow.x,_relbow.y);
    skeleton.vertex(_rshoulder.x,_rshoulder.y);
    skeleton.vertex(_torso.x,_torso.y);
    skeleton.vertex(_rhip.x,_rhip.y);
    skeleton.vertex(_rknee.x,_rknee.y);
    skeleton.vertex(_rfoot.x,_rfoot.y);
    skeleton.vertex(_rhip.x,_rhip.y);
    skeleton.vertex(_lhip.x,_lhip.y);
    skeleton.vertex(_lknee.x,_lknee.y);
    skeleton.vertex(_lfoot.x,_lfoot.y);
    skeleton.vertex(_lknee.x,_lknee.y);
    skeleton.vertex(_rhip.x,_rhip.y);
    skeleton.vertex(_torso.x,_torso.y);
    skeleton.vertex(_lshoulder.x,_lshoulder.y);
    skeleton.vertex(_lelbow.x,_lelbow.y);
    skeleton.vertex(_lhand.x,_lhand.y);
    skeleton.vertex(_lelbow.x,_lelbow.y);
    skeleton.vertex(_lshoulder.x,_lshoulder.y);
    skeleton.vertex(_head.x,_head.y);
    skeleton.setStatic(true);
    world.add(skeleton);
    
    //draw the head
    //then shoulder into arm
    //arm into torso
    //torso to leg
    //leg to leg
    //leg to torso
    //torso to arm
    //arm to shoulder
    //shoulder to head
    
     world.step();
 world.draw();
  }

  void mapPoints() {

    _head.x = map(_head.x, 0, 640, -100, width+100);

    _lshoulder.x = map(_lshoulder.x, 0, 640, -100, width+100);

    _rshoulder.x = map(_rshoulder.x, 0, 640, -100, width+100);

    _lhand.x = map(_lhand.x, 0, 640, -100, width+100);

    _rhand.x = map(_rhand.x, 0, 640, -100, width+100);

    _lelbow.x = map(_lelbow.x, 0, 640, -100, width+100);

    _relbow.x = map(_relbow.x, 0, 640, -100, width+100);

    _lhip.x = map(_lhip.x, 0, 640, -100, width+100);

    _rhip.x = map(_rhip.x, 0, 640, -100, width+100);

    _lknee.x = map(_lknee.x, 0, 640, -100, width+100);

    _rknee.x = map(_rknee.x, 0, 640, -100, width+100);

    _lfoot.x = map(_lfoot.x, 0, 640, -100, width+100);

    _rfoot.x = map(_rfoot.x, 0, 640, -100, width+100);

    _torso.x = map(_torso.x, 0, 640, -100, width+100);
  }

  void killBody() {
    world.remove(skeleton);
  }
}


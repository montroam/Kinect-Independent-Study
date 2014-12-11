/**
 
 New class created to hold all of the skeleton data from the kinect
 and then use it to form a shape that can be drawn.
 (in this specific version, only the triangle that would represent 
 the chest is drawn to the screen)
 
 Variables:
- _bodypart: creates a PVector ([x,y]) for each body part.
-
 Functions:
- createJoint(i,joint):
                    reads in the index(i) from the loop and uses it 
                    to assign the joint data(joint) to the correct variable.
-              sdraw():  
                    draws a shape to represent the upper torso of
                    the user.
**/

class newSkeleton {

  PVector _head, PVector _neck, PVector _lshoulder, PVector _rshoulder, PVector _lelbow, PVector _relbow, 
  PVector _lhand, PVector _rhand, PVector _torso, PVector _lhip, PVector _rhip, PVector _lknee, 
  PVector _rknee, PVector _lfoot, PVector _rfoot;


  public void createJoint(int i, PVector joint) {

    switch(key)
    {
    case '0':
      _head = joint;
      break;
    case '1':
      _neck = joint;
      break;
    case '2':
      _lshoulder = joint;
      break;
    case '3':
      _rshoulder = joint;
      break;
    case '4':
      _lelbow = joint;
      break;
    case '5':
      _relbow = joint;
      break;
    case '6':
      _lhand = joint;
      break;
    case '7':
      _rhand = joint;
      break;
    case '8':
      _torso = joint;
      break;
    case '9':
      _lhip = joint;
      break;
    case '10':
      _rhip = joint;
      break;
    case '11':
      _lknee = joint;
      break;
    case '12':
      _rknee = joint;
      break;
    case '13':
      _lfoot = joint;
      break;
    case '14':
      _rfoot = joint;
      break;
    }
  }
  public void sdraw() {
    beginShape();
    vertex(_lshoulder.x, _lshoulder.y);
    vertex(_rshoulder.x, _rshoulder.y);
    vertex(_torso.x, _torso.y);
    endShape(CLOSE);
  }
}


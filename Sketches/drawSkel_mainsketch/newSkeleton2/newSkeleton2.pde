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
  
    Body body;
  float w;
  float h;
  
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

 makeBody(new Vec2(width/2, height/2));

  }
  
    void killBody() {
    box2d.destroyBody(body);
  }
  
   boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height) {
      killBody();
      return true;
    }
    return false;
  }

void createJoint(int i, PVector joint){
switch(i){
case 0: _head = joint;  break;
case 1:_neck = joint;  break;
case 2: _lshoulder =  joint;  break;
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
    
      Vec2 pos = box2d.getBodyPixelCoord(body);
    Fixture f = body.getFixtureList();
    println(f);
    PolygonShape ps = (PolygonShape) f.getShape();
    
    stroke(255);
//    strokeWeight(10);
//noStroke();
    fill(0,200,100);

    mapPoints();
    
    //rectMode(CENTER);
  println("about to draw skeleton");
//  int distance = int(abs(_lhand.x - _lelbow.x));
//  int distance2 = int(abs(_lhand.y - _lelbow.y));
//  
//  float forearm = sqrt(pow(distance,2)+pow(distance2,2));
//  
fill(255,0,0);
  beginShape();
    vertex(_lhand.x,_lhand.y);
    vertex(_lelbow.x,_lelbow.y-20);
    vertex(_lelbow.x,_lelbow.y+20);
endShape();

fill(0,255,0);
  beginShape();
    vertex(_rhand.x,_rhand.y);
    vertex(_relbow.x,_relbow.y-20);
    vertex(_relbow.x,_relbow.y+20);
endShape();

      beginShape();
    vertex(_lelbow.x,_lelbow.y-20);
    vertex(_lelbow.x,_lelbow.y+20);
   vertex(_lshoulder.x,_lshoulder.y);
    endShape();

      beginShape();
    vertex(_relbow.x,_relbow.y-20);
    vertex(_relbow.x,_relbow.y+20);
   vertex(_rshoulder.x,_rshoulder.y);
    endShape();
    
      beginShape();
    vertex(_lshoulder.x,_lshoulder.y);
    vertex(_rshoulder.x,_rshoulder.y);
   vertex(_rhip.x,_rhip.y);
   vertex(_lhip.x,_lhip.y);
    endShape();

      beginShape();
    vertex(_lhip.x-20,_lhip.y);
    vertex(_lhip.x+20,_lhip.y);
   vertex(_lknee.x,_lknee.y);
    endShape();
    
      beginShape();
    vertex(_rhip.x-20,_rhip.y);
    vertex(_rhip.x+20,_rhip.y);
   vertex(_rknee.x,_rknee.y);
    endShape();
    
    
          beginShape();
    vertex(_lknee.x-20,_lknee.y);
    vertex(_lknee.x+20,_lknee.y);
   vertex(_lfoot.x,_lfoot.y);
    endShape();
              beginShape();
    vertex(_rknee.x-20,_rknee.y);
    vertex(_rknee.x+20,_rknee.y);
   vertex(_rfoot.x,_rfoot.y);
    endShape();
 

    
  println("skeleton drawn");

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
w = abs(_lhand.x-_rhand.x);
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

h = abs(_head.y-_rfoot.y);

 

}

 void makeBody(Vec2 center) {

     // Define a polygon (this is what we use for a rectangle)
    PolygonShape lf = new PolygonShape();

    Vec2[] _lf = new Vec2[3];
    _lf[0] = box2d.vectorPixelsToWorld(new Vec2(_lhand.x,_lhand.y));
    _lf[1] = box2d.vectorPixelsToWorld(new Vec2(_lelbow.x,_lelbow.y-20));
    _lf[2] = box2d.vectorPixelsToWorld(new Vec2(_lelbow.x,_lelbow.y+20));
    
    lf.set(_lf, _lf.length);


    PolygonShape rf = new PolygonShape();

    Vec2[] _rf = new Vec2[3];
    _rf[0] = box2d.vectorPixelsToWorld(new Vec2(_rhand.x,_rhand.y));
    _rf[1] = box2d.vectorPixelsToWorld(new Vec2(_relbow.x,_relbow.y+20));
    _rf[2] = box2d.vectorPixelsToWorld(new Vec2(_relbow.x,_relbow.y-20));
    
    rf.set(_rf, _rf.length);

     // Define a polygon (this is what we use for a rectangle)
    PolygonShape lu = new PolygonShape();

    Vec2[] _lu = new Vec2[3];
    _lu[0] = box2d.vectorPixelsToWorld(new Vec2(_lelbow.x,_lelbow.y+20));
    _lu[1] = box2d.vectorPixelsToWorld(new Vec2(_lelbow.x,_lelbow.y-20));
    _lu[2] = box2d.vectorPixelsToWorld(new Vec2(_lshoulder.x,_lshoulder.y));
    
    lu.set(_lu, _lu.length);

     // Define a polygon (this is what we use for a rectangle)
    PolygonShape ru = new PolygonShape();

    Vec2[] _ru = new Vec2[3];
    _ru[0] = box2d.vectorPixelsToWorld(new Vec2(_relbow.x,_relbow.y-20));
    _ru[1] = box2d.vectorPixelsToWorld(new Vec2(_relbow.x,_relbow.y+20));
    _ru[2] = box2d.vectorPixelsToWorld(new Vec2(_rshoulder.x,_rshoulder.y));
    
    ru.set(_ru, _ru.length);


     // Define a polygon (this is what we use for a rectangle)
    PolygonShape torso = new PolygonShape();


    Vec2[] _torso = new Vec2[4];
    _torso[0] = box2d.vectorPixelsToWorld(new Vec2(_lshoulder.x,_lshoulder.y));
    _torso[1] = box2d.vectorPixelsToWorld(new Vec2(_rshoulder.x,_rshoulder.y));
    _torso[2] = box2d.vectorPixelsToWorld(new Vec2(_rhip.x,_rhip.y));
    _torso[3] = box2d.vectorPixelsToWorld(new Vec2(_lhip.x,_lhip.y));
    
    torso.set(_torso, _torso.length);

    PolygonShape lul = new PolygonShape();

    Vec2[] _lul = new Vec2[3];
    _lul[0] = box2d.vectorPixelsToWorld(new Vec2(_lhip.x-20,_lhip.y));
    _lul[1] = box2d.vectorPixelsToWorld(new Vec2(_lhip.x+20,_lhip.y));
    _lul[2] = box2d.vectorPixelsToWorld(new Vec2(_lknee.x,_lknee.y));
    
    lul.set(_lul, _lul.length);
   
    PolygonShape rul = new PolygonShape();

    Vec2[] _rul = new Vec2[3];
    _rul[0] = box2d.vectorPixelsToWorld(new Vec2(_rhip.x-20,_rhip.y));
    _rul[1] = box2d.vectorPixelsToWorld(new Vec2(_rhip.x+20,_rhip.y));
    _rul[2] = box2d.vectorPixelsToWorld(new Vec2(_rknee.x,_rknee.y));
    
    rul.set(_rul, _rul.length);
    
    
    PolygonShape lll = new PolygonShape();

    Vec2[] _lll = new Vec2[3];
    _lll[0] = box2d.vectorPixelsToWorld(new Vec2(_lknee.x-20,_lknee.y));
    _lll[1] = box2d.vectorPixelsToWorld(new Vec2(_lknee.x+20,_lknee.y));
    _lll[2] = box2d.vectorPixelsToWorld(new Vec2(_lfoot.x,_lfoot.y));
    
    lll.set(_lll, _lll.length);
    
    PolygonShape rll = new PolygonShape();

    Vec2[] _rll = new Vec2[3];
    _rll[0] = box2d.vectorPixelsToWorld(new Vec2(_rknee.x-20,_rknee.y));
    _rll[1] = box2d.vectorPixelsToWorld(new Vec2(_rknee.x+20,_rknee.y));
    _rll[2] = box2d.vectorPixelsToWorld(new Vec2(_rfoot.x,_rfoot.y));
    
    rll.set(_rll, _rll.length);
        
    
    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    body.createFixture(lf, 1.0);
   body.createFixture(rf, 1.0);
   body.createFixture(lu, 1.0);
   body.createFixture(ru, 1.0);
   body.createFixture(torso, 1.0);
   body.createFixture(lul, 1.0);
   body.createFixture(rul, 1.0);
   body.createFixture(lll, 1.0);
   body.createFixture(rll, 1.0);

  }



}

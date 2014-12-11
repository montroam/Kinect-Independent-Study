class BodyBuild {
  
PVector head      = new PVector( 0, -50);
PVector neck      = new PVector( 0, -30);
PVector torso     = new PVector( 0,   0);
PVector shoulders = new PVector(30, -30);
PVector hips      = new PVector(30,  30);
PVector elbows    = new PVector(60, -30);
PVector knees     = new PVector(60, -30);
PVector feet      = new PVector(80, -30);

RevoluteJoint joint;
Box headBox;
Box shouldersBox;  
  
  
  BodyBuild(int w){
  headBox         = new Box(head.x-10,head.y-10,w,w,false);
  shouldersBox    = new Box(-shoulders.x,shoulders.y-5,shoulders.x*2,w/2,true);
  
  RevoluteJointDef neck = new RevoluteJointDef();
  
  Vec2 offset = box2d.vectorPixelsToWorld(new Vec2(0, 60));
  
  neck.initialize(headBox.body, shouldersBox.body, shouldersBox.body.getWorldCenter());

  joint = (RevoluteJoint) box2d.world.createJoint(neck);
  
  }  
  
   void display() {
    
    headBox.display();
    shouldersBox.display();
    
    Vec2 anchor = box2d.coordWorldToPixels(shouldersBox.body.getWorldCenter());
    
    fill(255, 0, 0);
    stroke(0);
    ellipse(anchor.x, anchor.y, 4, 4);

  }
  
}

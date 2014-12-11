// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Series of Particles connected with distance joints

class Pair {

  Particle head;
  Particle neck;
  Particle lshoulder;
  Particle rshoulder;
  Particle lelbow;
  Particle relbow;
  Particle lhand = new Particle(-90,0);
  Particle rhand = new Particle(90,0);
  Particle lhip = new Particle(-30,30);
  Particle rhip = new Particle(30,30);
  Particle torso;
  Particle pelvis;
  Particle lknee = new Particle(-60,30);
  Particle rknee = new Particle(60,30);
  Particle lfoot = new Particle(-80,60);
  Particle rfoot = new Particle(80,60);

  float len;
  // Chain constructor
  Pair(float x, float y) {
    len = 64;
    
   head = new Particle(x,y-50, 20);
   neck = new Particle(x,y-30);
   lshoulder = new Particle(x-30,y-30);
   rshoulder = new Particle(x+30,y-30);
   lelbow = new Particle(x-60,y-30);
   relbow = new Particle(x+60,y-30);
   torso = new Particle(x+10,y);
   lhip = new Particle(x-30,y+30);
   pelvis = new Particle(x,y+30);
   rhip = new Particle(x+30,y+30);

    DistanceJointDef hN = new DistanceJointDef();
    DistanceJointDef nLS = new DistanceJointDef();
    DistanceJointDef nRS = new DistanceJointDef();
    DistanceJointDef LSe = new DistanceJointDef();
    DistanceJointDef RSe = new DistanceJointDef();
    DistanceJointDef LSt = new DistanceJointDef();
    DistanceJointDef RSt = new DistanceJointDef();
    DistanceJointDef tN = new DistanceJointDef();
    DistanceJointDef tLH = new DistanceJointDef();
    DistanceJointDef tRH = new DistanceJointDef();
    DistanceJointDef RHlh = new DistanceJointDef();
    DistanceJointDef RSrh = new DistanceJointDef();
    DistanceJointDef LSlh = new DistanceJointDef();


    hN.bodyA = head.body;
    hN.bodyB = neck.body;
    nLS.bodyA = neck.body;
    nLS.bodyB = lshoulder.body;
    nRS.bodyA = neck.body;
    nRS.bodyB = rshoulder.body;
    LSe.bodyA = lelbow.body;
    LSe.bodyB = lshoulder.body;
    RSe.bodyA = relbow.body;
    RSe.bodyB = rshoulder.body;
    LSt.bodyA = torso.body;
    LSt.bodyB = lshoulder.body;
    RSt.bodyA = torso.body;
    RSt.bodyB = rshoulder.body;
    tN.bodyA = torso.body;
    tN.bodyB = neck.body;
    tLH.bodyA = torso.body;
    tLH.bodyB = lhip.body;
    tRH.bodyA = torso.body;
    tRH.bodyB = rhip.body;
    
    RHlh.bodyA = lhip.body;
    RHlh.bodyB = rhip.body;
    
    RSrh.bodyA = rshoulder.body;
    RSrh.bodyB = rhip.body;
    LSlh.bodyA = lshoulder.body;
    LSlh.bodyB = lhip.body;
   
    // Equilibrium length
   hN.length = box2d.scalarPixelsToWorld(25);
   nLS.length = box2d.scalarPixelsToWorld(40);
   nRS.length = box2d.scalarPixelsToWorld(40);
   LSe.length = box2d.scalarPixelsToWorld(25);
   RSe.length = box2d.scalarPixelsToWorld(25);
   LSt.length = box2d.scalarPixelsToWorld(60);
   RSt.length = box2d.scalarPixelsToWorld(60);
   tN.length = box2d.scalarPixelsToWorld(50);
   tLH.length = box2d.scalarPixelsToWorld(60);
   tRH.length = box2d.scalarPixelsToWorld(60);   
   RHlh.length = box2d.scalarPixelsToWorld(50);
   RSrh.length = box2d.scalarPixelsToWorld(90);
   LSlh.length = box2d.scalarPixelsToWorld(90);
   
    
    // These properties affect how springy the joint is 
    hN.frequencyHz = 0;  // Try a value less than 5 (0 for no elasticity)
    hN.dampingRatio = 0; // Ranges between 0 and 1
 
    nLS.frequencyHz = 0;  // Try a value less than 5 (0 for no elasticity)
    nLS.dampingRatio = 0; // Ranges between 0 and 1


    // Make the joint.  Note we aren't storing a reference to the joint ourselves anywhere!
    // We might need to someday, but for now it's ok
    DistanceJoint _hN = (DistanceJoint) box2d.world.createJoint(hN);
    DistanceJoint _nLS = (DistanceJoint) box2d.world.createJoint(nLS);
    DistanceJoint _nRS = (DistanceJoint) box2d.world.createJoint(nRS);
  
    DistanceJoint _LSe = (DistanceJoint) box2d.world.createJoint(LSe);
    DistanceJoint _RSe = (DistanceJoint) box2d.world.createJoint(RSe);
  
    DistanceJoint _LSt = (DistanceJoint) box2d.world.createJoint(LSt);
    DistanceJoint _RSt = (DistanceJoint) box2d.world.createJoint(RSt);
    
    DistanceJoint _tN = (DistanceJoint) box2d.world.createJoint(tN);
    
    DistanceJoint _tLH = (DistanceJoint) box2d.world.createJoint(tLH);
    DistanceJoint _tRH = (DistanceJoint) box2d.world.createJoint(tRH);
    
    DistanceJoint _RHlh = (DistanceJoint) box2d.world.createJoint(tRH);
  
    DistanceJoint _RSrh = (DistanceJoint) box2d.world.createJoint(RSrh);
    DistanceJoint _LSlh = (DistanceJoint) box2d.world.createJoint(LSlh);
  
  }



  // Draw the bridge
  void display() {

    Vec2 pos1 = box2d.getBodyPixelCoord(head.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(neck.body);
   
    Vec2 pos3 = box2d.getBodyPixelCoord(lshoulder.body);
    Vec2 pos4 = box2d.getBodyPixelCoord(rshoulder.body);
   
    Vec2 pos5 = box2d.getBodyPixelCoord(lelbow.body);
    Vec2 pos6 = box2d.getBodyPixelCoord(relbow.body);
   
    Vec2 pos7 = box2d.getBodyPixelCoord(torso.body);
     
    Vec2 pos8 = box2d.getBodyPixelCoord(lhip.body);
    Vec2 pos9 = box2d.getBodyPixelCoord(rhip.body);
   
   
    stroke(0);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
    line(pos2.x,pos2.y,pos3.x,pos3.y);
    line(pos2.x,pos2.y,pos4.x,pos4.y);
   
    line(pos3.x,pos3.y,pos5.x,pos5.y);
    line(pos4.x,pos4.y,pos6.x,pos6.y);

    line(pos3.x,pos3.y,pos7.x,pos7.y);
    line(pos4.x,pos4.y,pos7.x,pos7.y);
    
    line(pos8.x,pos8.y,pos7.x,pos7.y);
    line(pos9.x,pos9.y,pos7.x,pos7.y);
    line(pos9.x,pos9.y,pos8.x,pos8.y);
    
   
    head.display();
    neck.display();
   
    lshoulder.display();
    rshoulder.display();
   
    lelbow.display();
    relbow.display();
 
    torso.display();
    
    lhip.display();
    rhip.display();
    
  }
}


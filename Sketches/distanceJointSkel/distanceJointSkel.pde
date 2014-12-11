/**

Creates a skeleton made out of connected distance joints.

**/
/*
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;

ArrayList<Particle2> particles;

Pair pp;

int x = 0;

void setup() {
  size(400,300);
  smooth();

  // Create the empty list
  particles = new ArrayList<Particle2>();

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  
  boundaries = new ArrayList<Boundary>();

  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(width/4,height-5,width/2,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));

  pp = new Pair(150,height-height/4);

}

void draw() {
  //frameRate(25);
 background(255);
 
   if (random(1) < 0.1) {
    float sz = random(4,8);
    particles.add(new Particle2(random(150,250),-20,sz));
  }


  
   x++;

//  if (x%10==0){background(100);setup();}




  // We must always step through time!
  box2d.step();
  
    for (int i = particles.size()-1; i >= 0; i--) {
    Particle2 p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }

//  // When the mouse is clicked, add a new Box object
//
//
  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }
//  
//  fill(0);
//  text("Click mouse to add connected particles.",10,20);
//  
//  // Display all the boxes
//pp = new Pair(mouseX,height-height/4);
       pp.display();

}

*/









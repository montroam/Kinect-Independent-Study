/**

Uses class BodyBuild to create a body that works with physics
from imaginary skeleton data.

**/

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

BodyBuild mybody;

ArrayList<Particle> particles;

void setup() {
  size(600,600);
  smooth();


  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  translate(100,100);
  mybody = new BodyBuild(20);

  // Create the empty list
  particles = new ArrayList<Particle>();
   
}

void draw() {
  background(255);

  if (random(1) < 0.1) {
    float sz = random(4,8);
    particles.add(new Particle(random(150,250),-20,sz));
  }


  // We must always step through time!
  box2d.step();

  // Look at all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }

  // Draw the windmill
  mybody.display();
  

}

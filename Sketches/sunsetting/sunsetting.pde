/**

Simple Processing Sketch: creates an ellipse (sun) to follow the mouse.
The mouse's position moves the sun as well as changes the time of day based
off of the y-position of the mouse. The shapes are drawn in HSB rather than RGB
so that the movement controls the brightness as well as the hue.

**/

void setup(){
 size(600,600); 
 colorMode(HSB); 
}

void draw(){
  noStroke();
  // maps from mouseY to 0 so that it is darkest near the bottom
  // maps the brightness between 255 and 0
 float b = map(mouseY, 0,height,255,0); 
 //makes an yellow-orange color
 float sun = map(mouseY,0,height,40,0);
  background(150,255,b);
  fill(sun,255,b);
  ellipse(mouseX, mouseY, 100,100);
  fill(100,255,b);
  rect(0,400,width,200);
  
}
